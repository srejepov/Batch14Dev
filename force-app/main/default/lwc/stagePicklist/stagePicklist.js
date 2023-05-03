import { LightningElement } from 'lwc';

export default class StagePicklist extends LightningElement {
    selectedStage = "Prospecting";

    get options() {        
        return [
            {label: "Prospecting", value: "Prospecting"},
            {label: "Value Proposition", value: "Value Proposition"},
            {label: "Negotiation/Review", value: "Negotiation/Review"},
            {label: "Closed Lost", value: "Closed Lost"},
            {label: "Closed Won", value: "Closed Won"}
        ];
    }

    changeHandler(event) {
        this.selectedStage = event.target.value;
    }
}