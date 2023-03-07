@isTest
public class AccountQueueableTest {
    private testmethod static void testQueueable1() {
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 200; i++) {
            account a = new account();
            a.Name = 'queue test';
            a.Description = 'test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc; 

        Test.startTest();
        system.enqueueJob(new AccountsQueueable(listAcc));
        Test.stopTest();

        integer countSI = [select count() from account where name like '%--SI'];
        assert.areEqual(200, countSI);
    }
}