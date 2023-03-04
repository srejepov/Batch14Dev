public class AccountsBatch implements Database.Batchable<SObject> {
    public  Database.QueryLocator start(Database.BatchableContext bc){
        Database.QueryLocator db = Database.getQueryLocator([select id, active__c, description from account]);
        return db;
    }

    public void execute(Database.BatchableContext bc, List<Account> scope){
        system.debug('inside execute method');
        system.debug('number of records to process is ' + scope.size());
        for (Account eachAcc : scope) {
            eachAcc.Description += '...Updated VIA Batch. OKAY?';
        }
        update scope;
    }

    public void finish(Database.BatchableContext bc){
        system.debug('finish method is called. all records are processed.');
    }
}