@isTest
public class SPTriggerHandlerTest {
    @isTest
    private static void testFutureMethod1() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn test';
        sp.Description__c = 'learn dml batch14';
        sp.Status__c = 'New';

        Salesforce_Project__c sp2 = new Salesforce_Project__c();
        sp2.Project_Name__c = 'Learn future test';
        sp2.Description__c = 'learn dml batch14';
        sp2.Status__c = 'New';

        List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>{sp, sp2};
        insert listSP;

        set<id> spIds = new Set<Id>{sp.Id, sp2.Id};

        test.startTest();
        SPTriggerHandler.updateProjectDescription(spIds);
        test.stopTest();

        List<Salesforce_Project__c> allSP = [select id, description__c from Salesforce_Project__c];
        for (Salesforce_Project__c eachSP : allSP) {
            assert.isTrue(eachSP.Description__c.contains('future'));
        }
    }
}