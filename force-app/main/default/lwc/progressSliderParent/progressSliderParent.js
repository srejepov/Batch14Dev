import { LightningElement } from 'lwc';

export default class ProgressSliderParent extends LightningElement {
    selectedValue;

    changeHandler(event) {
        this.selectedValue = event.target.value;
    }

    resetHandler() {
        this.template.querySelector('c-progress-slider').resetProgress();
    }
}