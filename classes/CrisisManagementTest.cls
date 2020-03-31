@isTest
public class CrisisManagementTest {
    public static testMethod void testCompanyNewsList (){
        //Insert 50 test contacts
        List<crisisapp__Company_news__c> cnews = new List<crisisapp__Company_news__c>();
        //   List<Company_News__c> companynews = [Select Headline__c, Description__c, FORMAT(Date_Posted__c) formattedDate  From Company_News__c where Public__c =:TRUE ORDER BY Date_Posted__c DESC]; 
        for (Integer count = 0; count < 50; count++) {
            cnews.add(new Company_news__c(crisisapp__Headline__c = 'Headline '+count, crisisapp__Description__c ='Description '+count, crisisapp__Date_Posted__c=system.today()));
        }
        insert cnews;
        
        List<crisisapp__Location__c> loc = new List<crisisapp__Location__c>();
        
        for (Integer count = 0; count < 50; count++) {
            loc.add(new crisisapp__Location__c(Name = 'location '+count, crisisapp__Location_Status__c='Open'));
        }
        
        insert loc;
        
        Test.startTest();
        List<crisisapp__Company_news__c> test_res = crisisapp.CrisisManagementCtrl.getCompanyNews();
        List<crisisapp__Location__c> loc_res = crisisapp.CrisisManagementCtrl.fetchOfficeStatus();
        Test.stopTest();
        
        
    }
}