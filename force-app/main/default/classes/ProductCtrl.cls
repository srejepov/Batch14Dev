public with sharing class ProductCtrl {
    @AuraEnabled
    public static List<Ecommerce_Product__c> getProducts(Integer Amount){       
       return [SELECT Title__c, Brand__c, Category__c, Price__c
                FROM Ecommerce_Product__c
                WHERE Price__c <= :Amount
                WITH SECURITY_ENFORCED];
    }
}