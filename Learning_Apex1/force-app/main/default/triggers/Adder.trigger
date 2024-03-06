trigger Adder on Account (before insert, before update) {
    for (Account a : Trigger.new) {
		if(a.First_Number__c != null && a.Second_Number__c != null) {
            a.Sum__c = a.First_Number__c + a.Second_Number__c;
       }
        else{
            a.Sum__c=null;
        }
    }
}