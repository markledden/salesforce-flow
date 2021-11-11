@isTest
private class FlowAction_LeadConvertTest {

    @TestSetup
    static void makeData(){

        Lead l = new Lead(LastName = 'Lastname', Company = 'Company');insert l;
        Account a = new Account(Name = 'Company');insert a;
        Contact c = new Contact(AccountId = a.Id, LastName = 'Lastname');insert c;

    }

    @isTest
    static void validateLeadConvert() {
        
        Lead l = [SELECT Id FROM Lead LIMIT 1];
        LeadStatus ls = [SELECT MasterLabel FROM LeadStatus WHERE isConverted = true LIMIT 1];
        Account a = [SELECT Id FROM Account LIMIT 1];
        Contact c = [SELECT Id FROM Contact LIMIT 1];
        
        List<FlowAction_LeadConvert.Input> testinput = new List<FlowAction_LeadConvert.Input>();
        
        FlowAction_LeadConvert.Input input = new FlowAction_LeadConvert.Input();
        input.leadId = l.Id;
        input.statusLabel = ls.Masterlabel;
        input.noOpportunity = true;
        input.accountId = a.Id;
        input.contactId = c.Id;
        
        testinput.add(input);

        Test.startTest();

        FlowAction_LeadConvert.LeadConvert(
            new List<FlowAction_LeadConvert.Input>(testinput)
        );

        Test.stopTest();                  
    }
     
}