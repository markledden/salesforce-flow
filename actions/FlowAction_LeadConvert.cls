public with sharing class FlowAction_LeadConvert {

    public class Input { 

        @invocableVariable (label='Lead ID' required=true)
        public String leadId;

        @invocableVariable( label='Contact ID' required=false)
        public String contactId;

        @invocableVariable (label='Account ID' required=false)
        public String accountId;

        @invocableVariable (label='Lead Converted Status' required=true)
        public String statusLabel;

        @invocableVariable (label='Do Not Create Opportunity')
        public Boolean noOpportunity; 

    }

    public class Output {
        
        @invocableVariable (label='Contact ID')
        public String newContactId;

        @invocableVariable (label='Account ID')
        public String newAccountId;

        @invocableVariable (label='Opportunity ID')
        public String newOpportunityId;

    }

    @invocableMethod (label='Lead Convert' description='Convert Lead Flow Action' category='Lead')
    public static List<Output> leadConvert(List<Input> inputList) {

        Output output = new Output();
        List<Output> outputWrapper = new List<Output>();

        for (Input i : inputList) {

            String leadId           = i.leadId;
            String contactId        = i.contactId;
            String accountId        = i.accountId;
            String statusLabel  = i.statusLabel;
            Boolean noOpportunity   = i.noOpportunity;

            Database.LeadConvert lc = new database.LeadConvert();
            lc.setLeadId(leadId);
            lc.setConvertedStatus(statusLabel);

            if (accountId != null){
                lc.setAccountId(accountId);
            } 
    
            if (contactId != null){
                lc.setContactId(contactId);
            } 
    
            if (noOpportunity == true){
                lc.setDoNotCreateOpportunity(noOpportunity);
            } 

            Database.LeadConvertResult lcr = Database.convertLead(lc);
            System.assert(lcr.isSuccess());

            String newAccountId = accountId==null?lcr.getAccountId():null;
            String newContactId = contactId==null?lcr.getContactId():null;
            String newOpportunityId = lcr.getOpportunityId();

            output.newContactId = newContactId;
            output.newAccountId = newAccountId;
            output.newOpportunityId = newOpportunityId;
            outputWrapper.add(output);

        }

        return outputWrapper;
    }  
}
