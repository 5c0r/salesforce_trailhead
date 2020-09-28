global class LeadProcessor implements Database.Batchable<SObject>, Database.Stateful {
    global Database.QueryLocator start(Database.BatchableContext bc) {
        return Database.getQueryLocator(
            'SELECT Id, Name, LeadSource FROM Lead'
        );
    }

    global void execute(Database.BatchableContext bc, List<Lead> leads) {
        for(Lead lead: leads) {
            lead.LeadSource = 'Dreamforce';
        }

        update leads;
    }

    global void finish(Database.BatchableContext bc) {
        System.debug('done');
    }
}