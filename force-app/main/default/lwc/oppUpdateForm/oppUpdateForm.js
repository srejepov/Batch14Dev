import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import NAME_FIELD from '@salesforce/schema/Opportunity.Name';
import TYPE_FIELD from '@salesforce/schema/Opportunity.Type';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import AMOUNT_FIELD from '@salesforce/schema/Opportunity.Amount';
import CLOSEDATE_FIELD from '@salesforce/schema/Opportunity.CloseDate';
import { getFieldValue, getRecord, updateRecord } from 'lightning/uiRecordApi';
import { getObjectInfo, getPicklistValuesByRecordType } from 'lightning/uiObjectInfoApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

const FIELDS = [NAME_FIELD, TYPE_FIELD, STAGE_FIELD, AMOUNT_FIELD, CLOSEDATE_FIELD];

export default class OppUpdateForm extends LightningElement {
    recordId="006Dn0000051kKDIAY";
    typeOptions = [];
    stageOptions = [];
    formdata = {};

    changeHandler(event) {
        this.formdata[event.target.name] = event.target.value;
    }

    updateHandler() {
        this.formdata["Id"] = this.recordId;

        const recordInput = {fields: this.formdata};

        updateRecord(recordInput)
            .then(result => {
                const toast = new ShowToastEvent({
                    title: "Success",
                    message: "Opportunity record has been updated successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);
            })
            .catch(error => {
                console.error(error);
                const toast = new ShowToastEvent({
                    title: error.statusText,
                    message: error.body.output.errors[0].message,
                    variant: "error"
                });
                this.dispatchEvent(toast);
            })
    }

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

    @wire(getPicklistValuesByRecordType, {
        objectApiName: OPP_OBJECT,
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    })picklistHandler({data, error}) {
        if (data) {
            console.log(data);
            this.typeOptions = data.picklistFieldValues.Type.values;
            this.stageOptions = data.picklistFieldValues.StageName.values;
        }
        if (error) {
            console.error(error);
        }
    }

    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    }) opportunity;

    get name() {
        return getFieldValue(this.opportunity.data, NAME_FIELD);
    }

    get type() {
        return getFieldValue(this.opportunity.data, TYPE_FIELD);
    }

    get stage() {
        return getFieldValue(this.opportunity.data, STAGE_FIELD)
    }

    get amount() {
        return getFieldValue(this.opportunity.data, AMOUNT_FIELD)
    }

    get closedate() {
        return getFieldValue(this.opportunity.data, CLOSEDATE_FIELD)
    }
}