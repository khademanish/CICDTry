public class ekycRequest
{
    public cls_statusType statusType;
    public class cls_statusType{
       public String code;
       public String message;
       public String authCode;//variable name changed by shilpa for ekyc Bug Id 15230
       public String reference_Number;
       public String host_Ref_Number;
       public String errorDesc;//added by shilpa for ekyc Bug Id 15230
       public String errorSource; //added by shilpa for ekyc Bug Id 15230
       public String hashCode; //added by shilpa for ekyc Bug Id 16111
       public String errorCode; //added by shilpa for ekyc Bug Id 16111    
       
    }
    public cls_deviceInfoType deviceInfoType;
    public class cls_deviceInfoType{
       public String deviceID;//variable name changed by shilpa for ekyc Bug Id 15230
       public String deviceType;//variable name changed by shilpa for ekyc Bug Id 15230
       public String merchantID;//Rohit Bio ekyc
       public String uniqueID;//Rohit Bio ekyc
       public String sourceIPAddress;//Rohit Bio ekyc
    }
    public cls_transactionInfoType transactionInfoType;//variable name changed by shilpa for ekyc Bug Id 15230
    public class cls_transactionInfoType{
       public String serviceCode;//vatiable name changed by shilpa for ekyc Bug Id 15230
       public String subServiceCode;
       public String transactionID;//variable name changed by shilpa for ekyc Bug Id 15230
       public String task_ID;
    }
    public cls_customerInfoType customerInfoType; //vatiable name changed by shilpa for ekyc Bug Id 15230
    /*commented by shilpa for ekyc Bug Id 15230 start
    public class cls_name{
       public String firstName;
    }
    commented by shilpa for ekyc Bug Id 15230 end*/
    public class cls_address{
       public String streetAddress;
       public String address2;
       public String city;
       public String state;
       public String zipCode;
       //added by shilpa for ekyc Bug Id 15230 start
       public string country;
       public string dist;
       public string house;
       public string loc;
       public string co;
       public string subDist;
       //added by shilpa for ekyc Bug Id 15230 end
    }
    public class cls_image{
       public String type;
       public String value;
       
    }
    //added by shilpa for ekyc Bug Id 15230 start
    public class cls_prn{
       public String value;
      
   }  
   //added by shilpa for ekyc Bug Id 15230 end
    public class cls_customerInfoType{
      // public cls_name name;//commented by shilpa for ekyc Bug Id 15230
       public String name;//added by shilpa for ekyc Bug Id 15230
       public cls_address address;
       
       public String gender;
       public cls_image image;
       public String ssn;
       public String dob;

       public cls_prn prn;//added by shilpa for ekyc Bug Id 15230
   }  
   
    public static ekycRequest parse(String json)
    {
        return (ekycRequest) System.JSON.deserialize(json, ekycRequest.class);
    }
}