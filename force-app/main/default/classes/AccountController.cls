public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccount(String filter) {
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }

   
}