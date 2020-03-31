public with sharing class CrisisManagementCtrl {
    
    @AuraEnabled 
    public static List<crisisapp__Company_News__c> getCompanyNews(){ 
        //List<Company_News__c> cn = [Select Headline__c, Description__c, Date_Posted__c From Company_News__c where Public__c =:TRUE limit 20];
        if (Schema.sObjectType.crisisapp__Company_News__c.fields.crisisapp__Headline__c.isAccessible() && 
            Schema.sObjectType.crisisapp__Company_News__c.fields.crisisapp__Description__c.isAccessible() && 
            Schema.sObjectType.crisisapp__Company_News__c.fields.crisisapp__Date_Posted__c.isAccessible()&& 
            Schema.sObjectType.crisisapp__Company_News__c.fields.crisisapp__Public__c.isAccessible() &&
            Schema.sObjectType.crisisapp__Company_News__c.fields.Id.isAccessible())
        {
            List<crisisapp__Company_News__c> companynews = [Select Id, crisisapp__Headline__c, crisisapp__Description__c, FORMAT(crisisapp__Date_Posted__c) formattedDate  From crisisapp__Company_News__c where crisisapp__Public__c =:TRUE ORDER BY crisisapp__Date_Posted__c DESC]; 
            return companynews;
        }
        
        else 
        {
            System.debug('User requires permission to access Company News Object');
            return null;
        }
        
    } 
    
    @AuraEnabled
    public static List <Location__c> fetchOfficeStatus() {
        
        if (Schema.sObjectType.crisisapp__Location__c.fields.Name.isAccessible() && 
            Schema.sObjectType.crisisapp__Location__c.fields.CreatedDate.isAccessible() && 
            Schema.sObjectType.crisisapp__Location__c.fields.crisisapp__Location_Status__c.isAccessible()&& 
            Schema.sObjectType.crisisapp__Location__c.fields.crisisapp__Public__c.isAccessible()
           )
        {
            
            List<crisisapp__Location__c> locList = [SELECT Name, crisisapp__Location_Status__c from crisisapp__Location__c WHERE crisisapp__Public__c =:TRUE ORDER BY CreatedDate DESC];
            //return list of accounts
            return locList;
        }
        else
        {
            System.debug('User requires permission to access Location Object');
            return null;
        }
    }
}