public with sharing class RestCallouts {
    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: GET
    public static HttpResponse getAnimals(){
        //1. Prepare HttpRequest and wrap all the necessary data in it.
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('GET');
        
        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines/1
    //Http Method: GET
    public static HttpResponse getAirlines(){
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.instantwebtools.net/v1/airlines/1');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody(); 

            //Convert json string into wrapper
            AirlinesWrapper wrapper = (AirlinesWrapper)JSON.deserialize(jsonString, AirlinesWrapper.class);

            //Convert wrapper into sobject record
            Airlines__c airline = new Airlines__c();
            airline.Name = String.valueOf(wrapper.id);
            airline.Name__c = wrapper.name;
            airline.Country__c = wrapper.country;
            airline.Logo_URL__c = wrapper.logo;
            airline.Slogan__c = wrapper.slogan;
            airline.Headquarters__c = wrapper.head_quaters;
            airline.Website__c = wrapper.website;
            airline.Established__c = wrapper.established;

            //create airlines record
            try {
                insert airline;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://api.onlinewebtutorblog.com/employees
    //Http Method: GET
    public static HttpResponse getEmployee(){
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://api.onlinewebtutorblog.com/employees');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
               
        if (response.getStatusCode() == 200) {
            String jsonString = response.getBody();

            //Convert json string into wrapper class
            EmployeeWrapper empWrapper = (EmployeeWrapper)JSON.deserialize(jsonString, EmployeeWrapper.class);
            List<EmployeeWrapper.Employee> employees = empWrapper.data;
            
            //Convert the wrapper into sobject record
            List<Employee__c> emps = new List<Employee__c>();
            for (EmployeeWrapper.Employee empWrap : employees) {
                Employee__c emp = new Employee__c();
                emp.Name = String.valueOf(empWrap.id);
                emp.Name__c = empWrap.name;
                emp.Username__c = empWrap.username;
                emp.Email__c = empWrap.email;
                emp.Gender__c = empWrap.gender;
                emp.Designation__c = empWrap.designation;
                emp.Phone_Number__c = empWrap.phone_number;
                emp.Complete_Address__c = empWrap.complete_address;
                emps.add(emp);
            }
            //insert employee records
            try {
                insert emps;
            } catch (Exception ex) {
                System.debug(ex.getMessage());
            }
        } else {
            System.debug(response.getStatus());
            System.debug(response.getStatusCode());
            System.debug(response.getBody());
        }
        return response;
    }

    //Endpoint: https://langston-dev-ed.develop.my.salesforce.com/services/apexrest/Case/500Do000001cbUnIAI
    //Http Method: GET
    public static HttpResponse getCaseInfo() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:NC_SFDEV12/services/apexrest/Case/500Do000001cbUnIAI');
        request.setMethod('GET');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus());
        System.debug(response.getStatusCode());
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://th-apex-http-callout.herokuapp.com/animals
    //Http Method: POST
    public static HttpResponse postAnimal() {
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals');
        request.setMethod('POST');
        // set json body
        request.setBody('{"name":"mighty moose"}');
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        System.debug(response.getStatus()); //OK(GET) or Created(POST)
        System.debug(response.getStatusCode()); //200(GET) or 201(POST)
        System.debug(response.getBody());
        return response;
    }

    //Endpoint: https://api.instantwebtools.net/v1/airlines
    //Http Method: POST
    public static HttpResponse postAirlines(Id airlineId) {
       //1. Prepare HttpRequest and wrap all the necessary data in it
       HttpRequest request = new HttpRequest();
       request.setEndpoint('https://api.instantwebtools.net/v1/airlines');
        request.setMethod('POST');

       // set json body
       Airlines__c airline = [SELECT Name, Name__c, Country__c, Logo_URL__c, Slogan__c, Headquarters__c, Website__c, Established__c 
                                FROM Airlines__c
                                WHERE Id = :airlineId
                                AND Name = null];
        AirlinesWrapper wrapper = new AirlinesWrapper();
        wrapper.country = airline.Country__c;
        wrapper.established = airline.Established__c;
        wrapper.head_quaters = airline.Headquarters__c;
        wrapper.logo = airline.Logo_URL__c;
        wrapper.name = airline.Name__c;
        wrapper.slogan = airline.Slogan__c;
        wrapper.website = airline.Website__c;
        String body = JSON.serialize(wrapper);

       //2. Prepare internet
       //3. Send the request over the internet to receive HttpResponse
       //4. Process the response
    }
}