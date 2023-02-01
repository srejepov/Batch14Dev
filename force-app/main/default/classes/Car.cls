public class Car {
    // variables created directly in class are class variables
    //class variables access modifiers
    public string carColor = '';
    public string carName;
    //default is private
    integer maxSpeed = 140;

    public void switchOn() {
        system.debug('starting the car nowwwww!');
    }
    public void drive(){
        system.debug('driving ' + carName);        
    }
    public void driveAtMaxSpeed(){
        //we can access public and private class inside public method of the class
        string description = 'driving ' + carName + ' with car color ' + carColor + ' at ' + maxSpeed + 'km/h';
        system.debug(description);
    }
    //Go to classes (force-app>classes) folder > right click create apex class
    ////remove the extra stuff.

    //How to save this code to ORG?
        //1. save (ctrl + s) (cmd + s)
        //2. Deploy ?
            // right click > Sfdx deploy

}