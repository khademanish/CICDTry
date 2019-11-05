public class RandomContactFactory {

    public static  List<Contact> generateRandomContacts(Integer num, String lastname){
        
        List<Contact> contactList = new List<Contact>();
        
        for(Integer i=1;i<=num;i++){
            String name = 'Test'+i;
            Contact c = new Contact(FirstName = name, LastName = lastname);
            contactList.add(c);
        }
        return contactList;
    }
}