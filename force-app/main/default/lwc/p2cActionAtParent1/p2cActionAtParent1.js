import { LightningElement } from 'lwc';

export default class P2cActionAtParent1 extends LightningElement {
    studentAge;

    changeHandler(event) {
        this.studentAge = Number(event.target.value);
    }
}