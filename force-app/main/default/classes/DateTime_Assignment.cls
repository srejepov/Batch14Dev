public class DateTime_Assignment {
    public void diffOfDate() {
        Date varTomorrowDate = date.newInstance(2023, 1, 17);
        Date varTodaysDate = date.newInstance(2023, 1, 16);
        
        integer daysDifference = varTodaysDate.daysBetween(varTomorrowDate);

        system.debug('Days difference between these two days is ' + daysDifference);
    }
    public void timeCheck(){
        Datetime varTomorrowDateTime = datetime.newInstance(2023, 1, 17, 7, 00, 00);
        Datetime var10DaysDateTime = datetime.newInstanceGMT(2023, 1, 27, 9, 00, 00);
        
        system.debug('Tomorrow datetime is '+ varTomorrowDateTime);
        system.debug('10 days GMT datetime is ' + var10DaysDateTime);

        Long varDateTimeLong = 12339874361L;
        system.debug('datetime long is ' + varDateTimeLong);
        
        Datetime  add7days = varTomorrowDateTime.addDays(7);
        Datetime add10days = var10DaysDateTime.addDays(10);

        system.debug(add7days);
        system.debug(add10days);
    }
}