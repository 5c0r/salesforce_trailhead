@isTest
public class ParkLocatorTest {
    @isTest static void testParks() {
        Test.setMock(WebServiceMock.class, new ParkServiceMock());

        List<String> results = ParkLocator.country('french');
        System.assert(results.size() > 0);
    }
}
