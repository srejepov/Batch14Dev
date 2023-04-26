@RestResource(urlMapping='/Contact/*')
global with sharing class ContactManager {
    //https://abcd121-dev-ed.develop.my.salesforce.com/services/apexrest/Contact/003Dn00000D8edEIAR  
    
    @HttpGet 
    global static Contact getContact() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id contactId = endpoint.substring(lastIndex+1);
        // Or Id contactId = endpoint.substringafterlast('/') to get Id
        Contact contact = [SELECT Id, FirstName, LastName, Title, Email, Department FROM Contact WHERE Id = :contactId];
        return contact;
    }

    @HttpPost 
    global static Id postContact(String firstName, String lastName, String title, String email, String department) {
        Contact contact = new Contact();
        contact.FirstName = firstName;
        contact.LastName = lastName;
        contact.Title = title;
        contact.Email = email;
        contact.Department = department;
        insert contact;
        return contact.Id;
    }

    @HttpDelete 
    global static String deleteContact() {
        RestRequest request = RestContext.request;
        String endpoint = request.requestURI;
        Integer lastIndex = endpoint.lastIndexOf('/');
        Id contactId = endpoint.substring(lastIndex+1);
        try {
            Contact contact = [SELECT Id FROM Contact WHERE Id = :contactId];
            delete contact;
        } catch (Exception ex) {
            return 'Fail';
        }
        return 'Success';
    }

    @HttpPut 
    global static Contact putContact() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact contact = (Contact)JSON.deserialize(body, Contact.class);
        upsert contact;
        return contact; 
    }

    @HttpPatch 
    global static Contact patchContact() {
        RestRequest request = RestContext.request;
        String body = request.requestBody.toString();
        Contact contact = (Contact)JSON.deserialize(body, Contact.class);
        update contact;
        Contact updateContact = [SELECT Id, FirstName, LastName, Title, Email, Department FROM Contact WHERE Id = :contact.Id];
        return updateContact;
    }
}