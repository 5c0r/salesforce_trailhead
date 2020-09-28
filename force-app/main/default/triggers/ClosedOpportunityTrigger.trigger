trigger ClosedOpportunityTrigger on Opportunity (before insert, before update) {
    List<Task> taskList = new List<Task>();

    for (Opportunity o : Trigger.new) {
        if(o.StageName == 'Closed Won') {
            Task t = new Task();
            t.WhatId = o.Id;
            t.Subject = 'Follow Up Test Task';
            
            taskList.add(t);
        }
    }

    insert taskList;
}