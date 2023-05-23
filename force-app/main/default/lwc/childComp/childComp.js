import { LightningElement } from 'lwc';

export default class ChildComp extends LightningElement {

    clickHandler() {
        console.log("Before dispatching the show event")
        const evt = new CustomEvent('show', {
            bubbles: true,
            composed: true
        });
        this.dispatchEvent(evt);
        console.log("After dispatching the show event");
    }
}