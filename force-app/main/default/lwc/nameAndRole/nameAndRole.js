import { LightningElement } from 'lwc';

export default class NameAndRole extends LightningElement {
    username="{username}";    

    changeHandler(event) {
        this.username = event.target.value;
    }

    selectedRole = "Salesforce Admin";

    get roles () {
        return [
            {label: "Salesforce Admin", value: "Salesforce Admin"},
            {label: "Salesforce Developer", value: "Salesforce Developer"},
            {label: "Salesforce Architect", value: "Salesforce Architect"}
        ]
    }

    changeHandler2(event) {
        this.selectedRole = event.target.value;
    }
}