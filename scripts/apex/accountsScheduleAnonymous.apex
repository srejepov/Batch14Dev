string crn = '0 0 13 * * ?';
AccountsSchedule acs = new AccountsSchedule();
system.schedule('AccountSchedule22', crn, acs);