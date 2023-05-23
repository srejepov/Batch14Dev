import { LightningElement, api } from 'lwc';

export default class ProgressSlider extends LightningElement {
    @api progressValue;

    @api resetProgress() {
        this.progressValue = 60;
    }
}