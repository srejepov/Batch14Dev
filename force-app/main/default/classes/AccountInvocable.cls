public with sharing class AccountInvocable {
    @invocableMethod(label = 'Close Opportunities'
    description = 'This method is going to close all the open opportunities when the account status is changed to inactive or hold'
    category = 'Account')
    public static void closeOpportunities(List<Id> accountIds) {
        List<Opportunity> opps = [SELECT Id, StageName FROM Opportunity 
                                WHERE AccountId IN :accountIds 
                                AND StageName NOT IN ('Closed Won', 'Closed Lost') 
                                WITH SECURITY_ENFORCED];

        for (Opportunity opp : opps) {
            opp.StageName = 'Close Lost';
        }
        try {
            update opps;
        } catch (Exception ex) {
            system.debug(ex.getMessage());
        }
    }
}