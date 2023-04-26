@isTest
public with sharing class AccountManagerTest {
   
    @TestSetup
    private static void makeData() {
        List<Account> accounts = new List<Account>();
        for (Integer i = 1; i < 2; i++) {
            Account acc = new Account(Name='Test Account '+i);
            acc.Type = 'New Account';
            acc.Industry = 'Consulting';
            acc.AnnualRevenue = 20000000;
            accounts.add(acc);
        }
        insert accounts;
    }

    @isTest 
    private static void getAccountTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue FROM Account LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Account/' + acc.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'GET';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout
        Account acc1 = AccountManager.getAccount();

        //4. Perform asserts
        Assert.areEqual(acc.Name, acc1.Name);
        Assert.areEqual(acc.AnnualRevenue, acc1.AnnualRevenue);
        Test.stopTest();
    }

    @isTest 
    private static void postAccountTest() {
        Test.startTest();
        //1. Make callout
        Id accId = AccountManager.postAccount('Test Name', 'Existing Customer - Upgrade', 'Biotechnology', 3000000);

        //2. Perform asserts
        Assert.isNotNull(accId);
        Test.stopTest();
    }

    @isTest 
    private static void deleteAccountTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Account acc = [SELECT Id FROM Account LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Account/' + acc.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout (Success Case)
        String status = AccountManager.deleteAccount();

        //4. Perform asserts
        Assert.areEqual('Success', status);
        Test.stopTest();
    }

    @isTest 
    private static void deleteAccountFailTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Account acc = [SELECT Id FROM Account LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Account/' + acc.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout (Failure Case)
        String statusOld = AccountManager.deleteAccount();
        String status = AccountManager.deleteAccount();

        //4. Perform asserts
        Assert.areEqual('Fail', status);
        Test.stopTest();
    }

    @isTest 
    private static void putAccountTest() {
        Test.startTest();
       //1. Prepare RestRequest and wrap all the necessary information in it
            //Step 1 create a record
            Account acc = new Account(Name='My Account', Type='New Account', Industry='Electronics', AnnualRevenue=4000000);
            //Step 2 convert a record into json
            String body = JSON.serialize(acc);
            //Step 3 convert a json into blob
            RestRequest request = new RestRequest();
            request.requestBody = Blob.valueOf(body);
            request.httpMethod = 'PUT';

       //2. Prepare RestContext
       RestContext.request = request;

       //3. Make callout
       Account newAcc = AccountManager.putAccount();

       //4. Perform asserts
       Assert.isNotNull(newAcc.Id);
       Assert.areEqual(acc.Name, newAcc.Name);
       Assert.areEqual(acc.AnnualRevenue, newAcc.AnnualRevenue);
       Test.stopTest();
    }

    @isTest 
    private static void patchAccountTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
            //Step 1 query a record and update some fields
            Account acc = [SELECT Id, Name, Type, Industry, AnnualRevenue FROM Account LIMIT 1];
            acc.Industry = 'Education';
            acc.AnnualRevenue = 5000000;
            //Step 2 convert a record into json
            String body = JSON.serialize(acc);
            //Step 3 convert a json into blob
            RestRequest request = new RestRequest();
            request.requestBody = Blob.valueOf(body);
            request.httpMethod = 'PATCH';
        
        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout
        Account updatedAcc = AccountManager.patchAccount();

        //4. Perform asserts
        Assert.areEqual('Education', updatedAcc.Industry);
        Assert.areEqual(5000000, updatedAcc.AnnualRevenue);
        Test.stopTest();
    }
}