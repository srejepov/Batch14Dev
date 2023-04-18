public with sharing class PostsCallout {
    //Endpoint: https://gorest.co.in/public/v2/posts
    //Http Method: POST
    public static HttpResponse postPosts(){        
        //1. Prepare HttpRequest and wrap all the necessary data in it
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://gorest.co.in/public/v2/posts');
        request.setMethod('POST');
        
        // set json body
        Posts__c post = [SELECT Name, Title__c, User_ID__c, Body__c 
                        FROM Posts__c
                        WHERE CreatedDate = TODAY
                        LIMIT 1];
        PostsWrapper wrapper = new PostsWrapper();
        wrapper.user_id = Integer.valueOf(post.User_ID__c);
        wrapper.title = post.Title__c;
        wrapper.body = post.Body__c;
        String body = JSON.serialize(wrapper);
        request.setBody(body);
        request.setHeader('Content-Type', 'application/json;charset=UTF-8');
        request.setHeader('Authorization', 'Bearer ecd0bb07629ed744799ec917ce830c45f508cd2a8296a0aea4cec3ab240c315f');

        //2. Prepare internet
        Http http = new Http();

        //3. Send the request over the internet to receive HttpResponse
        HttpResponse response = http.send(request);

        //4. Process the response
        if (response.getStatusCode() == 200 || response.getStatusCode() == 201) {
        System.debug('Data has been sent successfully!');
        } else {
        System.debug(response.getBody());
        } 
        return response;       
    }
}