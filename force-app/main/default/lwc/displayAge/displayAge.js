import { LightningElement, api } from 'lwc';

export default class DisplayAge extends LightningElement {
    @api age;

    get ageInMonths() {
        return this.age*12;
    }

    get ageInDays() {
        return this.age*365;
    }
}