List<Account> listAccounts = new List<Account>();

account a = new account();
a.Name = 'test accccc';
listAccounts.add(a);

account a1 = new account();
a1.Name = 'test accccccccddddddd';
listAccounts.add(a1);

account a2 = new account();
listAccounts.add(a2);

account a3 = new account();
listAccounts.add(a3);

account a4 = new account();
a4.Name = 'test acccccsssss';
listAccounts.add(a4);

account a5 = new account();
a5.Name = 'test bbbbbbbaccccc';
listAccounts.add(a5);

account a6 = new account();
a6.Name = 'testsssssss accccc';
listAccounts.add(a6);

account a7 = new account();
a7.Name = 'test accccckkkkkkk';
listAccounts.add(a7);

// insert listAccounts;

List<Database.SaveResult> listResult = Database.insert(listAccounts, false);

for (Database.SaveResult eachResult : listResult) {
    if (eachResult.isSuccess()) {
        system.debug('account record inserted successfully, account record id is ' + eachResult.getId());
    } else {
        system.debug('account insert FAILED. Error is ' + eachResult.getErrors());
    }
}