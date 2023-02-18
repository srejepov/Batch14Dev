trigger ContactTriggerAssignment on Contact (before insert, before update) {
    for (Contact newContact : trigger.new) {
        system.debug('Contact name is ' + newContact.Name);
        system.debug('Account name is ' + newContact.Account.Name);
        system.debug('Contact phone is ' + newContact.Phone);
        system.debug('Contact email is ' + newContact.Email);
    }
}