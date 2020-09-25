@isTest
public with sharing class DailyLeadProcessorTest {
    @isTest static void testSomething() {
        List<Lead> leads = new List<Lead>();
        for (Integer i = 0; i < 200; i++) {
            Lead lead = new Lead(FirstName = 'Test', LastName = 'testt', Company = 'Joo');
            leads.add(lead);
        }

        insert leads;

        Test.startTest();
        System.schedule('ScheduledDailyProcessorTest', '0 0 0 15 3 ? 2022', new DailyLeadProcessor());
        Test.stopTest();

        System.assertEquals(200, [SELECT COUNT() FROM Lead WHERE LeadSource = 'Dreamforce']);
    }
}
