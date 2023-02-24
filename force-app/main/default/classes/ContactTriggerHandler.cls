public class ContactTriggerHandler {
    public static void contactUpdateValidation1(list<contact> conTriggerNew, list<contact> conTriggerOld, map<id, contact> conTriggerNewMap, map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            if (conTriggerOldMap.get(eachContact.Id).LeadSource == 'Partner Referral') {
                eachContact.addError('Cannot update contact if lead sourse is Partner Referral');
            }
        }
    }
    public static void contactUpdateValidation2(list<contact> conTriggerNew, list<contact> conTriggerOld, map<id, contact> conTriggerNewMap, map<id, contact> conTriggerOldMap) {
        for (contact eachContact : conTriggerNew) {
            if (eachContact.LeadSource != conTriggerOldMap.get(eachContact.Id).LeadSource) {
                eachContact.LeadSource.addError('CANNOT UPDATE LEAD SOURCE. USER, PLEASE GOOGLE TRIGGERS!!!!');
            }
        }
    }
    public static void rollUpSummaryUpdate(List<contact> conTriggerNew, List<contact> conTriggerOld,
        Map<id, contact> conTriggerNewMap, Map<id, contact> conTriggerOldMap) {
        
            //contact created with related Account  --> Increase count of 'number of contacts' for that new account.
            //Contact update, account field changed --> INCREASE count for NEW ACCOUNT.
            //                                      --> DECREASE Count for OLD ACCOUNT.
            //Contact Deleted                       --> DECREASE Count for OLD ACCOUNT.
            //Contact UnDeleted                     --> INCREASE count for NEW ACCOUNT.


            set<id> accountIds = new set<id>();

            if(Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete){
                //for increase we Use trigger NEW
                for (contact eachCon : conTriggerNew) {
                    if(eachCon.AccountId != null){
                        accountIds.add(eachCon.AccountId);
                    }
                }
            }
            if (Trigger.isDelete || Trigger.isUpdate) {
                //OLD account for Decrease
                for (contact eachCon : conTriggerOld) {
                    if(eachCon.AccountId != null){
                        accountIds.add(eachCon.AccountId);
                    }
                }
            }

            if (!accountIds.isEmpty()) {
                list<account> listAcc = [select id, number_of_contacts__c, (select id from contacts)
                from account where id in :accountIds];
                for (account eachAcc : listAcc) {
                    integer numOfContacts = 0;
                    if (eachAcc.contacts != null) {
                        eachAcc.contacts.size();
                    }
                    //set number of contacts field on account record
                    eachAcc.number_of_contacts__c = eachAcc.contacts.size();
                }
                if(!listAcc.isEmpty()){
                    update listAcc;
                }
            }

    }
}
