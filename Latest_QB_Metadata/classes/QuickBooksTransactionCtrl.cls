public class QuickBooksTransactionCtrl {
    public Static String getAccessToken(){
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
        system.debug(httpRes.getBody());
        if(httpRes.getStatusCode()==200){
            map<string,object> qbRes = (map<string,object>)JSON.deserializeUntyped(httpRes.getBody());
            String access_token = String.valueOf(qbRes.get('access_token'));
            return access_token;
        }
        return null;
    }
    public Static map<String,String> getProductsDetails(){
        map<String,String> prodDetailsMap = new map<String,String>();
        Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c,Realm_ID__c,Base_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
        Quick_Books_Api_Tokens__c apiTokenObj = Quick_Books_Api_Tokens__c.getValues('Quick Books');
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        String access_token = QuickBooksTransactionCtrl.getAccessToken();
        String baseURL = metadataInfo.Base_URL__c;
        String realmId = metadataInfo.Realm_ID__c;
        httpReq.setMethod('GET');
        httpReq.setEndPoint(baseURL+'/'+realmId+'/query?query='+EncodingUtil.urlEncode('select name from Item', 'UTF-8'));
        httpReq.setHeader('Authorization' , 'Bearer ' + access_token);
        httpReq.setHeader('Accept' , 'application/json');
        httpReq.setHeader('Content-Type' , 'application/json');
        httpRes = http.send(httpReq);
        system.debug(httpRes.getBody());
        if(httpRes.getStatusCode()==200){
            QB_ProductsDetailsJSON prodDetails = (QB_ProductsDetailsJSON)JSON.deserialize(httpRes.getBody(), QB_ProductsDetailsJSON.class);
            if(prodDetails.QueryResponse!=null){
                system.debug(prodDetails.QueryResponse.Item);
                for(QB_ProductsDetailsJSON.Item item:prodDetails.QueryResponse.Item){
                    prodDetailsMap.put(item.Name,item.Id);
                } 
            }
            return prodDetailsMap;
        }
        return null;
    }    
    public Static String createInvoice(String invoice){
        Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c,Realm_ID__c,Base_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
        Quick_Books_Api_Tokens__c apiTokenObj = Quick_Books_Api_Tokens__c.getValues('Quick Books');
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        //String invoice = '{"Line": [{"DetailType": "SalesItemLineDetail","Amount": "400.0","SalesItemLineDetail": {"ItemRef": { "name": "Services","value": "1"},"Qty":"2","UnitPrice":"200"}}],"CustomerRef": {"value": "60"}}';
        String access_token = QuickBooksTransactionCtrl.getAccessToken();
        String baseURL = metadataInfo.Base_URL__c;
        String realmId = metadataInfo.Realm_ID__c;
        httpReq.setMethod('POST');
        httpReq.setEndPoint(baseURL+'/'+realmId+'/invoice');
        httpReq.setHeader('Authorization' , 'Bearer ' + access_token);
        httpReq.setHeader('Accept' , 'application/json');
        httpReq.setHeader('Content-Type' , 'application/json');
        httpReq.setBody(invoice);
        httpRes = http.send(httpReq);
        system.debug(httpRes.getBody());
        if(httpRes.getStatusCode()==200){
            return httpRes.getBody();
        }
        return null;
    }
    @future (callout=true)
    public static void createCustomers(list<Id> accIds,list<Id> oppIds){
        map<string,string> accRelQBIdMap = new map<string,string>();
        Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c,Base_URL__c,Realm_ID__c,Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
        Quick_Books_Api_Tokens__c apiTokenObj = Quick_Books_Api_Tokens__c.getValues('Quick Books');
        HttpRequest httpReq = new HttpRequest();
        HttpResponse httpRes = new HttpResponse();
        Http http = new Http();
        String access_token = QuickBooksTransactionCtrl.getAccessToken();
        map<String,String> prodDetailsMap = QuickBooksTransactionCtrl.getProductsDetails();
        String baseURL = metadataInfo.Base_URL__c;
        String realmId = metadataInfo.Realm_ID__c;
        httpReq.setMethod('POST');
        httpReq.setEndPoint(baseURL+realmId+'/customer');
        system.debug(baseURL+realmId+'/customer');
        system.debug(access_token);
        httpReq.setHeader('Authorization' , 'Bearer ' + access_token);
        httpReq.setHeader('Accept' , 'application/json');
        httpReq.setHeader('Content-Type' , 'application/json');
        
        list<Account> accList = [SELECT Id,QuickBooksRefId__c,Name, LastName, FirstName, Salutation, 
                                 MiddleName, PersonTitle, Suffix, Phone, PersonEmail, 
                                 PersonMobilePhone, Website, BillingStreet, BillingCity, 
                                 BillingState, BillingPostalCode, BillingCountry, BillingAddress, 
                                 ShippingStreet, ShippingCity, ShippingState, ShippingPostalCode, 
                                 ShippingCountry, ShippingAddress FROM Account where Id IN:accIds];
        list<QB_CutomerWrapper> customersList = new list<QB_CutomerWrapper>();
        list<sObject> updatedAccList = new list<sObject>();
        for(Account acc:accList){
            if(acc.QuickBooksRefId__c==null){
                QB_CutomerWrapper customer = new QB_CutomerWrapper();
                customer.FullyQualifiedName = acc.name;//acc.FirstName+' '+acc.LastName;
                customer.PrimaryEmailAddr.Address = acc.PersonEmail;
                //customer.DisplayName = acc.Name;
                customer.Suffix = acc.Suffix;
                customer.Title = acc.PersonTitle;
                customer.FamilyName = acc.LastName;
                customer.GivenName = acc.FirstName;
                customer.PrimaryPhone.FreeFormNumber = acc.Phone;
                customer.Mobile.FreeFormNumber = acc.PersonMobilePhone; //Change
                //customer.CompanyName = acc.Name; //Change
                customer.BillAddr.City = acc.BillingCity;
                customer.BillAddr.PostalCode = acc.BillingPostalCode;
                customer.BillAddr.Line1 = acc.BillingStreet;
                customer.BillAddr.CountrySubDivisionCode = acc.BillingState;
                customer.BillAddr.Country = acc.BillingCountry;
                customer.ShipAddr.City = acc.ShippingCity;
                customer.ShipAddr.PostalCode = acc.ShippingPostalCode;
                customer.ShipAddr.Line1 = acc.ShippingStreet;
                customer.ShipAddr.City = acc.ShippingCity;
                customer.ShipAddr.CountrySubDivisionCode = acc.ShippingState; //Change
                customer.ShipAddr.Country = acc.ShippingCountry;
                customersList.add(customer);
                system.debug(JSON.serialize(customer));
                httpReq.setBody(JSON.serialize(customer));
                try{
                    httpRes = http.send(httpReq);
                    system.debug(httpRes);
                    system.debug(httpRes.getBody());
                    if(httpRes.getStatusCode()==200){
                        QB_CreateCustomerResponse custResp = (QB_CreateCustomerResponse)JSON.deserialize(httpRes.getBody(), QB_CreateCustomerResponse.class);
                        updatedAccList.add(new Account(Id=acc.Id,QuickBooksRefId__c=custResp.Customer.Id));
                        system.debug('--------------------------------custResp.Customer.Id-------------'+custResp.Customer.Id);
                        accRelQBIdMap.put(acc.Id,custResp.Customer.Id);
                    }
                }
                catch(exception e){
                    
                }
            }
            else{
                accRelQBIdMap.put(acc.Id,acc.QuickBooksRefId__c);
            }
        }
        system.debug('--------------------------------accRelQBIdMap-------------'+accRelQBIdMap);
        for(Opportunity opp:[select id,amount,(SELECT Id, Name, Quantity, UnitPrice,TotalPrice,product2.ProductCode,Product2.Name FROM OpportunityLineItems),accountid,SyncedQuote.Discount_FBA__c from opportunity where id in:oppIds]){
            QB_CreateInvoiceJSON creatInvoice = new QB_CreateInvoiceJSON();
            system.debug('--------------------------------------opp.AccountId--------------'+accRelQBIdMap.get(opp.AccountId));
            creatInvoice.CustomerRef.value = accRelQBIdMap.get(opp.AccountId); 
            Integer val=0;
            for(OpportunityLineItem oppLi:opp.OpportunityLineItems){
                val++;
                QB_CreateInvoiceJSON.Line li = new QB_CreateInvoiceJSON.Line();
                li.Amount = oppLi.TotalPrice;
                li.DetailType = 'SalesItemLineDetail';
                li.Description = oppLi.product2.Name;
                li.SalesItemLineDetail.Qty = oppLi.Quantity;
                li.SalesItemLineDetail.UnitPrice = oppLi.UnitPrice;
                //li.SalesItemLineDetail.DiscountRate = opp.SyncedQuote.Discount_FBA__c;
                //  li.SalesItemLineDetail.DiscountPercent = opp.SyncedQuote.Discount_FBA__c;
                li.SalesItemLineDetail.ItemRef.name = oppLi.product2.Name;
                //li.SalesItemLineDetail.ItemRef.value = prodDetailsMap.get(oppLi.product2.Name)!=null?prodDetailsMap.get(oppLi.product2.Name):String.valueOf(val);
                li.SalesItemLineDetail.ItemRef.value = prodDetailsMap.get(oppLi.product2.Name)!=null?prodDetailsMap.get(oppLi.product2.Name):prodDetailsMap.get('Product');
                creatInvoice.Line.add(li);
            }
            if(creatInvoice.Line.size()>0){
                QB_CreateInvoiceJSON.Line li = new QB_CreateInvoiceJSON.Line();
                li.Amount = opp.amount;
                li.DetailType = 'SubTotalLineDetail';
                creatInvoice.Line.add(li);
                li = new QB_CreateInvoiceJSON.Line();
                li.DetailType = 'DiscountLineDetail';
                li.DiscountLineDetail.PercentBased = true;
                //li.DiscountLineDetail.DiscountPercent = opp.SyncedQuote.Discount_FBA__c;
                li.DiscountLineDetail.DiscountPercent = opp.SyncedQuote.Discount_FBA__c!=null?opp.SyncedQuote.Discount_FBA__c:0;
                creatInvoice.Line.add(li);
                String invoiceResp = QuickBooksTransactionCtrl.createInvoice(JSON.serialize(creatInvoice));
                system.debug('invoiceResp'+invoiceResp);
                if(invoiceResp!=null){
                    map<string,object> invoiceRespMap = (map<string,object>)JSON.deserializeUntyped(invoiceResp);
                    map<string,object> invoiceRetResp = (map<string,object>)JSON.deserializeUntyped(JSON.serialize(invoiceRespMap.get('Invoice')));
                    if(invoiceRetResp!=null)
                        updatedAccList.add(new opportunity(id=opp.id,QuickBooksRefId__c=String.valueOf(invoiceRetResp.get('Id'))));
                } 
            }
        }
        if(updatedAccList.size()>0){
            update updatedAccList;
        }
    } 
    @future (callout=true)
    public static void updateOrderStatus(map<string,string> orderInvoiceMap){
        list<Order> updateOrderList = new list<Order>();
        for(String orderId:orderInvoiceMap.keySet()){
            String invoiceId = orderInvoiceMap.get(orderId);
            if(invoiceId!=null){
                map<string,string> accRelQBIdMap = new map<string,string>();
                Quick_Book_App_Info__mdt metadataInfo = [SELECT App_URL__c,Realm_ID__c,Base_URL__c, Callback_URL__c, Token_URL__c, Client_ID__c, Client_Secret__c FROM Quick_Book_App_Info__mdt];
                Quick_Books_Api_Tokens__c apiTokenObj = Quick_Books_Api_Tokens__c.getValues('Quick Books');
                HttpRequest httpReq = new HttpRequest();
                HttpResponse httpRes = new HttpResponse();
                Http http = new Http();
                String access_token = QuickBooksTransactionCtrl.getAccessToken();
                String baseURL = metadataInfo.Base_URL__c;
                String realmId = metadataInfo.Realm_ID__c;
                httpReq.setMethod('GET');
                httpReq.setEndPoint(baseURL+realmId+'/invoice/'+invoiceId);
                system.debug(baseURL+realmId+'/invoice/'+invoiceId);
                httpReq.setHeader('Authorization' , 'Bearer ' + access_token);
                httpReq.setHeader('Accept' , 'application/json');
                httpReq.setHeader('Content-Type' , 'application/json');
                try{
                    httpRes = http.send(httpReq);
                    system.debug(httpRes);
                    system.debug(httpRes.getBody());
                    QB_InvoiceJSONResp custResp = (QB_InvoiceJSONResp)JSON.deserialize(httpRes.getBody(), QB_InvoiceJSONResp.class);
                    Double TotalAmt = custResp.Invoice.TotalAmt;
                    Double Balance = custResp.Invoice.Balance;
                    if(TotalAmt!=Balance){
                        updateOrderList.add(new Order(Id=orderId,Payment_Received__c=true));
                    }
                }
                catch(exception e){
                    
                }
            }
        }
        if(updateOrderList.size()>0){
            update updateOrderList;
        }
    }
}