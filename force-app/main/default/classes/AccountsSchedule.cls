public class AccountsSchedule implements Schedulable {
    public void execute(SchedulableContext sc){
        AccountsBatch ab = new AccountsBatch();
        Id jobId = Database.executeBatch(ab, 50);
    }
}