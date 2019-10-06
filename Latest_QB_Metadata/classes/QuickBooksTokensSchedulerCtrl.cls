global class QuickBooksTokensSchedulerCtrl implements Schedulable, Database.AllowsCallouts {
    global void execute(SchedulableContext sc) {
        getAccessTokenForScheduler();
    }
    @future(callout=true)
    public Static void getAccessTokenForScheduler(){
        Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c,Refresh_Token__c,Base_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
        String endPoint = metadataInfo.Token_URL__c;
        String clientId = metadataInfo.Client_ID__c;
        String clientSecret = metadataInfo.Client_Secret__c;
        String encodedString = EncodingUtil.base64Encode(Blob.valueOf(clientId + ':' + clientSecret));
        Quick_Books_Api_Tokens__c apiTokenObj = Quick_Books_Api_Tokens__c.getValues('Quick Books');
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        httpReq.setMethod('POST');
        String requestBody = 'grant_type=refresh_token&refresh_token='+apiTokenObj.Refresh_Token__c;
        httpReq.setEndPoint(endPoint);
        httpReq.setHeader('Content-Type' , 'application/x-www-form-urlencoded');
        httpReq.setHeader('Accept' , 'application/json');
        httpReq.setHeader('Authorization' , 'Basic '+encodedString);
        httpReq.setBody(requestBody);
        httpRes = http.send(httpReq);
        map<string,object> qbRes = (map<string,object>)JSON.deserializeUntyped(httpRes.getBody());
        String refreshToken = String.valueOf(qbRes.get('refresh_token'));
        if(qbRes.get('refresh_token')!=null && apiTokenObj.Refresh_Token__c!=refreshToken){
            //apiTokenObj.Access_Token__c = String.valueOf(qbRes.get('access_token'));
            apiTokenObj.Refresh_Token__c = refreshToken;
            update apiTokenObj;  
        }
    }
}