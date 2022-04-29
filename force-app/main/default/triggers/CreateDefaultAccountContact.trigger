trigger CreateDefaultAccountContact on Account (after insert) {

    if(trigger.isAfter && trigger.isInsert){
        CreateDefaultAccountContact.CreateAccount(trigger.new);
    }
}