public class VOPVotingPageController {
    
    public String ipAddress{get;set;}    
    public VOPVotingPageController(){
    
        Cookie cookie = ApexPages.currentPage().getCookies().get('CookieName1');
        if (cookie != null) {
            System.debug('Cookie already exists : '+cookie );
        }else{
            Cookie userCookie = new Cookie('CookieName1', '12345', null, 315569260, false); 
            ApexPages.currentPage().setCookies(new Cookie[] {
                userCookie
                    });
            //Cookie cookie = ApexPages.currentPage().getCookies().get('CookieName');
            if (cookie != null) {
                String fieldValueToBeStoredAsCookie = cookie.getValue();        
            }
            //System.debug('Cookie' + cookie.getValue());
        }
        
    }
}