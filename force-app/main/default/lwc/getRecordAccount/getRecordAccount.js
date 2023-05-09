import { LightningElement, wire } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import TYPE_FIELD from '@salesforce/schema/Account.Type';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
import { getFieldDisplayValue, getFieldValue, getRecord } from 'lightning/uiRecordApi';

const FIELDS = [NAME_FIELD, TYPE_FIELD, INDUSTRY_FIELD, REVENUE_FIELD, PHONE_FIELD, WEBSITE_FIELD];

export default class GetRecordAccount extends LightningElement {
    //second approach
    //Name, Type, Industry, AnnualRevenue, Phone, Website
    recordId = "001Dn00000B9GrXIAV";

    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    }) account;

    get name() {
        
        return getFieldValue(this.account.data, NAME_FIELD);
    }

    get type() {
        return getFieldValue(this.account.data, TYPE_FIELD);
    }

    get industry() {
        return getFieldValue(this.account.data, INDUSTRY_FIELD);
    }

    get revenue() {
        return getFieldDisplayValue(this.account.data, REVENUE_FIELD);        
    }

    get phone() {
        return getFieldValue(this.account.data, PHONE_FIELD);
    }

    get website() {
        return getFieldValue(this.account.data, WEBSITE_FIELD);
    }
}