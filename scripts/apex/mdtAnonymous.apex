Map<string, EmailDomain__mdt> emails = EmailDomain__mdt.getAll();
system.debug(emails);

EmailDomain__mdt gmail = EmailDomain__mdt.getInstance('Gmail');
system.debug('Gmail -->' + gmail);

