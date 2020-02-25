public class AccountHandler {
	//comment added for ant testing
	//another comment added
    public static Account insertNewAccount(String account_name)
    {
        try{
            Account acc=new Account(Name=account_name);
            insert acc;
             return acc;
        }
        catch(DmlException d)
        {
         return null;
        }
       
    }
}