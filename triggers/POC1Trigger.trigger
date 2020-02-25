trigger POC1Trigger on pslPractice__POC1__c (before insert,before update,after update , after insert) {
    /*  
System.debug('Trigger Count :'+controlRecursiveUtil.getPOC1());
if(controlRecursiveUtil.getPOC1() <2 && trigger.isBefore){
pslPractice__POC2__c obj= [SELECT id,Test_Field__c from pslPractice__POC2__c where id = 'a0F28000008W9yJ' limit 1];
obj.Test_Field__c = 'Manish';
update obj;

controlRecursiveUtil.setPOC1();
}



if(trigger.isBefore){
if(trigger.isInsert) System.debug('POC1 Before Insert');
if(trigger.isUpdate)System.debug('POC1 Before Update');
}
if(trigger.isAfter){
if(trigger.isInsert) System.debug('POC1 After Insert');
if(trigger.isUpdate)System.debug('POC1 After Update');
}

*/
    try{
        if(trigger.isBefore && trigger.isUpdate){
            /*for(pslPractice__POC1__c ob : trigger.new){
                ob.pslPractice__Test_Field__c = 'MM';
            }
            pslPractice__POC1__c o;
            System.debug(o.Id);*/
            GenericClass.updateValuesFromTrigger(trigger.new);
        }
        
    }catch(Exception e){
        System.debug('Exception caught :'+e);
    }
    
}