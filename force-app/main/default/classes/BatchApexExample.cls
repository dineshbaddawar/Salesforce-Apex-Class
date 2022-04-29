    public with sharing class BatchApexExample implements Database.Batchable <SOBJECT> {

    Public Database.QueryLocator start(Database.BatchableContext bc)
    {
    return Database.getQueryLocator('Select Type, Industry from Account');
    }

    Public void execute(Database.BatchableContext bc, List<Account> AccList)
    {
    for(Account a : AccList){
    if(a.Type =='Prospecting'){
    a.Industry = 'Other';
    }
    } 
    update AccList;
    }

    Public void finish(Database.BatchableContext bc){

    }
    }
