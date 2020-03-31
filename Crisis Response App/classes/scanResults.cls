global class scanResults {
	@AuraEnabled
	global Einstein_PredictionResult einsteinPredictionResult;
	@AuraEnabled
	global IDResult idResult;

	global scanResults() {
		this.einsteinPredictionResult = new Einstein_PredictionResult();
		this.einsteinPredictionResult.probabilities = new List<Einstein_Probability>();
		this.idResult = new idResult();		
	}
}