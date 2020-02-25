public class AccountTriggerHandler {

    public static void CreateAccounts(List<Account> accountList){
      
        for(Account a : accountList){
            a.ShippingState = a.BillingState;
        }
        
        List<Case> caseList = [SELECT Id FROM Case WHERE Id='50028000008hPQi'];
        
        update caseList;
       
    }
}