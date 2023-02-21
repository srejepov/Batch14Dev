trigger AccountAssignmentTrigger on Account (before insert, after insert, before update, after update) {
    if (trigger.isBefore) {
        if (trigger.isInsert) {
            for (account eachAcc : trigger.new) {
                system.debug('trigger.new is ' + trigger.new);
                system.debug('trigger.old is ' + trigger.old);
                system.debug('trigger.newMap is ' + trigger.newMap);
                system.debug('trigger.oldMap is ' + trigger.oldMap);  
            }            
        }
        if (trigger.isUpdate) {
            for (account eachAcc : trigger.new) {
                system.debug('trigger.new is ' + trigger.new);
                system.debug('trigger.old is ' + trigger.old);
                system.debug('trigger.newMap is ' + trigger.newMap);
                system.debug('trigger.oldMap is ' + trigger.oldMap);   
            }            
        }
    }
    if (trigger.isAfter) {
        if (trigger.isInsert) {
            for (account eachAcc : trigger.new) {
                system.debug('trigger.new is ' + trigger.new);
                system.debug('trigger.old is ' + trigger.old);
                system.debug('trigger.newMap is ' + trigger.newMap);
                system.debug('trigger.oldMap is ' + trigger.oldMap);
                system.debug('new account record map is ' + trigger.newMap.get(eachAcc.Id));
            } 
        }
            
        if (trigger.isUpdate) {
            for (account eachAcc : trigger.new) {
                system.debug('trigger.new is ' + trigger.new);
                system.debug('trigger.old is ' + trigger.old);
                system.debug('trigger.newMap is ' + trigger.newMap);
                system.debug('trigger.oldMap is ' + trigger.oldMap); 
                system.debug('new account record map is ' + trigger.newMap.get(eachAcc.Id));
                system.debug('old account record map is ' + trigger.oldMap.get(eachAcc.Id));
            }
            
        }
    }
}