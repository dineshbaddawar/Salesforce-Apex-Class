@isTest
public with sharing class UpadteContactEmailHandler_Test {
   
    @isTest
    static void updateContactEmail(){
        List<Account> accList = new List<Account>();
        Account acc = new Account();
        acc.Name ='Test Account';
        acc.Email__c = 'test@gmail.com';
        accList.add(acc);
        insert accList;

        Contact con = new Contact();
        con.LastName = 'testContact';
        con.Email = 'testcontact@gamil.com';
        con.AccountId = acc.Id;
        insert con;

        acc.Email__c = 'test1@gmail.com';
        update acc;
    }
}
