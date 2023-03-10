try {
    account a = new account();
    insert a;
} catch (DmlException dmlex){
    system.debug('dml went wrong buddy');
    system.debug('dml ex message: ' + dmlex.getDmlIndex(0));
    system.debug('ex message ' + dmlex.getMessage());
} catch (Exception ex) {
    system.debug('something went wrong buddy');
    system.debug('ex message ' +ex.getMessage());
}

system.debug('Apex is SIMPLE');