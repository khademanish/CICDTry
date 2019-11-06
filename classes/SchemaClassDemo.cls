public class SchemaClassDemo {
    public SchemaClassDemo(){
        Map<String ,Schema.SObjectType> allMap = Schema.getGlobalDescribe();
       for(String s : allMap.keySet())
           System.debug('Key :'+s+' Value :'+allMap.get(s));
    }
}