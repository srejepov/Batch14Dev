public class AccountUpdateHelper {
    /*@invocableMethod
   public static void updateAccountWebsite(list<id> accIds) {
        list<account> listAccount = [select id, website from account where id in:accIds];
        for (account eachAccount : listAccount) {
            eachAccount.Website = 'www.softinnovas.com';
        }
        update listAccount;
   }*/
   @invocableMethod
    public static void updateStatusOfST(List<Id> spIds) {
        List<Salesforce_Ticket__c> stListToUpdate = new list<Salesforce_Ticket__c>();
        List<Salesforce_Ticket__c> stList = [select id, status__c, salesforce_project__c from Salesforce_Ticket__c where Salesforce_Project__c = :spIds and status__c != 'Completed']; 
        for (Salesforce_Ticket__c eachST : stList) {
            eachST.Status__c = 'Completed';
            stListToUpdate.add(eachST);
        }
        if (!stListToUpdate.isEmpty()) {
             update stListToUpdate;
        }
    }
}