@isTest
public with sharing class StudentCtrlTest {
    @TestSetup
    static void makeData(){
        List<Student__c> studentList = new List<Student__c>();
        for (Integer i = 0; i < 10; i++) {
            Student__c student = new Student__c();
            student.Student_Name__c = 'Test' + i;
            student.Postal_Code__c = '70000' + i;
            studentList.add(student);
        }
        insert studentList;
    }

    @isTest 
    public static void searchStudentsByPostalCodeTest() {
        Test.startTest();
        List<Student__c> stlist = new List<Student__c>();
        stlist = StudentCtrl.searchStudentsByPostalCode('700002');        
        Test.stopTest();

        //system.assert(stlist.size(), 1);
        system.assert(stlist.size()!=0);
        
    }
}