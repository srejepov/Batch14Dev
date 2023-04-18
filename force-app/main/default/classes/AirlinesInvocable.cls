public with sharing class AirlinesInvocable {
    
    @invocableMethod(label='Send Airlines Information'
    description='Post the newly created airline records into verdor system'
    category='Airlines')
    public static void sendAirlines(List<Id> airlineIds) {
        for (Id airlineId : airlineIds) {
            RestCallouts.postAirlines(airlineId);
        }
    }
}