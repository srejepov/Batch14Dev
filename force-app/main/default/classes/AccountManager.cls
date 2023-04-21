@RestResource(urlMapping='/Account/*')
global with sharing class AccountManager {
    // https://abcd121-dev-ed.develop.my.salesforce.com/services/apexrest/Account/001Dn00000B9GraIAF

    @HttpGet
    global static Account getAccount() {
       RestRequest request = RestContext.request;
       String endpoint = request.requestURI; 
       Integer lastIndex = endpoint.lastIndexOf('/');
       Id accountId = endpoint.substring(lastIndex+1);
       Account acc = [SELECT Name, Type, Industry, AnnualRevenue FROM Account WHERE Id = :accountId];
       return acc;
    }

    @HttpPost
    global static Id postAccount(String name, String type, String industry, Integer annualRevenue) {
        Account acc = new Account();
        acc.Name = name;
        acc.Type = type;
        acc.Industry = industry;
        acc.AnnualRevenue = annualRevenue;
        insert acc;
        return acc.Id;
    }

    @HttpDelete 
    global static String deleteAccount() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id accId = endpoint.substring(lastIndex+1);
    }
}