global class IDReader_Controller {

	// Global variable that will hold the labels used by the Ocr Parser class to populate the 
	// relevant record fields.
	private static ScanResults scanResults;


	// Apex Parser Interface Utilities
	// ===============================
	// Returns the index in the PredictionResult where the findString is located
	global static Integer find(Einstein_PredictionResult sortedResult, String findString) {
        for (Integer i = 0; i < sortedResult.probabilities.size(); i++) {
            if (findString.toLowerCase() == sortedResult.probabilities[i].label.toLowerCase()) {
                return i;
            }
        }
        return -1;
    }

	// Returns the label at the given index.  Also adds this to the global scanResults as being
	// a label that was used in the prediction.
	global static String getLabel(Einstein_PredictionResult sortedResult, Integer index) {
		scanResults.einsteinPredictionResult.probabilities.add(sortedResult.probabilities[index]);
		return sortedResult.probabilities[index].label;
	}


	// Lightning Component Utilities
	// =============================
	// Called by the Lightning Component.  Takes the url of an image and the contentId (Yes, redundant)
	// and returns a complex object of the scan results, including the relevant data as well as
	// a list of the text fields used.
	@AuraEnabled
	public static crisisapp.scanResults analyzeImageUrl(String url, String contentId) {
		
		// Get the configuration settings
		IDReader__c cs = IDReader__c.getOrgDefaults();

		if (cs == null) {
			throw new AuraHandledException('No IDReader Custom Settings Defined');
		}

		String idClass = '';
		if (cs.Use_Image_Classification__c) {
			// Use an Image Classification model to determine the class of the ID image
			idClass = classifyDL (cs.Image_Classification_Model_Id__c, url);
		}

		// Use OCR to get the raw text from the DL
		Einstein_PredictionResult result = extractText(cs.OCR_Model_Id__c, url);
		
		//Sort from top to bottom of image
		Einstein_PredictionResult sortedResult = sortResults(result);

		// Get the type corresponding to the class name
		Type t = Type.forName(cs.OcrParsingClass__c);
		
		// Instantiate the type
		OcrParserInterface handler = (OcrParserInterface)t.newInstance();
		
		scanResults = new ScanResults();

		// Invoke the org's handler
		scanResults.idResult = handler.parseResults(idClass, sortedResult);


		// Tack on the Id of the ContentVersion of the image.
		scanResults.idResult.contentVersionId = getContentVersionId(contentId);
		scanResults.idResult.identifiedStateDL = idClass;

		return scanResults;
	}

	// Returns the current user's Id to the Lightning component
	@AuraEnabled
	public static id getMyUserId(){
		return UserInfo.getUserId();
	}

	// Creates a temporary URL that can be used by the Lightning component to point to the image
	@AuraEnabled
	public static string createContentUrl(String contentDocumentId) {
		System.debug('createContentUrl ' + contentDocumentId);
		string CD_TEMP_PREFIX = 'EinsteinTemp';
		integer EXPIRY = 5;
		
        if (Schema.sObjectType.ContentVersion.fields.Title.isAccessible() && 
            Schema.sObjectType.ContentVersion.fields.Id.isAccessible())
        {
            
            ContentVersion CV = [select id, Title from ContentVersion where ContentDocumentId =: contentDocumentId and isLatest = true];        
            
            ContentDistribution CD = new ContentDistribution();
            CD.ContentVersionId = CV.Id;
            CD.Name = CD_TEMP_PREFIX + '_' + CV.Title;
            CD.PreferencesAllowOriginalDownload = true;
            CD.PreferencesLinkLatestVersion = true;
            CD.ExpiryDate = system.now().addMinutes(EXPIRY);
            CD.PreferencesExpires = true;
            CD.PreferencesNotifyOnVisit = false;
            CD.PreferencesNotifyRndtnComplete = false;
            
            if (!Schema.sObjectType.ContentDistribution.fields.ContentVersionId.isCreateable()
                && !Schema.sObjectType.ContentDistribution.fields.Name.isCreateable() && 
                !Schema.sObjectType.ContentDistribution.fields.PreferencesAllowOriginalDownload.isCreateable() &&
                !Schema.sObjectType.ContentDistribution.fields.PreferencesLinkLatestVersion.isCreateable() &&
                !Schema.sObjectType.ContentDistribution.fields.PreferencesExpires.isCreateable() &&
                !Schema.sObjectType.ContentDistribution.fields.ExpiryDate.isCreateable() &&
                !Schema.sObjectType.ContentDistribution.fields.PreferencesNotifyOnVisit.isCreateable() &&
                !Schema.sObjectType.ContentDistribution.fields.PreferencesNotifyRndtnComplete.isCreateable()
               ){
                   
                   ApexPages.addMessage(new ApexPages.Message(	ApexPages.Severity.ERROR,'Error: Insufficient Access'));
                   return null;
               }
            
            insert CD;
            
            if (Schema.sObjectType.ContentDistribution.fields.ContentDownloadUrl.isAccessible() && 
                Schema.sObjectType.ContentDistribution.fields.Id.isAccessible())
            {
                
                ContentDistribution CD2 = [select id, ContentDownloadUrl from ContentDistribution where Id =: cd.Id];
                return CD2.ContentDownloadUrl;
            }
            else
            {
                return null;
            }

	}
        else
        {
            return null;
        }
    }

	// Private convienence methods
	// ===========================
	private static String classifyDL (String modelName, String url) {
		Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.IMAGE);
		Einstein_PredictionResult result;

		if (!Test.isRunningTest())  {
			result =  service.predictImageUrl(modelName, url, 3, 'IDImage');
			if (service.httpStatusCode > 200) {
				throw new AuraHandledException(service.httpErrorMessage);
			}
			return result.probabilities[0].label;
		} else {
			return IDReader_FakeData.format;
		}
	}

	private static Einstein_PredictionResult extractText(String ocrModelName, String url) {
		Einstein_PredictionService service = new Einstein_PredictionService(Einstein_PredictionService.Types.OCR);
		Einstein_PredictionResult result;

		if (!Test.isRunningTest())  {
			result = service.predictOcrUrl(ocrModelName, url, 'DriversLicense');			
			if (service.httpStatusCode > 200) {
				throw new AuraHandledException(service.httpErrorMessage);
			}
			return result;
		} else {
			return IDReader_FakeData.create();
		}
	}

	// Wrapper class that implements Comparable 
	// so that prediction results can be sorted.
	private class PredictionWrapper implements Comparable {
		Integer gap = 5;
		
		public Einstein_Probability probability;
        
        public PredictionWrapper(Einstein_Probability prob) {
            probability = prob;
        }

		public Integer compareTo (Object compareTo) {
            PredictionWrapper compareToProbability = (PredictionWrapper)compareTo;
            
            Integer x1 = probability.boundingBox.minX;
            Integer x2 = compareToProbability.probability.boundingBox.minX;
            Integer y1 = probability.boundingBox.minY;
			Integer y2 = compareToProbability.probability.boundingBox.minY;
			Integer xDiff = x1 - x2;
			Integer yDiff = y1 - y2;

			// Sorts Top to Bottom priority.  Uses a gap to provide tollerance if the 
			// image is slightly tilted.
            Integer returnValue = 0;
            if (Math.abs(yDiff) > gap) {
                returnValue = yDiff;
            } else {
                returnValue = xDiff;
            }
            return returnValue;
        }
    }

	// Performs the sort using the wrapper class
	private static Einstein_PredictionResult sortResults(Einstein_PredictionResult result) {
		// Populate a list of sortable wrappers
		PredictionWrapper[] predictionList = new List<PredictionWrapper> ();
		for (Einstein_Probability prob : result.probabilities) {
			predictionList.add(new PredictionWrapper(prob));
		}
		// Use the sortable wrapper class to sort
		predictionList.sort();

		// Create a new prediction result that is sorted
		Einstein_PredictionResult sortedResult = new Einstein_PredictionResult();
		sortedResult.probabilities = new List<Einstein_Probability>();
		for (PredictionWrapper wrapper : predictionList) {
			sortedResult.probabilities.add(wrapper.probability);
		}

		System.debug('sortedResult: ');
		system.debug(sortedResult);
		return sortedResult;
	}

    private static string getContentVersionId (String contentDocumentId) {
        System.debug('getContentVersionId ' + contentDocumentId);
        
        if (Schema.sObjectType.ContentVersion.fields.Id.isAccessible())
        {
            
            ContentVersion CV = [select id from ContentVersion where ContentDocumentId =: contentDocumentId and isLatest = true];
            return CV.id;
        }
        else{
            return null;
        }
    }

}