global with sharing class DailyLeadProcessor implements Schedulable {
    global void execute(SchedulableContext ctx) {
        List<Lead> leads = [SELECT Id,LeadSource FROM Lead WHERE LeadSource = '' LIMIT 200];
        for(Lead lead: leads) {
            lead.LeadSource = 'Dreamforce';
        }
        update leads;
    }
}