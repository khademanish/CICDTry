public class MyFirstClass {
        public String[] months=new List<String>{'Jan','feb','mar','apr','june','july','aug','sept','oct','nov','dec'};
        
        public string getMonth()
        {
            String s='>';
            for(String a: months)
                s=' '+s+' > '+a;
                
             return s;
        }
}