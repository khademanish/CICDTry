public class AnimalLocator {

    public String getAnimalNameById(Integer i){
        
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://th-apex-http-callout.herokuapp.com/animals/'+i);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        
        Map<String , Object> results = (Map<String , Object>)JSON.deserializeUntyped(response.getBody());
       	Map<String , Object> animals = (Map<String , Object>) results.get('animal');
        
        return (String)animals.get('name');
    }
}