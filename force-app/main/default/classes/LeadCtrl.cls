public with sharing class LeadCtrl {
    @AuraEnabled
    public static List<Lead> getRecentLeads(){
        return [SELECT Id, FirstName, LastName, Title, Company, Email, Industry
                FROM Lead
                WITH SECURITY_ENFORCED
                ORDER BY CreatedDate DESC
                LIMIT 5];
    }
}