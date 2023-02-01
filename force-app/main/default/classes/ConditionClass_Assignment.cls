public class ConditionClass_Assignment {
    public string ifClassMethod(integer month) {
        string output_Month = 'Not a valid Month';
        if (month == 1) {
            output_Month = 'January';
        } else if (month == 2) {
            output_Month = 'February';
        } else {
            output_Month = 'Not a valid Month';
        }

        return output_Month;
    }
    public string caseMethod(string month){
        string output_Quarter = 'Enter a proper Month name';
        switch on month {
            when 'January','February','March'{
               output_Quarter = 'Quarter 1'; 
            }
            when else {
                output_Quarter = 'Not a valid Quarter';
            }
        }               
           return output_Quarter; 
    }
}