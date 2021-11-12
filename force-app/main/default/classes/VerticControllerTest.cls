@isTest
public with sharing class VerticControllerTest {

    @isTest public static void TestController() {

        VerticController TestController = new VerticController();
        Contact contact = new Contact(FirstName = 'Jack', LastName = 'Jackson');
        insert contact;
        TestController.searchKey = 'Jack';

        Test.startTest();
        TestController.searchByName();
        Test.stopTest();

        List<Contact> actual = TestController.contacts;

        List<Contact> expected = [
            SELECT Id, FirstName, LastName
            FROM Contact
            WHERE FirstName LIKE 'Jack'];
        System.assertEquals(expected[0].FirstName, actual[0].FirstName, 'Should be contact with FirstName - "Jack"');
    }
}
