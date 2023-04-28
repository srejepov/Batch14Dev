import { LightningElement, track } from 'lwc';

export default class TrackProperty extends LightningElement {
    @track location = {
        city: "San Antonio",
        state: "Texas",
        country: "United States"
    };

    changeHandler(event) {
        console.log(event.target.value);
        this.location.city = event.target.value;
    }
}