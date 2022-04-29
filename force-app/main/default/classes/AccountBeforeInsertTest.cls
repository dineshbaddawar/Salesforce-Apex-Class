@isTest
public with sharing class AccountBeforeInsertTest {
   
    @isTest static void Method(){
        Account acc = new Account();
        acc.Name = 'Test Account';
        insert acc;
        acc = [SELECT DEscription FROM Account WHERE Id =:acc.Id];
        System.assertEquals('BeforeInsert', acc.Description);
    }
}
