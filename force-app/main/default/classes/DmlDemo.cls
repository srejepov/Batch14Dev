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
    public static void dmlDemoInsert_cstmObj2() {
        Salesforce_Project__c sp = [select id from Salesforce_Project__c order by CreatedDate DESC limit 1];
        Salesforce_Ticket__c newST = new Salesforce_Ticket__c();
        newST.Subject__c = 'create related record via apex';
        newST.Priority__c = 'High';
        newST.Status__c = 'New';
        newST.Requested_by_date__c = date.today();
        newST.Salesforce_Project__c = sp.Id;
        insert newST;
    }
    public static void dmlDemoMultipleInsert_right1() {
        list<account> listAccout = new list<account>();
        account acc1 = new account();
        acc1.Name = 'Bulk acc1';
        acc1.ShippingCity = 'New York';
        acc1.Active__c = 'No';
        listAccout.add(acc1);

        account acc2 = new account();
        acc2.Name = 'Bulk acc2';
        acc2.ShippingCity = 'Dallas';
        acc2.Active__c = 'Yes';
        listAccout.add(acc2);

        account acc3 = new account();
        acc3.Name = 'Bulk acc3';
        acc3.ShippingCity = 'Atlanta';
        acc3.Active__c = 'Yes';
        listAccout.add(acc3);

        insert listAccout;
    }
    public static void dmlDemoMultipleInsert_right2() {
        list<account> insertAccountList = new list<account>();
        for (Integer i = 0; i < 166; i++) {
            account a = new account();
            a.Name = 'SoftInnovas v' + i;
            a.Phone = '87657483' + i;
            a.AccountNumber = 'rt' + i;
            a.Active__c = 'Yes';
            insertAccountList.add(a);
        }
        if (!insertAccountList.isEmpty()) {
           insert insertAccountList; 
        }
    }
    public static void dmlDemoMultipleUpdate_right1() {
        list<account> listAccount = [select id, name from account order by createddate desc limit 50];
        for (account eachAcc : listAccount) {
            eachAcc.Name += ' B.0';
        }
        update listAccount;       
    }
    public static void dmlDemoMultipleUpdate_right2() {
        list<account> listAccount = [select id, name, Active__c from account];
        list<account> updateAccountList = new list<account>();
        for (account eachAcc : listAccount) {
            if (eachAcc.Active__c == 'Yes') {
                eachAcc.Name += ' Yy';
                updateAccountList.add(eachAcc);
            } else if (eachAcc.Active__c == null){
                eachAcc.Name += ' Nn';
                updateAccountList.add(eachAcc);
            }
        }
        if (!updateAccountList.isEmpty()) {
            update updateAccountList;
        }
    }
}