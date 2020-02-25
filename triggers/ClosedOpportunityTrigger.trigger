trigger ClosedOpportunityTrigger on Opportunity (after insert, after update) {
	
    
    List<Opportunity> closedOpportunities = new List<Opportunity>();
    for(Opportunity opp : trigger.new){
        if(opp.StageName == 'Closed Won'){
            closedOpportunities.add(opp);
        }
    }
    
    String userId = UserInfo.getUserId();
    List<Task> taskList = new List<Task>(); 
    for(Opportunity o: closedOpportunities){
        Task t = new Task();
        t.OwnerId = userId;
        t.Subject = 'Follow Up Test Task';
        t.WhatId = o.ID;
        taskList.add(t);
    }
    
    insert(taskList);
}