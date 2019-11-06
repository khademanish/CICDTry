public class myextension {

    private ID id;
    public Employee__c emp;
    public myextension(ApexPages.StandardController controller) {
        id=Apexpages.currentpage().getparameters().get('id');
        emp=[select Name__c,Email_ID__c,DOB__c,Mobile_No__c,City__c,State__c from employee__c where id=:id];
    }

    public employee__c getEmployee()
    {
    return emp;
    }
    
    public PageReference save(){
    upsert emp;
    return null;
    
    }
    
    public PageReference back(){
    return new PageReference('/apex/Day2Assignment2');
    
    }
}