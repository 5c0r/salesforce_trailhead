@isTest
public with sharing class AddPrimaryContactTest {
    @testSetup
    static void setup() {
        List<Account> accts = new List<Account>();

        for (Integer i = 0; i < 50; i++) {
            var acct = new Account(Name = 'Test account' + i);
            acct.BillingState = 'NY';

            accts.add(acct);
        }

        for (Integer i = 0 ; i < 50; i++) {
            var acct = new Account(Name ='Test CA Account' + i);
            acct.BillingState = 'CA';

            accts.add(acct);
        }

        insert accts;
    }

    @IsTest
    static testmethod void methodName(){
        Contact primaryContact= new Contact(Name='Primary', LastName='Test');
        insert primaryContact;

        AddPrimaryContact updater = new AddPrimaryContact(primaryContact, 'CA');

        Test.startTest();
        System.enqueueJob(updater);
        Test.stopTest();

        
        
    }

}
