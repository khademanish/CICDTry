({
	getTimeHelper : function(component) {
		
        var fname=component.get("v.fname");
        
        var action=component.get("c.getTimeFromApex");
        action.setParams({"fname":fname});
        
        action.setCallback(this,function(response){
            if(response.getState()=="SUCCESS"){
                console.log(response.getReturnValue());
                component.set("v.message",response.getReturnValue());
                
            }
        });
        
        $A.enqueueAction(action);
	}
})