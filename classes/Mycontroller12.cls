public class Mycontroller12{

    public PageReference next() {
        
        PageReference acctPage = new PageReference('/apex/secondpage');
        acctPage.setRedirect(true);
        return acctPage;
    }

    
    private List<Employee__c> emp;
    
    public Mycontroller12(){
        
        emp=[select name from employee__c];
    }

    public List<Employee__c> getEmployee(){
        return emp;
    }

}