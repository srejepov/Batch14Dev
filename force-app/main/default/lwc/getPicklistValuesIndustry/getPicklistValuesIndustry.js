import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';

export default class GetPicklistValuesIndustry extends LightningElement {
    accountRtId;
    selectedIndustry;
    industryOptions = [];

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    objectInfoHandler({data, error}) {
        if (data) {
            this.accountRtId = data.defaultRecordTypeId;
        }        
    }

    @wire(getPicklistValues, {
        fieldApiName: INDUSTRY_FIELD,
        recordTypeId: '$accountRtId'
    }) 
    picklistHandler({data, error}) {
        if (data) {
            console.log(data);
            this.industryOptions = data.values;
        }
        if (error) {
            console.error(error);
        }
    }

    changeHandler(event) {
        this.selectedIndustry = event.target.value;
    }
}