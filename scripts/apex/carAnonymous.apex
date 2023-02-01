//code to call switchOn method.

car vw = new car();
vw.carColor = 'white';
vw.carName = 'Golf';
vw.switchOn();
vw.drive();
vw.driveAtMaxSpeed();

Car bm = new Car();
bm.carColor = 'Black';
system.debug('bm ==> ' + bm);
bm.switchOn();
system.debug('bm color ==> ' + bm.carColor);

Car lm = new Car();
lm.carColor = 'red';
lm.maxSpeed = 100;
lm.switchOn();
system.debug('lm max speed ==> ' + lm.maxSpeed);