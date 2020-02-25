public class BatchClass implements Database.Batchable<sObject> {
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        return null;
    }
    
    public void execute(Database.BatchableContext bc, List<Account> t){
        
    }
    
    public void finish(Database.BatchableContext bc){
        
    }

}