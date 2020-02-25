public class TimeManagerApexClass {

    @AuraEnabled
    public static String getTimeFromApex(String fname){
        return 'Hello '+fname+' . '+ System.now();
    }
}