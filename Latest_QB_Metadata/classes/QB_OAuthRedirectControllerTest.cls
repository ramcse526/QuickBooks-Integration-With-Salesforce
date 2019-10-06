@isTest
private class QB_OAuthRedirectControllerTest {
	
	@isTest static void testGetAccessToken () {
        test.startTest();
        Test.setMock(HttpCalloutMock.class, new QuickBooksCalloutMock());
		PageReference pageRef = QB_OAuthRedirectController.getAccessToken();
		Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c FROM Quick_Book_App_Info__mdt];
        String appUrl = metadataInfo.App_URL__c;
		System.assert(pageRef.getUrl().startsWith(appUrl));
		test.stopTest();
	}
	
}