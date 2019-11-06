@isTest(seeAllData= false)
public class AntSampleTestClass {

    public static testMethod void testMethod1(){
        Test.startTest();
        AntSampleClass a = new AntSampleClass();
        Test.stopTest();
    }
}