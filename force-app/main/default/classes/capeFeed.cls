// Copyright 2020 University of St. Thomas - Minnesota. All rights reserved.
// Use of this source code is governed by a BSD Revised
// license that can be found in the LICENSE file.
// Created by Thaddaeus Dahlberg on 07/07/2018.

@RestResource(urlMapping='/capefeed/*')

// https://stthomas.force.com/applicantportal/services/apexrest/capefeed?feedType=courselist

global with sharing class capeFeed {

    private static String feedType { get; set; }

    private Class capeItem {
        public String id { get; set; }
        public String title { get; set; }
        public String description { get; set; }
        public String link { get; set; }
        public String format { get; set; }
        public String startTime { get; set; }
        public String startDate { get; set; }
        public String endDate { get; set; }
        public String image { get; set; }
        public String alt { get; set; }
        public String ceus { get; set; }
        public String sponsor { get; set; }
        public String featured { get; set; }
        public String retireDate { get; set; }
        public String cost { get; set; }
    }

    @HttpGet
    global static void getSummitEventsFeed() {
        feedType = RestContext.request.params.get('feedType');

        RestResponse res = RestContext.response;
        String callback = RestContext.request.params.get('callback');
        String serializedJSON = '';

        if (String.isBlank(callback)) {
            res.addHeader('Content-Type', 'application/json');
            callback = '';
        } else {
            res.addHeader('Content-Type', 'application/javascript');
        }

        if (feedType.toLowerCase() == 'courselist') {
            serializedJSON = JSON.serialize(getCapeItems());
            serializedJSON = serializedJSON.replace('"endDate":', '"end":');
        } else if (feedType.equalsIgnoreCase('parameterKey')) {
            serializedJSON = JSON.serialize(getParameterLists());
        }

        if (!String.isBlank(callback)) {
            serializedJSON = callback + '(' + serializedJSON + ')';
        }

        res.responseBody = Blob.valueOf(serializedJSON);
    }

    private static List<capeItem> getCapeItems() {
        List<capeItem> capeItemList = new List<capeItem>();
        RestRequest req = RestContext.request;
        String query = '';
        query += ' SELECT Id, Product2.Id, Product2.Name, Product2.Product_Description__c, Product2.Storefront_Info_Page__c, ' +
                ' Product2.Format__c, Product2.Start_Time__c, Product2.Course_Start_Date__c, Product2.Course_End_Date__c, ' +
                ' Product2.Course_Image__c, Product2.CEU_Amount__c, Product2.Sponsoring_College_School__c, ' +
                ' Product2.Featured_Course__c, Product2.Retire_Date__c, UnitPrice FROM PricebookEntry ' +
                ' WHERE PriceBook2.IsStandard=true ';

        List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();
        pricebookEntries = database.query(query);

        for (PricebookEntry entry : pricebookEntries) {
            capeItem cape = new capeItem();

            cape.id = entry.Product2.Id;

            if (String.isNotBlank(entry.Product2.Name)) {
                cape.title = entry.Product2.Name;
            } else {
                cape.title = '';
            }

            if (String.isNotBlank(entry.Product2.Storefront_Info_Page__c)) {
                cape.link = entry.Product2.Storefront_Info_Page__c;
            } else {
                cape.link = '';
            }

            If (String.isNotBlank(entry.Product2.Format__c)) {
                cape.format = entry.Product2.Format__c;
            } else {
                cape.format = '';
            }

            if (entry.Product2.Start_Time__c != null) {
                cape.startTime = String.valueOf(entry.Product2.Start_Time__c);
            } else {
                cape.startTime = '';
            }

            if (entry.Product2.Course_Start_Date__c != null) {
                cape.startDate = String.valueOf(entry.Product2.Course_Start_Date__c);
            } else {
                cape.startDate = '';
            }

            if (entry.Product2.Course_End_Date__c != null) {
                cape.endDate = String.valueOf(entry.Product2.Course_End_Date__c);
            } else {
                cape.endDate = '';
            }

            if (String.isNotBlank(entry.Product2.Course_Image__c)) {
                cape.image = entry.Product2.Course_Image__c;
            } else {
                cape.image = '';
            }

            if (String.isNotBlank(entry.Product2.Name)) {
                cape.alt = entry.Product2.Name;
            } else {
                cape.alt = '';
            }

            if (entry.Product2.CEU_Amount__c != null) {
                cape.ceus = String.valueOf(entry.Product2.CEU_Amount__c);
            } else {
                cape.ceus = '';
            }

            if (String.isNotBlank(entry.Product2.Sponsoring_College_School__c)) {
                cape.sponsor = entry.Product2.Sponsoring_College_School__c;
            } else {
                cape.sponsor = '';
            }

            if (entry.Product2.Featured_Course__c != null) {
                cape.featured = String.valueOf(entry.Product2.Featured_Course__c);
            } else {
                cape.featured = '';
            }

            if (String.isNotBlank(entry.Product2.Product_Description__c)) {
                cape.description = entry.Product2.Product_Description__c;
            } else {
                cape.description = '';
            }

            if (entry.Product2.Retire_Date__c != null) {
                cape.retireDate = String.valueOf(entry.Product2.Retire_Date__c);
            } else {
                cape.retireDate = '';
            }

            if (entry.UnitPrice != null) {
                cape.cost = String.valueOf(entry.UnitPrice);
            } else {
                cape.cost = '';
            }

            capeItemList.add(cape);
        }

        return capeItemList;
    }

    private class parameterList {
        String parameter;
        String description;
        List<String> options;
    }

    private static List<parameterList> getParameterLists() {
        List<parameterList> allOptions = new List<parameterList>();
        return allOptions;
    }

}