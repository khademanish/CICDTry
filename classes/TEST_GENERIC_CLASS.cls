public with sharing class TEST_GENERIC_CLASS {
    @AuraEnabled
    public static Account getAccount(){
        return [SELECT Id,Name FROM Account LIMIT 1];
    }
}