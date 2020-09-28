trigger AccountAddressTrigger on Account (before insert, before update) {
    for (Account a : Trigger.new) {
        if( String.isNotEmpty(a.BillingPostalCode) && a.Match_Billing_Address__c == true) {
            a.ShippingPostalCode = a.BillingPostalCode;
        }
    }
}