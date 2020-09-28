global class ParkServiceMock implements WebServiceMock {
    global void doInvoke(
        Object stub,
        Object request,
        Map<String, Object> response,
        String endpoint,
        String soapAction,
        String requestName,
        String responseNS,
        String responseName,
        String responseType) {

        List<String> parks = new List<String>();
        parks.add('park1');
        
        ParkService.byCountryResponse response_x = new ParkService.byCountryResponse();
        response_x.return_x = parks;

        response.put('response_x', response_x);
    }
}
