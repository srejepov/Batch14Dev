import { LightningElement } from 'lwc';

export default class QuerySelectors extends LightningElement {

    fruits = ["Banana", "Apple", "Pear", "Grapes"];

    clickHandler() {
        //querySelector demo
        const h1elem = this.template.querySelector('h1');
        console.log(h1elem.innerText);
        h1elem.style.color = "#095fe8";
        h1elem.style.border = "3px solid green";
        h1elem.style.background = "#00dff7";

        const pelem = this.template.querySelector('p');
        console.log(pelem.innerText);
        pelem.style.color = "#eb1330";
        pelem.style.border = "5px solid blue";
        pelem.style.background = "#05f55d";

        //querySelectorAll demo
        const divelems = this.template.querySelectorAll('div.child');
        divelems.forEach(item => {
            console.log(item.innerText);
            item.setAttribute("class", "slds-align_absolute-center");
        })
    }
}