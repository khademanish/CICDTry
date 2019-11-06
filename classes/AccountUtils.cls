public class AccountUtils {
 
    public static List<Account> accountsByState(String state){
        List<Account> accountsList = new List<Account>();
        
        accountsList = [select id , name from Account where BillingState = :state];
        
        return accountsList;
    }
}