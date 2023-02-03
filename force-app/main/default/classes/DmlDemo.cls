public class DmlDemo {
    public static void dmlDemoInsert_stndObj1() {
      account acc = new account();
      acc.Name = 'SoftInnovas';
      insert acc;  
    }
    public static void dmlDemoInsert_cstmObj() {
        Salesforce_Project__c sp = new Salesforce_Project__c();
        sp.Project_Name__c = 'Learn dml';
        sp.Description__c = 'learn dml batch14';
        sp.Status__c = 'New';
        insert sp;
    }
    public static void dmlUpdateDemo_stndObj1() {
        Account ac = new Account();
        ac.Name = 'Salesforce';
        insert ac;
        ac.Name = 'Salesforce Inc.';
        update ac;
    }
    public static void dmlUpdateDemo_stndObj2() {
        account acc = [select id, name from account where name like 'SoftInnovas%' limit 1];
        acc.Name = 'SoftInnovas Inc.';
        acc.Phone = '9788765432';
        update acc;
    }
    public static void dmlInsertDemo_stndObj2() {
        account acc = [select id, name from account where name like 'SoftInnovas%' limit 1];
        contact c = new contact();
        c.LastName = 'Biden';
        c.AccountId = acc.Id;
        insert c;  
    }
}