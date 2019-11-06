public class invoiceController {



        public List<Invoice__c> invlist;
          
        public Map<Invoice__c,List<Line_Item__c>> det=new Map<Invoice__c,List<Line_Item__c>>();
         
        public Map<Invoice__c,List<Line_Item__c>> getInvoice()
        {
            invlist= [select name, Invoice_Total__c,(select name,Line_Item_Total__c,Merchandise__c,Quantity__c,Unit_Price__c from Line_Items__r) from invoice__c];
            
           // system.debug(invlist);
            for(Invoice__c i: invlist)
                {
                     List<Line_Item__c> lnlist =new List<Line_Item__c>();
                    for(Line_Item__c l: i.Line_Items__r)
                        {
                           
                            lnlist.add(l);
                        }
                     det.put(i,lnlist);
                }
            
            
            return det;

        }
    
        
}