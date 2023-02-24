List<Case> newCases = new List<Case>();
for (Integer i = 0; i < 210; i++) {
    case c = new case();
    c.Subject = 'Trigger Case';
    c.Status = 'New';
    c.Origin = 'Web';
    c.Description = 'Resolve it now';
    newCases.add(c);
}
insert newCases;

list<case> updateCases = [select id, status from case where status='New'];
for (case eachCase : updateCases) {
    eachCase.Status = 'Working';
}
update updateCases;