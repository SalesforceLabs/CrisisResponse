({ 
    doInit : function(component, event, helper) { 
        var action = component.get("c.getCompanyNews"); 
        var returnvals = []; 
        action.setCallback(this, function(response){ 
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.rec", response.getReturnValue()); 
                returnvals = response.getReturnValue(); 
            }
        }); 
        $A.enqueueAction(action); 
    } 
})