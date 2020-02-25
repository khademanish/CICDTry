({
	myAction : function(component, event, helper) {
		
	},
    
    buttonAction : function(component,event){
        var target;
        if(event.getSource){
            target=event.getSource();
            component.set("v.text",target.get("v.label"));
        }
        else{
            target=event.target.value;
            component.set("v.text",event.target.value);
        }
    }
})