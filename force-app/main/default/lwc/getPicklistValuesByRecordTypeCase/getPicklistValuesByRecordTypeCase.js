import { LightningElement, wire } from 'lwc';
import CASE_OBJECT from '@salesforce/schema/Case';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';

export default class GetPicklistValuesByRecordTypeCase extends LightningElement {
    selectedStatus;
    selectedPriority;
    statusOptions = [];
    priorityOptions = [];

    changeHandler(event) {
        const elem = event.target.label;
        if (elem == "Select Status") {
            this.selectedStatus = event.target.value;
        } else {
            this.selectedPriority = event.target.value;
        }
    }

    @wire(getObjectInfo, {objectApiName: CASE_OBJECT})
    caseInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: CASE_OBJECT,
        recordTypeId: '$caseInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if (data) {
            console.log(data);
            this.statusOptions = data.picklistFieldValues.Status.values;
            this.priorityOptions = data.picklistFieldValues.Priority.values;
        }
        if (error) {
            console.error(error);
        }
    }
}