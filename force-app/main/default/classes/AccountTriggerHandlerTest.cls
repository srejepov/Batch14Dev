@isTest
public class AccountTriggerHandlerTest {
    @isTest
    private static void testUpdateDescription1() {
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';
        acc.Active__c = 'Yes';
        
        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';
        acc2.Active__c = 'Yes';
        
        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';
        acc3.Active__c = 'No';
        
        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //assertion or verification.
        //soql to get lates account.
        List<Account> allAccounts = [select id, description, active__c from account];
        for (account eachAcc : allAccounts) {
            if (eachAcc.Active__c == 'Yes') {
                assert.isTrue(eachAcc.Description.contains('Enjoy'));
            } else {
                assert.isTrue(eachAcc.Description == null);
            }
        }
    }
    @isTest
    private static void testUpdateDescription2() {
        //insert data
            // which calls trigger -> which calls handler's method 'UpdateDescription'
            //all the if conditions are true.
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';
        acc3.Active__c = 'No';

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        //update active for all accounts
        for (account a : listAcc) {
            a.Active__c = 'Yes';
        }
        update listAcc;

        //assertion or verification.
        //soql to get latest account
        list<account> allAccounts = [select id, description, active__c from account];
        for (account eachAcc : allAccounts) {
            if(eachAcc.Active__c == 'Yes'){
                //we want to assert that description has 'Enjoy' word in it.
                assert.isTrue(eachAcc.Description.contains('Enjoy'));
            } else {
                //check description is null
                assert.isTrue(eachAcc.Description == null);
            }
        }
    }
    @isTest
    private static void testVIPUpdate() {
        Account acc = new account();
        acc.Name = 'test 1';
        acc.Industry = 'Energy';

        Account acc2 = new account();
        acc2.Name = 'test 2';
        acc2.Industry = 'Energy';

        Account acc3 = new account();
        acc3.Name = 'test 3';
        acc3.Industry = 'Banking';        

        list<account> listAcc = new list<account>{acc, acc2, acc3};
        insert listAcc;

        List<contact> listCon = new list<contact>();
        for (Integer i = 0; i < 300; i++) {

            contact c = new contact();
            c.LastName = 'anything ' + i;

            if (i < 100) {
             c.accountId = listAcc[0].id;
            } else if(i < 200){
              c.AccountId = listAcc[1].id;
            } else {
              c.AccountId = listAcc[2].id;
            }
            listCon.add(c);
        }
        insert listCon;

        for (account eachAcc : listAcc) {
            eachAcc.vip__c = true;
        }
        update listAcc;

        List<Contact> allContacts = [select id, accountid, vip__c from contact];
        for (contact eachContact : allContacts) {
            assert.areEqual(true, eachContact.vip__c);
        }
    } 
}
