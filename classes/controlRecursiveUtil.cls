public class controlRecursiveUtil {

    private static Integer poc1 = 0;
    private static Integer poc2 = 0;
    
    public static Integer getPOC1(){
        return poc1;
    }
    
    public static Integer getPOC2(){
        return poc2;
    }
    
    public static void setPOC1(){
        poc1 = poc1+1;
    }
    
    public static void setPOC2(){
       poc2 = poc2+1;
    }
}