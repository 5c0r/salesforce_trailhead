@isTest
public class AccountTriggerTest {
    @isTest static void TestCreateNewAccounts() {
        List<Account> accts = new List<Account>();
        String billingState = 'CA';

        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test ' + i);
            acct.BillingState = 'CA';

            accts.add(acct);
        }

        Test.startTest();
        insert accts;
        Test.stopTest();

        List<Account> verifyAccts =  Database.query('SELECT Id FROM Account WHERE BillingState = :billingState');
        System.assertEquals(200, verifyAccts.size());   
    }
}
