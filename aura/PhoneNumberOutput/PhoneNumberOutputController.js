({
	getPhone : function(component, event, helper) {
		var phone=event.getParam("phone");
        var outputText=component.find("phone");
        outputText.set("v.value" , phone);
        
	}
})