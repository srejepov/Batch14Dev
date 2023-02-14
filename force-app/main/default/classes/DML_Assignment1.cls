public class DML_Assignment1 {
    public void insertRecord(){
        list<account> AccInsList = new list<account>();
        for (Integer i = 0; i < 20; i++) {
            account acc = new account();
            acc.Name = 'Test Account' + i + ' Created';
            AccInsList.add(acc);
        }
        if (!AccInsList.isEmpty()) {
            insert AccInsList;
        }
    }
    public void updateRecords(){
        list<account> listQueryAcc = [select id, name from account order by CreatedDate DESC limit 20 ];
        list<account> AccntListUpdate = new list<account>();
        for (account eachAccount : listQueryAcc) {            
            eachAccount.Name += ' Updated';
            AccntListUpdate.add(eachAccount);            
        }
        if (!AccntListUpdate.isEmpty()) {
            update AccntListUpdate;
        }

    }
}