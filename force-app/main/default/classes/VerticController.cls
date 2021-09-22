public with sharing class VerticController {

    public List<Contact> contacts {get;set;}
    public String searchKey {get;set;}

    public VerticController() {
        this.contacts = [
            SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate 
            FROM Contact
            ORDER BY FirstName
            LIMIT 30
        ];
    }

    public void searchByName() {
        String key = '%' + this.searchKey + '%';
        this.contacts = [
            SELECT Id, FirstName, LastName, Email, AccountId, Account.Name, Phone, CreatedDate 
            FROM Contact
            WHERE FirstName LIKE :key
            ORDER BY FirstName
            LIMIT 30
        ];
    }
}
