@isTest 
public with sharing class LeadManagerTest {
    
    @TestSetup
    private static void makeData() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 1; i < 2; i++) {
            Lead ld = new Lead(LastName = 'Silver '+i, Company = 'SoftInnovas '+i);
            ld.FirstName = 'Michael';                        
            ld.Title = 'Developer';
            ld.LeadSource = 'Web';
            ld.Email = 'msilver@test.net';
            ld.Phone = '2465348954';
            leads.add(ld);
        }
        insert leads;
    }

    @isTest 
    private static void getLeadTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Lead ld = [SELECT Id, Name, Company, Title, LeadSource, Email, Phone FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'GET';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout
        Lead ld1 = LeadManager.getLead();

        //4. Perform asserts
        Assert.areEqual(ld.Name, ld1.Name);
        Assert.areEqual(ld.Company, ld1.Company);
        Test.stopTest();
    }

    @isTest 
    private static void postLeadTest() {
        Test.startTest();
        //1. Make callout
        Id leadId = LeadManager.postLead('Jimmy', 'Gold', 'Google', 'Senior Developer', 'Phone Inquiry', 'jgold@google.net', '2356325478');

        //2. Perform asserts
        Assert.isNotNull(leadId);
        Test.stopTest();
    }

    @isTest 
    private static void deleteLeadSuccessTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Lead ld = [SELECT Id FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout (Success Case)
        String status = LeadManager.deleteLead();

        //4. Perform asserts
        Assert.areEqual('Success', status);
        Test.stopTest();
    }

    @isTest 
    private static void deleteLeadFailTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
        Lead ld = [SELECT Id FROM Lead LIMIT 1];
        String endpoint = System.Url.getSalesforceBaseUrl().toExternalForm() + '/services/apexrest/Lead/' + ld.Id;
        RestRequest request = new RestRequest();
        request.requestURI = endpoint;
        request.httpMethod = 'DELETE';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout (Success Case)
        String statusOld = LeadManager.deleteLead();
        String status = LeadManager.deleteLead();

        //4. Perform asserts
        Assert.areEqual('Fail', status);
        Test.stopTest();
    }

    @isTest 
    private static void putLeadTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
            //Step 1 create a record
            Lead ld = new Lead(FirstName='Jimmy', LastName='Gold', Company='Google', Title='Senior Developer', LeadSource='Phone Inquiry', Email='jgold@google.net', Phone='2356325478');
            //Step 2 convert a record into json
            String body = JSON.serialize(ld);
            //Step 3 convert a json into blob
            RestRequest request = new RestRequest();
            request.requestBody = Blob.valueOf(body);
            request.httpMethod = 'PUT';
        
        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout
        Lead newLd = LeadManager.putLead();

        //4. Perform asserts
        Assert.isNotNull(newLd.Id);
        Assert.areEqual(ld.Company, newLd.Company);
        Assert.areEqual(ld.Email, newLd.Email);
        Test.stopTest();
    }

    @isTest 
    private static void patchLeadTest() {
        Test.startTest();
        //1. Prepare RestRequest and wrap all the necessary information in it
            //Step 1 query a record and update some fields
            Lead ld = [SELECT Id, Name, Company, Title, LeadSource, Email, Phone FROM Lead LIMIT 1];
            ld.Company = 'Apple';
            ld.Phone = '3214235124';
            //Step 2 convert a record into json
            String body = JSON.serialize(ld);
            //Step 3 convert a json into blob
            RestRequest request = new RestRequest();
            request.requestBody = Blob.valueOf(body);
            request.httpMethod = 'PATCH';

        //2. Prepare RestContext
        RestContext.request = request;

        //3. Make callout
        Lead updatedLd = LeadManager.patchLead();

        //4. Perform asserts
        Assert.areEqual('Apple', updatedLd.Company);
        Assert.areEqual('3214235124', updatedLd.Phone);
        Test.stopTest();
    }
}