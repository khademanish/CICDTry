({
	answer : function(component, event, helper) {
		var Text = event.getParam("text");
        component.set("v.myText" , Text);
	}
})