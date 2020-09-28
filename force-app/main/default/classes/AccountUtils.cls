public with sharing class AccountUtils {
    public static List<Account> accountsByState(String stt)   {
        String query = 'SELECT Id,Name,BillingState FROM Account WHERE BillingState = :stt';
        return Database.query(query);
    }
}