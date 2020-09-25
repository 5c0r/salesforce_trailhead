@isTest
public with sharing class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accts = new List<Account>();

        for (Integer i = 0; i < 50; i++) {
            Account acct = new Account(Name = 'Test account' + i);
            acct.BillingState = 'NY';

            accts.add(acct);
        }

        for (Integer i = 0 ; i < 50; i++) {
            Account acct = new Account(Name ='Test CA Account' + i);
            acct.BillingState = 'CA';

            accts.add(acct);
        }

        insert accts;
    }

    @IsTest
    static void testAddPrimaryContact(){
        Contact primaryContact= new Contact(FirstName='Primary', LastName='Test');

        AddPrimaryContact updater = new AddPrimaryContact(primaryContact, 'CA');

        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();

        System.assertEquals(50, [SELECT count() FROM Contact WHERE AccountId IN :[SELECT Id FROM Account WHERE BillingState = 'CA']]);
    }

}
