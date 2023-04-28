import { LightningElement } from 'lwc';

export default class TwoWayDataBinding extends LightningElement {
    fullName = "Sapa Rejepov";
    title = "Salesforce Developer";
    age = 41;

    titleChangeHandler(event) {
        this.title = event.target.value;
    }

    ageChangeHandler(event) {
        this.age = event.target.value;
    }
}