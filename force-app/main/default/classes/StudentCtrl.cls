public with sharing class StudentCtrl {
    @AuraEnabled
    public static List<Student__c> searchStudentsByPostalCode(String searchWord) {
        if (string.isNotBlank(searchWord)) {
            searchWord = '%' + searchWord + '%';
            return [SELECT Student_Name__c, Class__c, Mobile__c, Email__c, Postal_Code__c 
                    FROM Student__c 
                    WHERE Postal_Code__c LIKE :searchWord 
                    WITH SECURITY_ENFORCED]; 
        }
        
    }
}