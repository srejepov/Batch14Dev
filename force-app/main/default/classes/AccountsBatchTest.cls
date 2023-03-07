@isTest
public class AccountsBatchTest {
    @isTest
    private static void testBatch1() {
        List<Account> listAcc = new List<Account>();
        for (Integer i = 0; i < 900; i++) {
            account a = new account();
            a.Name = 'batch test';
            a.Description = 'test';
            a.Active__c = 'Yes';
            listAcc.add(a);
        }
        insert listAcc;

        Test.startTest();
        AccountsBatch ab = new AccountsBatch();
        Database.executeBatch(ab, 950); 
        Test.stopTest();
        
        
        List<Account> allAccounts = [select id, description from account];
        for (Account eachAccount : allAccounts) {
            assert.isTrue(eachAccount.Description.containsIgnoreCase('batch'));
        }
   }
}