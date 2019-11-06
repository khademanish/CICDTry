global class eKYCBioController{

    public String parentObj{get;set;}
    public String parentId{get;set;}
    public String ekycId{get;set;}
    
    public eKYCBioController(){
        
          if(System.currentPageReference() != null && System.currentPageReference().getParameters().get('parentId') != null)
              parentId = System.currentPageReference().getParameters().get('parentId');
          
          if(System.currentPageReference() != null && System.currentPageReference().getParameters().get('parentObj') != null)
              parentObj = System.currentPageReference().getParameters().get('parentObj');    
           
          if(System.currentPageReference() != null && System.currentPageReference().getParameters().get('ekycId') != null && System.currentPageReference().getParameters().get('ekycId') != ''){
              ekycId = System.currentPageReference().getParameters().get('ekycId');    
              /*List<Ekyc__c> ekycList = [SELECT Id,eKYC_Aadhaar_Number__c,eKYC_Response__c FROM EKYC__c WHERE Id=:ekycId];
              ekycObj = new Ekyc__c(id = ekycId);
              if(ekycList != null && ekycList.size()>0)
                  ekycObj = ekycList[0];*/
          }    
    }
    
    @RemoteAction
    global static String insertIntegrationResponseForBIO(String response, string parentId,string parentObj,DateTime eKYCConsentOn,String ekycId){
       
        //parse response,link to parent & save in ekyc object
        ekycRequest result = new ekycRequest(); 
        result = ekycRequest.parse(response);
               
        populateRec(result);  
        
        return '';
    }
    
    
    @AuraEnabled
    @RemoteAction
    global static void getEKYCdataFromCustomer(String parentObj ,String parentId){
        
    }
    
    @RemoteAction
    global static string GetBIOKYC(string aadhaarNumber, String udc, String rdServiceData,String parentId,String parentObj) {
       
        String product = 'PRO';       
                GetBIOKYCReqJSON Generatereq = new GetBIOKYCReqJSON();
                Generatereq.aadhaarNumber = aadhaarNumber;
                Generatereq.source = product;
                Generatereq.rdServiceData = rdServiceData;
                Generatereq.udc = udc;
                Generatereq.rrn = '123456';
        
                String jsonReq = JSON.serialize(Generatereq);
        
                String endPointURL ='https://bflapiprod.azure-api.net/BFLEKYCAVWS/getBIOKYC'; 
                //System.Label.Aadhaar_KYC_API_EndPointUrl + 'getBIOKYC';
                String result = APICall(endPointURL, jsonReq);
                
                System.debug('rohit --> GetBIOKYC');
                //insertIntegrationResponse(result , 'BIO');
            
            return result;
   }
        
    
    
    public static String APICall(string endPointURL, String jsonReq) {
        System.debug('Req   : ' + jsonReq);
        System.debug('endPointURL   : ' + endPointURL);
        String accessToken = generateToken();
        HttpRequest req = new HttpRequest();
        req.setEndpoint(endPointURL);
        req.setMethod('POST');
        req.setTimeout(60000);
        req.setHeader('Content-Type', 'application/json');
        req.setHeader('Ocp-Apim-Trace', 'true');
        //change for testing
        req.setHeader('Ocp-Apim-Subscription-Key', '5d37bb2b783b4bf086a206ce4d9537b8');
        req.setHeader('Authorization', 'Bearer '+ accessToken);
       
        req.setBody(jsonReq);


/*        String LogKey = 'AadhaarKYCController.APICall';
        ApplicationLogger.addLog(LogKey, 'endPointURL: ' + endPointURL);
        ApplicationLogger.addLog(LogKey, 'jsonReq: ' + jsonReq);
        ApplicationLogger.addLog(LogKey, 'jsonReq: ' + jsonReq);
      */
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        System.debug('Body: ' + res.getBody());

/*        ApplicationLogger.addLog(LogKey, 'Body: ' + res.getBody());
        ApplicationLogger.commitLog(LogKey,'Debug');
*/

        return res.getBody();

    }
    
     public static String generateToken()
    {
        String endpointAuth = 'https://login.microsoftonline.com/bajajfinance.in/oauth2/token';
        String userid = '4bb387dc-ee32-4a24-b61f-393e8776aec6';
        String pw = 'CjnJ0SN1CjFgU0JcgGGR1rICI+4vvlWeWbXy4mFH71c=';
        String resource = 'https://management.azure.com/';
        String accessToken;
        
        generateTokenJSON Generatereq = new generateTokenJSON();
        Generatereq.grant_type = 'client_credentials';
        Generatereq.client_id = userid;
        Generatereq.client_secret = pw;
        Generatereq.resource = resource;
        
        String jsonReq = JSON.serialize(Generatereq);
        
        HttpRequest req = new HttpRequest();
        HttpResponse res = new HttpResponse();
        Http http = new Http();
        Map < string, object> result = new Map < string, object> ();
        req.setEndpoint(String.valueof(endpointAuth));
        req.setMethod('POST');
        //req.setTimeout(120000);
        req.setHeader('Content-Type','application/x-www-form-urlencoded');
        req.setBody('grant_type='+'client_credentials'+'&client_id='+userid+'&client_secret='+EncodingUtil.URLENCODE(pw,'UTF-8')+'&resource='+resource);
        //req.setHeader('Content-Type', 'application/json');
        //req.setBody(jsonReq);
        system.debug('Body is'+req.getBody());
        try {
                res = http.send(req);
                system.debug('Body: '+res.getBody());
                result = (Map<String,Object>)JSON.deserializeuntyped(res.getBody());
                system.debug('Result is: '+result);
                accessToken = (String)result.get('access_token');
        } catch(Exception e){
            system.debug('Exception occured: '+e.getMessage()+e.getLineNumber());
        }
        return accessToken;
    }
    
     public class generateTokenJSON {
        public String grant_type;
        public String client_id;
        public String client_secret;
        public String resource;
    }
    
     public class GetBIOKYCReqJSON {
        public String aadhaarNumber;
        public String source;
        public String hashCode;
        public String rdServiceData;
        public String udc;
        public String rrn;
    }
    
    public static void populateRec(ekycRequest result){
               
            
            String firstName, middleName, lastName,streetAddress;
        if(result.statusType != null){
            if(result.statusType.message.toUpperCase() == 'SUCCESS'){                 
                if (result.customerInfoType.name != null) {//added by shilpa for bug id 15230 
                    String[] nameSplit = result.customerInfoType.name.split(' ');
                    if (nameSplit.size() == 4) {
                        firstName = nameSplit[0] + ' ' + nameSplit[1];
                        middleName = nameSplit[2];
                        lastName = nameSplit[3];
                    }
                    if (nameSplit.size() == 3) {
                        firstName = nameSplit[0];
                        middleName = nameSplit[1];
                        lastName = nameSplit[2];
                    }
                    if (nameSplit.size() == 2) {
                        firstName = nameSplit[0];
                        lastName = nameSplit[1];
                    }
                }
                
                String sonOfwifeOf;
                system.debug('oAddharDetails.customer_InfoType.Address.StreetAddress>>'+result.customerInfoType.address.StreetAddress);
                String[] add = result.customerInfoType.address.StreetAddress.split(' ');
                system.debug('*****Address :- ' + add);
                system.debug('*****Address :- ' + add[0]);
                if (add[0].contains('S/O') || add[0].contains('W/O') || add[0].contains('D/O')) {
        
                    if (add[0].contains('S/O') || add[0].contains('D/O')) {
                        if (add[1].contains(lastName)) {
                            sonOfwifeOf = add[0] + ' ' + add[1];
                            for (Integer i = 2; i < add.size(); i++) {
                                streetAddress = streetAddress + ' ' + add[i];
                            }
                        }
                        if (add[2].contains(lastName)) {
                            sonOfwifeOf = add[0] + ' ' + add[1] + ' ' + add[2];
                            for (Integer i = 3; i < add.size(); i++) {
                                streetAddress = streetAddress + ' ' + add[i];
                            }
                        }
                        if (add[3].contains(lastName)) {
                            sonOfwifeOf = add[0] + ' ' + add[1] + ' ' + add[2] + ' ' + add[3];
                            for (Integer i = 4; i < add.size(); i++) {
                                streetAddress = streetAddress + ' ' + add[i];
                            }
                        }
                    } else {
                        sonOfwifeOf = add[0] + ' ' + add[1] + ' ' + add[2];
                    }
                    System.debug('****S/O W/O :- ' + sonOfwifeOf);
                    
                } 
                else {
                   streetAddress = result.customerInfoType.address.StreetAddress;
                }
            }
            
            //Populate data in ekyc object
            
            String[] dobArray;
            if(result.customerInfoType.DOB != null){
                dobArray =result.customerInfoType.DOB.split('-');
                //if(dobArray != null && dobArray.size()>2)
                     //ekycObj.eKYC_Date_of_Birth__c = Date.newInstance(Integer.valueOf(dobArray[2]),Integer.valueOf(dobArray[1]),Integer.valueOf(dobArray[0]));// Date.parse(result.customerInfoType.DOB);
            }
            
            System.debug(result.customerInfoType.Gender);
            System.debug(result.customerInfoType.address.city);
            System.debug(result.customerInfoType.address.state);
            System.debug(Integer.valueof(result.customerInfoType.address.zipcode));
            //ekycObj.eKYC_Photo__c = '<!DOCTYPE html><html><body>' +                          
            //                        ' <body><img src=' + 'data:image/jpeg;base64,' +result.customerInfoType.image.value + '/>' +
            //                        '</body></html>';
            System.debug(result.transactionInfoType.transactionID);   
            System.debug(result.statusType.hashCode);
            System.debug(result.customerInfoType.address.Address2);
            System.debug(result.deviceInfoType.deviceID);
            System.debug(result.deviceInfoType.deviceType);
            System.debug(result.transactionInfoType.serviceCode);
            System.debug(result.transactionInfoType.subServiceCode);
            System.debug(result.customerInfoType.address.country);
            System.debug(result.customerInfoType.address.loc);
            System.debug(result.customerInfoType.address.subDist);
            System.debug(result.statusType.authCode);
            System.debug(result.statusType.errorCode);
            System.debug(result.transactionInfoType.transactionID);
            System.debug(streetAddress); 
            
            /*String aadhaarResponseText = '<html>' +
            '<head>' +
            '<meta name="viewport" content="width=device-width, initial-scale=1">' +
            '<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">' +
            '<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>' +
            '<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>' +
            '</head>' +
            '<body>' +
            '<div class="table-responsive">' +
            '<table class="table table-bordered">' +
            '<tr><td>First Name</td><td>' + firstName + '</td></tr>' +
            '<tr><td>Last Name</td><td>' + lastName + '</td></tr>' +
            '<tr><td>Gender</td><td>' + ekycObj.eKYC_Gender__c + '</td></tr>' +
            '<tr><td>DOB</td><td>' + ekycObj.eKYC_Date_of_Birth__c + '</td></tr>' +
            '<tr><td>StreetAddress</td><td>' + streetAddress+ '</td></tr>' +
            '<tr><td>City</td><td>' + ekycObj.eKYC_City__c + '</td></tr>' +
            '<tr><td>District</td><td>' + ekycObj.eKYC_District__c + '</td></tr>' +
            '<tr><td>State</td><td>' + ekycObj.eKYC_State__c  + '</td></tr>' +
            '<tr><td>ZipCode</td><td>' + ekycObj.eKYC_Pin_Code__c + '</td></tr>' +
            '<tr><td>Phone</td><td>' + '' + '</td></tr>' +
            '<tr><td>Email</td><td>' + '' + '</td></tr>' +
            '</table>' +
            '</div>' +
            '</body>' +
            '</html>';
            ekycObj.eKYC_Response__c = aadhaarResponseText;*/
                         
        }    
    }
}