trigger AccountTriggerAssignment on Account (before insert, after insert, before update, after update) {
    for (Account newAccount : trigger.new) {
        system.debug('Account name is ' + newAccount.Name);
        system.debug('Account rating is ' + newAccount.Rating);
        system.debug('Account description is ' + newAccount.Description);
        system.debug('Account mailing city is ' + newAccount.ShippingCity);
    }
}