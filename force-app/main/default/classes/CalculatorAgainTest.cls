@isTest
public class CalculatorAgainTest {
    //1. public or private
    //2. must be static
    //3. test method must return void
        //we can call other methods which returns something
    //4. no parameters allowed in test method
        // we can call other parameterized method inside test method
    //5. @isTest annotation for test method

    @isTest
    private static void testMethod1() {
        CalculatorAgain c = new CalculatorAgain();
        c.publicMessage();
        c.welcomeMessage();
    }
    @isTest
    private static void testAdd1() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5, 10);
        //we want to verify if sum is accurate or not
        //we call assertion, we will assert it here.
        system.assertEquals(15, sum);
    }
    @isTest
    private static void testAdd2() {
        CalculatorAgain c = new CalculatorAgain();
        integer sum = c.add(5, 10, 10);
        //we want to verify if sum is accurate or not
        //we call assertion, we will assert it here.
        system.assertEquals(25, sum);
    }
    @isTest
    private static void testPrint() {
        CalculatorAgain c = new CalculatorAgain();
        string str = c.printAndReturnMessage('Testing Print Message');
        //we want to verify if sum is accurate or not
        //we call assertion, we will assert it here.
        system.assertEquals('Testing Print Message...OK Cool', str);
    }
}