public class StringArrayTest  {
		public static List<String> generateStringArray(integer n)
        {
            List<String> ar=new List<String>();
            for(integer i= 0 ; i < n ; i++)
            {
                ar.add('Test '+i);
            }
         
            return ar;
        }
}