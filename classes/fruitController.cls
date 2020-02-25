public class fruitController {

    public PageReference redirect() {
        return Page.DynamicTab;
    }

        
    public List<SelectOption> list1{get; set;}
    public List<SelectOption> list2{get; set;}
    
    public String selected{get; set;}
    
    public fruitController(){
        list1= new List<SelectOption>();
         list2=new List<SelectOption>();
        list1.add(new SelectOption('none','None'));
       list2.add(new SelectOption('none','None'));

        list1.add(new SelectOption('a','A'));
        list1.add(new SelectOption('b','B'));
        list1.add(new SelectOption('c','C'));
    }
    
    
    public void getFruits(){
            list2.clear();
            list2.add(new SelectOption('none','None'));
        if(selected=='a'){
            list2.add(new SelectOption('apple','apple'));
            list2.add(new SelectOption('ananas','ananas'));
        }
        else if(selected=='b'){
            list2.add(new SelectOption('banana','banana'));
            list2.add(new SelectOption('batata','batata'));
        }
        else if(selected=='c'){
            list2.add(new SelectOption('chiku','chiku'));
            list2.add(new SelectOption('carrot','carrot'));
        }
    }
    
}