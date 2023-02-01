public class Calculator {
    public void welcomeMessage() {
        system.debug('Welcome to Apex Calculator');
    }
    public void printNewMessage(string msg){
        system.debug(msg);
    }
    public string pringAndReturnMessage(string m){
        string returnStr = '';
        system.debug('message is ' + m);
        returnStr = m + '...OK Cool';
        return returnStr;
    }
    public integer add(integer a, integer b){
        integer sum = a + b;
        return sum;
    }
    public integer add(integer x, integer y, integer z){
        integer sum = x+y+z;
        return sum;
    }
    public boolean leapYearCheck(date dt){
        integer year = dt.year();
        boolean lp = date.isLeapYear(year);
        return lp;
    }
    public void publicMessage(){
        system.debug('public method called');
        system.debug('calling private method');
        privateMessage1();
        system.debug('called private method');
    }

    private void privateMessage1(){
        system.debug('private method called');
    }
}