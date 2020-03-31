@IsTest
public with sharing class TEST_IDReader {

	static void createSettings () {
		Einstein_Settings__c settings = Einstein_Settings__c.getOrgDefaults();
		settings.Einstein_EMail__c = 'test@mail.com';
		upsert settings;

		IDReader__c IDReaderSettings = IDReader__c.getOrgDefaults();
		IDReaderSettings.Image_Classification_Model_Id__c = 'some model';
		IDReaderSettings.OCR_Model_Id__c = 'OCRModel';
		IDReaderSettings.Use_Image_Classification__c = true;
		IDReaderSettings.OcrParsingClass__c = 'IDReader_FakeData';
		upsert IDReaderSettings;

	}

	static ContentVersion createContentVersion() {
		ContentVersion cv = new ContentVersion();
		cv.title = 'test';
		cv.PathOnClient = 'test';
		cv.versionData = EncodingUtil.base64Decode('This is test content');
		insert cv;
		ContentVersion cv2 =[SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id =: cv.Id];
		return cv2;
	}
	

	static testMethod void getMyUserId() {

		String thisUser = UserInfo.getUserId();

		Test.startTest();
		String userId = IDReader_Controller.getMyUserId();
		Test.stopTest();

		System.assertEquals(thisUser, userId);
	}

	static testMethod void createContentUrl() {

		ContentVersion cv = new ContentVersion();
		cv.title = 'test';
		cv.PathOnClient = 'test';
		cv.versionData = EncodingUtil.base64Decode('This is test content');
		insert cv;
		Id ContentDocumentId = [SELECT Id, ContentDocumentId FROM ContentVersion WHERE Id = :cv.Id][0].ContentDocumentId;

		Test.startTest();
		String url = IDReader_Controller.createContentUrl(ContentDocumentId);
		Test.stopTest();

		System.debug('Content url is ' + url);
		System.assert(url.startsWith('https://'), 'Bad URL from createContentUrl');
	}

	static testMethod void analyzeImageUrlnewYorkState1() {

		createSettings();
		ContentVersion cv = createContentVersion();

		Test.startTest();
		IDReader_FakeData.format = 'NewYorkState1';
		scanResults scanResults = IDReader_Controller.analyzeImageUrl('fake url', cv.ContentDocumentId);
		Test.stopTest();

		System.assertEquals('Brenna', scanResults.idResult.firstName);
		System.assertEquals('Murphy', scanResults.idResult.lastName);
		System.assertEquals('I\'ll Anywhere Street', scanResults.idResult.streetAddress);
		System.assertEquals('City', scanResults.idResult.cityAddress);
		System.assertEquals('DL', scanResults.idResult.stateAddress);
		System.assertEquals('67890-10', scanResults.idResult.zipCode);
		System.assertEquals(true, scanResults.idResult.isOrganDonor);
		System.assertEquals(cv.Id, scanResults.idResult.contentVersionId);
	}

	static testMethod void analyzeImageUrlnewYorkState2() { 

		createSettings();
		ContentVersion cv = createContentVersion();

		Test.startTest();
		IDReader_FakeData.format = 'NewYorkState2';
		scanResults scanResults = IDReader_Controller.analyzeImageUrl('fake url', cv.ContentDocumentId);
		Test.stopTest();

		System.assertEquals('Michael', scanResults.idResult.firstName);
		System.assertEquals('Motorist', scanResults.idResult.lastName);
		System.assertEquals('2345 Anywhere Street', scanResults.idResult.streetAddress);
		System.assertEquals('Your City.', scanResults.idResult.cityAddress);
		System.assertEquals('NY', scanResults.idResult.stateAddress);
		System.assertEquals('12345', scanResults.idResult.zipCode);
		System.assertEquals(true, scanResults.idResult.isOrganDonor);
		Date d = Date.valueOf('1978-08-31 12:00:00');
		System.assertEquals(d, Date.valueOf(scanResults.idResult.dob));
	}

	static testMethod void analyzeImageUrlCalifornia() { 

		createSettings();
		ContentVersion cv = createContentVersion();

		Test.startTest();
		IDReader_FakeData.format = 'California';
		scanResults scanResults = IDReader_Controller.analyzeImageUrl('fake url', cv.ContentDocumentId);
		Test.stopTest();

		System.assertEquals('Lucille', scanResults.idResult.firstName);
		System.assertEquals('Ball', scanResults.idResult.lastName);
		System.assertEquals('918 N Roxbury', scanResults.idResult.streetAddress);
		System.assertEquals('Beverly Hils', scanResults.idResult.cityAddress);
		System.assertEquals('CA', scanResults.idResult.stateAddress);
		System.assertEquals('90210', scanResults.idResult.zipCode);
		System.assertEquals(false, scanResults.idResult.isOrganDonor);
		Date d = Date.valueOf('1911-08-06 12:00:00');
		System.assertEquals(d, Date.valueOf(scanResults.idResult.dob));
	}

	static testMethod void analyzeImageUrlNewJersey() { 

		createSettings();
		ContentVersion cv = createContentVersion();

		Test.startTest();
		IDReader_FakeData.format = 'NewJersey';
		scanResults scanResults = IDReader_Controller.analyzeImageUrl('fake url', cv.ContentDocumentId);
		Test.stopTest();

		System.assertEquals('Jessica.f', scanResults.idResult.firstName);
		System.assertEquals('Brady', scanResults.idResult.lastName);
		System.assertEquals('3512 Bluntbong Way', scanResults.idResult.streetAddress);
		System.assertEquals('Freehold', scanResults.idResult.cityAddress);
		System.assertEquals('NJ', scanResults.idResult.stateAddress);
		System.assertEquals('08094-434', scanResults.idResult.zipCode);
		System.assertEquals(false, scanResults.idResult.isOrganDonor);
		Date d = Date.valueOf('1982-05-21 12:00:00');
		System.assertEquals(d, Date.valueOf(scanResults.idResult.dob));
	}

}