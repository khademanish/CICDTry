@isTest
private class TestRestrictContactByName {

    @isTest
    static void testLastNameForInvalidName(){
        Contact c=new Contact(LastName = 'INVALIDNAME');
        Contact c1 = new Contact(LastName = 'Khade');
        insert c1;

        Test.startTest();
        Database.SaveResult result = Database.insert(c, false);
       
        
        System.assert(!result.isSuccess());
        
                
       	c1 = [select LastName from Contact where LastName = 'Khade'];
       	c1.LastName = 'INVALIDNAME';
     
        Database.SaveResult result1 = Database.update(c1, false); 
        Test.stopTest();
        
        System.assert(!result1.isSuccess());
    }
}