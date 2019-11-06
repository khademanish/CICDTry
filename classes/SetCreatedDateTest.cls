@isTest 
private class SetCreatedDateTest {
    static testMethod void testSetCreatedDate() {
        Lead a1 = new Lead(Company = 'JohnMille1r', LastName = 'Mik1e', Status = 'Open');
        insert a1;
        Lead a = new Lead(Company = 'JohnMiller', LastName = 'Mike', Status = 'Open');
        insert a;
        test.setCreatedDate(a.Id, DateTime.now().addDays(-5));
        Test.startTest();
        Lead myLead = [SELECT Id, Name, CreatedDate FROM Lead 
                             WHERE Company ='JohnMiller' limit 1];
        //System.assertEquals(myAccount.CreatedDate, DateTime.newInstance(2012,12,12));
        System.debug('Lead Created Date :'+myLead.CreatedDate);
        Test.stopTest();
    }
}