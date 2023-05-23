import getContacts from '@salesforce/apex/ContactCtrl.getContacts';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: "First Name", fieldName: "FirstName", type: "text"},
    {label: "Last Name", fieldName: "LastName", type: "text"},
    {label: "Title", fieldName: "Title", type: "text"},
    {label: "Department", fieldName: "Department", type: "text"}
];

export default class SearchContacts extends LightningElement {
    contacts;
    columns = COLUMNS;
    error = "Please enter some search words to see matching contacts if exist...";

    changeHandler(event) {
        const searchWord = event.target.value;
        if (searchWord) {
            getContacts({searchKey: searchWord})
            .then(result => {                
                if(result.length > 0) {
                    this.contacts = result;
                    this.error = undefined;
                } else {
                    this.contacts = undefined;
                    this.error = "Coult not find any matching contacts for the entered search criteria. Please try another!";
                }
            })
            .catch(error => {
                this.error = error;
                this.contacts = undefined;                
            })
        } else {
            this.error = "Please enter some search words to see matching contacts if exist...";
        }
    }
}