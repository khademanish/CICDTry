trigger AccountTrigger on Account (before insert,before update) {
    
    System.debug('Account Trigger called.');
    
     for(Account acc : Trigger.new){
        if(acc.BillingPostalCode != null && acc.Match_Billing_Address__c == true){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
     List<Case> caseList = [SELECT Id FROM Case WHERE Id='50028000008hPQi'];
        
        update caseList;
}