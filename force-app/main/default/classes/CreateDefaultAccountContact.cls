public with sharing class CreateDefaultAccountContact {
   
    public static void CreateAccount(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc:accList){
            Contact con = new Contact();
            con.LastName = 'Contact Test';
            con.AccountId = acc.Id;
            conList.add(con);
        }
        if(conList.size()>0){
            insert conList;
        }
       
    }
}
