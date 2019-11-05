public class AccountTriggerHandler {

    public static void CreateAccounts(List<Account> accountList){
      
        for(Account a : accountList){
            a.ShippingState = a.BillingState;
        }
       
    }
}