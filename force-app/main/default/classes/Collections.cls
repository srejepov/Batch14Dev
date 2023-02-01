public class Collections {
  public static string listAssignment(integer i) {
    list<string> listMonth = new list<string>();
    string outputMonth = '';
    
    listMonth.add('January');
    listMonth.add('February');
    listMonth.add('March');
    listMonth.add('April');
    listMonth.add('May');
    listMonth.add('June');
    listMonth.add('July');
    listMonth.add('August');
    listMonth.add('September');
    listMonth.add('October');
    listMonth.add('November');
    listMonth.add('December');

    if (i >= 0 && i < listMonth.size()) {
        outputMonth = listMonth[i - 1];
    } else {
        outputMonth = 'Not a valid month';
    }
    return outputMonth;
  }
}