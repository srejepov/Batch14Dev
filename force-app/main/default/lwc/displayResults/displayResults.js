import { LightningElement, api } from 'lwc';

export default class DisplayResults extends LightningElement {
    @api records;
    @api columns;
    @api error;
}