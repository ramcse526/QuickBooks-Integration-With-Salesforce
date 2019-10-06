trigger oppStage on Opportunity (after insert,after update) {
    if(Trigger.isAfter){
        if(Trigger.isUpdate){
            list<Id> accIds = new list<Id>();
            list<Id> oppIds = new list<Id>();
            for(Id oppId:Trigger.newMap.keySet()){
                if(Trigger.newMap.get(oppId).StageName!=Trigger.oldMap.get(oppId).StageName && Trigger.newMap.get(oppId).StageName=='Closed Won'){
                    accIds.add(Trigger.newMap.get(oppId).accountId);
                    oppIds.add(oppId);
                }
            }
            if(oppIds.size()>0)
            QuickBooksTransactionCtrl.createCustomers(accIds,oppIds);
        }
        else if(Trigger.isInsert ){
            list<Id> accIds = new list<Id>();
            list<Id> oppIds = new list<Id>();
            for(Id oppId:Trigger.newMap.keySet()){
                if(Trigger.newMap.get(oppId).StageName=='Closed Won'){
                    accIds.add(Trigger.newMap.get(oppId).accountId);
                    oppIds.add(oppId);
                }
            }
            if(oppIds.size()>0)
            QuickBooksTransactionCtrl.createCustomers(accIds,oppIds);
        }
    }
}