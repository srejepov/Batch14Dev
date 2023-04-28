import { LightningElement } from 'lwc';

export default class LocalProperties extends LightningElement {
    name; //undefined
    fullName = "Sapa Rejepov";
    age = 41;
    location = {
        city: "San Antonio",
        country: "United States",
        zipCode: "78233"
    };
    birds = ["Crow", "Sparrow", "Swan", "Peacock"];
}