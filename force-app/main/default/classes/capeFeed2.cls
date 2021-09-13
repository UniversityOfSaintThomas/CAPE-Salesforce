// Copyright 2020 University of St. Thomas - Minnesota. All rights reserved.
// Use of this source code is governed by a BSD Revised
// license that can be found in the LICENSE file.
// Created by Thaddaeus Dahlberg on 07/07/2018.

@RestResource(UrlMapping='/capefeed2/*')

// https://stthomas.force.com/applicantportal/services/apexrest/capefeed?feedType=courselist

global with sharing class capeFeed2 {

    private static String feedType { get; set; }
    private static Integer pageSize { get; set; }
    private static Integer pageNum { get; set; }
    private static Boolean pagNumParameterExists { get; set; }
    private static String orderBy { get; set; }
    private static String format { get; set; }
    private static String subject { get; set; }
    private static String featured { get; set; }
    private static String filter { get; set; }
    private static String sponsor { get; set; }
    private static Integer months { get; set; }
    private static String viewStart { get; set; }
    private static String viewEnd { get; set; }
    private static Boolean retired { get; set; }

    public class results {
        public links links { get; set; }
        public meta meta { get; set; }
        public List<data> data { get; set; }
    }

    public class links {
        public String self { get; set; }
        public String first { get; set; }
        public String prev { get; set; }
        public String next { get; set; }
        public String last { get; set; }
        public String query { get; set; }
    }

    public class meta {
        public Integer totalPages { get; set; }
        public Integer totalResults { get; set; }
        public Integer pageSize { get; set; }
    }

    private class parameterItem {
        public String parameter;
        public String description;
        public String example;
        public List<String> options;
    }

    private class data {
        public String id { get; set; }
        public String title { get; set; }
        public String description { get; set; }
        public String link { get; set; }
        public String format { get; set; }
        public String subject { get; set; }
        public String startTime { get; set; }
        public String startDate { get; set; }
        public String endDate { get; set; }
        public String image { get; set; }
        public String alt { get; set; }
        public String ceus { get; set; }
        public String sponsor { get; set; }
        public String featured { get; set; }
        public String featureDate { get; set; }
        public String retireDate { get; set; }
        public String cost { get; set; }
        public String startDetails { get; set; }
    }

    @HttpGet
    global static void getCAPEFeed() {
        RestResponse res = RestContext.response;
        RestRequest req = RestContext.request;
        String callback = req.params.get('callback');
        String serializedJSON = '';
        pageSize = 10;
        pageNum = 1;
        pagNumParameterExists = false;

        if (String.isBlank(callback)) {
            res.addHeader('Content-Type', 'application/json');
            callback = '';
        } else {
            res.addHeader('Content-Type', 'application/javascript');
        }

        feedType = RestContext.request.params.get('feedType');

        if (String.isNotBlank(feedType)) {

            if (String.isNotBlank(req.params.get('filter'))) {
                filter = String.escapeSingleQuotes(RestContext.request.params.get('filter').trim());
            }

            if (String.isNotBlank(req.params.get('sort'))) {
                orderBy = String.escapeSingleQuotes(RestContext.request.params.get('sort').trim());
            } else {
                orderBy = 'name_asc';
            }

            if (String.isNotBlank(req.params.get('format'))) {
                format = String.escapeSingleQuotes(RestContext.request.params.get('format').trim());
            }

            if (String.isNotBlank(req.params.get('subject'))) {
                subject = String.escapeSingleQuotes(RestContext.request.params.get('subject').trim());
            }

            if (String.isNotBlank(req.params.get('featured'))) {
                featured = String.escapeSingleQuotes(RestContext.request.params.get('featured').trim());
            }

            if (String.isNotBlank(req.params.get('sponsor'))) {
                sponsor = String.escapeSingleQuotes(RestContext.request.params.get('sponsor').trim());
            }

            if (String.isNotBlank(req.params.get('months'))) {
                months = Integer.valueOf(String.escapeSingleQuotes(RestContext.request.params.get('months').trim()));
            } else {
                months = 0;
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


            if (String.isNotBlank(req.params.get('retired'))) {
                retired = Boolean.valueOf(String.escapeSingleQuotes(RestContext.request.params.get('retired').trim()));
            } else {
                retired = false;
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

            if (String.isNotBlank(req.params.get('page'))) {
                try {
                    pageNum = Integer.valueOf(req.params.get('page'));
                    pagNumParameterExists = true;
                } catch (Exception e) {
                    System.debug(e.getMessage());
                }
            }

            if (String.isNotBlank(req.params.get('pagesize'))) {
                try {
                    pageSize = Integer.valueOf(req.params.get('pagesize'));
                } catch (Exception e) {
                    System.debug(e.getMessage());
                }
            }


            feedType = feedType.toLowerCase();
            switch on feedType {
                when 'courselist' {
                    serializedJSON = JSON.serialize(getCapeItems());
                    serializedJSON = serializedJSON.replace('"endDate":', '"end":');
                }
                when 'parameterkey' {
                    serializedJSON = JSON.serialize(getParameterLists());
                }
                when 'sponsorlist' {
                    serializedJSON = JSON.serialize(getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe()));
                }
                when 'formatlist' {
                    serializedJSON = JSON.serialize(getObjectItemList(Product2.Format__c.getDescribe()));
                }
                when 'subjectlist' {
                    serializedJSON = JSON.serialize(getObjectItemList(Product2.Subject_Area__c.getDescribe()));
                }
                when else {
                    serializedJSON = feedType;
                }
            }
        }
        res.responseBody = Blob.valueOf(serializedJSON);
    }

    private static results getCapeItems() {
        List<data> dataIn = new List<data>();
        String resultQuery = '';
        String limitQuery = '';
        String orderByQuery = '';

        String resultCountQuery = 'SELECT Count() FROM PricebookEntry';

        resultQuery += ' SELECT Id, Product2.Id, Product2.Name, Product2.Product_Description__c, Product2.Storefront_Info_Page__c, ' +
                ' Product2.Format__c, Product2.Start_Time__c, Product2.Course_Start_Date__c, Product2.Course_End_Date__c, ' +
                ' Product2.Course_Image__c, Product2.CEU_Amount__c, Product2.Sponsoring_College_School__c, Product2.Feature_date__c, Product2.Subject_Area__c, ' +
                ' Product2.Featured_Course__c, Product2.Retire_Date__c, UnitPrice, Product2.No_of_Meetings_Start_Details__c ';
        resultQuery += ' FROM PricebookEntry ';

        //WHERE section of all SOQL queries
        String whereQuery = '';
        whereQuery += ' WHERE PriceBook2.IsStandard = true ';
        whereQuery += ' AND Product2.IsActive = true ';
        if (!retired) {
            whereQuery += ' AND ( Product2.Retire_Date__c >= ' + String.valueOf(Date.today()) + ' OR Product2.Retire_Date__c = null)';
        }

        System.debug(viewStart + '  ? ' + viewEnd);

        if (String.isNotBlank(viewStart)) {
            whereQuery += ' AND Product2.Course_Start_Date__c >= ' + viewStart + ' ';
        }

        if (String.isNotBlank(viewEnd)) {
            whereQuery += ' AND Product2.Course_End_Date__c <= ' + viewEnd + ' ';
        }

        if (String.isNotBlank(format)) {
            whereQuery += ' AND (' + createMultiLikeStatement(format, 'Product2.Format__c', 'equal') + ') ';
        }

        if (String.isNotBlank(filter)) {
            whereQuery += ' AND (' + createMultiLikeStatement(filter, 'Product2.Name', 'like') + ') ';
        }

        if (String.isNotBlank(sponsor)) {
            whereQuery += ' AND (' + createMultiLikeStatement(sponsor, 'Product2.Sponsoring_College_School__c', 'equal') + ') ';
        }

        if (String.isNotBlank(subject)) {
            whereQuery += ' AND ( ' + createMultiLikeStatement(subject, 'Product2.Subject_Area__c', 'includes') + ' ) ';
        }

        if (String.isNotBlank(featured)) {
            Boolean isFeatured = false;
            try {
                isFeatured = Boolean.valueOf(featured);
            } catch (Exception e) {

            }
            if (isFeatured) {
                whereQuery += ' AND ( Product2.Featured_Course__c = true AND ( Product2.Feature_date__c <= ' + String.valueOf(Date.today()) + ' OR Product2.Feature_date__c = null ) )';
            }
        }


        orderBy = orderBy.toLowerCase();
        switch on orderBy {
            when 'name_dec' {
                orderByQuery = ' ORDER BY Product2.Name DESC';
            }
            when 'featured' {
                orderByQuery = ' ORDER BY Product2.Featured_Course__c ASC NULLS LAST, Product2.Name ASC  ';
            }
            when 'featured_date' {
                orderByQuery = ' ORDER BY Product2.Feature_Date__c ASC NULLS LAST, Product2.Featured_Course__c ASC NULLS LAST, Product2.Name  ';
            }
            when 'start_date_dec' {
                orderByQuery = ' ORDER BY Product2.Course_Start_Date__c DESC NULLS LAST, Product2.Name ASC ';
            }
            when 'start_date_asc' {
                orderByQuery = ' ORDER BY Product2.Course_Start_Date__c ASC NULLS LAST, Product2.Name ASC';
            }
            when else {
                orderByQuery = ' ORDER BY Product2.Name ASC';
            }
        }

        if (pageNum <= 1) {
            limitQuery = ' LIMIT ' + pageSize;
        } else {
            limitQuery = ' LIMIT ' + pageSize + ' OFFSET ' + pageSize * (pageNum - 1);
        }


        resultCountQuery += whereQuery ;
        resultQuery += whereQuery + orderByQuery + limitQuery;

        List<PricebookEntry> pricebookEntries = Database.query(resultQuery);
        Integer totalRecords = Database.countQuery(resultCountQuery);

        for (PricebookEntry entry : pricebookEntries) {
            data dataItem = new data();

            //Apply data values blank strings not null if data not present
            dataItem.id = entry.Product2.Id;
            dataItem.title = String.isNotBlank(entry.Product2.Name) ? entry.Product2.Name : '';
            dataItem.link = String.isNotBlank(entry.Product2.Storefront_Info_Page__c) ? entry.Product2.Storefront_Info_Page__c : '';
            dataItem.format = String.isNotBlank(entry.Product2.Format__c) ? entry.Product2.Format__c : '';
            dataItem.startTime = entry.Product2.Start_Time__c != null ? String.valueOf(entry.Product2.Start_Time__c) : '';
            dataItem.startDate = entry.Product2.Course_Start_Date__c != null ? String.valueOf(entry.Product2.Course_Start_Date__c) : '';
            dataItem.endDate = entry.Product2.Course_End_Date__c != null ? String.valueOf(entry.Product2.Course_End_Date__c) : '';
            dataItem.alt = String.isNotBlank(entry.Product2.Name) ? entry.Product2.Name : '';
            dataItem.ceus = entry.Product2.CEU_Amount__c != null ? String.valueOf(entry.Product2.CEU_Amount__c) : '';
            dataItem.sponsor = String.isNotBlank(entry.Product2.Sponsoring_College_School__c) ? entry.Product2.Sponsoring_College_School__c : '';
            dataItem.startDetails = String.isNotBlank(entry.Product2.No_of_Meetings_Start_Details__c) ? entry.Product2.No_of_Meetings_Start_Details__c : '';
            dataItem.featured = entry.Product2.Featured_Course__c != null ? String.valueOf(entry.Product2.Featured_Course__c) : '';
            dataItem.description = String.isNotBlank(entry.Product2.Product_Description__c) ? entry.Product2.Product_Description__c : '';
            dataItem.retireDate = entry.Product2.Retire_Date__c != null ? String.valueOf(entry.Product2.Retire_Date__c) : '';
            dataItem.cost = entry.UnitPrice != null ? String.valueOf(entry.UnitPrice) : '';
            dataItem.subject = entry.Product2.Subject_Area__c != null ? String.valueOf(entry.Product2.Subject_Area__c) : '';
            dataItem.featureDate = entry.Product2.Feature_Date__c != null ? String.valueOf(entry.Product2.Feature_Date__c) : '';

            //parse out the image from a rich text field
            if (String.isNotBlank(entry.Product2.Course_Image__c)) {
                String IMG_SRC_PATTERN = 'src="([^"]+)"';
                Pattern p = Pattern.compile(IMG_SRC_PATTERN);
                Matcher m = p.matcher(entry.Product2.Course_Image__c);
                String imageSrc = '';
                if (m.find()) {
                    imageSrc = m.group(1);
                }
                imageSrc = imageSrc.replaceAll('&amp;', '&');
                if (String.isNotBlank(imageSrc)) {
                    String domain = Url.getSalesforceBaseUrl().toExternalForm();
                    if (!imageSrc.containsIgnoreCase('https://' + domain)) {
                        imageSrc = domain + imageSrc;
                    }
                }
                dataItem.image = imageSrc;
            } else {
                dataItem.image = '';
            }

            dataIn.add(dataItem);
        }
        results resultsOut = new results();
        resultsOut.data = dataIn;

        meta metaOut = new meta();
        metaOut.totalResults = totalRecords;
        metaOut.pageSize = pageSize;
        if (totalRecords / pageSize > 0) {
            if (Math.mod(totalRecords, pageSize) > 0) {
                metaOut.totalPages = totalRecords / pageSize + 1;
            } else {
                metaOut.totalPages = totalRecords / pageSize;
            }
        } else {
            metaOut.totalPages = 1;
        }
        resultsOut.meta = metaOut;

        links linksOut = new links();
        linksOut.query = resultQuery;
        String restRequestURL = Url.getSalesforceBaseUrl().toExternalForm();
        RestRequest req = RestContext.request;
        restRequestURL = restRequestURL + '/applicantportal/services/apexrest' + req.requestURI + '?';
        linksOut.self = linksOut.first = linksOut.next = linksOut.prev = linksOut.last = restRequestURL;

        //remove page from the url
        for (String s : req.params.keySet()) {
            if (!s.equalsIgnoreCase('page')) {
                linksOut.self = linksOut.first = linksOut.next = linksOut.prev = linksOut.last += +s + '=' + req.params.get(s) + '&';
            }
        }

        if (metaOut.totalPages == 1) {
            linksOut.self = linksOut.first = linksOut.next = linksOut.prev = linksOut.last += 'page=1';
        } else {

            linksOut.first += 'page=1';
            linksOut.self += 'page=' + pageNum;
            linksOut.last += 'page=' + metaOut.totalPages;

            if (pageNum < metaOut.totalPages) {
                linksOut.next += 'page=' + (pageNum + 1);
            } else {
                linksOut.next += 'page=' + pageNum ;
            }

            if (pageNum != 1) {
                linksOut.prev += 'page=' + (pageNum - 1);
            } else {
                linksOut.prev += 'page=' + pageNum;
            }
        }

        resultsOut.links = linksOut;

        return resultsOut;
    }

    private static List<String> getObjectItemList(Schema.DescribeFieldResult fieldResult) {
        List<String> fieldMap = new List<String>();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for (Schema.PicklistEntry f : ple) {
            fieldMap.add(f.getValue());
        }
        return fieldMap;
    }

    private static parameterItem makeOption(String options, List<String> items, String description, String exampleUrl) {
        parameterItem newOption = new parameterItem();
        newOption.parameter = options;
        newOption.description = description;
        newOption.options = items;
        newOption.example = exampleUrl;
        return newOption;
    }

    private static String createMultiLikeStatement(String listIn, String objFieldName, String type) {
        String queryOut = '';
        if (String.isNotBlank(listIn)) {
            List<String> listInList = new List<String>();
            if (type.equalsIgnoreCase('includes')) {
                queryOut += objFieldName + ' INCLUDES(';
            }
            listInList = listIn.split(',');
            for (String listItem : listInList) {
                if (type.equalsIgnoreCase('like')) {
                    queryOut += ' ( ' + objFieldName + ' LIKE \'%' + String.escapeSingleQuotes(listItem.trim()) + '%\' ) OR ';
                } else if (type.equalsIgnoreCase('includes')) {
                    queryOut += '\'' + String.escapeSingleQuotes(listItem.trim()) + '\',';
                } else {
                    queryOut += ' ( ' + objFieldName + ' = \'' + String.escapeSingleQuotes(listItem.trim()) + '\' ) OR ';
                }
            }

            if (type.equalsIgnoreCase('includes')) {
                queryOut = queryOut.removeEnd(',');
                queryOut += ')';
            } else {
                queryOut = queryOut.removeEnd(' OR ');
            }
        }
        return queryOut;
    }


    private static List<parameterItem> getParameterLists() {
        String restRequestURL = Url.getSalesforceBaseUrl().toExternalForm();
        RestRequest req = RestContext.request;
        restRequestURL += '/applicantportal/services/apexrest' + req.requestURI + '?feedType=';
        List<parameterItem> allOptions = new List<parameterItem>();

        allOptions.add(makeOption(
                '?feedType',
                new List<String>{
                        'courselist',
                        'parameterkey',
                        'sponsorlist',
                        'formatlist',
                        'subjectlist'
                },
                'Define as first part of url to determine API feed type. courselist: list of courses; parameterkey: API key for understanding the feed; sponsorlist: list of sponsors available to query, formatlist: list of formats available to query; subjectlist: list of subjects available to query. ',
                restRequestURL + 'courselist')
        );

        allOptions.add(makeOption(
                '?feedType=courselist',
                new List<String>{
                        'all other filtering options listed in key that are not feedtype.'
                },
                'List of all courses that have not reached their retired date.',
                restRequestURL + 'courselist')
        );

        allOptions.add(makeOption(
                '?feedType=parameterkey',
                new List<String>{
                },
                'This API parameter key instructions.',
                restRequestURL + 'parameterkey')
        );

        allOptions.add(makeOption(
                '?feedType=sponsorlist',
                new List<String>{
                },
                'List of all sponsors you can use in the sponsor parameter.',
                restRequestURL + 'sponsorlist')
        );

        allOptions.add(makeOption(
                '?feedType=formatlist',
                new List<String>{
                },
                'List of all formats you can use in the format parameter.',
                restRequestURL + 'formatlist')
        );

        allOptions.add(makeOption(
                '?feedType=subjectlist',
                new List<String>{
                },
                'List of all subject you can use in the subject parameter.',
                restRequestURL + 'subjectlist')
        );

        restRequestURL += 'courselist';
        allOptions.add(makeOption(
                'pagesize',
                new List<String>(),
                'Integer of the amount of results you want to receive for each page of results.',
                restRequestURL + '&pagesize=2')
        );

        allOptions.add(makeOption(
                'page',
                new List<String>(),
                'Integer of which page of results you wish to receive out of all pages.',
                restRequestURL + '&page=2')
        );

        allOptions.add(makeOption(
                'viewStart',
                new List<String>{
                        Date.today().addMonths(-1).format()
                },
                'The date scope of the feed start. Defaults to current month -1.',
                restRequestURL + '&viewStart=' + String.valueOf(Date.today().addMonths(-1).format()))
        );

        allOptions.add(makeOption(
                'viewEnd',
                new List<String>{
                        Date.today().addMonths(+1).format()
                },
                'The date scope of the feed end.',
                restRequestURL + '&viewEnd=' + String.valueOf(Date.today().addMonths(+1).format()))
        );

        allOptions.add(makeOption(
                'months',
                new List<String>{
                        'Integer'
                },
                'Can be a positive or negative number. This will adjust the amount of months of available courses listed to include the current date to the addition of months signified by the integer given.',
                restRequestURL + '&months=5')
        );

        allOptions.add(makeOption(
                'sort',
                new List<String>{
                        'name_asc', 'name_dec', 'featured', 'featured_date', 'start_date_dec', 'start_date_asc'
                },
                'Changes the order of results displayed.',
                restRequestURL + '&sort=5')
        );

        allOptions.add(makeOption(
                'filter',
                new List<String>{
                        'String'
                },
                'Filter searches CAPE course title names for like matches of provided filter. Can be a comma separated list of filter keywords.',
                restRequestURL + '&filter=Healthcare')
        );

        allOptions.add(makeOption(
                'sponsor',
                getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe()),
                'Filters on sponsoring school (&sponsor= single or coma separated list of these items)',
                restRequestURL + '&sponsor=' + EncodingUtil.urlEncode(getObjectItemList(Product2.Sponsoring_College_School__c.getDescribe())[0], 'UTF-8'))
        );

        allOptions.add(makeOption(
                'format',
                getObjectItemList(Product2.Format__c.getDescribe()),
                'Filters on learning format (&format= single or coma separated list of these items)',
                restRequestURL + '&format=' + EncodingUtil.urlEncode(getObjectItemList(Product2.Format__c.getDescribe())[0], 'UTF-8'))
        );

        allOptions.add(makeOption(
                'subject',
                getObjectItemList(Product2.Subject_Area__c.getDescribe()),
                'Filters on learning subject (&subject= single or coma separated list of these items)',
                restRequestURL + '&subject=' + EncodingUtil.urlEncode(getObjectItemList(Product2.Subject_Area__c.getDescribe())[0], 'UTF-8'))
        );

        allOptions.add(makeOption(
                'featured',
                new List<String>{
                        'true', 'false'
                },
                'Displays featured courses',
                restRequestURL + '&featured=true')
        );

        return allOptions;
    }
}