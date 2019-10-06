@isTest
public class QuickBooksTransactionCtrlTest {
    public static testMethod  void Testmethod1()
    {
        Quick_Books_Api_Tokens__c apiTokens = new Quick_Books_Api_Tokens__c(Name='Quick Books',Access_Token__c='Test',Realm_ID__c='1234',Refresh_Token__c='test');
        insert apiTokens;
        RecordType rt = [SELECT Id FROM RecordType WHERE sObjectType = 'Opportunity' AND Name = 'Non Sales Rep'];
        RecordType rtAccount = [SELECT Id FROM RecordType WHERE sObjectType = 'Account' AND Name = 'Business Account'];
        List<Id> oppIds = new List<Id>();
        Account testacc = new Account();
        testacc.Name='Acctest';
        testacc.RecordType = rtAccount;
        testacc.RecordTypeId = rtAccount.id;
        insert testacc;
        
        Opportunity testopp = new Opportunity();
        testopp.Name='test';
        testopp.AccountId=testacc.id;
        testopp.StageName='Negotiation/Review';
        testopp.CloseDate=System.today();
        testopp.Job_Type__c='Permit Required';
        testopp.Proposal_Delivery_Method__c = 'Emailed';
        testopp.Quote_Generated__c = TRUE;
        testopp.Quote_Status__c = 'Accepted';
        testopp.RecordType = rt;
        testopp.RecordTypeId = rt.id;
        testopp.QuickBooksRefId__c='123';
        insert testopp; 
        
        Quote testQuote = new Quote();
        testQuote.Name = 'test';
        testQuote.Quote_PDF_Attached__c = TRUE;
        testQuote.Job_Type__c='Permit Required';
        testQuote.Status = 'Accepted';
      //  testQuote.IsSyncing = TRUE;
      //  testQuote.AccountId = testacc.id;
        testQuote.OpportunityId = testopp.id;
        insert testQuote;
        
        testopp.SyncedQuoteId = testQuote.id;
        testopp.StageName='Closed Won';
        Update testopp; 
        
        Id pricebookId = Test.getStandardPricebookId();
        
        //Create your product
        Product2 prod = new Product2(
            Name = 'Product X',
            ProductCode = 'Pro-X',
            isActive = true
        );
        insert prod;
        
        //Create your pricebook entry
        PricebookEntry pbEntry = new PricebookEntry(
            Pricebook2Id = pricebookId,
            Product2Id = prod.Id,
            UnitPrice = 100.00,
            IsActive = true
        );
        insert pbEntry;
        
        //create your opportunity line item.  This assumes you already have an opportunity created, called opp
        OpportunityLineItem oli = new OpportunityLineItem(
            OpportunityId = testopp.Id,
            Quantity = 5,
            PricebookEntryId = pbEntry.Id,
            TotalPrice = 5 * pbEntry.UnitPrice
            
        );
        insert oli;
        system.debug([select id from order]);
        
        Order testOrder = new Order();
          testOrder.Name = 'test Order';
          testOrder.Job_Type__c='Permit Required';
          testOrder.status = 'Permit';
          testOrder.OpportunityId = testopp.id;
          testOrder.AccountId = testacc.id;
          testOrder.EffectiveDate = System.today();
          testOrder.Engineering_Document_Attached__c= TRUE;
          testOrder.Deposit_Received__c = TRUE;
          testOrder.Permit_Attached__c = TRUE;
         insert testOrder;

         testOrder.status = 'Doc Prep';
         Update testOrder;
        testOrder.status = 'Permit';
         Update testOrder;
        test.startTest();
        
        pageReference pager = page.quotationWorksheet;
        ContentVersion contentVersionInsert = new ContentVersion(
            Title = 'Test',
            PathOnClient = 'Test.pdf',
            VersionData = Blob.valueOf('Test Content Data'),
            IsMajorVersion = true
        );
        insert contentVersionInsert;
        
        // Test INSERT
        ContentVersion contentVersionSelect = [SELECT Id, Title, ContentDocumentId FROM ContentVersion WHERE Id = :contentVersionInsert.Id LIMIT 1];
        List<ContentDocument> documents = [SELECT Id, Title, LatestPublishedVersionId FROM ContentDocument];
        System.assertEquals(documents.size(), 1);
        
        Messaging.EmailFileAttachment attachment = new Messaging.EmailFileAttachment();
        
        attachment.setFileName('Cost Plus Merchants.pdf');
        attachment.setContentType('text/csv');        
        Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();        
        message.setFileAttachments(new Messaging.EmailFileAttachment[] { attachment } );
        //Test.setCurrentPage(pager);
        //  pager.getParameters().put('id',testopp.id);
        Test.setCurrentPage(pager);
        pager.getParameters().put('id',testopp.id);
        ApexPages.StandardController sc = new ApexPages.standardController(testopp);
        noticeOfCommencementSave  controller = new noticeOfCommencementSave(sc);
        controller.attachPDF();
        //  System.assertNotEquals(null,controller.autoRun());
        
        //testopp.StageName = 'Closed Won';
        //update testopp;
        Test.setMock(HttpCalloutMock.class, new QuickBooksCalloutMock());
        Map<String, String> MyStrings = new Map<String, String>{'a' => 'b', 'c' => 'd'.toUpperCase()};
        QuickBooksTransactionCtrl.updateOrderStatus(MyStrings);
        test.stopTest(); 
    }
}