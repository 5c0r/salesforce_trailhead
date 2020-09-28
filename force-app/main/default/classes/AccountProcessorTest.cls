@isTest
private class AccountProcessorTest {

    @testSetup static void setup(){

        List<Account> accounts = new List<Account>();
        for (Integer i = 0; i < 5; i++) {
            Account newAcc = new Account();
            newAcc.Name = 'Test Account ' + i;
            accounts.add(newAcc);
        }

        insert accounts;

        List<Contact> contacts = new List<Contact>();
        accounts = [SELECT Id,Name FROM Account];

        for(Account a : accounts) {
            for (Integer j = 0; j < 2; j++) {
                Contact newContact = new Contact(FirstName = 'Test Contact', LastName ='Last');
                newContact.AccountId = a.Id;

                contacts.add(newContact);
            }
        }
        insert contacts;
    }

    @isTest
    static void testAccountProcessor() {
        List<Id> accIds = new List<Id>();

        List<Account> accounts = [SELECT Id FROM Account];


        for(Account a : accounts) {
            accIds.add(a.Id);
        }

        Test.startTest();
        AccountProcessor.countContacts(accIds);
        Test.stopTest();
        
        List<Account> accts = [SELECT Id,Number_Of_Contacts__c FROM Account];
        Account firstAcc = accts.get(0);
        System.assertEquals(firstAcc.Number_Of_Contacts__c,2);
    }
}