({
    getUserId: function(component) {
        console.log("helper:getUserId");
        var action = component.get("c.getMyUserId");
        var helper = this;

        action.setCallback(this, function(a) {
            if (a.getState() === "SUCCESS") {
                var userId = a.getReturnValue();
                component.set("v.userId", userId);
            } else if (a.getState() === "ERROR") {
                helper.handleErrors(a.getError());
            }
        });

        $A.enqueueAction(action);
    },

    // Invoked by controller handleUploadFinished.
    // Creates a content document from the uploaded file, sets the picture Url, then invokes analyseUrl on the distribution url
    analyzeContent: function(component, contentId) {
        console.log("helper:analyzeContent");

        var action = component.get("c.createContentUrl");
        action.setParams({
            contentDocumentId: contentId
        });

        action.setCallback(this, function(response) {
            console.log("Got response createContentUrl");

            var state = response.getState();
            var errors = action.getError();
            if (state === "SUCCESS") {
                var returnValue = response.getReturnValue();
                console.log("analyzeContent SUCCESS " + returnValue);
                component.set("v.pictureSrc", returnValue);

                this.analyzeUrl(component, returnValue, contentId);

            } else if (state === "ERROR") {
                console.log("analyzeContent ERROR");
                $A.log("Errors", errors);
                this.handleErrors(errors);
            }
        });

        console.log("Sending ..");
        $A.enqueueAction(action);
    },

    // Analyzes the image referenced by the pictureSrc attribute
    analyzeUrl: function (component, url, contentId) {
        console.log('helper:analyzeUrl');
        component.set("v.spinnerWaiting", true);

        var helper = this;

        console.log("Analyzing " + url);

        // Have server call Einstein prediction
        var action = component.get("c.analyzeImageUrl");
        action.setParams({
            url: url,
            contentId, contentId
        });

        action.setCallback(this, function (response) {
            component.set("v.spinnerWaiting", false);
            console.log("Got Response analyseUrl ");
            
            var state = response.getState();
            var errors = action.getError();
            if (state === "SUCCESS") {
                // Save predictions in attributes
                var result = response.getReturnValue();
                var rawPredictions = JSON.stringify(result, null, 4);
                component.set("v.rawPredictions", rawPredictions);
                component.set("v.idResult", result.idResult);
                component.set("v.identifiedStateDL", result.idResult.identifiedStateDL);

                // Listen for resize when border overlays are added
                var ro = new ResizeObserver(entries => {
                    this.generateSvg(component, result.einsteinPredictionResult);
                });
                var img = component.find("imgItself").getElement();
                ro.observe(img);

                // Fire an application event so other components know
                this.fireEvent(component, result.idResult);

            } else if (state === "ERROR") {
                $A.log("Errors", errors);
                this.handleErrors(errors);
            }
        });
        
        console.log("Sending ..");
        $A.enqueueAction(action);
    },

    generateSvg: function (component, predictions) {
        console.log('helper:generateSvg');
        var imgContainer = component.find("imgContainer").getElement();
        // Remove any existing DIVs from overlay
        while (imgContainer.firstChild) {
            imgContainer.removeChild(imgContainer.firstChild);
        }
        
        var img = component.find("imgItself").getElement();
        var proportion = img.clientHeight / img.naturalHeight;
        if (proportion > 1) {
            proportion = 1;
        }
        
        if (predictions == null) {
            return;
        }

        var probabilities = predictions.probabilities;

        var svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
        var svgNS = svg.namespaceURI;

        var leftPos = img.offsetLeft;
        var topPos = img.offsetTop;

        probabilities.forEach(function (probability) {
            var color = '#e6194b';
            // create polygon for box
            var polygon = document.createElementNS(svgNS, "polygon");
            polygon.setAttribute(
                "style",
                "stroke:" + color + ";"
            );
            var points = [];
            points.push(
                (probability.boundingBox.minX * proportion + leftPos) +
                "," +
                (probability.boundingBox.minY * proportion + topPos)
            );
            points.push(
                (probability.boundingBox.maxX * proportion + leftPos) +
                "," +
                (probability.boundingBox.minY * proportion + topPos)
            );
            points.push(
                (probability.boundingBox.maxX * proportion + leftPos) +
                "," +
                (probability.boundingBox.maxY * proportion + topPos)
            );
            points.push(
                (probability.boundingBox.minX * proportion + leftPos) +
                "," +
                (probability.boundingBox.maxY * proportion + topPos)
            );
            polygon.setAttribute("points", points.join(" "));
            polygon.classList.add('polygon');

            svg.appendChild(polygon);
        }, this);
        imgContainer.appendChild(svg);
    },

    fireEvent: function (component, idResult) {
        console.log('fireEvent');

        var appEvent = $A.get("e.c:IDScanned");
        appEvent.setParams({
            "idResult": idResult
        });
        appEvent.fire();
    },


});