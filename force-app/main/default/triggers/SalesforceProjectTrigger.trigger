trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (trigger.isAfter && trigger.isInsert) {
        system.debug('call method now...');
        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet()); 
        system.debug('method just called...');       
        SPTriggerHandler.createDefaultSPTicket(trigger.new);
    }
        
    if (Trigger.isBefore && Trigger.isUpdate) {
        system.debug('before update project trigger called');
        //SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());
        //validate status complete method
        //SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
    if (trigger.isAfter && trigger.isUpdate) {
        SPTriggerHandler.projectStatusChange(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
/*
    if (trigger.isAfter && trigger.isUpdate) {
        SPTriggerHandler.stStatusNotComplete(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }*/
}