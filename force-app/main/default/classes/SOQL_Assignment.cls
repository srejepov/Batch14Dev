public class SOQL_Assignment {
    public static void soql_WhereClause() {
       list<contact> listContact = [select id, name, lastname from contact where lastname like '%A%'];
       integer contListSize = listContact.size(); 
       system.debug('Contact list size is ' + contListSize);
    }
    public static void soql_forMethod() {
        list<contact> contactList = [select id, lastname, phone from contact];
        for (contact eachContact : contactList) {
            system.debug('Contact last name is ' +eachContact.LastName);
            system.debug('Contact phone number is ' + eachContact.Phone);
        }
    }
}