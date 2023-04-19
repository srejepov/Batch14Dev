public class StringDemoClass {
    public void StringMethod1() {
        string sessionDiscription = 'learning string methods in apex language';
        system.debug(sessionDiscription);
        //1. length
        integer lengthOfStr = sessionDiscription.length();
        system.debug('length of session description string is ' + lengthOfStr);

        //2. uppercase
        string strCapital = sessionDiscription.toUpperCase();
        system.debug('capital string is ==> ' + strCapital);

        //3. check if string has apex word in it
        Boolean containsApex = sessionDiscription.contains('apex');
        system.debug('session discription contains apex??? ' + containsApex);

        Boolean containsApex2 = sessionDiscription.contains('APex');
        system.debug('session discription contains apex??? ' + containsApex2);

        Boolean containsApex3 = sessionDiscription.containsIgnoreCase('APEX');
        system.debug('session discription contains APEX??? ' + containsApex3);

        Boolean containsSalesforce = sessionDiscription.contains('salesforce');
        system.debug('contains salesforce??? ' + containsSalesforce);

        string username = ' vitap r ';
        system.debug('username length is --> ' + username.length());

        string username2 = username.trim();
        system.debug('userName2 length is --> ' + username2.length());
    }
}