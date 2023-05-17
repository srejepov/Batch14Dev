import getProducts from '@salesforce/apex/ProductCtrl.getProducts';
import { LightningElement } from 'lwc';

const COLUMNS = [
    {label: 'Title', fieldName: 'Title__c', type: 'text'},
    {label: 'Brand', fieldName: 'Brand__c', type: 'text'},
    {label: 'Category', fieldName: 'Category__c', type: 'text'},
    {label: 'Price', fieldName: 'Price__c', type: 'currency'}
]

export default class ProductSearch extends LightningElement {
    searchAmount;
    products;
    columns = COLUMNS;
    error = "Enter an amount so that you can see matching products!";
    

    changeHandler(event) {
        this.searchAmount = event.target.value;
        getProducts({Amount: this.searchAmount})
            .then(result => {
                this.products = result;
                this.error = undefined;
            })
            .catch(error => {
                this.error = error;
                this.products = undefined;
            })
    }
}