public with sharing class TriggerEmployeeHandler {
    public static void afterInsert(List<Employee__c> triggerNew) {
        for (Employee__c eachEmp : triggerNew) {
            RestCalloutEmployee.postEmployee(eachEmp.Id);
        }
    } 
}