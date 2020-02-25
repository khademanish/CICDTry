public class barcodeController {
    
    public String barcode{get;set;}
    
    public barcodeController(ApexPages.StandardController controller) {

    }

    public void test(){
        System.debug('Barcode is :'+barcode);
      Attachment a = new Attachment();
        a.ParentId = '00628000007pQAr';
        a.Name = 'Test.jpeg';
        a.Body = EncodingUtil.base64Decode(barcode);
         insert a;
    }
}