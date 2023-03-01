trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (trigger.isAfter && trigger.isInsert) {
        SPTriggerHandler.updateProjectDescription(trigger.newMap.keySet());        
        SPTriggerHandler.createDefaultSPTicket(trigger.new);
    }
        
    if (Trigger.isBefore && Trigger.isUpdate) {
        //validate status complete method
        SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
/*
    if (trigger.isAfter && trigger.isUpdate) {
        SPTriggerHandler.stStatusNotComplete(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }*/
}