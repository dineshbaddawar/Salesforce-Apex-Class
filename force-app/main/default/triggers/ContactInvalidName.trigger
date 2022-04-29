trigger ContactInvalidName on Contact (before insert,before update) {

    for(Contact con:trigger.new){
        if(con.LastName == null){
            con.addError('Please Provide the LastName');
        }
    }
}