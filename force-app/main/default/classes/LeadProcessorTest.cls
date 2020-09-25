@isTest
public with sharing class LeadProcessorTest {
    @TestSetup
    static void makeData(){
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead newLead = new Lead(Company = 'Test ' + i, LastName = 'Hello');
            leads.add(newLead);
        }

        insert leads;
    }

    @isTest
    static void testLeadProcessor() {
        Test.startTest();
        LeadProcessor lp = new LeadProcessor();
        Id batchId = Database.executeBatch(lp);
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}
