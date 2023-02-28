public class AccountTriggerHandler {
    public static void updateDescription(List<Account> accTriggerNew, List<Account> accTriggerOld, map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap) {
        boolean updateDesc = false;
        for (Account eachAccount : accTriggerNew) {
            if ((trigger.isInsert) && eachAccount.Active__c == 'Yes') {
                //eachAccount.Description = 'Account is active now. Enjoy buddy!';
                updateDesc = true;
            }
            if (trigger.isUpdate) {
                string newActive = eachAccount.Active__c;

                account oldAccount = accTriggerOldMap.get(eachAccount.Id);
                string oldActive = oldAccount.Active__c;
                if (newActive != oldActive && newActive == 'Yes') {
                    //eachAccount.Description = 'Account is active now. Enjoy Enjoy buddy!';
                    updateDesc = true;
                }
            }
            if (updateDesc) {
                eachAccount.Description = 'Account is active now. Enjoy Enjoy Enjoy buddy!';
            }
        }
    }

    public static void updateVIPforContact(List<Account> accTriggerNew, List<Account> accTriggerOld, map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap) {
        set<id> accIds = new set<id>();
        for (account eachAccount : accTriggerNew) {
            if (eachAccount.VIP__c != accTriggerOldMap.get(eachAccount.Id).Vip__c) {
                accIds.add(eachAccount.Id);
            }
        }
        if (!accIds.isEmpty()) {
            List<Contact> listContacts = [select id, vip__c, accountid from contact where AccountId in :accIds];

            for (contact eachContact : listContacts) {            
                eachContact.vip__c = accTriggerNewMap.get(eachContact.AccountId).vip__c;
            }
            if (!listContacts.isEmpty()) {
                update listContacts;
            }  
        }        
    }
    // home assignment
    public static void updateMailingCityforContact(List<Account> accTriggerNew, List<Account> accTriggerOld, map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap) {        
        set<id> accountIds = new set<id>();
        for (account eachAccount : accTriggerNew) {
            if (eachAccount.BillingCity != accTriggerOldMap.get(eachAccount.Id).BillingCity) {
                accountIds.add(eachAccount.Id);
            }
        }
        List<Contact> contactList = [select id, MailingCity, accountid from contact where AccountId in :accountIds];

        for (contact eachContact : contactList) {
            eachContact.MailingCity = accTriggerNewMap.get(eachContact.AccountId).BillingCity;            
        }
        if (!contactList.isEmpty()) {
            update contactList;
        }
    }
    //home assignment 17, Feb 21
    public static void createContact(List<Account> accTriggerNew) {
        List<Contact> contList = new List<Contact>();
        for (account eachAccount : accTriggerNew) {
            contact cont = new contact();
            cont.FirstName = 'Declan';
            cont.LastName = 'Rice';
            cont.AccountId = eachAccount.Id;
            contList.add(cont);
        }
        if (!contList.isEmpty()) {
            insert contList;
        }
    }
}