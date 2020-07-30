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
    global static void getCAPEFeed() {
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

        if (String.isNotBlank(feedType)) {
            if (feedType.toLowerCase() == 'courselist') {
                serializedJSON = JSON.serialize(getCapeItems());
                serializedJSON = serializedJSON.replace('"endDate":', '"end":');
            } else if (feedType.equalsIgnoreCase('parameterKey')) {
                serializedJSON = JSON.serialize(getParameterLists());
            }

            if (!String.isBlank(callback)) {
                serializedJSON = callback + '(' + serializedJSON + ')';
            }
        }
        res.responseBody = Blob.valueOf(serializedJSON);
    }

    private static List<capeItem> getCapeItems() {
        List<capeItem> capeItemList = new List<capeItem>();
        RestRequest req = RestContext.request;
        String query = '';
        String sortBy = '';
        String format = '';
        String filter = '';
        String sponsor = '';
        Integer months = 0;
        String viewStart = '';
        String viewEnd = '';
        Boolean retired = false;

        if (String.isNotBlank(req.params.get('filter'))) {
            filter = String.escapeSingleQuotes(RestContext.request.params.get('filter').trim());
        }

        if (String.isNotBlank(req.params.get('sort'))) {
            sortBy = String.escapeSingleQuotes(RestContext.request.params.get('sort').trim());
        }

        if (String.isNotBlank(req.params.get('format'))) {
            format = String.escapeSingleQuotes(RestContext.request.params.get('format').trim());
        }

        if (String.isNotBlank(req.params.get('sponsor'))) {
            sponsor = String.escapeSingleQuotes(RestContext.request.params.get('sponsor').trim());
        }

        if (String.isNotBlank(req.params.get('months'))) {
            months = Integer.valueOf(String.escapeSingleQuotes(RestContext.request.params.get('months').trim()));
        }

        if (String.isNotBlank(req.params.get('viewstart'))) {
            viewStart = String.escapeSingleQuotes(RestContext.request.params.get('viewstart').trim());
            Date viewStartDate = Date.parse(viewStart);
            viewStart = String.valueOf(viewStartDate);
        }

        if (String.isNotBlank(req.params.get('viewend'))) {
            viewEnd = String.escapeSingleQuotes(RestContext.request.params.get('viewend').trim());
            Date viewEndDate = Date.parse(viewEnd);
            viewEnd = String.valueOf(viewEndDate);
        }

//        if (String.isBlank(viewStart)) {
//            viewStart = String.valueOf(Date.today().addMonths(-1));
//        }
//
//        if (String.isBlank(viewEnd)) {
//            viewEnd = String.valueOf(Date.today().addMonths(1));
//        }
//

        if (String.isNotBlank(req.params.get('retired'))) {
            retired = Boolean.valueOf(String.escapeSingleQuotes(RestContext.request.params.get('retired').trim()));
        }

        if (months != 0) {
            if (months < 0) {
                Date monthsOut = Date.today().addMonths(months);
                viewEnd = String.valueOf(Date.today());
                viewStart = String.valueOf(monthsOut);
            } else {
                Date monthsOut = Date.today().addMonths(months);
                viewEnd = String.valueOf(monthsOut);
                viewStart = String.valueOf(Date.today());
            }
        }

        query += ' SELECT Id, Product2.Id, Product2.Name, Product2.Product_Description__c, Product2.Storefront_Info_Page__c, ' +
                ' Product2.Format__c, Product2.Start_Time__c, Product2.Course_Start_Date__c, Product2.Course_End_Date__c, ' +
                ' Product2.Course_Image__c, Product2.CEU_Amount__c, Product2.Sponsoring_College_School__c, ' +
                ' Product2.Featured_Course__c, Product2.Retire_Date__c, UnitPrice ';
        query += ' FROM PricebookEntry ';
        query += ' WHERE PriceBook2.IsStandard = true ';

        if (!retired) {
            query += ' AND Product2.Retire_Date__c >= ' + String.valueOf(Date.today()) + ' ';
        }

        System.debug(viewStart + '  ? ' + viewEnd);

        if (String.isNotBlank(viewStart)) {
            query += ' AND Product2.Course_Start_Date__c >= ' + viewStart + ' ';
        }

        if (String.isNotBlank(viewEnd)) {
            query += ' AND Product2.Course_End_Date__c <= ' + viewEnd + ' ';
        }

        if (String.isNotBlank(format)) {
            query += 'AND (' + createMultiLikeStatement(format, 'Product2.Format__c', 'equal') + ') ';
        }

        if (String.isNotBlank(filter)) {
            query += 'AND (' + createMultiLikeStatement(filter, 'Product2.Name', 'like') + ') ';
        }

        if (String.isNotBlank(sponsor)) {
            query += 'AND (' + createMultiLikeStatement(sponsor, 'Product2.Sponsoring_College_School__c', 'equal') + ') ';
        }

        List<PricebookEntry> pricebookEntries = new List<PricebookEntry>();

        System.debug(query);


        pricebookEntries = database.query(query);

        for (PricebookEntry entry : pricebookEntries) {
            capeItem cape = new capeItem();

            cape.id = entry.Product2.Id;

            if (String.isNotBlank(entry.Product2.Name)) {
                cape.title = entry.Product2.Name;
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


    private static List<String> getObjectItemList(Schema.DescribeFieldResult fieldResult) {
        List<String> fieldMap = new List<String>();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f : ple) {
            fieldMap.add(f.getValue());
        }
        return fieldMap;
    }

    private static parameterList makeOption(String options, List<String> items, String description) {
        parameterList newOption = new parameterList();
        newOption.parameter = options;
        newOption.description = description;
        newOption.options = items;
        return newOption;
    }

    private static String createMultiLikeStatement(String listIn, String objFieldName, String likeOrEqual) {
        String listOut = '';
        if (String.isNotBlank(listIn)) {
            List<String> listInList = new List<String>();
            listInList = listIn.split(',');
            for (String listItem : listInList) {
                if (likeOrEqual.equalsIgnoreCase('like')) {
                    listOut += ' ( ' + objFieldName + ' LIKE \'%' + String.escapeSingleQuotes(listItem.trim()) + '%\' ) OR ';
                } else {
                    listOut += ' ( ' + objFieldName + ' = \'' + String.escapeSingleQuotes(listItem.trim()) + '\' ) OR ';
                }
            }
            listOut = listOut.removeEnd(' OR ');
        }
        return listOut;
    }


    private static List<parameterList> getParameterLists() {
        List<parameterList> allOptions = new List<parameterList>();

        allOptions.add(makeOption('feedType', new List<String>{
                'courselist', 'parameterKey'
        }, 'Must be included to get any feed (&feedType= one of these items)'));

        //View start
        allOptions.add(makeOption('viewStart', new List<String>{
                Date.today().addMonths(-1).format()
        }, 'The date scope of the feed start. Defaults to current month -1. (&viewStart=)'));

        //View end
        allOptions.add(makeOption('viewEnd', new List<String>{
                Date.today().addMonths(1).format()
        }, 'The date scope of the feed end. Defaults to current month +1. (&viewEnd=)'));

        //Month
        allOptions.add(makeOption('months', new List<String>{
                'Integer'
        }, 'Can be a positive or negative number. This will adjust the amount of months of available courses listed to include the current date to the addition of months signified by the integer given.'));

        //filter
        allOptions.add(makeOption('filter', new List<String>{
                'Name'
        }, 'Filter searches CAPE course title names for like matches of provided filter. Can be a comma separated list of filter keywords.'));

        //sponsor
        allOptions.add(makeOption('sponsor', getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe()), 'Filters on sponsoring school (&sponsor= single or coma separated list of these items)'));

        //format
        allOptions.add(makeOption('format', getObjectItemList(Product2.Format__c.getDescribe()), 'Filters on learning format (&format= single or coma separated list of these items)'));

        //retired
        allOptions.add(makeOption('retired', new List<String>{
                'true', 'false'
        }, '&retired=true. Defaults to false if not passed. Will show retired courses if set to true. Otherwise only course that are not retired after the current date will show.'));


        return allOptions;
    }
}