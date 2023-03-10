Map<String, Country_Code__C> countryCodes = country_code__c.getAll();
system.debug('countryCode map ' + countryCodes);

for (string eachName : countryCodes.keySet()) {
    country_code__c eachRecord = countryCodes.get(eachName);
    system.debug('country is ' + eachName + ' and its code is ' + eachRecord.code__c);
}