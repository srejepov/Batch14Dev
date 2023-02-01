map<string, integer> marksObtainInMaths = new map<string, integer>();
marksObtainInMaths.put('0111C112', 40);
marksObtainInMaths.put('0111C102', 19);
marksObtainInMaths.put('0111C100', 33);
marksObtainInMaths.put('0111C098', 40);

set<string> rollNumberSet = marksObtainInMaths.keySet();
system.debug('roll number set is ' + rollNumberSet);

list<integer> studentMarksList = marksObtainInMaths.values();
system.debug('student marks list is ' + studentMarksList);

set<string> uniqueRollNumberSet = marksObtainInMaths.keySet();
list<integer> marksObtainList = new list<integer>();

for(string eachStr : uniqueRollNumberSet){
    integer printStr = marksObtainInMaths.get(eachStr);    
    marksObtainList.add(printStr);
    if(printStr < 20){
        system.debug(eachStr + ' is not qualified for next class');
    }
}
system.debug(' marks obtain list is ' + marksObtainList);