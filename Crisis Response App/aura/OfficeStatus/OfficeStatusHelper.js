({
    fetchLocHelper : function(component, event, helper) {
        component.set('v.mycolumns', [
            {label: 'Location Name', fieldName: 'Name', type: 'text'},
             //   {label: 'City', fieldName: 'City__c', type: 'text'},
                {label: 'Status', fieldName: 'crisisapp__Location_Status__c', type: 'text'}
            ]);
        var action = component.get("c.fetchOfficeStatus");
        action.setParams({
        });
        action.setCallback(this, function(response){
            var state = response.getState();
            if (state === "SUCCESS") {
                component.set("v.locList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
    }
})