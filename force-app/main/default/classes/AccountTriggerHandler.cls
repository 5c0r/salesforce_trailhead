public class AccountTriggerHandler {
    public static List<Account> CreateAccounts(List<Account> accts) {
        List<Account> newAccts = new List<Account>();
        for(Account a : accts) {
            a.ShippingState = a.BillingState;
            newAccts.add(a);
        }

        return newAccts;
    }
}
