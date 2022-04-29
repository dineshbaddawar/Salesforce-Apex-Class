public with sharing class CommonMethods {
   
   @AuraEnabled(cacheable = true)
   public static Map<String,String> getAllObjectList(){
       Map<String,String> mapOfAllObject = new Map<String,String>();
       for(Schema.SObjectType objTyp : Schema.getGlobalDescribe().values()){
           String name = objTyp.getDescribe().getLocalName();
           String label = objTyp.getDescribe().getLabel();
           mapOfAllObject.put(name,label);
       }
       return mapOfAllObject;
   }
}
