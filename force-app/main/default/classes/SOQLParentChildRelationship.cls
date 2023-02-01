public class SOQLParentChildRelationship {
    public static void childToParent() {
        list<contact> listContact = [select id, name, account.id, account.name from contact];
        for (contact eachContact : listContact) {
            string accName = eachContact.account.name;
            string accID = eachContact.account.id;
            system.debug('Account ID is ' + accID + ' and account name is ' + accName);
        }
    }
    public static void parentToChild() {
        list<account> listAccount = [select id, name, (select id, name from contacts) from account];
        for (account eachAccount : listAccount) {
            list<contact> eachAccCont = eachAccount.contacts;
            for (Contact eachCont : eachAccCont) {
                system.debug('Contact ID is ' + eachCont.Id + ', and contact name is  ' + eachCont.Name);
            }
        }
    }
}