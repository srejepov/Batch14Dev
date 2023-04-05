trigger ContactTrigger on Contact (before insert, after insert, before update, after update, before delete, after delete, after undelete) {
    TriggerSwitch__mdt ts = TriggerSwitch__mdt.getInstance('contact');
    if (!ts.enabled__c) {
        return;
    }
    if (trigger.isBefore && trigger.isUpdate) {
        //ContactTriggerHandler.contactUpdateValidation1(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
        ContactTriggerHandler.contactUpdateValidation2(trigger.new, trigger.old, trigger.newMap, trigger.oldMap);
    }
    if (trigger.isAfter) {
        //call method to update rollUpsummary field
        ContactTriggerHandler.rollUpSummaryUpdate(Trigger.new, trigger.old, trigger.newmap,trigger.oldmap);
     }
}   