import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {

    showHandler1(event) {
        console.log("show event has reached c-child-comp within the parent");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }

    showHandler2(event) {
        console.log("show event has bubbled up through the DOM from c-child-comp to div");
        console.log(event.target.nodeName);
        console.log(event.currentTarget.nodeName);
    }
}