public with sharing class EmployeeWrapper {
    public Integer error;
    public String msg;
    public List<Employee> data;

    public class Employee {
        public Integer id;
        public String username;
        public String name;
        public String email;
        public String gender;
        public String designation;
        public String phone_number;
        public String complete_address;
    }
}