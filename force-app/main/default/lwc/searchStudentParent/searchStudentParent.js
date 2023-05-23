import searchStudentsByPostalCode from '@salesforce/apex/StudentCtrl.searchStudentsByPostalCode';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: "Student Name", fieldName: "Student_Name__c", type: "text"},
    {label: "Class", fieldName: "Class__c", type: "number"},
    {label: "Mobile", fieldName: "Mobile__c", type: "tel"},
    {label: "Email", fieldName: "Email__c", type: "email"},
    {label: "Postal Code", fieldName: "Postal_Code__c", type: "text"}    
];

export default class SearchStudentParent extends LightningElement {
    students;
    columns = COLUMNS;
    error = 'Please enter some number to see matching students if exist...';

    changeHandler(event) {
        const searchNumber = event.target.value;
        if (searchNumber) {
            searchStudentsByPostalCode({searchWord: searchNumber})
            .then(result => {
                if (result.length > 0) {
                    this.students = result;
                    this.error = undefined;
                } else {
                    this.students = undefined;
                    this.error = "Could not find any matching students for the entered number";
                }                
            })
            .catch(error => {
                this.error = error;
                this.students = undefined;
            })
        } else {
            this.error = "Please enter some number to see matching students";
        }        
    }
}