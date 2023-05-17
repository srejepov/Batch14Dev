import getRecentOpps from '@salesforce/apex/OpportunityController.getRecentOpps';
import { LightningElement, wire } from 'lwc';

const COLUMNS = [
    {label: "Opp Name", fieldName: "Name", type: "text"},
    {label: "Stage Name", fieldName: "StageName", type: "text"},
    {label: "Amount", fieldName: "Amount", type: "currency"},
    {label: "Close Date", fieldName: "CloseDate", type: "date"}
]

export default class WiredApex1 extends LightningElement {
    opps;
    error;
    columns = COLUMNS;

    @wire(getRecentOpps)
    recordsHandler({data, error}) {
        if (data) {
            this.opps = data;
        }
        if (error) {
            this.error = error;
        }
    }
}