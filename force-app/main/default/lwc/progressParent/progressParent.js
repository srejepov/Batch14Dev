import { LightningElement } from 'lwc';

export default class ProgressParent extends LightningElement {
    
    selectedValue;
    selectedSize;

    changeHandler(event) {
        if (event.target.name == "Progress Value") {
            this.selectedValue = event.target.value;
        } else {
            this.selectedSize = event.target.value;
        }
    }

    get progressOptions() {
        return [
            {label: "Small", value: "Small"},
            {label: "Medium", value: "Medium"},
            {label: "Large", value: "Large"}
        ];
    }

    resetHandler() {
        this.template.querySelector('c-progress-bar').resetProgress();
    }
}