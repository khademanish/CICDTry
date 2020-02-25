public with sharing class DemoSitepageController {
    public Lead testLead{get;set;}
    public  DemoSitepageController(){
        List<Lead> leadList = [SELECT Id FROM Lead WHERE Id='00Q0I00001E3Wxd'];
        System.debug('Lead list : '+leadList);
        if(leadList != null && leadList.size()>0){
            testLead = leadList[0];
        }
    }
    
    public void updateLeadRecord(){
        try{
         	if(testLead != null){
                update testLead;
            }   
        }catch(Exception e){
            System.debug('Exception occured : '+e.getMessage());
        }
    }
}