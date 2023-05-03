import { LightningElement } from 'lwc';

export default class TemplateLooping2 extends LightningElement {
    opps = [
        {
            Id: 1,
            Name: "Electrical Generators",
            Amount: 1000000,
            Industry: "Electrical"
        },
        {
            Id: 2,
            Name: "Engineering Bootcamps",
            Amount: 2000000,
            Industry: "Education"
        },
        {
            Id: 3,
            Name: "Biotech Opp",
            Amount: 3000000,
            Industry: "Biotechnology"
        },
        {
            Id: 4,
            Name: "Universal Containers",
            Amount: 4000000,
            Industry: "Consulting"
        }
    ];
}