Map<String, String> mapCountryCurrency = new Map<String, String>();
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('Japan', 'Yen');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('Poland', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkey', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
system.debug('map of country and its currency ' + mapCountryCurrency);

string IndiaCurrency = mapCountryCurrency.get('India');
string TurkeyCurrency = mapCountryCurrency.get('Turkey');
system.debug('Currency of India is ' + IndiaCurrency);
system.debug('Currency of Turkey is ' + TurkeyCurrency);

set<string> countrySet = mapCountryCurrency.keySet();
system.debug('countries are ' + countrySet);

list<string> currencies = mapCountryCurrency.values();
system.debug('currencies are ' + currencies);

for(string eachKey : countrySet){
    string printString = 'Country is ' + eachKey;
    system.debug(printString);

    string eachValue = mapCountryCurrency.get(eachKey);
    printString += ', its currency is ' + eachValue;
    system.debug(printString);
}
