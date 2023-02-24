List<Salesforce_Project__c> listSP = new List<Salesforce_Project__c>();

Salesforce_Project__c sp = new Salesforce_Project__c();
sp.Project_Name__c = 'Learn trigger';
sp.Description__c = 'learn trigger batch14';
sp.Status__c = 'New';
listSp.add(sp);

Salesforce_Project__c sp1 = new Salesforce_Project__c();
sp1.Project_Name__c = 'Learn trigger adv';
sp1.Description__c = 'learn trigger adv batch14';
sp1.Status__c = 'New';
listSp.add(sp1);

insert listSP;