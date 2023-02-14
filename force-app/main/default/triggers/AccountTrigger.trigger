trigger AccountTrigger on Account (before insert, before update, after insert, after update) {    
    system.debug('----- trigger starts -----');
    
     if (trigger.isAfter) {
        system.debug('after isert/update new records: ' + trigger.new);
     }   

    system.debug('===== trigger ends ====='); 

    /*
    system.debug('Trigger.isBefore -> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter -> ' + Trigger.isAfter);

    system.debug('Trigger.isInsert -> ' + Trigger.isInsert);
    system.debug('Trigger.isUpdate -> ' + Trigger.isUpdate);
    
    if(Trigger.isAfter && Trigger.isInsert){
        system.debug('after insert trigger called.');
    }

    if(Trigger.isBefore && Trigger.isInsert){
        system.debug('before insert trigger called.');
    } 
    if(Trigger.isAfter && Trigger.isUpdate){
        system.debug('after update trigger called.');
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        system.debug('before update trigger called.');
    }
    system.debug('Trigger.isInsert --> ' + Trigger.isInsert);
    if(trigger.isInsert){
        system.debug('before insert trigger called.');
    }
    system.debug('Trigger.isUpdate --> ' + Trigger.isUpdate);
    if(trigger.isUpdate){
        system.debug('before update trigger called.');
    }

    system.debug('Trigger.isBefore --> ' + Trigger.isBefore);
    system.debug('Trigger.isAfter --> ' + Trigger.isAfter);
    
    if(Trigger.isBefore){
        system.debug('before insert trigger called.');
    }
    if(Trigger.isAfter){
        system.debug('after insert trigger called.');
    }
    */
       
}