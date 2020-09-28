@isTest
public class AnimalLocatorTest {
    @isTest static void testGetAnimal() {
        Test.setMock(HttpCalloutMock.class, new AnimalLocatorMock());

        String animalName = AnimalLocator.getAnimalNameById(2);
        System.assertEquals('bear', animalName);
    }
}