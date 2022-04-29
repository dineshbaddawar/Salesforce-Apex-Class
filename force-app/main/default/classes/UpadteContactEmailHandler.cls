public with sharing class UpadteContactEmailHandler {
    
    public static void updateContactEmail(List<Account> listNew,Map<Id,Account> oldmap){
        Set<Id> IdSet = new Set<Id>();
        System.debug('oldmap--->'+oldmap); 
        System.debug('IdSet--->'+IdSet);

        for(Account acc:listNew){
            System.debug('oldmap email--->'+oldmap.get(acc.Id).Email__c);
            System.debug('listNew email--->'+acc.email__c);
            if(acc.Email__c != oldmap.get(acc.Id).Email__c && acc.Email__c !=null){
                IdSet.add(acc.Id);
            }
        }
        System.debug('IdSet--->'+IdSet);
        if(!IdSet.isEmpty()){
            List<Contact> conList = [SELECT Id,Account.Email__c,Email FROM Contact Where AccountId IN :IdSet];
            System.debug('ConList--->'+conList);
            List<Contact> updateContact = new List<Contact>();
            for(Contact con:conList){
                if(con.Email !=con.Account.Email__c){
                    con.Email = con.Account.Email__c;
                    updateContact.add(con);
                }else{
                    con.Email=null;
                    updateContact.add(con);
                }
            }
            if(!updateContact.isEmpty()){
                update updateContact;
            }
        }
    }
}
