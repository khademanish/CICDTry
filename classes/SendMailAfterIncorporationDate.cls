global class SendMailAfterIncorporationDate implements Database.Batchable<sObject>,Database.AllowsCallOuts,Database.Stateful{
 		
 		global string query;
    	public Integer totalRecordsProcessed = 0;
 		global string todaydt;
    	global DateTime dt;
    	global Date todayDate;
  		list<id> tempid = new list<id>();
		map<string,Id> templateIdMap = new map<string,Id>();
		map<String,map<String,id>> NewtemplateIdMap = new map<String,map<String,id>>();
		
    	/*
 		global SendMailAfterIncorporationDate(){
 			
 				dt = system.now();  
        		todayDate = dt.date();
        		Date todayDate = Date.today();
        		todayDt = date.today().format();
        		
        		system.debug('-todayDt-' + todayDt+'-todayDate-'+ todayDate);
        		
        		templateIdMap = fetchTempId();
        		NewtemplateIdMap = fetchCompanyTypeTempId();
        		
        		system.debug('--templateIdMap--' + templateIdMap);
 
 
 			}*/
 
 
	global Database.QueryLocator start(Database.BatchableContext BC){
		
		query = 'select id,Name from ' +
    			 'Lead';
				
				system.debug('--query--' +query);
				
				return Database.getQueryLocator(query);
	}


	global void execute(Database.BatchableContext BC,List<Lead> leadlist){
			
		/*list<Messaging.SingleEmailMessage> messageList = new list<Messaging.SingleEmailMessage>();	
		
			for(Lead leadobject : leadlist){
				
    		String[] toAddresses = new list<string>{leadobject.Email};
     		 string[] ccAddresses = new string[]{};	
	  		Messaging.Singleemailmessage msg = new Messaging.Singleemailmessage();  
   		 
	 			 if(leadobject.X3rdDayOfIncorporation__c == todayDate && templateIdMap.containsKey('3rd Day')){
          
							ID tempid = templateIdMap.get('3rd Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 }else if(leadobject.X5th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('5th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('5th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X7th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('7th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('7th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X10th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('10th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('10th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X15th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('15th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('15th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X20th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('20th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('20th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X30th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('30th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('30th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X35th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('35th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('35th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X45th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('45th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('45th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X50th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('50th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('50th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X60th_Day_of_Incorporation__c == todayDate && leadobject.Company_Type__c == 'PVT'){
      			 		
      			 			ID tempid = NewtemplateIdMap.get(leadobject.Company_Type__c).get('60th Day');
          
							msg.setTemplateId(tempid);
							system.debug('--tempid-'+tempid);
      			 
      			 }else if(leadobject.X75th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('75th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('75th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X85th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('85th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('85th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X100th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('100th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('100th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X120th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('120th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('120th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X130th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('130th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('130th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }else if(leadobject.X150th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('150th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('150th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      			 }
			
      		else if(leadobject.X180th_Day_of_Incorporation__c == todayDate && templateIdMap.containsKey('180th Day')){
      			 		
      			 			ID tempid = templateIdMap.get('180th Day');
          
								system.debug('--tempid-'+tempid);
								msg.setTemplateId(tempid);
      			 
      		}

      			 
   
    			if(leadobject.CCEmail__c != null){
        					ccAddresses=leadobject.CCEmail__c.split(',');
        					msg.setCcAddresses(ccAddresses);
    			}
    
				map<id, id> orgUserEmailId = new map<id, id>();     
				list<id> ownerIDs = new list<id>();
				
				if(leadList.size()>0){
    						ownerIDs.add(leadobject.OwnerId);
   				 }   
				system.debug('----ownerIDs----'+ ownerIDs.size()+'----'+ ownerIDs);

				OwnerOrgAddress orgAdd = new OwnerOrgAddress();
    				system.debug('inside OwnerOrgAddress');
				orgUserEmailId = orgAdd.OwnerOrgWideAdd(ownerIDs);
					system.debug('--Org Email address--' + orgUserEmailId);

    			msg.setToAddresses(toAddresses);
   				msg.setTargetObjectId(leadobject.id);
    				system.debug('-setTargetObjectId-'+leadobject.id);
	
				msg.setOrgWideEmailAddressId(orgUserEmailId.get(leadobject.ownerId));
   					system.debug('-setOrgWideEmailAddressId-'+leadobject.ownerId);
				MessageList.add(msg);
   					 
			 
			 	totalRecordsProcessed++;
		    		
		    		system.debug('---Total Records Processed---'+totalRecordsProcessed+'---Record Detail---'+leadobject);
			 
			 
			 
			 }
				if(MessageList.size() > 0){
					
                		Messaging.sendEmail(MessageList,false);
                			System.Debug('---Send Email---'+MessageList.size());    
				}*/
				
	}
		
		
	/*public map<string,Id> fetchTempId(){
			
		for(MCACampaignBatchCS__c setting : [select id,Name,Day__c,isActive__c,Template_ID__c from MCACampaignBatchCS__c where isActive__c =: true]){
			
            templateIdMap.put(setting.Day__c,setting.Template_ID__c);
            
            system.debug('--templateIdMap---'+templateIdMap+'--templateIdMap size---'+templateIdMap.size());

		}
			system.debug('--templateIdMap---'+templateIdMap.size()+'--templateIdMap---'+templateIdMap);
			
			return templateIdMap;
	}
	
	public map<String,map<String,id>> fetchCompanyTypeTempId(){
	
		map<String,map<String,id>> NewtemplateIdMap = new map<String,map<String,id>>();
		list<CompanyTypeCS__c> customsettinglist = [select id,Name,Day__c,Company_Type__c,Template_ID__c,isActive__c from CompanyTypeCS__c where isActive__c =: true];
		system.debug('--customsettinglist--'+customsettinglist);
		system.debug('--customsettinglist size--'+customsettinglist.size());

		for(CompanyTypeCS__c ctsetting : customsettinglist){

    		if(ctsetting.Company_Type__c == 'PVT'){
    	
				NewtemplateIdMap.put(ctsetting.Company_Type__c,new map<String,Id>{'60th Day' => ctsetting.Template_ID__c});
    		}
 			if(ctsetting.Company_Type__c == 'LLP'){
        
				if(NewtemplateIdMap.containsKey(ctsetting.Company_Type__c))
		
      		 		NewtemplateIdMap.get(ctsetting.Company_Type__c).put('60th Day',ctsetting.Template_ID__c);

				else
        
            		NewtemplateIdMap.put(ctsetting.Company_Type__c,new map<String,Id>{'60th Day' => ctsetting.Template_ID__c});
			}
        

    		if(ctsetting.Company_Type__c == 'OPC'){
        
				if(NewtemplateIdMap.containsKey(ctsetting.Company_Type__c))
		
        			NewtemplateIdMap.get(ctsetting.Company_Type__c).put('60th Day',ctsetting.Template_ID__c);

				else
        
            		NewtemplateIdMap.put(ctsetting.Company_Type__c,new map<String,Id>{'60th Day' => ctsetting.Template_ID__c});
			}
		} 
			system.debug('--NewtemplateIdMap OPC---'+NewtemplateIdMap+'--NewtemplateIdMap1 size---'+NewtemplateIdMap.size());
	
			return NewtemplateIdMap;
	
	}*/
	
	global void finish(Database.BatchableContext BC){
	/*
	    AsyncApexJob a = [Select Id, Status, NumberOfErrors, JobItemsProcessed,TotalJobItems, CreatedBy.Email
                                          from 
                                          AsyncApexJob 
                                          where 
                                          Id =:BC.getJobId()];
         
         system.debug('--Batch Job contains--' + a);
         
         Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
         String[] toAddresses = new String[] {'shital.ghumare@startupwala.com','shreenath.jamdade@startupwala.com'};
         mail.setToAddresses(toAddresses);
         mail.setSubject('MCA Campaign Batch: ' + a.Status);
         mail.setPlainTextBody
         ('The batch Apex job processed ' + a.TotalJobItems +
          ' batches with '+ a.NumberOfErrors + ' failures.\r\nTotal Records Processed '+ totalRecordsProcessed +
          ' records');
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });*/
}
}