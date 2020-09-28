public with sharing class AccountProcessor {
    @future
    public static void countContacts(List<Id> accountIds) {
            List<Account> accounts = [SELECT Id,Number_of_Contacts__c, (SELECT ID FROM Contacts) FROM Account WHERE Id in :accountIds]; 
            for(Account acct: accounts) {
                acct.Number_of_Contacts__c = acct.contacts.size();
            }
            update accounts;
    }
}