public with sharing class ContactCtrl {
    @AuraEnabled
    public static List<Contact> getContacts(String searchKey){
       searchKey = '%' + searchKey + '%';
        return [SELECT FirstName, LastName, Email, Title, Department 
                FROM Contact
                WHERE Name LIKE :searchKey
                WITH SECURITY_ENFORCED];
    }
}