@isTest
public with sharing class SoapCalloutsTest {
   
    @isTest
    private static void getParksByCountryTest() {
        Test.startTest();
        //1. Set the mock
        ParkServicesMock mock = new ParkServicesMock();
        Test.setMock(WebServiceMock.class, mock);

        //2. Perform callout
        String[] parks = SoapCallouts.getParksByCountry('United States');

        //3. Do assertions
        System.assertEquals(2, parks.size());
        Test.stopTest();
    }
}