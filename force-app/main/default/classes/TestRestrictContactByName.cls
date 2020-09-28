@isTest
public class TestRestrictContactByName {
    @isTest static void testTrigger() {
        Contact validContact = new Contact(FirstName = 'Test', LastName = 'Valid');

        Test.startTest();
        Database.SaveResult saveResult = Database.insert(validContact);
        Test.stopTest();

        System.assertEquals(true, saveResult.isSuccess());
    }

    @isTest static void testTriggerInvalidCase() {
        Contact invalidContact = new Contact(FirstName = 'Test', LastName = 'INVALIDNAME');

        Test.startTest();
        try {
            insert invalidContact;
        } catch (Exception error) {
            System.assert(error.getMessage().contains('The Last Name "'+ 'INVALIDNAME' +'" is not allowed for DML'));
        }

        Test.stopTest();
    }
}