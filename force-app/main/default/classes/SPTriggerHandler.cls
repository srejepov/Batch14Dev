public class SPTriggerHandler {
    public static void createDefaultSPTicket(list<Salesforce_Project__c> spTriggerNew) {
        List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            Salesforce_Ticket__c st = new Salesforce_Ticket__c();
            st.Subject__c = 'Default ST';
            st.Salesforce_Project__c = eachSP.Id;
            newST.add(st);
        }
        if (!newST.isEmpty()) {
            insert newST;
        }
    }

    public static void validateStatusCompletion(list<salesforce_project__c> spTriggerNew,
   list<salesforce_project__c> spTriggerOld,
   Map<id, salesforce_project__c> spTriggerNewMap,
   Map<id, salesforce_project__c> spTriggerOldMap) {

        set<id> spIds = new set<id>();
        //get all sp ids where status is changed to completed.
        for (Salesforce_Project__c eachSP : spTriggerNew) {
            //check if status is changed.
            //and new status is completed
            if (eachSP.status__c != spTriggerOldMap.get(eachSP.id).status__c
                && eachSP.status__c == 'Completed') {
                    spIds.add(eachSP.Id);
            }
        }

        if (!spIds.isEmpty()) {
            //get the list of tickets which are NOT completed for spIds.
            List<Salesforce_Ticket__c> listST = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c
                                                    where Salesforce_Project__c in :spIds and status__c != 'Completed'];
            for (Salesforce_Ticket__c eachST : listST) {
                
                spTriggerNewMap.get(eachST.Salesforce_Project__c).status__c.addError('Cannot complete project because all tickets are NOT completed.');
            }
        }
   }  
}
