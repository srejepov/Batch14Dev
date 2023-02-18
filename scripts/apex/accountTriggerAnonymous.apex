list<account> listAccount = new list<account>();
        account acc1 = new account();
        acc1.Name = 'Trigger acc1';
        acc1.ShippingCity = 'New York';
        acc1.Active__c = 'No';
        listAccount.add(acc1);

        account acc2 = new account();
        acc2.Name = 'Trigger acc2';
        acc2.ShippingCity = 'Dallas';
        acc2.Active__c = 'Yes';
        listAccount.add(acc2);

        account acc3 = new account();
        acc3.Name = 'Trigger acc3';
        acc3.ShippingCity = 'Atlanta';
        acc3.Active__c = 'Yes';
        listAccount.add(acc3);

        insert listAccount;