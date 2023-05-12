import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import { createRecord } from 'lightning/uiRecordApi';

export default class CreateRecordAccount extends LightningElement {
    industryOptions = [];
    formdata = {};

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    @wire(getPicklistValues, {
        fieldApiName: INDUSTRY_FIELD, 
        recordTypeId: '$accountInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if (data) {
            this.industryOptions = data.values;
        }        
    }

    changeHandler(event) {
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;
        console.log(JSON.stringify(this.formdata));
    }

    cancelHandler() {
        this.template.querySelector('form.accountform').reset();
        this.template.querySelector('lightning-combobox').value = undefined;
        this.formdata = {};
    }

    saveHandler() {
        //Populate Rating (always use API Name from Org)
        const name = "Rating";
        if (this.formdata.AnnualRevenue > 10000000) {
            this.formdata[name] = "Hot";
        } else if (this.formdata.AnnualRevenue < 5000000) {
            this.formdata[name] = "Cold";
        } else {
            this.formdata[name] = "Warm";
        }

        //prepare recordInput
        const recordInput = {
            apiName: ACCOUNT_OBJECT.objectApiName,
            fields: this.formdata
        };

        //create record
        createRecord(recordInput)
            .then(result => {
                console.log("Success");
                this.cancelHandler();
            })
            .catch(error => {
                console.log("Error");
            })
    }
}