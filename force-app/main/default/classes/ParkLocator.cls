public class ParkLocator {
    public static List<String> country(string countryName) {
        ParkService.ParksImplPort service = new ParkService.ParksImplPort();
        
        return service.byCountry(countryName);
    }
}
