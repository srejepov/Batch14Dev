Calculator c = new Calculator();
c.publicMessage();


date dtt = date.today();
boolean dttCheck = c.leapYearCheck(dtt);
system.debug('today date is in LEAP year?? ' + dttCheck);


integer sum11 = c.add(10, 15, 25);
system.debug('sum11 is ' + sum11);
integer x = 10;
integer y = 15;
integer sum1 = c.add(x, y);
integer sum2 = c.add(10, 15);
system.debug(' sum1 is ' + sum1);
system.debug(' sum2 is ' + sum2);
c.pringAndReturnMessage('print this for batch 14');
string result = c.pringAndReturnMessage('print this for batch 14');
system.debug(result);
c.welcomeMessage();
string m = 'print this now';
c.printNewMessage(m);
string msg = 'pring this now too';
c.printNewMessage(msg);
c.printNewMessage('pring this too buddy');