({
    init: function(component, event, helper) {
        // Set values (abstract EinsteinPlatformCard)
        component.set("v.hasData", true);
        component.set("v.cardLabel", component.get("v.title"));

        helper.getUserId(component);

        // Set default backgroud for image.  Setting this as the default of the attribute in the component
        // causes problems where the predicted image will not load.
        component.set("v.pictureSrc", $A.get('$Resource.einstein_images') + '/einstein_images/EinsteinVIsionDefault.png');
    },

    // Invoked by lightning:fileUpload when file has been uploaded... obviously
    handleUploadFinished: function(component, event, helper) {
        console.log('handleUploadFinished');
        component.set("v.identifiedStateDL", null);

        var uploadedFiles = event.getParam("files");
        var contentId = '';

        // Multiple file upload is not allowed, so there should only be one
        for(var i=0; i<uploadedFiles.length; i++) {
            console.log( uploadedFiles[i].name + ' - ' + uploadedFiles[i].documentId );
            contentId =  uploadedFiles[i].documentId;
        }

        helper.analyzeContent(component, contentId);
    },
 
});