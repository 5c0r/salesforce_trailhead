public with sharing class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    public AddPrimaryContact(Contact contact, String state) {
        this.contact = contact;
        this.state = state;
    }

    public void execute(QueueableContext context) {
        var accounts = [SELECT Id, Name FROM Account WHERE BillingState = :state LIMIT 200];

        for (Account a : accounts) {
            var newContact  = contact.clone(false);
            a.Contacts.add(newContact);

            update a;
        }
    }
}
