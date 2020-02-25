public class GenericClass {
	public static void updateValuesFromTrigger(List<pslPractice__POC1__c> objList){
        for(pslPractice__POC1__c ob : objList){
                ob.pslPractice__Test_Field__c = 'MM';
            }
    }
}