public with sharing class CovidInfoCallout {
    //Endpoint: https://api.covidtracking.com/v1/us/current.json
    //Http Method: GET
    public static HttpResponse getCovidInfo() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.covidtracking.com/v1/us/current.json');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody();

            //Convert json string into wrapper
            List<CovidInfoWrapper> wrapper = (List<CovidInfoWrapper>)JSON.deserialize(jsonString, List<CovidInfoWrapper>.class);
            CovidInfoWrapper wrapper1 = wrapper[0];

            //Convert wrapper into sobject record
            List<Covid_Info__c> covidList = [SELECT Id, Name, Negative__c, Positive__c, Pending__c, Received_Date__c FROM Covid_Info__c WHERE Received_Date__c = TODAY];
            if (!covidList.isEmpty()) {
                covidList[0].Positive__c = wrapper1.positive;
                covidList[0].Negative__c = wrapper1.negative;
                covidList[0].Pending__c = wrapper1.pending;
                covidList[0].Name = String.valueOf(wrapper1.states);
                update covidList;
            } else {
                Covid_Info__c covid = new Covid_Info__c();
                covid.Name = String.valueOf(wrapper1.states);
                covid.Positive__c = wrapper1.positive;
                covid.Negative__c = wrapper1.negative;
                covid.Pending__c = wrapper1.pending;
                covid.Received_Date__c = Date.today();
                try {
                    insert covid;
                } catch (Exception ex) {
                    System.debug(ex.getMessage());
                }
            }
        }
        return response;
    }
}