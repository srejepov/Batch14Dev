@isTest
public with sharing class RestCalloutTest {
    @isTest
    private static void getAnimalsTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.getAnimals();
        
        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void getAirlinesTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.getAirlines();
        
        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void postAirlinesTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        Airlines__c airlines = new Airlines__c();
        airlines.Name = '127853';
        airlines.Name__c = 'Turkish Airlines';
        airlines.Country__c = 'Turkiye';
        airlines.Established__c = '2023';
        airlines.Slogan__c = 'Widen Your World';
        airlines.Logo_URL__c = 'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.turkishairlines.com%2Fen-int%2Fflight-destinations%2F&psig=AOvVaw2rgmbfcVVE-CnuYuiRJSY9&ust=1681612493859000&source=images&cd=vfe&ved=0CBAQjRxqFwoTCJjP4-zsqv4CFQAAAAAdAAAAABAE';
        insert airlines;

        //3. Perform assertions
        System.assert(airlines.Id != null);
        Test.stopTest();
    } 

    @isTest
    private static void getEmployeesTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.getEmployees();
        
        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();
    }

    @isTest
    private static void getCaseInfoTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.getCaseInfo();

        //3. Perform assertions
        System.assertEquals(200, response.getStatusCode());
        System.assertEquals('OK', response.getStatus());
        Test.stopTest();        
    } 
    @isTest
    private static void postAnimalTest() {
        Test.startTest();
        //1. Set Mock
        RestCalloutsMock mock = new RestCalloutsMock();
        Test.setMock(HttpCalloutMock.class, mock);

        //2. Make Callout
        HttpResponse response = RestCallouts.postAnimal();
        
        //3. Perform assertions
        System.assertEquals(201, response.getStatusCode());
        System.assertEquals('Created', response.getStatus());
        Test.stopTest();        
    }  
}