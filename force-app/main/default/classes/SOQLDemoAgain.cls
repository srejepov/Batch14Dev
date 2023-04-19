public with sharing class SOQLDemoAgain {
    public static void accountSOQL_1(){
        List<Account> listAcc = [select id, name, phone from account order by CreatedDate DESC];
        system.debug('list of accounts ' + listAcc);
    }

    public static void accountSOQL_11(){
        account acc = [select id, name, phone from account order by CreatedDate DESC limit 1];
        system.debug('latest account created is ' + acc);
    }
    public static void accountSOQL_2(){
        account acc = [select id, name, phone, accountnumber from account order by CreatedDate DESC limit 1];
        system.debug('latest account created is ' + acc);

        string accName = acc.Name;
        string accPhone = acc.Phone;
        system.debug('account name is ' + accName + ', phone is ' + accPhone + 'and account number is ' + acc.accountnumber);
    }
    public static void accountSOQL_3(){
        List<Account> listAccount = [select id, name, Phone, AccountNumber from account order by CreatedDate DESC];
        system.debug('list of accounts ' + listAccount);

        for(Account eachAccount : listAccount) {
            system.debug('---eachaccount loop start---');
            system.debug('each account record ' + eachAccount);
            string accName = eachAccount.Name;
            string accPhone = eachAccount.Phone;
            system.debug('account name is ' + accName + ', phone is ' + accPhone + ' and account number is ' + eachAccount.accountnumber);
            system.debug('---each loop END--');
        }
    }
    public static void accountSOQL_Filter(){
        string accountNameFilter = 'sfdc';
        List<Account> listAcc = [select id, name from account where name = :accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void accountSOQL_Filter(string accountNameFilter){        
        List<Account> listAcc = [select id, name from account where name = :accountNameFilter];
        system.debug('list acc ' + listAcc);
    }
    public static void childToParent_SOQL1() {
        list<contact> listContact = [select id, name, phone, account.name, account.industry from contact where account.industry = 'energy'];
        for (contact eachContact : listContact) {
            string accName = eachContact.account.name;
            system.debug('contact name is ' + eachContact.name + ' its account is ' + accName);            
        }
    }
    public static void parentToChild_SOQL1() {
        list<account> listAcc = [select name, annualrevenue, (select name, amount from opportunities where stagename = 'Closed won') from account where type = 'Customer - direct'];
        for (account eachAcc : listAcc) {
            system.debug('account name is ' + eachAcc.name + ', acc annual revenue ' + eachAcc.AnnualRevenue);
            List<Opportunity> eachAccOpp = eachAcc.Opportunities;
            system.debug('--------');
            for (opportunity eachOpp : eachAccOpp) {
                system.debug('opp name ' + eachOpp.Name + ', amount is ' + eachOpp.Amount);
            }
            system.debug('__________');
        }
    }
    public static void parentToChild_SOQL2() {
       list<salesforce_project__c> listSP = [select name, project_name__c, (select subject__c, priority__c from salesforce_tickets__r) from salesforce_project__c];
       for (salesforce_project__c eachSP : listSP) {
            list<salesforce_ticket__c> listST = eachSP.salesforce_tickets__r;
            integer totalTickets = listST.size();
            integer highPriorityST = 0;
            for (salesforce_ticket__c eachST : listST) {
                if (eachST.priority__c == 'High') {
                    highPriorityST++;
                }
            }
            system.debug('Project anem ' + eachSP.name + ', total tickets ' + totalTickets + ' high priority tickets are ' + highPriorityST);
       } 
    }
}