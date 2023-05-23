import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import OPP_OBJECT from '@salesforce/schema/Opportunity';
import STAGE_FIELD from '@salesforce/schema/Opportunity.StageName';
import getOppsByStage from '@salesforce/apex/OpportunityController.getOppsByStage';

const COLUMNS = [
    {label: "Name", fieldName: "Name", type: "text"},
    {label: "Type", fieldName: "Type", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"},
    {label: "Close Date", fieldName: "CloseDate", type: "date"}
];

export default class OppSearch extends LightningElement {
    selectedStage;
    stageOptions = [];
    opps;
    error = "Select a stage to see the opportunities available under that";
    columns = COLUMNS;
    
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

    changeHandler(event) {
        this.selectedStage = event.target.value;
        getOppsByStage({stage: this.selectedStage})
                .then(result => {
                    if (result.length > 0) {
                        this.opps = result;
                        this.error = undefined;
                    } else {
                        this.opps = undefined;
                        this.error = "No opportunities belong to the selected stage. Try selecting another!";
                    }
                })
                .catch(error => {
                    this.error = error;
                    this.opps = undefined
                })
    }

}