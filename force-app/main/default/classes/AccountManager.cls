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
        try {
            Account acc = [SELECT Id FROM Account WHERE Id = :accId];
            delete acc;
        } catch (Exception ex) {
            return 'Failed';
        }
        return 'Success';
    }

    @HttpPut 
    global static Account putAccount() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Account acc = (Account)JSON.deserialize(body, Account.class);
        upsert acc;
        return acc;
    }

    @HttpPatch 
    global static Account patchAccount() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Account acc = (Account)JSON.deserialize(body, Account.class);
        update acc;
        Account updateAcc = [SELECT Id, Name, Type, Industry, AnnualRevenue FROM Account WHERE Id = :acc.Id];
        return updateAcc;
    }
}