public class AccountsQueueable2 implements Queueable {
    List<Account> listAccount = new List<Account>();

    public AccountsQueueable2(List<Account> accs) {
        listAccount = accs;
    }

    public void execute(QueueableContext qc){
        system.debug('inside execute method listaccount => ' + listAccount);

        for (account eachAcc : listAccount) {
            string newName = eachAcc.Name.removeEnd('Created');
            eachAcc.Name = newName;
        }
        update listAccount;
    }
}