({
	sendNumber : function(component, event, helper) {
		var phoneInput=component.find("phone");
        var phoneValue=phoneInput.get("v.value");
        
        $A.get("e.c:PhoneNumberEvent").setParams({
            phone:phoneValue
        }).fire();
	}
})