@isTest(seeAllData = false)
public class LeadInsertTest {

    public static testMethod void  testLeadInsert(){
        
        user u = [ select id 
                       from user
                       where 
                       Id = '0050I000007dwYA'];
        System.runAs(u){
            Lead l1 = new Lead(Company = 'JohnMiller1', LastName = 'Mike1', Status = 'Open');
         insert l1;
         Lead l = new Lead(Company = 'JohnMiller', LastName = 'Mike', Status = 'Open', ownerId='0052800000271jW');
         insert l;
         
         Test.setCreatedDate(l.Id, DateTime.now().addDays(-5));
          System.debug('Lead Created Date :'+l.CreatedDate);
         Test.startTest();
         System.debug('Lead Created Date :'+l.CreatedDate);
         Test.stopTest();
        }
         
         
         }
}