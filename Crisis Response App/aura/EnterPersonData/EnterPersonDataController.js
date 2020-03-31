({
	init: function(component, event, helper) {
		// Set values (abstract EinsteinPlatformCard)
		component.set("v.hasData", true);
		component.set("v.cardLabel", component.get("v.title"));
	},

	// Invoked when a Lighting Application event is received from
	// The Drivers License Scanner component
	handleIDScannedEvent: function (component, event, helper) {
		console.log('handleIDScannedEvent');

		// Populate the form with the values from the event
		var idResult = event.getParam("idResult");
		component.find("firstName").set("v.value", idResult.firstName);
		component.find("lastName").set("v.value", idResult.lastName);
		component.find("dob").set("v.value", idResult.dob);
		component.find("mailingStreet").set("v.value", idResult.streetAddress);
		component.find("mailingCity").set("v.value", idResult.cityAddress);
		component.find("mailingState").set("v.value", idResult.stateAddress);
		component.find("mailingPostalCode").set("v.value", idResult.zipCode);
		component.find("organDonor").set("v.value", idResult.isOrganDonor);

		// Save the contentVersionId for later
		component.set('v.contentVersionId', idResult.contentVersionId);
	},

	// Invoked when the user saves the record.
	handleOnSubmit: function (component, event, helper) {
		console.log('handleOnSubmit');
		event.preventDefault();
    	var fields = event.getParam("fields");
		
		fields["crisisapp__DLImageContentId__c"] = component.get('v.contentVersionId');
		component.find("newContactForm").submit(fields);
		
	},

	// Fired when new contact has been successfully saved.
	// Would like to navigate to it, but not working.
	handleOnSuccess: function (component, event, helper) {
		var record = event.getParam("response");
		console.log('handleOnSuccess ' + record.id);
		helper.handleConfirmation('New Contact ' + record.id + ' created');

		var navService = component.find("navService");	
		var pageReference = {
			type: 'standard__recordPage',
			attributes: {
				"recordId": record.id,
				"objectApiName": "Contact",
				"actionName": "view"
			}
		}
		event.preventDefault();
		navService.navigate(pageReference);
	},
})