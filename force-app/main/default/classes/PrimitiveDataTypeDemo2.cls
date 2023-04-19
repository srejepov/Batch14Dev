public class PrimitiveDataTypeDemo2 {
    public void printNewDate() {
        system.debug('create new dates here');

        Date newDate = date.newInstance(1995, 2, 15);
        system.debug('new date is ' + newDate);

        Date newDate2 = date.newInstance(2022, 1, 9);
        system.debug('new date2 is ' + newDate2);

        Date todayDate = date.today();
        system.debug('today date is ' + todayDate);
    }

    public void printNewTime(){
        //newInstance hour, minute, seconds, milliseconds
        Time myTime = time.newInstance(22, 70, 15, 40);
        system.debug('my time is ' + myTime);

        Time myTime2 = time.newInstance(9, 80, 30, 20);
        system.debug('my time2 is ' + myTime2);
    }
    public void printNewDateTime(){
       Date newDate = date.today();
       Time newTime = time.newInstance(8, 50, 30, 40);

       // 1. create datetime using DATE and TIME
       Datetime dt1 = Datetime.newInstance(newDate, newTime);
       system.debug('dt1 ' + dt1); 

       //2. create datetime using YEAR, MONTH, DAY
       Datetime dt2 = Datetime.newInstance(2020, 10, 16);
       system.debug('dt2 is ' + dt2);

       //3. create datetime using year, month, day, hour, minute, second
       Datetime dt3 = Datetime.newInstance(1999, 9, 14, 2, 50, 30);
       system.debug('dt3 ' + dt3);

        //4. newInstance fron longtime
       Long longtime = 0;
       Datetime dt4 = Datetime.newInstance(longtime);
       system.debug('dt4 ' + dt4);

       Long longtime2 = 1925498457987L;
       Datetime dt4_1 = Datetime.newInstance(longtime2);
       system.debug('dt4_1 => ' + dt4_1);

        //GMT
       Datetime dt5 = Datetime.newInstanceGMT(1998, 1, 14, 14, 14, 14);
       system.debug('dt5 => ' + dt5);

        //6. now
       Datetime dt6 = Datetime.now();
       system.debug('dt6 is ' + dt6);
    }
}