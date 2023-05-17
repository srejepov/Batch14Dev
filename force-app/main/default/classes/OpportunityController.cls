public with sharing class OpportunityController {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getRecentOpps(){
        return [SELECT Id, Name, Type, StageName, Amount, CloseDate
                FROM Opportunity
                WITH SECURITY_ENFORCED
                ORDER BY CreatedDate DESC
                LIMIT 5];
    }

    @AuraEnabled
    public static List<Opportunity> getOppsByStage(String stage){
        return [SELECT Id, Name, Type, StageName, Amount, CloseDate
                FROM Opportunity
                WHERE StageName = :stage
                WITH SECURITY_ENFORCED
                ORDER BY Amount DESC];
    }
}