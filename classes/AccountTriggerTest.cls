@isTest
public class AccountTriggerTest {

    @isTest 
    static void TestCreateNewAccountInBulk() {

        List<Account> accts = new List<Account>();
        for(Integer i=0; i < 200; i++) {
            Account acct = new Account(Name='Test Account ' + i);
            acct.BillingState = 'CA';
            accts.add(acct);
        }              

        // Perform Test
        Test.startTest();
        insert accts;
        Integer n = [SELECT count() FROM Account where ShippingState = 'CA'];
        System.assertEquals(200, n);
        Test.stopTest();
        
        
   
    }
}