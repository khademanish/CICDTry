({
	testMethod : function(component, event, helper) {
        var t = "buttonId";
		var ob = component.find(t);
        for(var key in ob)
            alert(ob[key].get("v.value"));
	}
})