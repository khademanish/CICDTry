@isTest
private class TestVerifyDate {

    @isTest
    static void testCheckDates(){
        Date date1 = Date.newInstance(2016, 2, 17);
        Date date2 = Date.newInstance(2016, 2, 28);
        
        Date returnDate = VerifyDate.CheckDates(date1,date2);
        
        System.assertEquals(date2, returnDate);
        
        date2 = Date.newInstance(2016, 4, 28);
        
        returnDate = VerifyDate.CheckDates(date1,date2);
        
         System.assertEquals(Date.newInstance(2016, 2, 29), returnDate);
    }
    
    
}