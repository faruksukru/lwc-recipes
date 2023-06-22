public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
<<<<<<< HEAD
    public static List<Account> getAccount(String filter) {
        return [SELECT Id, Name FROM Account WITH SECURITY_ENFORCED LIMIT 10];
    }

   
}
=======
    public static List<Account> getAccountList() {
        return [SELECT Id, Name FROM Account WITH USER_MODE LIMIT 10];
    }

    @AuraEnabled(cacheable=true)
    public static Account getSingleAccount() {
        return [
            SELECT Id, Name, Phone, Type
            FROM Account
            WITH USER_MODE
            LIMIT 1
        ];
    }

    @AuraEnabled
    public static void randomizeAccountData(Id accountId) {
        try {
            Account acc = [
                SELECT Id, NumberOfEmployees
                FROM Account
                WHERE Id = :accountId
                WITH USER_MODE
                LIMIT 1
            ];
            acc.NumberOfEmployees = Integer.valueof((Math.random() * 100000));
            update as user acc;
        } catch (Exception e) {
            throw new AccountUpdateException(
                'Couldn\'t update account with ID ' + accountId
            );
        }
    }

    public class AccountUpdateException extends Exception {
    }
}
>>>>>>> 1ccbaa9cc65d9bc26c0930a883850d366b33763a
