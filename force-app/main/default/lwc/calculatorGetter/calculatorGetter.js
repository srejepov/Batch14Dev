import { LightningElement } from 'lwc';

export default class CalculatorGetter extends LightningElement {
    num1 = 20;
    num2 = 30;    

    get sumOfNumbers() {
        return Number(this.num1) + Number(this.num2);
    }

    changeHandler(event) {
        this.num1 = event.target.value;
    }

    changeHandler2(event) {
        this.num2 = event.target.value;
    }
}