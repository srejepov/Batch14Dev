import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';

export default class GetPicklistValuesByRecordTypeAccount extends LightningElement {
    selectedType;
    selectedIndustry;
    typeOptions = [];
    industryOptions = []; 

    changeHandler(event) {
        const elem = event.target.label;
        if (elem == "Select Type") {
            this.selectedType = event.target.value;
        } else {
            this.selectedIndustry = event.target.value;
        }
    }

    @wire(getObjectInfo, {objectApiName: ACCOUNT_OBJECT})
    accountInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: ACCOUNT_OBJECT, 
        recordTypeId: '$accountInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if (data) {
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.industryOptions = data.picklistFieldValues.Industry.values;
        }
        if (error) {
            console.error(error);
        }
    }
}