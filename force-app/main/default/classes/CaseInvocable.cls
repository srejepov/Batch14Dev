public with sharing class CaseInvocable {

    @InvocableMethod(Label='Send Email & Save as Activity'
    description='Send an email to contact and save the same as an activity'
    category='Case')
    public static void sendEmailSaveActivity(List<CaseRequest> inputs) {
        List<Messaging.SingleEmailMessage> msgs = new List<Messaging.SingleEmailMessage>();
        for (CaseRequest request : inputs) {
            Messaging.SingleEmailMessage msg = new Messaging.SingleEmailMessage();
            msg.setSubject('Case Created: ' + request.caseNumber);
            msg.setPlainTextBody(
            'Hello there, \n'
            + 'A case has been created for your query. Please quote the case number while you call us next time. \n\n'
            + 'Thank you! \n'
            + 'Salesforce'
            );
            msg.setTargetObjectId(request.contactId);
            msg.setSaveAsActivity(true);
            msgs.add(msg);
        }
        try {
            Messaging.sendEmail(msgs);
        } catch (Exception ex) {
            system.debug(ex.getMessage());
        }
    }

    public class CaseRequest {
        @InvocableVariable(label='Case Number' description='Case Number' required=true)
        public String caseNumber;

        @InvocableVariable(label='Contact ID' description='Contact ID' required=false)
        public Id contactId;
    }
}