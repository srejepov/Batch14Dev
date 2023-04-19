public class Car {
    
    public string carColor = '';
    public string carName;
    
    integer maxSpeed = 140;

    public void switchOn() {
        system.debug('starting the car nowwwww!');
    }
    public void drive(){
        system.debug('driving ' + carName);        
    }
    public void driveAtMaxSpeed(){
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