public class ContactSearch {

    public static List<Contact> searchForContacts(string last_name, String code)
    {
        Contact[] result=[select id, name from contact where lastname=:last_name AND MailingPostalCode=:code] ;
     	List<Contact> res=result;
        return res;
    }
}