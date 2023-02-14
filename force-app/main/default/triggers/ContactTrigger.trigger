trigger ContactTrigger on Contact (before insert, after insert, before update, after update) {

    if (trigger.isBefore) {
        system.debug('We are in BEFORE Trigger.');
        if (trigger.isInsert) {
            system.debug('before insert trigger');
        }
        if (trigger.isUpdate) {
            system.debug('before update trigger');
        }
    }
    if (trigger.isAfter) {
        system.debug('We are in AFTER Trigger.');
        if (trigger.isInsert) {
            system.debug('after insert trigger');
        }
        if (trigger.isUpdate) {
            system.debug('after update trigger');
        }
    }
}