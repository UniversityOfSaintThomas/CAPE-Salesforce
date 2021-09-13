/**
 * Created by Thad-PC-2019 on 7/29/2020.
 */

@isTest
public with sharing class capeFeed2_TEST {

    @isTest static void testCAPEFeed2() {

        createProducts();
        //List of parameters
        List<String> sponsors = getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe());
        List<String> formats = getObjectItemList(Product2.Format__c.getDescribe());
        List<String> indexCodes = getObjectItemList(Product2.Index_Code__c.getDescribe());

        Test.startTest();
        getFeeds('courselist', '', '', '', '', '', '', '');
        getFeeds('parameterKey', '', '', '', '', '', '', '');

        //filter tests
        getFeeds('courselist', 'Course-0', '', '', '', '', '', '');
        getFeeds('courselist', 'Course-0,Course-1', '', '', '', '', '', '');

        //sponsors test
        String sponsor1 = '';
        String sponsor2 = '';
        if (sponsors.size() > 0) {
            sponsor1 = sponsors[0];
        }
        if (sponsors.size() > 1) {
            sponsor2 = sponsors[1];
        }
        getFeeds('courselist', '', sponsor1, '', '', '', '', '');
        getFeeds('courselist', '', sponsor1 + ',' + sponsor2, '', '', '', '', '');


        //sponsors test
        String format1 = '';
        String format2 = '';
        if (formats.size() > 0) {
            format1 = formats[0];
        }
        if (formats.size() > 1) {
            format2 = formats[1];
        }
        getFeeds('courselist', '', '', format1, '', '', '', '');
        getFeeds('courselist', '', '', format1 + ',' + format2, '', '', '', '');

        //months test
        getFeeds('courselist','', '', '', '', '10', '', '');
        getFeeds('courselist', '', '', '', '', '-10', '', '');

        //retired test
        getFeeds('courselist', '', '', '', 'true', '', '', '');

        //viewstart/viewend test
        getFeeds('courselist', '', '', '', 'true', '', Date.today().format(), Date.today().addMonths(5).format());

        Test.stopTest();
    }

    private static void createProducts() {

        //List of parameters
        List<String> sponsors = getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe());

        List<String> formats = getObjectItemList(Product2.Format__c.getDescribe());

        List<String> indexCodes = getObjectItemList(Product2.Index_Code__c.getDescribe());

        //Search for standard pricebook, if not there create
        Pricebook2 standardPricebook = new Pricebook2(
                Id = Test.getStandardPricebookId(),
                IsActive = true
        );
        update standardPricebook;
        standardPricebook = [SELECT IsStandard FROM Pricebook2 WHERE Id = :standardPricebook.Id];
        system.assertEquals(true, standardPricebook.IsStandard, 'The Standard Pricebook should now return IsStandard = true');

        //Create and insert products
        Integer formatCount = 0;
        Integer sponsorCount = 0;
        Integer indexCount = 0;
        Boolean even = false;
        List<Product2> products = new List<Product2>();
        for (Integer x = 0; x <= 9; x++) {
            Product2 product = new Product2();
            product.Name = 'Course-' + String.valueOf(x);
            product.Start_Time__c = Time.newInstance(8, 0, 0, 0);
            product.Index_Code__c = indexCodes[indexCount];
            product.IsActive = true;
            product.Course_Image__c = '<img src="https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png"/>';
            if (even) {
                product.Course_Start_Date__c = Date.today().addMonths(-x);
                product.Course_End_Date__c = Date.today().addMonths(x);
                product.Retire_Date__c = Date.today().addMonths(x);
                product.CEU_Amount__c = x * x;
                product.Sponsoring_College_School__c = sponsors[sponsorCount];
                product.Format__c = formats[formatCount];
            } else {
                product.Retire_Date__c = Date.today().addMonths(-x);
                product.Storefront_Info_Page__c = 'https://gooogle.com';
                product.Course_Image__c = 'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png';
            }
            formatCount++;
            if (formatCount >= formats.size() - 1) {
                formatCount = 0;
            }
            sponsorCount++;
            if (sponsorCount >= sponsors.size() - 1) {
                sponsorCount = 0;
            }
            indexCount++;
            if (indexCount >= indexCodes.size() - 1) {
                indexCount = 0;
            }
            even = !even;
            products.add(product);
        }

        System.debug(JSON.serializePretty(products));
        insert products;

        //Create pricebook entries
        List<PricebookEntry> pricebookEntries = new LIst<PricebookEntry>();
        for (Product2 prod : products) {
            PricebookEntry pbe = new PricebookEntry();
            pbe.IsActive = true;
            pbe.Pricebook2Id = standardPricebook.Id;
            pbe.Product2Id = prod.Id;
            if (prod.CEU_Amount__c != null) {
                pbe.UnitPrice = prod.CEU_Amount__c;
            } else {
                pbe.UnitPrice = 0;
            }

            pricebookEntries.add(pbe);
        }
        System.debug(JSON.serializePretty(pricebookEntries));
        insert pricebookEntries;

    }

    private static void getFeeds(String feedType, String filter, String sponsor, String format, String retired, String months, String viewStart, String viewEnd) {
        RestRequest req = new RestRequest();
        RestResponse res = new RestResponse();
        req.requestURI = '/applicantportal/services/apexrest/capefeed';
        req.params.put('feedType', feedType);
        req.params.put('filter', filter);
        req.params.put('sponsor', sponsor);
        req.params.put('format', format);
        req.params.put('retired', retired);
        req.params.put('months', months);
        req.params.put('viewstart', viewStart);
        req.params.put('viewend', viewEnd);
        req.httpMethod = 'GET';
        req.addHeader('Content-Type', 'application/json');
        RestContext.request = req;
        RestContext.response = res;
        capeFeed2.getCAPEFeed();
    }

    private static List<String> getObjectItemList(Schema.DescribeFieldResult fieldResult) {
        List<String> fieldMap = new List<String>();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f : ple) {
            fieldMap.add(f.getValue());
        }
        return fieldMap;
    }
}