({
	handleClick : function(component, event, helper) {

    var urlEvent = $A.get("e.force:navigateToURL");
    urlEvent.setParams({
      "url": 'http://psl-manish-developer-edition.ap7.force.com/EKYCPage'
    });
    urlEvent.fire();
}
})