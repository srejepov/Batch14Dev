public class String_Assignment {
    public void printString() {
        string localString = 'Thanks for the session on the string';

        integer length1 = localString.length();
        system.debug('length of string is ' + length1);

        string strUpper = localString.toUpperCase();
        system.debug(strUpper);

        Boolean containsSession = localString.contains('session');
        system.debug('sentence contains session??? ' + containsSession);

        Boolean containsSessions = localString.contains('sessions');
        system.debug('sentence contains sessions??? ' + containsSessions);

        Boolean containsSessions1 = localString.contains('SESSION');
        system.debug('sentence contains SESSION??? ' + containsSessions1);

        Boolean containsSessions2 = localString.containsIgnoreCase('SESSION');
        system.debug('sentence contains SESSION??? ' + containsSessions2);
    }
}