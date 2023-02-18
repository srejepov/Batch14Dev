public class AccountTriggerHandler {
    public static void updateDescription(List<Account> accTriggerNew, List<Account> accTriggerOld, map<id, account> accTriggerNewMap, map<id, account> accTriggerOldMap) {
        for (Account eachAccount : accTriggerNew) {
            if ((trigger.isInsert) && eachAccount.Active__c == 'Yes') {
                eachAccount.Description = 'Account is active now. Enjoy buddy!';
            }
            if (trigger.isUpdate) {
                string newActive = eachAccount.Active__c;

                account oldAccount = accTriggerOldMap.get(eachAccount.Id);
                string oldActive = oldAccount.Active__c;
                if (newActive != oldActive && newActive == 'Yes') {
                    eachAccount.Description = 'Account is active now. Enjoy Enjoy buddy!';
                }
            }
        }
    }
}