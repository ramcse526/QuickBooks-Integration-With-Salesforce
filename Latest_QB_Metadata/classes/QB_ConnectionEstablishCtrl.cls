public class QB_ConnectionEstablishCtrl {
    public static PageReference connectToQuickbooks () {
        String statusMessage;
        try {
            Quick_Book_App_Info__mdt metadataInfo = [SELECT Client_ID__c, Client_Secret__c, Auth_URL__c, Callback_URL__c FROM Quick_Book_App_Info__mdt];
            String clientId = metadataInfo.Client_ID__c;
            String callbackUrl = metadataInfo.Callback_URL__c;   
            String authEndpoint = metadataInfo.Auth_URL__c;
            String scope = 'com.intuit.quickbooks.accounting';
            
            String endPoint = authEndpoint + '?client_id=' + clientId + '&state=1234&response_type=code&scope=' +scope+ '&redirect_uri=' + callbackUrl;
            PageReference pageRef = new PageReference(endPoint);
            //pageRef.setRedirect(true);
            return pageRef;
        }
        catch(System.Exception e){
            statusMessage = 'Exception: ' + e.getMessage();
        } 
        return null;
    }
}