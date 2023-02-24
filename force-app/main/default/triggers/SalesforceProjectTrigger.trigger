trigger SalesforceProjectTrigger on Salesforce_Project__c (before insert, after insert, before update, after update) {
    if (trigger.isAfter && trigger.isInsert) {
        SPTriggerHandler.createDefaultSPTicket(trigger.new);
    }
        
    if (Trigger.isBefore && Trigger.isUpdate) {
        //validate status complete method
        SPTriggerHandler.validateStatusCompletion(Trigger.New, Trigger.Old, Trigger.NewMap, Trigger.OldMap);
    }
}