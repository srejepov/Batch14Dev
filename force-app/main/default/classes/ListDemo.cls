public  class ListDemo {
    //pass index number in parameter and return the candidate at that index
    public static string candidateList(integer i) {
        list<string> listCandidates = new list<string>();
        listCandidates.add('Marc');
        listCandidates.add('Elon');
        listCandidates.add('Bill');
        listCandidates.add('Marc');
        system.debug('Candidates ==> ' + listCandidates);

        string candidate = '';
        if (i>=0 && i < listCandidates.size()) {
            candidate = listCandidates[i];
        } else {
            candidate = 'No value found. Try again later';
        }
        return candidate;
    }
    public static void randomIntegerList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10); //index = 0
        listInteger.add(15); //index = 1
        listInteger.add(21); //index = 2
        listInteger.add(15); //index = 3
        listInteger.add(15); //index = 4
        system.debug('Random integer list ==> ' + listInteger);

        integer index3Value = listInteger.get(3);
        //both ways are fine.
        integer index3Value2 = listInteger[3];
        system.debug('value at index 3 ==> ' + index3Value);
        system.debug('value at index 3, again ==> ' + index3Value2);
    }    
    public static void allCats() {
        list<cat> cats = new list<cat>();
        //A. we can add instances of CAT class in this list.
        cat c1 = new cat('cinnamon','brown');
        cat c2 = new cat('duman','dark gray');
        cat c3 = new cat();
        cats.add(c1);
        cats.add(c2);
        cats.add(c3);
        system.debug('cats ===> ' + cats);
        if (!cats.isEmpty()){
            system.debug('cat at 0 ' + cats[0]);
        }
    }
    public static void iterateList() {
        List<integer> listInteger = new List<integer>();
        listInteger.add(10);
        listInteger.add(15);
        listInteger.add(21);
        listInteger.add(15);
        listInteger.add(15);

        for (integer eachInteger : listInteger) {
            system.debug(eachInteger);
        }
    }
}