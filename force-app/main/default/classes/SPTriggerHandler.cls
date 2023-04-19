public class SPTriggerHandler {
    public static void createDefaultSPTicket(list<Salesforce_Project__c> spTriggerNew) {
        try {
            DefaultTicketInfo__c dtInfo;
            Profile adminProfile = [select id, name from profile where name = 'System Administrator'];
            if(UserInfo.getProfileId() == adminProfile.Id){
                dtInfo = DefaultTicketInfo__c.getInstance(adminProfile.Id);
            } else {
                dtInfo = DefaultTicketInfo__c.getOrgDefaults();
            }
            
            List<Salesforce_Ticket__c> newST = new List<Salesforce_Ticket__c>();
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                Salesforce_Ticket__c st = new Salesforce_Ticket__c();
                st.Subject__c = dtInfo.Subject__c;
                st.Salesforce_Project__c = eachSP.Id;
                st.Priority__c = 'High';
                st.Description__c = dtInfo.Description__c;
                newST.add(st);
            }
            if (!newST.isEmpty()) {
                insert newST;
            }            
        } catch (Exception ex) {
            string errorMessage = system.label.SPTicketValidation;	
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                eachSP.addError(errorMessage);
            }
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
   
   //1. static
   //2. it must return void
   //3. parameters: primitive datatypes or collection of primitive data types. List of Sobject is not allowed in future method.
   @future
   public static void updateProjectDescription(Set<Id> spIds) {
        List<Salesforce_Project__c> listSP = [select id, description__c from Salesforce_Project__c where id in :spIds];
        for (Salesforce_Project__c eachSP : listSP) {
            eachSP.Description__c = 'Updated from future.';
        }
        update listSP;
   }

   public static void projectStatusChange(list<salesforce_project__c> spTriggerNew,
        list<salesforce_project__c> spTriggerOld,
        Map<id, salesforce_project__c> spTriggerNewMap,
        Map<id, salesforce_project__c> spTriggerOldMap) {
            
            set<id> projectIds = new set<id>();
            for (Salesforce_Project__c eachSP : spTriggerNew) {
                if (eachSP.Status__c == 'Completed' && eachSP.Status__c != spTriggerOldMap.get(eachSP.Id).Status__c) {
                    projectIds.add(eachSP.Id);
                }                
            }
            if (!projectIds.isEmpty()) {
                updateTicketStatus(projectIds);
            }    
   }
   @testVisible
   @future
   private static void updateTicketStatus(set<id> spIds) {

       List<Salesforce_Ticket__c> listST = [select id, status__c, Salesforce_Project__c from Salesforce_Ticket__c
       Where Salesforce_Project__c in :spIds and status__c !='Completed'];
       for (Salesforce_Ticket__c st : listST) {
            st.Status__c = 'Completed';     
       }
       update listST;
   }
}