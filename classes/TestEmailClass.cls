public class TestEmailClass {

public static void test1(){
    List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();

for(Integer i = 0; i < 5000;i++) {

Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

string body = 'Hi ';

mail.setSubject('Test Subject');

mail.setTargetObjectId('0052800000271jW'); mail.setSaveAsActivity(false);

mail.setHtmlBody(body); mails.add(mail);

}

Messaging.sendEmail(mails);
}
}