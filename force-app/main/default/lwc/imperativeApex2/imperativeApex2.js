import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import getOppsByStage from '@salesforce/apex/OpportunityController.getOppsByStage';

const COLUMNS = [
    {label: "Opp Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"},
    {label: "Close Date", fieldName: "CloseDate", type: "date"}
];

export default class ImperativeApex2 extends LightningElement {
    stageOptions = [];
    selectedStage;
    opps;
    error;
    columns=COLUMNS;    

    changeHandler(event) {
        this.selectedStage = event.target.value;
        getOppsByStage({stage: this.selectedStage})
            .then(result => {
                this.opps = result;
            })
            .catch(error => {
                this.error = error;
            })
    }

    @wire(getObjectInfo, {objectApiName: OPP_OBJECT})
    oppInfo;

    @wire(getPicklistValues, {
        fieldApiName: STAGE_FIELD,
        recordTypeId: '$oppInfo.data.defaultRecordTypeId'
    }) picklistHandler({data, error}) {
        if (data) {
            this.stageOptions = data.values;
        }
    }
}