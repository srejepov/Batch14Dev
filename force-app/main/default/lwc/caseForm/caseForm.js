import { LightningElement } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Case.AccountId';
import CONTACT_NAME_FIELD from '@salesforce/schema/Case.ContactId';
import SUBJECT_FIELD from '@salesforce/schema/Case.Subject';
import PRIORITY_FIELD from '@salesforce/schema/Case.Priority';
import STATUS_FILED from '@salesforce/schema/Case.Status';
import DESCRIPTION_FIELD from '@salesforce/schema/Case.Description';
import ORIGIN_FIELD from '@salesforce/schema/Case.Origin';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class CaseForm extends LightningElement {
    objectName = CASE_OBJECT;
    recordId = "500Dn000003zdj4IAA";
    fields = {
        accountName: ACCOUNT_NAME_FIELD,
        contactName: CONTACT_NAME_FIELD,
        subject: SUBJECT_FIELD,
        priority: PRIORITY_FIELD,
        status: STATUS_FILED,
        description: DESCRIPTION_FIELD,
        origin: ORIGIN_FIELD
    }

    successHandler(error) {
        console.log(error);
        const event = new ShowToastEvent({
            title: "Error",
            message: error.detail.message + "\n" + error.detail.detail,
            variant: "error"
        });
        this.dispatchEvent(event);
    }
}