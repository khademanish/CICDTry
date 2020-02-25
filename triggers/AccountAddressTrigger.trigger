trigger AccountAddressTrigger on Account (before insert, before update) {
    
    for(Account acc : Trigger.new){
        if(acc.BillingPostalCode != null && acc.Match_Billing_Address__c == true){
            acc.ShippingPostalCode = acc.BillingPostalCode;
        }
    }
     List<Case> caseList = [SELECT Id FROM Case WHERE Id='50028000008hPQi'];
        
        update caseList;
}