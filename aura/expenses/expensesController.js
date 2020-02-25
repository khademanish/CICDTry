({
	clickCreateExpense : function(component, event, helper) {
		var validExpense = true;
		var nameField = component.find("expname");
        var expname = nameField.get("v.value");
        if($A.util.isEmpty(expname)){
            validExpense = false;
            nameField.set("v.errors",[{message:"Expense Name can not be blank."}]);
        }
        else{
            nameField.set("v.errors",null);
        }
        
        if(validExpense){
            var newExpense = component.get("v.newExpense");
            helper.createExpense(component, newExpense);
        }
	}
})