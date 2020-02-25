({
	doInit : function(component, event, helper) {
		var action = component.get('c.getAccount');
        action.setCallback(this,function(response){
           var state= response.getState();
            if(state == 'SUCCESS'){
                component.set('v.accountRecord',response.getReturnValue());
            }
        });
	}
})