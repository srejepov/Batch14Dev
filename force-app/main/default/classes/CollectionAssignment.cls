public class CollectionAssignment {
    public set<string> countriesSet = new set<string>{'India', 'USa', 'Russia', 'Germany', 'Singapore', 'Japan'};
            
    public void printLowerCase() {
        list<string> listInLower = new list<string>();
        
        for (string eachStr : countriesSet) {
            string allLower = eachStr.toLowerCase();
            listInLower.add(allLower);            
        }    
        system.debug('lower case country set is ' + listInLower); 
    }
    public void printUpperCase(){
        list<string> listInUpper = new list<string>();
        for (string eachStr : countriesSet) {
            string allUpper = eachStr.toUpperCase();
            listInUpper.add(allUpper);            
        }
        system.debug('upper case country set is ' + listInUpper);
    }
}