public class DML_Assignment {
    public static void insert_DML() {
        account ac1 = new account();
      ac1.Name = 'Sapa Assignment1';
      ac1.Name = 'Sapa Assignment2';            
      insert ac1;
    }
    public static void update_DML() {
        Account ac2 = new Account();
        ac2.Name = 'Account Created';
        insert ac2;
        ac2.Name = 'Account Updated';
        update ac2;   
        
    }
}