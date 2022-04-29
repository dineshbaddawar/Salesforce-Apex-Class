trigger AccountBeforeInsert on Account (before insert) {

    for(Account acc:trigger.new){
        if(acc.Name == 'Test Account'){
            acc.Description ='BeforeInsert';
        }
    }
}