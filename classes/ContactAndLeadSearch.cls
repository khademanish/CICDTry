public class ContactAndLeadSearch {
    public static List<List<sObject>> searchContactsAndLeads(String str){
        List<List<sObject>> obj=[Find :str in NAME FIELDS RETURNING Contact,Lead];
        return obj;
    }

}