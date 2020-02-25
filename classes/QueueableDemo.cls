public class QueueableDemo implements Queueable {
    
    public void execute( QueueableContext qc){
        FutureDemo.demoFutureMethod();
    }

}