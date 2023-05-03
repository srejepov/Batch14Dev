import { LightningElement } from 'lwc';
import AIRLINE_OBJECT from '@salesforce/schema/Airlines__c';
import COUNTRY_FIELD from '@salesforce/schema/Airlines__c.Country__c';
import ESTABLISHED_FIELD from '@salesforce/schema/Airlines__c.Established__c';
import HEADQUARTERS_FIELD from '@salesforce/schema/Airlines__c.Headquarters__c';
import NAME_FIELD from '@salesforce/schema/Airlines__c.Name__c';
import SLOGAN_FIELD from '@salesforce/schema/Airlines__c.Slogan__c';
import LOGO_FIELD from '@salesforce/schema/Airlines__c.Logo__c';
import WEBSITE_FIELD from '@salesforce/schema/Airlines__c.Website__c';
import { ShowToastEvent} from 'lightning/platformShowToastEvent';

export default class RecordFormAirlines extends LightningElement {
    objectName = AIRLINE_OBJECT;
    recordId = "a07Dn000002PbMHIA0";
    fields = [COUNTRY_FIELD, ESTABLISHED_FIELD, HEADQUARTERS_FIELD, NAME_FIELD, SLOGAN_FIELD, LOGO_FIELD, WEBSITE_FIELD];

    successHandler() {
        const event = new ShowToastEvent({
            title: "Success",
            message: "Airline details have been saved successfully",
            variant: "success"
        });
        this.dispatchEvent(event);
    }
}