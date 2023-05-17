import getRecentLeads from '@salesforce/apex/LeadCtrl.getRecentLeads';
import { LightningElement } from 'lwc';

export default class ImperativeApex1 extends LightningElement {
    leads;
    error;
    
    fetchLeads() {
        getRecentLeads() 
            .then(result =>{
                console.log(result);
                this.leads = result;
            })
            .catch(error => {
                console.log(error);
                this.error = error;
            }) 
        
    }
}