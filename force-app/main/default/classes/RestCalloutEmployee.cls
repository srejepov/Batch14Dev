public with sharing class RestCalloutEmployee {
    @future(callout=true)
    public static void postEmployee(Id employeeId) {
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('POST');

        Employee__c employee = [SELECT Name, Name__c, Username__c, Email__c, Gender__c, Designation__c, Phone_Number__c, Complete_Address__c, Integration_Status__c FROM Employee__c WHERE Id = :employeeId];
        EmployeeWrapper.Employee wrapper = new EmployeeWrapper.Employee();
        wrapper.name = employee.Name__c;
        wrapper.username = employee.Username__c;
        wrapper.email = employee.Email__c;
        wrapper.gender = employee.Gender__c;
        wrapper.phone_number = employee.Phone_Number__c;
        wrapper.designation = employee.Designation__c;
        wrapper.complete_address = employee.Complete_Address__c;
        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        Http http = new Http();

        HttpResponse response = http.send(request);
        employee.Integration_Status__c = response.getBody() + ' ' + response.getStatus() + ' ' + response.getStatusCode() + ' ' + Datetime.now();

        try {
            update employee;
        } catch (Exception ex) {
            System.debug(ex.getMessage());
        }

        /*if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
            System.debug('Data has been sent successfully!');
        } else {
            System.debug(response.getBody());
        }*/
    }
}