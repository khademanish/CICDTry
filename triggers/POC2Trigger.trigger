trigger POC2Trigger on pslPractice__POC2__c (before insert,before update,after update , after insert) {

     /* if(controlRecursiveUtil.getPOC2() <1){
            pslPractice__POC1__c obj= [SELECT id,Test_Field__c from pslPractice__POC1__c where id = 'a0E2800000M435C' limit 1];
            obj.Test_Field__c = 'Manish Khade';
            update obj;
        }*/
    
     /*if(controlRecursiveUtil.getPOC2()<2){
        controlRecursiveUtil.setPOC2();
        if(trigger.isBefore){
            if(trigger.isInsert) System.debug('POC2 Before Insert');
            if(trigger.isUpdate)System.debug('POC2 Before Update');
        }
        if(trigger.isAfter){
            if(trigger.isInsert) System.debug('POC2 After Insert');
            if(trigger.isUpdate)System.debug('POC2 After Update');
        }
      
    }
    try{
        for(pslPractice__POC2__c ob : trigger.new){
            ob.pslPractice__Test_Field__c = 'Updated'; 
        } 
        pslPractice__POC2__c o1;
        System.debug(''+o1.Id);
        
    }catch(Exception e){
        System.debug('Exception caught :'+e);
    }*/
    
}