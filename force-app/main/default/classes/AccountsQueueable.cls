public class AccountsQueueable implements Queueable {
    List<Account> listAccount = new List<Account>();

    public AccountsQueueable(List<Account> accs) {
        listAccount = accs;
    }

    public void execute(QueueableContext qc){
        system.debug('inside execute method listaccount => ' + listAccount);

        for (account eachAcc : listAccount) {
            eachAcc.Name += '--SI';
        }
        update listAccount;
    }

    
}