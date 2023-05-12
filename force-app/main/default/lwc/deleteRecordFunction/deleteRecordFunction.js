import { LightningElement } from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { deleteRecord } from 'lightning/uiRecordApi';

export default class DeleteRecordFunction extends LightningElement {
    recordId;

    changeHandler(event) {
        this.recordId = event.target.value;
    }

    deleteHandler() {
        if (this.recordId.length == 15 || this.recordId.length == 18) {
            //delete record
            deleteRecord(this.recordId)
                .then(result => {
                    //show success toast
                    this.prepareToast("Success", "Record has been deleted successfully!", "success");
                })
                .catch(error => {
                    //show error toast
                    console.error(error);
                    this.prepareToast(error.statusText, error.body.message, "error");
                })                
        } else {
            //show warning toast
            this.prepareToast("Warning", "Please enter 15 or 18 digits record Id only!", "warning");
        }
    }

    prepareToast(title, message, variant) {
        //if property name matches parameter then we can write as follows
        const toast = new ShowToastEvent({title, message, variant});
        this.dispatchEvent(toast);
    }
}