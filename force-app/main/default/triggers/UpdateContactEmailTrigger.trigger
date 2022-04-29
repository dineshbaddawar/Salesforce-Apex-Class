trigger UpdateContactEmailTrigger on Account (before update) {

    if(trigger.isUpdate){  
        UpadteContactEmailHandler.updateContactEmail(trigger.new, trigger.oldMap);
    }
}