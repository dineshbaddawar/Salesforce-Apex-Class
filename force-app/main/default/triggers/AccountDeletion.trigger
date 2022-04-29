trigger AccountDeletion on Account (before delete) {

    for(Account acc:[SELECT Id FROM Account WHERE Id IN(SELECT AccountId FROM Contact) AND Id IN:trigger.old]){
        trigger.oldmap.get(acc.id).addError('Account can not be deleted if it has related Contacts');
    }
}