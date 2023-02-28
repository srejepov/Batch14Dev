@isTest
public class DmlDemoAgainTest {
    @isTest
    private static void testInsertStndObj() {
        //call method
        DmlDemoAgain.dmlDemoInsert_stndObj1();
        //verify
        //soql
        list<account> accs = [select id, name from account where name = 'Softinnovas'];
        //assert
        system.assertEquals(1, accs.size());
        system.assertEquals('Softinnovas', accs[0].Name);
    }

    @isTest
    private static void testInsertCustmObj() {
        DmlDemoAgain.dmlDemoInsert_cstmObj(); //it will insert record in test world

        //verify. to verify, we do SOQL and get the record here.
        List<Salesforce_Project__c> listSP = [select id, name, project_name__c from Salesforce_Project__c];
        system.assertEquals('Learn dml', listSP[0].project_name__c);
    }

    @isTest
    private static void testUpdateDemo_stndObj2() {
        //1. Prepare data
        Account acc = new account();
        acc.Name = 'Softinnovas';
        insert acc;


        //this method NEEDs one account with name 'Softinnovas.'
        DmlDemoAgain.dmlUpdateDemo_stndObj2();

        //verify.
        //soql
        Account updatedAcc = [select id, name, phone from account limit 1];
        //assert
        system.assertEquals('Softinnovas Inc.', updatedAcc.Name);
        assert.areEqual('Softinnovas Inc.', updatedAcc.Name);
    }
}