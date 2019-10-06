public class QB_OAuthRedirectController {
    
    public static PageReference getAccessToken(){
        
        Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
        String appUrl = metadataInfo.App_URL__c;
        String callbackUrl = metadataInfo.Callback_URL__c;
        String endPoint = metadataInfo.Token_URL__c;
        
        String clientId = metadataInfo.Client_ID__c;
        String clientSecret = metadataInfo.Client_Secret__c;
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(clientId + ':' + clientSecret));
        
        String oAuthCode = ApexPages.currentPage().getParameters().get('code');
        String realmId = ApexPages.currentPage().getParameters().get('realmId');
        String requestBody = 'grant_type=authorization_code&code=' + oAuthCode + '&redirect_uri=' + callbackUrl;
        String errorMessage = '';
        
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Authorization' , 'Basic ' + encodedString);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setBody(requestBody);
        
        try{
            httpRes = http.send(httpReq);
            system.debug(httpRes.getBody());
            if(httpRes.getStatusCode() == 200){
                Map<String, Object> response = (Map<String, Object>)JSON.deserializeUntyped(httpRes.getBody());
                
                String accessToken = (String) response.get('access_token');
                String refreshToken = (String) response.get('refresh_token');
                
                Quick_Books_Api_Tokens__c apiToken;
                List<Quick_Books_Api_Tokens__c> apiTokens = [Select Id,Refresh_Token__c,Access_Token__c, Realm_ID__c from Quick_Books_Api_Tokens__c where Name = 'Quick Books'];
                if (apiTokens.isEmpty()) {
                    apiToken = new Quick_Books_Api_Tokens__c();
                    apiToken.Name = 'Quick Books';
                    //apiToken.Access_Token__c = accessToken;
                    apiToken.Refresh_Token__c = refreshToken;
                    apiToken.Realm_ID__c = realmId;
                    insert apiToken;
                }
                else {
                    apiToken = apiTokens[0];
                    //apiToken.Access_Token__c = accessToken;
                    apiToken.Refresh_Token__c = refreshToken;
                    apiToken.Realm_ID__c = realmId;
                    upsert apiToken;
                }
            }
            
        }
        catch(System.Exception e){
            System.debug('Exception found in class QB_OAuthRedirectController method getAccessToken '+ e.getMessage());
            System.debug('Exception found in class QB_OAuthRedirectController method getAccessToken '+ e.getLineNumber());
        }  
        
        PageReference pageRef = new PageReference(appUrl);
        //pageRef.setRedirect(true);
        return pageRef;
    }
}