public with sharing class DynamicTabController 
{
    public List<Account> lstAccount{get;set;}
    
    public DynamicTabController()
    {
        lstAccount=new List<Account>();

                String query = 'SELECT Id, Name FROM Account limit 5 ';
            

                lstAccount = Database.query(query);        

    }


}