({
	getCaseObject: function(cmp){
    var action = cmp.get("getCaseFromId");
    action.setCallback(this, function(response){
        var state = response.getState();
        if (state === "SUCCESS") {
            cmp.set("v.record", response.getReturnValue());
        }
    });
    $A.enqueueAction(action);
}
})