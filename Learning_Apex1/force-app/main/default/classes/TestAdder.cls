@isTest
private class TestAdder {
    @isTest static void Add_Numbers_check1() {
        Account testAccount=new Account();
        testAccount.Name='Test Name';
        testAccount.First_Number__c=10;
        testAccount.Second_Number__c=20;
        Test.startTest();
        insert testAccount;
        Test.stopTest();
        Account resultAccount=[Select Sum__c from Account where Id=:testAccount.Id];
        System.assertEquals(30,resultAccount.Sum__c,'The sum should be 30');
    }
    @isTest static void Add_Numbers_for_null() {
        Account testAccount=new Account();
        testAccount.Name='Test Null';
        testAccount.First_Number__c=null;
        testAccount.Second_Number__c=10;
        Test.startTest();
        insert testAccount;
        Test.stopTest();
        Account resultAccount1=[Select Sum__c from Account where ID=:testAccount.Id];
        System.assertEquals(null,resultAccount1.Sum__c,'The expected value is null');
    }
    @isTest static void Add_Numbers_for_negative_numbers() {
        Account testAccount=new Account();
        testAccount.Name='Test Negative';
        testAccount.First_Number__c=-10;
        testAccount.Second_Number__c=-30;
        Test.startTest();
        insert testAccount;
        Test.stopTest();
        Account resultAccount2=[Select Sum__c from Account where Id=:testAccount.Id];
        System.assertEquals(-40,resultAccount2.Sum__c,'The sum is -40');
    }
}