import { LightningElement } from 'lwc';
import  ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import ACC_NUM_FIELD from '@salesforce/schema/Account.AccountNumber';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordFormAccount extends LightningElement {
    objectName = ACCOUNT_OBJECT;
    recordId = "001Dn00000B9GrXIAV";
    fields = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, ACC_NUM_FIELD, PHONE_FIELD];

    successHandler() {
        const evt = new ShowToastEvent({
            title: "Success",
            message: "Account detail has been saved successfully!",
            variant: "success"
        });
        this.dispatchEvent(evt);
    }
}