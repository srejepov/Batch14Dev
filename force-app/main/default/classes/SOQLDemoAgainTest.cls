@isTest
public class SOQLDemoAgainTest {
    @TestSetup
    static void makeData(){

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
    }    
    
    @isTest
    private static void testchildToParent_SOQL1() {
    //1. prepare data
    //3 account
    list<account> allAccs = [select id from Account];

    //300 contacts. 100 contacts for each account.
    List<contact> listCon = new list<contact>();
    for (Integer i = 0; i < 300; i++) {

        contact c = new contact();
        c.LastName = 'anything ' + i;

        if (i < 100) {
            c.accountId = allAccs[0].id;
        } else if(i < 200){
            c.AccountId = allAccs[1].id;
        } else {
            c.AccountId = allAccs[2].id;
        }
        listCon.add(c);
    }
    insert listCon;

    //start test
    Test.startTest();
    SoqlDemoAgain.childToParent_SOQL1();
    Test.stopTest();
    //call method
    //stop test

    //no assertion required because our method is NOT doing anything.

    }
    @isTest
    private static void testParentToChild_SOQL1() {
        list<account> allAccs = [select id from Account];
        for (account eachAcc : allAccs) {
            eachAcc.Type = 'Customer - direct';
        }
        update allAccs;

        List<Opportunity> listOpps = new List<Opportunity>();
        for (Integer i = 0; i < 300; i++) {
            Opportunity op = new Opportunity();
            op.StageName = 'New';
            op.Name = 'test opp';
            op.CloseDate = date.today();
            if (i < 100) {
                op.accountId = allAccs[0].id;
            } else if(i < 200){
                op.AccountId = allAccs[1].id;
            } else {
                op.AccountId = allAccs[2].id;
            }
            listOpps.add(op);
        }
        insert listOpps;

        SoqlDemoAgain.parentToChild_SOQL1();    
    }
}