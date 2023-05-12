import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import PRODUCT_OBJECT from '@salesforce/schema/Ecommerce_Product__c';
import { createRecord } from 'lightning/uiRecordApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class CreateRecordProduct extends LightningElement { 
    formdata = {};  

    @wire(getObjectInfo, {objectApiName: PRODUCT_OBJECT})
    productInfo;
    
    changeHandler(event) {
        const name = event.target.name;
        const value = event.target.value;
        this.formdata[name] = value;       
    }

    cancelHandler() {
        this.template.querySelector('form.productform').reset();
        this.template.querySelector('lightning-combobox').value = undefined;
    }

    saveHandler() { 
        const name =  "Name";
        const recordId = "";
        this.formdata[name] = recordId;

        const recordInput = {
            apiName: PRODUCT_OBJECT.objectApiName,
            fields: this.formdata
        };

        createRecord(recordInput)
            .then(result => {                
                this.cancelHandler();
                const toast = new ShowToastEvent({
                    title: "Success",
                    message: "The new Product has been created successfully!",
                    variant: "success"
                });
                this.dispatchEvent(toast);                
            })
            .catch(error => {
                console.log(error);
                const toast = new ShowToastEvent({
                    title: error.statusText,
                    message: error.body.message,
                    variant: "error"
                });
                this.dispatchEvent(toast)
            })
    }   
    
    get brandOptions() {
        return[
            {label: "Samsung", value: "Samsung"},
            {label: "Apple", value: "Apple"},
            {label: "Blackberry", value: "Blackberry"},
            {label: "Nokia", value: "Nokia"}
        ];
    }

    get categoryOptions() {
        return[
            {label: "Smartphones", value: "Smartphones"},
            {label: "Tablets", value: "Tablets"},
            {label: "Refrigerator", value: "Refrigerators"},
            {label: "Air Conditioners", value: "Air Conditioners"},
            {label: "Smart Watches", value: "Smart Watches"},
            {label: "Headphones", value: "Headphones"}
        ];
    }
}