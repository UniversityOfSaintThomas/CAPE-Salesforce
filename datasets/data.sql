BEGIN TRANSACTION;
CREATE TABLE "Pricebook2" (
	sf_id VARCHAR(255) NOT NULL, 
	"Name" VARCHAR(255), 
	"Description" VARCHAR(255), 
	"IsActive" VARCHAR(255),
	"IsStandard" VARCHAR(255),
	record_type VARCHAR(255),
	PRIMARY KEY (sf_id)
);
INSERT INTO "Pricebook2" VALUES('01s0R000002U5HrQAK','Standard Price Book','','true','true',NULL);
CREATE TABLE "PricebookEntry" (
	sf_id VARCHAR(255) NOT NULL,
	"Name" VARCHAR(255),
	"IsActive" VARCHAR(255), 
	"Pricebook2Id" VARCHAR(255), 
	"Product2Id" VARCHAR(255),
	"ProductCode" VARCHAR(255), 
	"UnitPrice" VARCHAR(255), 
	"UseStandardPrice" VARCHAR(255), 
	record_type VARCHAR(255), 
	PRIMARY KEY (sf_id)
);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099563QAA','','true','01s0R000002U5HpQAK','01t0R00000789cyQAA','','25000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099564QAA','','true','01s0R000002U5HpQAK','01t0R00000789czQAA','','5000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099565QAA','','true','01s0R000002U5HpQAK','01t0R000006mODPQA2','','85000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099566QAA','','true','01s0R000002U5HpQAK','01t0R000006mODQQA2','','20000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099567QAA','','true','01s0R000002U5HpQAK','01t0R000006mODRQA2','','50000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099568QAA','','true','01s0R000002U5HpQAK','01t0R000006mODSQA2','','40000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R0000099569QAA','','true','01s0R000002U5HpQAK','01t0R000006mODTQA2','','15000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956AQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODUQA2','','120000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956BQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODVQA2','','100000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956CQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODWQA2','','10000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956DQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODXQA2','','75000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956EQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODYQA2','','5000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956FQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODZQA2','','30000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956GQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODaQAM','','35000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956HQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODbQAM','','20000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956IQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODcQAM','','150000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956JQAQ','','true','01s0R000002U5HpQAK','01t0R000006mODdQAM','','50000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956KQAQ','','true','01s0R000002U5HqQAK','01t0R00000789cyQAA','','25000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956LQAQ','','true','01s0R000002U5HqQAK','01t0R00000789czQAA','','5000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956MQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODPQA2','','85000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956NQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODQQA2','','20000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956OQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODRQA2','','50000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956PQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODSQA2','','40000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956QQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODTQA2','','15000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956RQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODUQA2','','120000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956SQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODVQA2','','100000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956TQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODWQA2','','10000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956UQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODXQA2','','75000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956VQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODYQA2','','5000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956WQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODZQA2','','30000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956XQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODaQAM','','35000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956YQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODbQAM','','20000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956ZQAQ','','true','01s0R000002U5HqQAK','01t0R000006mODcQAM','','150000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000009956aQAA','','true','01s0R000002U5HqQAK','01t0R000006mODdQAM','','50000.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpOQAU','Autism Spectrum Disorder: Evidence-Based Practices','true','01s0R000002U5HrQAK','01t0R000006mOHrQAM','202002-ASD','50.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpPQAU','Catholic Social Thought for Church Managers','true','01s0R000002U5HrQAK','01t0R000006mOHqQAM','202002-CST','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpQQAU','Cultural Competency for K12 Educators - April 15 - April 29, 2020','true','01s0R000002U5HrQAK','01t0R000006mOHzQAM','20200415-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpRQAU','Cultural Competency for K12 Educators - August 05 - August 26, 2020','true','01s0R000002U5HrQAK','01t0R000006mOIFQA2','20200812-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpSQAU','Cultural Competency for K12 Educators - August 7-21, 2019','true','01s0R000002U5HrQAK','01t0R000006mOHuQAM','20190807-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpTQAU','Cultural Competency for K12 Educators - February 12-26, 2020','true','01s0R000002U5HrQAK','01t0R000006mOHmQAM','20200212-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpUQAU','Cultural Competency for K12 Educators - January 15-29, 2020','true','01s0R000002U5HrQAK','01t0R000006mOHpQAM','20200115-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpVQAU','Cultural Competency for K12 Educators - July 08 - July 29 2020','true','01s0R000002U5HrQAK','01t0R000006mOIEQA2','20200715-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpWQAU','Cultural Competency for K12 Educators - July 17-31, 2019','true','01s0R000002U5HrQAK','01t0R000006mOHsQAM','20190717-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpXQAU','Cultural Competency for K12 Educators - July 31st, 2019','true','01s0R000002U5HrQAK','01t0R000006mOHtQAM','20190731-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpYQAU','Cultural Competency for K12 Educators - June 17 - July 8, 2020','true','01s0R000002U5HrQAK','01t0R000006mOI1QAM','20200617-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpZQAU','Cultural Competency for K12 Educators - March 18 - April 1, 2020','true','01s0R000002U5HrQAK','01t0R000006mOHnQAM','20200318-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpaQAE','Cultural Competency for K12 Educators - May 13 - May 27, 2020','true','01s0R000002U5HrQAK','01t0R000006mOI0QAM','20200513-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpbQAE','Cultural Competency for K12 Educators - Oct 16-30, 2019','true','01s0R000002U5HrQAK','01t0R000006mOHvQAM','20191016-CulComp','249.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpcQAE','Gerrymandering at the Supreme Court','true','01s0R000002U5HrQAK','01t0R000006mOHoQAM','SELIM202002Gerrymandering','15.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpdQAE','Leading Effective Online Meetings','true','01s0R000002U5HrQAK','01t0R000006mOI2QAM','202004-LEVM','25.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpeQAE','Managing Remote Employees','true','01s0R000002U5HrQAK','01t0R000006mOI6QAM','202006-MRE','25.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpfQAE','Mental Health and the Remote Worker','true','01s0R000002U5HrQAK','01t0R000006mOI5QAM','202006-MHRW','25.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpgQAE','Mini Master in Business Analysis','true','01s0R000002U5HrQAK','01t0R000006mOHwQAM','ENGR202003MMBA','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZphQAE','Mini Master in Business Analysis','true','01s0R000002U5HrQAK','01t0R000006mOI7QAM','ENGR202006MMBA','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpiQAE','Mini Master in Business Analysis','true','01s0R000002U5HrQAK','01t0R000006mOI8QAM','ENGR202010MMBA','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpjQAE','Mini Master of Big Data & Artificial Intelligence','true','01s0R000002U5HrQAK','01t0R000006mOHxQAM','ENGR202003MMAI','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpkQAE','Mini Master of Big Data & Artificial Intelligence','true','01s0R000002U5HrQAK','01t0R000006mOI9QAM','ENGR202010MMAI','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZplQAE','Mini Master of Big Data & Artificial Intelligence','true','01s0R000002U5HrQAK','01t0R000006mOIAQA2','ENGR202006MMAI','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpmQAE','Mini Master of Information Technology','true','01s0R000002U5HrQAK','01t0R000006mOHyQAM','ENGR202003MMIT','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpnQAE','Mini Master of Information Technology','true','01s0R000002U5HrQAK','01t0R000006mOIBQA2','ENGR202010MMIT','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpoQAE','Mini Master of Information Technology','true','01s0R000002U5HrQAK','01t0R000006mOICQA2','ENGR202006MMIT','2495.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZppQAE','Practical Strategies for Working Remotely','true','01s0R000002U5HrQAK','01t0R000006mOI4QAM','202006-PSWR','25.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpqQAE','Simpler (and Smarter) DIY Videos','true','01s0R000002U5HrQAK','01t0R000006mOIHQA2','202006-DIYV','199.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZprQAE','Teaching Live, Online!','true','01s0R000002U5HrQAK','01t0R000006mOI3QAM','202004-TLO','25.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZpsQAE','Testing Product','true','01s0R000002U5HrQAK','01t0R000006mOIDQA2','TESTPROD','0.0','false',NULL);
INSERT INTO "PricebookEntry" VALUES('01u0R000008uZptQAE','The Art of Sales Persuasion','true','01s0R000002U5HrQAK','01t0R000006mOIGQA2','202006-ASP','325.0','false',NULL);
CREATE TABLE "Product2" (
	sf_id VARCHAR(255) NOT NULL,
	"Name" VARCHAR(255),
	"Activity_Code__c" VARCHAR(255),
	"CEU_Amount__c" VARCHAR(255),
	"Course_End_Date__c" VARCHAR(255),
	"Course_Image__c" VARCHAR(255),
	"Course_Start_Date__c" VARCHAR(255),
	"Description" VARCHAR(255),
	"DisplayUrl" VARCHAR(255),
	"Enrollment_Target__c" VARCHAR(255),
	"ExternalDataSourceId" VARCHAR(255),
	"ExternalId" VARCHAR(255),
	"Family" VARCHAR(255),
	"Featured_Course__c" VARCHAR(255),
	"Format__c" VARCHAR(255),
	"In_Person_Meetings__c" VARCHAR(255),
	"Index_Code__c" VARCHAR(255),
	"IsActive" VARCHAR(255),
	"Product_Description__c" VARCHAR(255),
	"Product_SKU_Number__c" VARCHAR(255),
	"Product_Source__c" VARCHAR(255),
	"ProductCode" VARCHAR(255),
	"QuantityUnitOfMeasure" VARCHAR(255),
	"Retire_Date__c" VARCHAR(255),
	"Sponsoring_College_School__c" VARCHAR(255),
	"Start_Time__c" VARCHAR(255),
	"StockKeepingUnit" VARCHAR(255),
	"Storefront_Info_Page__c" VARCHAR(255),
	"Summary_Display_Name__c" VARCHAR(255),
	record_type VARCHAR(255),
	PRIMARY KEY (sf_id)
);
INSERT INTO "Product2" VALUES('01t0R000006mOHmQAM','Cultural Competency for K12 Educators - February 12-26, 2020','150006','16.0','2020-02-26','','2020-02-12','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 8 CEUs:
Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','','false','Online: Instructor-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200212-CulComp','','20200212-CulComp','','2020-02-12','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---february-12-26-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHnQAM','Cultural Competency for K12 Educators - March 18 - April 1, 2020','150007','16.0','2020-04-01','','2020-03-18','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 8 CEUs:
Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','Online: Instructor-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200318-CulComp','','20200318-CulComp','','2020-03-18','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---march-18---april-1-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHoQAM','Gerrymandering at the Supreme Court','','','','','','The deliberate drawing of electoral districts for partisan advantage that we often call gerrymandering is not new, but the emergence of large voter datasets manipulated by powerful computer mapping technologies has increased the effectiveness of gerrymandering as a technique for parties in power to maximize their seats & political voice, while minimizing their opponents’ seats & chances of turning the political tables. With the 2020 census & a subsequent round of redistricting looming, this session will examine several recent Supreme Court cases that have declined to intervene, allowing our political geography to be reshaped by partisans to advantage some & disadvantage others in our electoral processes.','','','','','None','false','','','20252','true','','','','SELIM202002Gerrymandering','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHpQAM','Cultural Competency for K12 Educators - January 15-29, 2020','150006','','','','','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:

Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','20200115-CulComp','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHqQAM','Catholic Social Thought for Church Managers','150013','','','','2020-02-26','This course teaches the nature, principles and values of Catholic social teaching as well as some issues of social concern that ecclesiastics encounter in practice both in their own church administration and in their guidance of the laity.','','','','','None','false','Online: Self-Guided','','40493','true','This course teaches the nature, principles and values of Catholic social teaching as well as some issues of social concern that ecclesiastics encounter in practice both in their own church administration and in their guidance of the laity.','','','202002-CST','','','College of Arts & Sciences','','','https://stthomas.lmscheckout.com/Course/view/catholic-social-thought-for-church-managers-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHrQAM','Autism Spectrum Disorder: Evidence-Based Practices','150014','4.0','','','2020-02-19','This course will provide educators a solid understanding of the evidence-based practices and high-leverage practices in the field of autism spectrum disorder.

Learning Outcomes:

Define Autism Spectrum Disorder
Identify Evidence-Based Practices
Use credible sources to apply evidence-based practices
Determine appropriate evidence-based practices to meet student needs','','','','','None','false','Online: Self-Guided','','40493','true','This course will provide educators a solid understanding of the evidence-based practices and high-leverage practices in the field of autism spectrum disorder.<br><br>Learning Outcomes:
<ul><li>Define Autism Spectrum Disorder</li><li>Identify Evidence-Based Practices</li><li>Use credible sources to apply evidence-based practices</li><li>Determine appropriate evidence-based practices to meet student needs</li></ul>','','','202002-ASD','','','School of Education','','','https://stthomas.lmscheckout.com/Course/view/autism-spectrum-disorder-evidence-based-practices-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHsQAM','Cultural Competency for K12 Educators - July 17-31, 2019','150001','','','','','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:

Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','20190717-CulComp','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHtQAM','Cultural Competency for K12 Educators - July 31st, 2019','150002','','','','','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:

Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','20190731-CulComp','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHuQAM','Cultural Competency for K12 Educators - August 7-21, 2019','150003','','','','','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:

Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','20190807-CulComp','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHvQAM','Cultural Competency for K12 Educators - Oct 16-30, 2019','150004','','','','','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:

Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','None','false','','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','20191016-CulComp','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHwQAM','Mini Master in Business Analysis','','','','','','Designed for professionals wanting to enhance their understanding of the topics related to the roles, responsibilities, and skills necessary to be an effective business analyst or project manager.

The Mini Master of Business Analysis is designed for professionals who want to enhance their understanding of the role an analyst plays in bridging the gap between business and technology. The program highlights many of the topics taught in the Graduate Programs in Software''s graduate-level courses, including how to identify and articulate a business need and find an appropriate IT solution.','','','','','None','false','Face-to-Face','','33430','true','Designed for professionals wanting to enhance their understanding of the topics related to the roles, responsibilities, and skills necessary to be an effective business analyst or project manager.<br><br>The Mini Master of Business Analysis is designed for professionals who want to enhance their understanding of the role an analyst plays in bridging the gap between business and technology. The program highlights many of the topics taught in the Graduate Programs in Software&#39;s graduate-level courses, including how to identify and articulate a business need and find an appropriate IT solution.','','','ENGR202003MMBA','','','School of Education','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHxQAM','Mini Master of Big Data & Artificial Intelligence','','','','','','Data can help companies improve their operations and make faster, more intelligent business decisions. However, as the volume of available data increases, it becomes more challenging to capture and manage it. The Mini Master of Big Data and Artificial Intelligence lecture series is a response to the expansive growth in data and the corresponding need to store, search, share and analyze massive data sets. In addition, this series will cover a broad range of topics in the field of artificial intelligence (AI) and will give participants insight into how AI is applied and used in the industry today.','','','','','None','false','','','33430','true','','','','ENGR202003MMAI','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHyQAM','Mini Master of Information Technology','','','','','','The world’s most successful companies often have an information technology infrastructure that’s closely aligned with the goals of the business. As more organizations seek this level of perfect business/technology synergy, they’re seeking professionals with up-to-date technical skills, an understanding of systems and software and the ability to effectively communicate and collaborate

In response to industry''s need for skilled IT professionals, this Mini Master of Information Technology covers an overview of cutting-edge IT topics. Designed for anyone from any profession who wants a better understanding of the critical topics, current practices and issues in information technology and how these topics impact their organization.','','','','','None','false','','','33430','true','','','','ENGR202003MMIT','','','','','','','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOHzQAM','Cultural Competency for K12 Educators - April 15 - April 29, 2020','150008','16.0','2020-04-29','','2020-04-15','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
Understanding, Uncovering, and Overcoming Our Biases
Supporting Students from Indigenous Nations
Increasing Religious Literacy
Recognizing Systemic Racism
Supporting LGBTQ Youth
Language Diversity
Students with Disabilities and Mental Health Concerns
Culturally Responsive PBIS
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','','','','','','false','Online: Self-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200415-CulComp','','20200415-CulComp','','2020-04-15','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---april-15---april-29-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI0QAM','Cultural Competency for K12 Educators - May 13 - May 27, 2020','150009','16.0','2020-05-27','','2020-05-13','','','','','','','false','Online: Self-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200513-CulComp','','20200513-CulComp','','2020-05-13','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---may-13---may-27-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI1QAM','Cultural Competency for K12 Educators - June 17 - July 8, 2020','150010','16.0','2020-07-08','','2020-06-17','','','','','','','false','Online: Self-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200617-CulComp','','20200617-CulComp','','2020-06-17','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---june-17---july-1-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI2QAM','Leading Effective Online Meetings','150015','','','','2020-04-13','','','','','','','false','Online: Self-Guided','','40493','true','Virtual meetings are quickly becoming the norm, but many people are not prepared for this new way of getting together. We’ve seen the foibles of virtual meeting newbies go viral on social media. We watch, and we cringe at their missteps while also secretly hoping that we haven’t unknowingly made the same mistakes. In this course, you will learn to create a professional virtual meeting environment, plan purposeful and engaging meetings, and avoid the foibles. After some practice, you may even come to enjoy leading virtual meetings.<br><br>Learning Outcomes:<br>•    Identify reasons to hold a virtual meeting. <br>•    Create a professional virtual environment.<br>•    Set expectations for professionalism and engagement<br>•    Plan a purposeful virtual meeting. <br>•    Identify best practices of leading virtual meetings<br> ','202004-LEVM','','202004-LEVM','','','University of St. Thomas','','','https://stthomas.lmscheckout.com/Course/view/leading-effective-online-meetings-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI3QAM','Teaching Live, Online!','150016','','','','2020-04-13','','','','','','','false','Online: Self-Guided','','40493','true','Teaching live, online can seem scary, but it doesn’t need to be. This course will teach you the tips, tricks, and tools you need to have a successful virtual class meeting.  We’ll go over how to choose the right platform and equipment for your needs, set up your streaming environment, and plan a class that holds students’ attention and encourages participation. You and your students will come to love the flexibility and versatility of teaching live, online!<br><br>Learning Outcomes:<br>1.    Identify reasons to hold a virtual class meeting.<br>2.    Create an environment that is favorable for virtual classes.<br>3.    Set expectations for behavior and participation.<br>4.    List common types of virtual class activities.<br>5.    Plan a successful virtual class meeting.<br> ','202004-TLO','','202004-TLO','','','University of St. Thomas','','','https://stthomas.lmscheckout.com/Course/view/teaching-live-online-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI4QAM','Practical Strategies for Working Remotely','150017','','','','2020-05-11','','','','','','','false','Online: Self-Guided','','40493','true','Whether you are working remotely out of necessity or preference, it can feel strange to “go to work” without actually going somewhere. Because you aren&#39;t regularly seen “at the office,” you might be concerned about proving that you are, in fact, working. You may wonder how you will stay informed and stay connected to your manager and colleagues. <br><br>This course introduces practical strategies for successfully navigating the remote work environment and being a member of a remote team.  You will learn how to create the ideal home set up, work collaboratively in the virtual space, stay visible and connected, and reach the teams’ goals.  ','202006-PSWR','','202006-PSWR','','','University of St. Thomas','','','https://stthomas.lmscheckout.com/Course/view/practical-strategies-for-working-remotely-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI5QAM','Mental Health and the Remote Worker','150018','','','','2020-05-11','','','','','','','false','Online: Self-Guided','','40493','true','Is working from home taking a toll on your mental health? Are you stressed to the max because you are juggling employee, parent, and spouse responsibilities, and feel like you’re letting everyone down? Or are you alone all the time and craving the social aspect of going to the “office” everyday? Working from home has its perks, for sure—a short commute, a flexible schedule, and comfy footwear. But perhaps the newness has worn off and you’re starting to notice other, unanticipated effects. This course helps you identify the feelings you may be experiencing as a remote employee and offers strategies for battling stress, connecting with others, and getting back to a positive work/life balance. ','202006-MHRW','','202006-MHRW','','','University of St. Thomas','','','https://stthomas.lmscheckout.com/Course/view/mental-health-and-the-remote-worker-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI6QAM','Managing Remote Employees','150019','','','','2020-05-11','','','','','','','false','Online: Self-Guided','','40493','true','Managing a remote team can be challenging. How do you build team cohesion, monitor productivity, and keep everyone on the same page when you are never together?<br><br>In this course, you will learn how to build team spirit, motivate and provide guidance, manage performance, and ensure that everyone is productive and effective. We will also address critical skills for communication, goal setting, trust, and autonomy.  ','202006-MRE','','202006-MRE','','','','','','https://stthomas.lmscheckout.com/Course/view/managing-remote-teams-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI7QAM','Mini Master in Business Analysis','','','2020-06-25','','2020-06-22','','','','','','','false','Face-to-Face','','33430','true','','','','ENGR202006MMBA','','2020-06-22','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-in-business-analysis-622---1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI8QAM','Mini Master in Business Analysis','','','2020-10-22','','2020-10-19','','','','','','','false','','','33430','false','','','','ENGR202010MMBA','','2020-10-19','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-in-business-analysis-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOI9QAM','Mini Master of Big Data & Artificial Intelligence','','','2020-10-09','','2020-10-05','','','','','','','false','Face-to-Face','','33430','true','','','','ENGR202010MMAI','','2020-10-05','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-of-information-technology-1012---1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIAQA2','Mini Master of Big Data & Artificial Intelligence','','','2020-06-12','','2020-06-08','','','','','','','false','','','33430','true','','','','ENGR202006MMAI','','2020-06-08','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-of-big-data--artificial-intelligence-68---1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIBQA2','Mini Master of Information Technology','','','2020-10-16','','2020-10-12','','','','','','','false','Face-to-Face','','33430','false','','','','ENGR202010MMIT','','2020-10-12','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-of-information-technology-1012---1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOICQA2','Mini Master of Information Technology','','','2020-06-19','','2020-06-15','','','','','','','false','Face-to-Face','','33430','true','','','','ENGR202006MMIT','','2020-06-15','School of Engineering','','','https://stthomas.lmscheckout.com/Course/view/mini-master-of-information-technology-615---1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIDQA2','Testing Product','','3.2','2020-05-29','','2020-05-12','','','10.0','','','','false','Online: Self-Guided','','40493','true','','','','TESTPROD','','2020-05-29','University of St. Thomas','','','https://cape.stthomas.edu/','Test Case',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIEQA2','Cultural Competency for K12 Educators - July 08 - July 29 2020','150011','16.0','2020-07-29','','2020-07-08','','','','','','','false','Online: Instructor-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200715-CulComp','','20200715-CulComp','','2020-07-09','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---july-15---july-29-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIFQA2','Cultural Competency for K12 Educators - August 05 - August 26, 2020','150012','16.0','2020-08-26','','2020-08-05','','','','','','','false','Online: Instructor-Guided','','40493','true','Cultural Competency for K12 Educators is a PELSB-approved course that meets licensure renewal requirements for K-12 educators in Minnesota who need to complete cultural competency training. The program covers the following topics and is worth 16 CEUs:
<ul><li>Understanding, Uncovering, and Overcoming Our Biases</li><li>Supporting Students from Indigenous Nations</li><li>Increasing Religious Literacy</li><li>Recognizing Systemic Racism</li><li>Supporting LGBTQ Youth</li><li>Language Diversity</li><li>Students with Disabilities and Mental Health Concerns</li><li>Culturally Responsive PBIS</li></ul>
The program is 100% asynchronous online, which means you complete all coursework online, on your own schedule, within a specified two-week period.','20200812-CulComp','','20200812-CulComp','','2020-08-06','School of Education','','','https://stthomas.lmscheckout.com/Course/view/cultural-competency-for-k12-educators---august-12---august-26-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIGQA2','The Art of Sales Persuasion','150021','','','','2020-08-12','','','','','','','false','Online: Self-Guided','','40493','true','You thought they were going to close this quarter. You did the pitch, the meeting went great, so what went wrong? The Art of Sales Persuasion will equip you with the tools to prevent this internal monologue next quarter. Here you’ll learn the messaging and discovery tactics that show you who is in and out early in your process, and the tactics you can use to flat out win more deals.<br><br>Whether you are looking to get more quality opportunities flowing in your pipeline or you manage a team that is breaking into a new market or looking to find a way to level up their game, this is the course for you.<br><br><b>Course Topics:</b>
<ul><li>3 big sales questions and research</li><li>Getting the most out of your sales mediums (social media, email, phone)</li><li>Writing good emails</li><li>Leaving good voicemails</li><li>Reflective listening</li><li>Mirroring</li><li>Labeling</li><li>Link and trade</li></ul>
<b>Learning Outcomes:</b>

<ul><li>Apply the 3 Questions framework to any message, phone call, or new market</li><li>Analyze the effectiveness of your sales mediums (email, phone, and social media)</li><li>Practice persuasion techniques that open and close deals</li></ul>','202006-ASP','','202006-ASP','','','University of St. Thomas','','','https://stthomas.lmscheckout.com/Course/view/the-art-of-sales-persuasion-1','',NULL);
INSERT INTO "Product2" VALUES('01t0R000006mOIHQA2','Simpler (and Smarter) DIY Videos','150020','','','','2020-06-17','','','','','','','false','Online: Self-Guided','','40493','false','<p>Creating professional-looking videos can seem daunting, but it doesn’t need to be! You can produce high-quality videos with little more than your smartphone and some imagination, and this course will teach you how to do it. We’ll explain common types of video projects and help you decide which type suits your needs. Then, you’ll learn best practices for planning, shooting, editing and distributing your project. At the end, you’ll submit a short video and get feedback from our experts. Join us and learn to create simpler (and smarter) DIY videos!</p>

<p><b>Course Topics:</b></p>

<ul><li>How to plan for your project</li><li>Dos and Don’ts for producing great video projects</li><li>What tools will you need on hand and how can you use them most effectively?</li><li>A final project where you will put these all together, produce a short video and get feedback from our industry experts.</li></ul>

<p><b>Learning Outcomes:</b></p>

<ol><li> List common types of video projects and distribution channels.</li><li>Identify reasons for creating a video.</li><li>Identify the tools you’ll need to deliver on your vision.</li><li>Apply best practices for planning, shooting, and editing a video</li></ol>','202006-DIYV','','202006-DIYV','','','University of St. Thomas','','','','',NULL);
COMMIT;
