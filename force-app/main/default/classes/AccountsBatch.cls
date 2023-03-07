public class AccountsBatch implements Database.Batchable<SObject>, Database.Stateful {
    integer recordCount = 0;
    public  Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator db = Database.getQueryLocator([select id, active__c, description from account]);
        return db;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('inside execute method');
        system.debug(' record count: START : ' + recordCount);

        List<Account> updateAccount = new List<Account>();
        for (Account eachAcc : scope) {
            if (eachAcc.Active__c != 'No') {
                eachAcc.Description += '...Updated VIA Batch.'; 
                updateAccount.add(eachAcc);
            }            
        }
        if (!updateAccount.isEmpty()) {
            recordCount += updateAccount.size();
            update scope;
            system.debug('record count: AFTER Update :' + recordCount);
        }        
    }

    public void finish(Database.BatchableContext bc){
        system.debug('finish method is called. all records are processed.');
        system.debug('record count: FINAL : ' + recordCount);
    }
}