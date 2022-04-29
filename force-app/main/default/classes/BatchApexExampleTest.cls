@isTest
public with sharing class BatchApexExampleTest {
 
    @isTest
    static void testBatchMethod(){
        Account acc = new Account();
        acc.Name = 'Account Test';
        acc.Type ='Prospecting';
        insert acc;

        Test.startTest();
        BatchApexExample batchtest = new BatchApexExample();
        Id JobId = Database.executeBatch(batchtest,5);
        test.stopTest();
        Account accList =[SELECT Industry,Type FROM Account WHERE Id =:acc.Id];
        System.assertEquals('Prospecting', accList.Industry);
    }
}
