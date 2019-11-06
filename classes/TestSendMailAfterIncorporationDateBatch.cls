/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 * modified on 10-02-2014
 */
@isTest


private class TestSendMailAfterIncorporationDateBatch {


 static testmethod void myUnitTest1() {

  list < Lead > tempLead = new list < Lead > ();
  list < Lead > tempLead1 = new list < Lead > ();
  list < Lead > tempLead2 = new list < Lead > ();

  dateTime dT = System.now();
  date todayDate = date.newinstance(dT.year(), dT.month(), dT.day());

  user u = [select id
   from user
   where
   Name = 'Manish Khade'
  ];

  system.runAs(u) {

   Profile p = [select id
    from
    Profile
    where
    name = 'System Administrator'
   ];
   System.debug('Profile ID :' + p.Id);

   User uBDE = new user(alias = 'test123', email = 'test123@noemail.com',
    emailencodingkey = 'UTF-8', firstName = 'Nahush', lastname = 'Testing', languagelocalekey = 'en_US',
    localesidkey = 'en_IN', profileid = p.Id, country = 'India',
    timezonesidkey = 'Asia/Kolkata', username = 'test_g@noemail.com');
   insert uBDE;


   Date today = system.today();
   string temp = today.format();


   MCACampaignBatchCS__c cs = new MCACampaignBatchCS__c();
   cs.Name = '1';
   cs.Day__c = '3rd Day';
   cs.isActive__c = true;
   cs.Template_ID__c = '00X0k000000IeQO';

   insert cs;

   MCACampaignBatchCS__c cs1 = new MCACampaignBatchCS__c();
   cs1.Name = '2';
   cs1.Day__c = '5th Day';
   cs1.isActive__c = true;
   cs1.Template_ID__c = '00X0k000000IePp';
   insert cs1;

   MCACampaignBatchCS__c cs2 = new MCACampaignBatchCS__c();
   cs2.Name = '7';
   cs2.Day__c = '7th Day';
   cs2.isActive__c = true;
   cs2.Template_ID__c = '00X0k000000IeQE';
   insert cs2;

   MCACampaignBatchCS__c cs3 = new MCACampaignBatchCS__c();
   cs3.Name = '4';
   cs3.Day__c = '10th Day';
   cs3.isActive__c = true;
   cs3.Template_ID__c = '00X0k000000IeQn';

   insert cs3;


   MCACampaignBatchCS__c cs4 = new MCACampaignBatchCS__c();
   cs4.Name = '6';
   cs4.Day__c = '15th Day';
   cs4.isActive__c = true;
   cs4.Template_ID__c = '00X0k000000IeQs';
   insert cs4;

   MCACampaignBatchCS__c cs5 = new MCACampaignBatchCS__c();
   cs5.Name = '7';
   cs5.Day__c = '20th Day';
   cs5.isActive__c = true;
   cs5.Template_ID__c = '00X0k000000IeR2';
   insert cs5;

   MCACampaignBatchCS__c cs6 = new MCACampaignBatchCS__c();
   cs6.Name = '8';
   cs6.Day__c = '30th Day';
   cs6.isActive__c = true;
   cs6.Template_ID__c = '00X0k000000IdhP';
   insert cs6;


   CompanyTypeCS__c cts = new CompanyTypeCS__c();
   cts.Name = '1';
   cts.Company_Type__c = 'PVT';
   cts.Day__c = '60th Day';
   cts.isActive__c = true;
   cts.Template_ID__c = '00X0k000000IeXV';
   insert cts;

   CompanyTypeCS__c cts1 = new CompanyTypeCS__c();
   cts1.Name = '2';
   cts1.Company_Type__c = 'LLP';
   cts1.Day__c = '60th Day';
   cts1.isActive__c = true;
   cts1.Template_ID__c = '00X0k000000EQQv';
   insert cts1;

   CompanyTypeCS__c cts2 = new CompanyTypeCS__c();
   cts2.Name = '3 ';
   cts2.Company_Type__c = 'OPC';
   cts2.Day__c = '60th Day';
   cts2.isActive__c = true;
   cts2.Template_ID__c = '00X0k000000EQRK';
   insert cts2;



   Lead scheduleLead3 = new Lead();

   scheduleLead3.Salutation = 'Mr.';
   scheduleLead3.FirstName = 'Rohit';
   scheduleLead3.LastName = 'Testing';
   scheduleLead3.email = 'abcd@e.com';
   scheduleLead3.Company = 'c';
   //scheduleLead3.CCEmail__c = 'abcd@e.com';
   //scheduleLead3.Enquiry_For__c = 'MCA Email Campaign';
   scheduleLead3.Phone = '9158703399';
   //scheduleLead3.Date_of_Incorporation__c = system.today() - 30;
   scheduleLead3.city = 'Delhi';
   scheduleLead3.ownerId = uBDE.id;
   tempLead1.add(scheduleLead3);


   insert tempLead1;
   Lead scheduleLead31 = new Lead();

   scheduleLead31.Salutation = 'Mr.';
   scheduleLead31.FirstName = 'Rohit1';
   scheduleLead31.LastName = 'Testing1';
   scheduleLead31.email = 'abc1d@e.com';
   scheduleLead31.Company = 'c1';
   //scheduleLead3.CCEmail__c = 'abcd@e.com';
   //scheduleLead3.Enquiry_For__c = 'MCA Email Campaign';
   scheduleLead31.Phone = '9158703399';
   //scheduleLead3.Date_of_Incorporation__c = system.today() - 30;
   scheduleLead31.city = 'Delhi';
   scheduleLead31.ownerId = uBDE.id;

   insert scheduleLead31;






   Test.setCreatedDate(scheduleLead31.Id, DateTime.now().addDays(5));

   test.startTest();

   SendMailAfterIncorporationDate smid = new SendMailAfterIncorporationDate();
   id batchProcessID = Database.executeBatch(smid);

   test.stopTest();
  }
 }


}