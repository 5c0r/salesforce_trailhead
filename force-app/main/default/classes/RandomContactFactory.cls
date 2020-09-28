public with sharing class RandomContactFactory {
    public static List<Contact> generateRandomContacts(Integer count, String lastName) {
        List<Contact> contactList = new List<Contact>();
        for (Integer i = 0; i < count; i++) {
            contactList.add(new Contact(FirstName = 'Test ' + i, LastName = lastName));
        }

        return contactList;
    }
}