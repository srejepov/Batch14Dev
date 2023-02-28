trigger SalesforceProjectTriggerAssignment on Salesforce_Project__c (after update) {
    set<id> spIds = new set<id>();
    List<Salesforce_Ticket__c> listOfST = new list<Salesforce_Ticket__c>();
    if (trigger.isAfter && trigger.isUpdate) {
        for (Salesforce_Project__c eachSP : trigger.new) {
            if (eachSP.Status__c != trigger.oldMap.get(eachSP.Id).Status__c && eachSP.Status__c == 'Completed') {
           spIds.add(eachSP.Id);
           }
       }
       if (!spIds.isEmpty()) {
           List<Salesforce_Ticket__c> stList = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c in:spIds and status__c != 'Completed']; 
           for (Salesforce_Ticket__c eachST : stList) {
               eachST.Status__c = trigger.newMap.get(eachST.Salesforce_Project__c).Status__c;
               listOfST.add(eachST);
           }
           if (!listOfST.isEmpty()) {
               update listOfST;
           }
       }
    }        
}