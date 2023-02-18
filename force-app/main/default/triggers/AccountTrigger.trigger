trigger AccountTrigger on Account (before insert, before update, after insert, after update) {    
    system.debug('----- trigger starts -----');
    
    if (trigger.isBefore) {
        AccountTriggerHandler.updateDescription(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }       

    system.debug('===== trigger ends ====='); 

    /*
    Map<Id, Account>  trgNewMap = trigger.newMap;
    Map<Id, Account>  trgOldMap = trigger.oldMap;

    if (trigger.isBefore && trigger.isUpdate) {
        integer countWebsiteChange = 0;
        for (id eachId : trgNewMap.keySet()) {
            Account newAccount = trgNewMap.get(eachId);
            Account oldAccount = trgOldMap.get(eachId);

            system.debug('new account website field value ' + newAccount.Website);
            system.debug('old account website field value ' + oldAccount.Website);

            if (newAccount.Website != oldAccount.Website) {
                system.debug('for account ' +  newAccount.Name + ', new website is ' + newAccount.website);
                countWebsiteChange++;
            }
        }
        system.debug('number of records where website is changed ' + countWebsiteChange);
    }



    if (trigger.isAfter && trigger.isUpdate) {
        set<id> setIds = trgNewMap.keySet();

        for (id eachID : setIds) {
            
            account newAcc = trgNewMap.get(eachID);
            account oldAcc = trgOldMap.get(eachID);

            string newName = newAcc.Name;
            string oldName = oldAcc.Name;

            system.debug('new account name is ' + newName + ', old account name was ' + oldName);
            system.debug('new account name is version 2 ' + trigger.newMap.get(eachID).Name);
            system.debug('old account name was version 2 ' + trigger.oldMap.get(eachID).Name);
        }

        for (account eachNewAccount : trigger.new) {
            string newAccName = eachNewAccount.Name;

            Account oldAcc = trgOldMap.get(eachNewAccount.Id);
            string oldAccName = oldAcc.Name;

            system.debug('new account name is ' + newAccName + ', old account name was ' + oldAccName);
        }
    } 




    if (trigger.isBefore && trigger.isInsert) {
        system.debug('=====Before Insert====');
        system.debug('trigger.newMap -> ' + trgNewMap);
        system.debug('trigger.oldMap -> ' + trgOldMap);
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('=====After Insert====');
        system.debug('trigger.newMap -> ' + trgNewMap);
        system.debug('trigger.oldMap -> ' + trgOldMap);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('=====Before Update====');
        system.debug('trigger.newMap -> ' + trgNewMap);
        system.debug('trigger.oldMap -> ' + trgOldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('=====After Update====');
        system.debug('trigger.newMap -> ' + trgNewMap);
        system.debug('trigger.oldMap -> ' + trgOldMap);
    }



    if(trigger.isAfter){

        if(trigger.isUpdate){
            for(Account oldAcc:trigger.old){
                system.debug('old acc id is ' + oldAcc.Id + ', old acc name is ' + oldAcc.Name);
            }
            for(Account newAcc:trigger.new){
                system.debug('new acc id is ' + newAcc.Id + ', new acc name is ' + newAcc.Name);
            }
        }
    } 



    if (trigger.isBefore && trigger.isInsert) {
        system.debug('trigger.old in Before Insert ---> ' + trigger.old);
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('trigger.old in After Insert ---> ' + trigger.old);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('trigger.old is Before Update ---> ' + trigger.old);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('trigger.old in After Update ---> ' + trigger.old);
    }    



    if (trigger.isBefore && trigger.isInsert) {
        system.debug('trigger.new in Before Insert ---> ' + trigger.new);
    }
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('trigger.new in After Insert ---> ' + trigger.new);
    }
    if (trigger.isBefore && trigger.isUpdate) {
        system.debug('trigger.new is Before Update ---> ' + trigger.new);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        system.debug('trigger.new in After Update ---> ' + trigger.new);
    }


    List<Account> newAccounts = trigger.new;
     if (trigger.isAfter) {
        system.debug('after isert/update new records: ' + newAccounts);
        system.debug('Number of records inserted/updated ' + newAccounts.size());

        for (account eachAccount : newAccounts) {
            system.debug('new account id is ' + eachAccount.Id + ', new account name is ' + eachAccount.Name);
        }
     }


    system.debug('Trigger.isBefore -> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter -> ' + Trigger.isAfter);

    system.debug('Trigger.isInsert -> ' + Trigger.isInsert);
    system.debug('Trigger.isUpdate -> ' + Trigger.isUpdate);
    
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('after insert trigger called.');
    }

    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('before insert trigger called.');
    } 
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('after update trigger called.');
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('before update trigger called.');
    }
    system.debug('Trigger.isInsert --> ' + Trigger.isInsert);
    if(trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    system.debug('Trigger.isUpdate --> ' + Trigger.isUpdate);
    if(trigger.isUpdate){
        system.debug('before update trigger called.');
    }

    system.debug('Trigger.isBefore --> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter --> ' + Trigger.isAfter);
    
    if(Trigger.isBefore){
        system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert trigger called.');
    }
    */
       
}