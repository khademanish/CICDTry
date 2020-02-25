({
	doInit : function(component, event, helper) {
		$A.createComponent(
            "ui:button" ,
            {
                "aura:id" : "newButton",
                "label" : "New Button",
                "press" : component.getReference("c.handlePress")
            },
            function(something){
                if(component.isValid){
                    var body = component.get("v.body");
                    body.push(something);
                    component.set("v.body", body);
                }
            }
        )
	},
    
    handlePress : function(component, event){
        console.log("Pressed");
    }
})