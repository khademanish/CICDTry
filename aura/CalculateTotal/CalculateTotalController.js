({
	calculate : function(component, event, helper) {
		var findInputone = component.find("inputOne");
        var a=parseInt(findInputone.get("v.value"));
        
        var findInputtwo = component.find("inputTwo");
        var b=parseInt(findInputtwo.get("v.value"));
        
        var findInputthree = component.find("inputThree");
        var c=parseInt(findInputthree.get("v.value"));
        
        var result=(a+b)-c;
        
        var findOutput = component.find("totalValue");
        findOutput.set("v.value",result);
	}
})