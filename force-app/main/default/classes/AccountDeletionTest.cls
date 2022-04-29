@isTest
public with sharing class AccountDeletionTest {
   
    @isTest static void Method(){
        // test data steup
        // create account with an contact , and then try to delete it
        Account acc = new Account();
        acc.Name ='Test Account1';
        insert acc;

        Contact con = new Contact();
        con.LastName = 'Contact Test';
        con.AccountId = acc.Id;
        insert con;
        
        // perform test
        Test.startTest();
        Database.DeleteResult result = Database.delete(acc,false);
        Test.startTest();
        // Verify
        // In this case the deletion should have been stopped by the trigger,
        // so verify that we get back an error
        System.assert(!result.isSuccess());
        System.assert(result.getErrors().size()>0);
        System.assertEquals('Can not delete account with relate Contact.', result.getErrors()[0].getmessage());
    }
    
}
