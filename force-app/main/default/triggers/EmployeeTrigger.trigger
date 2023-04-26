trigger EmployeeTrigger on Employee__c (after insert) {
    if (Trigger.isAfter && Trigger.isInsert) {
        TriggerEmployeeHandler.afterInsert(Trigger.new);
    }
}