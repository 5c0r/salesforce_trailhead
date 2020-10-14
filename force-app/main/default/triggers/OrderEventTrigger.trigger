trigger OrderEventTrigger on Order_Event__e (after insert) {

    List<Task> taskList = new List<Task>();

    for (Order_Event__e event : Trigger.new) {
        if(event.Has_Shipped__c == true) {
            Task newTask = new Task(Subject = 'Follow up on shipped order ' + event.Order_Number__c);
            newTask.Priority = 'Medium';
            newTask.OwnerId = event.CreatedById;

            taskList.add(newTask);
        }
    }

    insert taskList;
}