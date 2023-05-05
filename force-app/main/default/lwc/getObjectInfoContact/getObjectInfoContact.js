import { getObjectInfo } from 'lightning/uiObjectInfoApi';
import { LightningElement, wire } from 'lwc';
import CONTACT_OBJECT from '@salesforce/schema/Contact';

export default class GetObjectInfoContact extends LightningElement {

    partnerRtId;

    @wire(getObjectInfo, {objectApiName: CONTACT_OBJECT})
    objectInfoHandler({data, error}) {
        if (data) {
            console.log(data);
            const rtids = data.recordTypeInfos;
            this.partnerRtId = Object.keys(rtids).find(item => rtids[item].name === "Partner");
        }
        if (error) {
            console.error(error);
        }
    }
}