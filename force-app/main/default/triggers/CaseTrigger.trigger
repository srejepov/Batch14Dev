trigger CaseTrigger on Case (before insert, before update) {
    
    if (trigger.isBefore) {
        system.debug(' before insert case trigger called');
        system.debug('trigger size is ' + trigger.size);
        CaseTriggerHandler.count++;
        CaseTriggerHandler.numOfRecords += trigger.size;
        system.debug('# of times trigger ran : ' + CaseTriggerHandler.count);
        system.debug('# of records processed : ' + CaseTriggerHandler.numOfRecords);
    }
    
}