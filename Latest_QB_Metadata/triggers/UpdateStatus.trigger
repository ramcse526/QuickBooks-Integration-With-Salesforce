trigger UpdateStatus on Order (after insert,after update) {
    map<string,string> orderInvoiceMap = new map<string,string>();
    map<Id,Order> newOrderMap = new map<Id,Order>([select id,opportunity.QuickBooksRefId__c from order where id in:Trigger.new]);
    if(Trigger.isUpdate){
        for(Id orderId:Trigger.newMap.keySet()){
            if(Trigger.newMap.get(orderId).status!=Trigger.oldMap.get(orderId).status && Trigger.newMap.get(orderId).status=='Permit'){
                if(newOrderMap.get(orderId).opportunity.QuickBooksRefId__c!=null){
                    orderInvoiceMap.put(orderId,newOrderMap.get(orderId).opportunity.QuickBooksRefId__c);
                }
            }
        }
    }
    else if(Trigger.isInsert){
        for(Id orderId:Trigger.newMap.keySet()){
            if(Trigger.newMap.get(orderId).status=='Permit'){
                if(newOrderMap.get(orderId).opportunity.QuickBooksRefId__c!=null){
                    orderInvoiceMap.put(orderId,newOrderMap.get(orderId).opportunity.QuickBooksRefId__c);
                }   
            }
        }
    }
    
    if(!orderInvoiceMap.isEmpty()){
        QuickBooksTransactionCtrl.updateOrderStatus(orderInvoiceMap);
    }
}