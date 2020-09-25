public with sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = [SELECT Id, Name FROM Account WHERE BillingState = :state LIMIT 200];
        List<Contact> contacts = new List<Contact>();

        for (Account a : accounts) {
            Contact newContact  = contact.clone(false,false,false,false);
            newContact.AccountId = a.Id;

            contacts.add(newContact);
        }
        insert contacts;
    }
}
