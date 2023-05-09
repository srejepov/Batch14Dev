import { LightningElement, wire } from 'lwc';
import TITLE_FIELD from '@salesforce/schema/Ecommerce_Product__c.Title__c';
import BRAND_FIELD from '@salesforce/schema/Ecommerce_Product__c.Brand__c';
import CATEGORY_FIELD from '@salesforce/schema/Ecommerce_Product__c.Category__c';
import PRICE_FIELD from '@salesforce/schema/Ecommerce_Product__c.Price__c';
import DISC_FIELD from '@salesforce/schema/Ecommerce_Product__c.Discount_Percentage__c';
import RATING_FIELD from '@salesforce/schema/Ecommerce_Product__c.Rating__c';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [TITLE_FIELD, BRAND_FIELD, CATEGORY_FIELD, PRICE_FIELD, DISC_FIELD, RATING_FIELD];

export default class GetRecordProduct extends LightningElement {
    recordId = "a09Dn000001vjM2IAI";
    title;
    brand;
    category;
    price;
    disc;
    rating;

    @wire(getRecord, {
        recordId: '$recordId',
        fields: FIELDS
    }) productHandler({data, error}) {
        if (data) {
            console.log(data);
            this.title = data.fields.Title__c.value;
            this.brand = data.fields.Brand__c.value;
            this.category = data.fields.Category__c.value;
            this.price = data.fields.Price__c.displayValue;
            this.disc = data.fields.Discount_Percentage__c.value;
            this.rating = data.fields.Rating__c.value;
        }
        if (error) {
            console.error(error);
        }
    }
}