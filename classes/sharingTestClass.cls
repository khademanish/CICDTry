public with sharing class sharingTestClass{
    public Boolean access{get; set;}
    public void callMethod(){
        access = Schema.sObjectType.pslPractice__Hours_TS__c.isCreateable();
        pslPractice__Hours_TS__c ob = new pslPractice__Hours_TS__c(Name = 'asdfgh');
        insert(ob);
    }

}