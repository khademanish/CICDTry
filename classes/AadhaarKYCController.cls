global class AadhaarKYCController {
    public boolean isPOABio{get;set;}
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * This api generates auth_Code , reference_Number , hashCode while passing input parameters 
     * as adhar number and Source also generates OTP and send it to the registered mobile number
     * -------------------------------------------------------------------------------
     * @param   aadhaarNumber ie "829913000097"
                source Static i.e. "CDPRIME" 
                rrn ???? now passing "123456"
     * @return  Response:
                {
                  "rrn": "997595000012345",
                  "message": "Success",
                  "authCode": "43e47adef1ab432eba302ad7f2dcf1f6",
                  "transactionId": "0000300000:20171218051023799",
                  "maskedPhone": "*******8545",
                  "maskedEmail": "NA",
                  "hashCode": "000000000004",
                  "errorCode": "null",
                  "errorDesc": "null",
                  "errorSource": "null",
                  "source": "CDPRIME"
                }

    */
    
    @AuraEnabled
    @RemoteAction 
    // 1. OTP Generation
    global static string GenerateOTP(string aadhaarNumber, string source, string rrn) {

        GenerateOTPReqJSON Generatereq = new GenerateOTPReqJSON();
        Generatereq.aadhaarNumber = aadhaarNumber;
        Generatereq.source = source;
        Generatereq.rrn = rrn;

        String jsonReq = JSON.serialize(Generatereq);

        String endPointURL = 'https://bflapiprod.azure-api.net/BFLEKYCAVWS/generateOTP';
        return APICall(endPointURL, jsonReq);

    }
    
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Get Ekyc Data based on OTP .Need to pass referenceNumber received in 
     * generate OTP operation to referenceNumber field
     * -------------------------------------------------------------------------------
     * @param   "rrn": "997595000012345",
                  "aadhaarNumber": "829913000097",
                  "otp": "543122", from mobile
                  "hashCode": "000000000004", last response
                  "pfr": "N", Static
                  "source": "CDPRIME", Static
                  "transactionId": "0000300000:20171218051023799" last response

     * @return  String
                {
                  "statusType": {
                    "rrn": "string",
                    "message": "string",
                    "authCode": "string",
                    "hashCode": "string",
                    "errorCode": "string",
                    "errorDesc": "string",
                    "errorSource": "string",
                    "source": "string"
                  },
                  "deviceInfoType": {
                    "merchantID": "string",
                    "deviceID": "string",
                    "uniqueID": "string",
                    "deviceType": "string",
                    "sourceIPAddress": "string"
                  },
                  "transactionInfoType": {
                    "serviceCode": "string",
                    "subServiceCode": "string",
                    "transactionID": "string"
                  },
                  "customerInfoType": {
                    "name": "string",
                    "address": {
                      "co": "",
                              "country": "India",
                              "dist": "",
                              "house": "",
                              "loc": "",
                              "zipCode": "",
                              "state": "Maharashtra",
                              "streetAddress": "",
                              "city": "",
                              "subDist": ""
                            },
                    "gender": "string",
                    "image": {
                      "name": "string",
                      "type": "string",
                      "value": "string"
                    },
                    "prn": {
                      "type": "string",
                      "value": "string"
                    },
                    "dob": "string"
                  }
                }
             
    */
    
    
    
    @AuraEnabled
    @RemoteAction 
    // 2. Fetch ekyc details based on OTP
    global static string GetOTPKYC(string aadhaarNumber, String otp, String transactionId, string source, String hashCode, String pfr, String rrn) {
        
        GetOTPKYCReqJSON Generatereq = new GetOTPKYCReqJSON();
        Generatereq.aadhaarNumber = aadhaarNumber;
        Generatereq.source = source;
        Generatereq.transactionId = transactionId;
        Generatereq.otp = otp;
        Generatereq.hashCode = hashCode;
        Generatereq.pfr = pfr;
        Generatereq.rrn = rrn;
        
        String jsonReq = JSON.serialize(Generatereq);
        String endPointURL = 'https://bflapiprod.azure-api.net/BFLEKYCAVWS/getOTPKYC';
        String result = APICall(endPointURL, jsonReq);
        
        //insertIntegrationResponse(result , 'OTP');
        
        
        return result;
    }
    
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Get ekyc data based on Bio Operation only for registered devices 
     * -------------------------------------------------------------------------------
     * @param   aadhaarNumber 
                rdServiceData String data feacth from biomatrix device
                udc ???
                source i.e. 'MOBAPP' 
     * @return  String
    */
    

    @RemoteAction 
    // 3. Fetch ekyc details based on biometric data
    global static string GetBIOKYC(string aadhaarNumber, String udc, String rdServiceData,Id custId) {

        //Customer__c custObj=[select id , eKYC_Counter__c from CUstomer__c where id=:custId];
        //if(custObj.eKYC_Counter__c<5 || custObj.eKYC_Counter__c==null){
            GetBIOKYCReqJSON Generatereq = new GetBIOKYCReqJSON();
            Generatereq.aadhaarNumber = aadhaarNumber;
            Generatereq.source = 'CDPRIME';
            Generatereq.rdServiceData = rdServiceData;
            Generatereq.udc = udc;
            Generatereq.rrn = '123456';
    
            String jsonReq = JSON.serialize(Generatereq);
    
            String endPointURL = 'https://bflapiprod.azure-api.net/BFLEKYCAVWS/getBIOKYC';
            String result = APICall(endPointURL, jsonReq);
            
            //insertIntegrationResponse(result , 'BIO');
            
            return result;
        /*}
        else{
            return 'false';
        }*/

    }
    
     /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Get ekyc data based on Bio Operation only for registered devices 
     * -------------------------------------------------------------------------------
     * @param   Aadhaar 
                aadhaarName 
                Year 
                Gender 
                piMatchStrategy 
                piMatchValue 
                addressValue
                pfaMatchStrategy 
                pfaMatchValue 
                careOf 
                Building 
                Landmark 
                Street 
                Locality
                poName 
                Village
                Subdist 
                District 
                State 
                Pincode 
                Country 
                Source 
     * @return  String
    */
    
    @RemoteAction 
    // 4. Verify Demographic details
    global static string VerifyAadhar(string  Aadhaar, string  aadhaarName, string  Year, string  Gender, string  piMatchStrategy, string  piMatchValue, string  addressValue,
        string  pfaMatchStrategy, string  pfaMatchValue, string  careOf, string  Building, string  Landmark, string  Street, string  Locality,
        string  poName, string  Village, string  Subdist, string  District, string  State, string  Pincode, string  Country, string  Source) {

        VerifyAadharReqJSON Generatereq = new VerifyAadharReqJSON();
        Generatereq.Aadhaar = Aadhaar;
        Generatereq.aadhaarName = aadhaarName;
        Generatereq.Year = Year;
        Generatereq.Gender = Gender;
        Generatereq.piMatchStrategy = piMatchStrategy;
        Generatereq.piMatchValue = piMatchValue;
        Generatereq.addressValue = addressValue;
        Generatereq.pfaMatchStrategy = pfaMatchStrategy;
        Generatereq.pfaMatchValue = pfaMatchValue;
        Generatereq.careOf = careOf;
        Generatereq.Building = Building;
        Generatereq.Landmark = Landmark;
        Generatereq.Street = Street;
        Generatereq.Locality = Locality;
        Generatereq.poName = poName;
        Generatereq.Village = Village;
        Generatereq.Subdist = Subdist;
        Generatereq.District = District;
        Generatereq.State = State;
        Generatereq.Pincode = Pincode;
        Generatereq.Country = Country;
        Generatereq.Source = Source;

        String jsonReq = JSON.serialize(Generatereq);

        String endPointURL = 'https://bflapiprod.azure-api.net/BFLEKYCAVWS/getBIOKYC';
        return APICall(endPointURL, jsonReq);

    }
    
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Get all the details of aadhaar holder from NSDL by passing reference number , hash code , aadhaar number 
     * and source as input parameters. Reference number and hash code is generated by GenerateOTP Operation 
     * -------------------------------------------------------------------------------
     * @param   rrn 
                hashCode 
                source 
     * @return  String
    */

    @RemoteAction 
    // 5. Fetch UID from aadhaar vault
    global static string fetchUID(string rrn, String hashCode, string source) {

        fetchUIDReqJSON Generatereq = new fetchUIDReqJSON();
        Generatereq.rrn = rrn;
        Generatereq.source = source;
        Generatereq.hashCode = hashCode;

        String jsonReq = JSON.serialize(Generatereq);

        String endPointURL = 'https://bflapiprod.azure-api.net/BFLEKYCAVWS/fetchUID';
        return APICall(endPointURL, jsonReq);

    }
    
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Get all the details of aadhaar holder from NSDL by passing reference number , hash code , aadhaar number 
     * and source as input parameters. Reference number and hash code is generated by GenerateOTP Operation 
     * -------------------------------------------------------------------------------
     * @param   rrn 
                hashCode 
                ekycTransactionId
                aadhaarNumber
                source 
     * @return  String
    */

    @RemoteAction 
    // 6. Fetch ekyc details from aadhaar vault
    global static string fetchAadhaarDetails(string rrn, String hashCode, String ekycTransactionId, String aadhaarNumber, string source) {

        fetchAadhaarDetailsReqJSON Generatereq = new fetchAadhaarDetailsReqJSON();
        Generatereq.rrn = rrn;
        Generatereq.source = source;
        Generatereq.hashCode = hashCode;
        Generatereq.ekycTransactionId = ekycTransactionId;
        Generatereq.aadhaarNumber = aadhaarNumber;

        String jsonReq = JSON.serialize(Generatereq);
        String endPointURL ='https://bflapiprod.azure-api.net/BFLEKYCAVWS/fetchAadhaarDetails';
        return APICall(endPointURL, jsonReq);

    }

    /* ======================================= Classes for JESON Start ======================================== */  

    public class GenerateOTPReqJSON {
        public String aadhaarNumber;
        public String source;
        public String rrn;
    }

    public class GetOTPKYCReqJSON {
        public String aadhaarNumber;
        public String source;
        public String transactionId;
        public String otp;
        public String pfr;
        public String rrn;
        public String hashCode;
    }

    public class GetBIOKYCReqJSON {
        public String aadhaarNumber;
        public String source;
        public String hashCode;
        public String rdServiceData;
        public String udc;
        public String rrn;
    }

    public class fetchUIDReqJSON {
        public String rrn;
        public String source;
        public String hashCode;
    }
    
    public class VerifyAadharReqJSON {
        public string Aadhaar;
        public string aadhaarName;
        public string Year;
        public string Gender;
        public string piMatchStrategy;
        public string piMatchValue;
        public string addressValue;
        public string pfaMatchStrategy;
        public string pfaMatchValue;
        public string careOf;
        public string Building;
        public string Landmark;
        public string Street;
        public string Locality;
        public string poName;
        public string Village;
        public string Subdist;
        public string District;
        public string State;
        public string Pincode;
        public string Country;
        public string Source;
    }

    public class fetchAadhaarDetailsReqJSON {
        public String rrn;
        public String hashCode;
        public String ekycTransactionId;
        public String aadhaarNumber;
        public String source;
    }
     
    /* ======================================= Classes for JESON End ======================================== */

    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * API call for get details
     * -------------------------------------------------------------------------------
     * @param   endPointURL 
                jsonReq 
     * @return  String
    */
    
    
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
        req.setHeader('Ocp-Apim-Subscription-Key','5d37bb2b783b4bf086a206ce4d9537b8');
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

    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * generateToken for generate the every API call.
     * -------------------------------------------------------------------------------
     * @param   
     * @return  String
    */
    
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

    // Json class for create the JSON string
    
    public class generateTokenJSON {
        public String grant_type;
        public String client_id;
        public String client_secret;
        public String resource;
    }

    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * Aadhaar details are to be saved in two places when the user clicks on Confirm button
     * Customer record and the corresponding Required Documents object
     * 
     * -------------------------------------------------------------------------------
     * @param   response    String        Response string from the final Aadhaar API that has all the details 
                Mode        string        OTP / BIO
                isPOI       Boolean       Indicates whether to use Aadhaar for POI
                isPOA       Boolean       Indicates whether to use Aadhaar for POA 
                userAction  String        Indicates the action used by the user in the front end Confirm or Cancel
                customerId  String        
                Customer    Object         
     * @return  Void
    */
   /*  @RemoteAction
    global static String insertIntegrationResponseForBIO(){
     	Customer__c customer=new Customer__c();
        customer.eKYC_Consent__c=eKYCConsent;
        customer.eKYC_Consent_On__c=eKYCConsentOn;
        customer.eKYC_Counter__c=Decimal.valueOf(eKYCCounter);
        customer.eKYC_Status__c=eKYCStatus;
        system.debug('in insertIntegrationResponseForBIO response: ' +  
                      ' response: ' + response + 
                      ' mode: ' + mode + 
                      ' isPOI: ' + isPOI + 
                      ' isPOA: ' + isPOA + 
                      ' userAction: ' + userAction + 
                      ' customerId: ' + customerId + 
                      ' customer: ' + customer);
        return insertIntegrationResponse(response,mode,isPOI,isPOA,userAction,customerId,customer);
    } 
    @AuraEnabled
    @RemoteAction
      global static String insertIntegrationResponse(String response,String mode,boolean isPOI,boolean isPOA,string userAction, string customerId,Customer__c customer){
   
       
        return 'Success';
        
    }*/
    /*
     * -------------------------------------------------------------------------------
     * @Description 
     * When EKYC component load then ekyc history details like EKYC counter, status, consent 
     * needs to fetch to check the same at the time of next time EKYC.
     * 
     * -------------------------------------------------------------------------------
     * @param   custmorRecordId            record id of current customer record 
     * @return  Customer__c
    */

   /* @AuraEnabled
    @RemoteAction
    // Customer details
    global static Customer__c getEKYCdataFromCustomer(string customerId){
        
        try{
          System.debug('customerId: ---- ' + customerId);
          Customer__c cust= [select eKYC_POA__c,Approval_Status__c,Card_Number__c,eKYC_POI__c,ekyc_ImageValue__c,eKYC_Counter__c,id,name,Customer_Full_Name__c,Address_Line_1__c,Address_Line_2__c,City__r.name,Zip_Code__r.Name,Date_Of_Birth__c,eKYC_Consent__c,eKYC_Consent_On__c,eKYC_Status__c,
                (select Id,File_Links__c,Type__c, Status__c, Customer__c, Opportunity__c, Mode__c, QC_Required__c from Required_Documents__r where Type__c='Customer Photo' limit 1)
                from Customer__c where id=:customerId limit 1];
          if(cust!=null)
            return cust;
        }
        catch(Exception ex){
          System.debug('Exception ex: ---- ' + ex.getMessage());
        }
        return null;
    }*/

}