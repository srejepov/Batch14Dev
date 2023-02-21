trigger AccountTriggerAssignment2 on Account (before insert, before update) {
    if (trigger.isBefore) {
        if (trigger.isInsert) {
            for (account eachAccount : trigger.new) {
                if (eachAccount.Active__c == 'Yes') {
                    eachAccount.Description = 'Account is Active';
                }
                if (eachAccount.Active__c == 'No') {
                    eachAccount.Description = 'Account is Inactive';
                }
            }
        }
        if (trigger.isUpdate) {
            for (account eachAccount : trigger.new) {
                if (trigger.oldMap.get(eachAccount.Id).Active__c != eachAccount.Active__c && eachAccount.Active__c == 'Yes') {
                    eachAccount.Description = 'Account is Active';
                }
                if (trigger.oldMap.get(eachAccount.Id).Active__c != eachAccount.Active__c && eachAccount.Active__c == 'No') {
                    eachAccount.Description = 'Account is Inactive';
                }
            }
        }
    }
}