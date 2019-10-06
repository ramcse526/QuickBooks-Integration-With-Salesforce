@IsTest
public class QB_InvoiceJSONResp_Test {
	
	static testMethod void testParse() {
		String json = '{  '+
		'   \"Invoice\":{  '+
		'      \"Deposit\":0,'+
		'      \"AllowIPNPayment\":false,'+
		'      \"AllowOnlinePayment\":false,'+
		'      \"AllowOnlineCreditCardPayment\":false,'+
		'      \"AllowOnlineACHPayment\":false,'+
		'      \"domain\":\"QBO\",'+
		'      \"sparse\":false,'+
		'      \"Id\":\"154\",'+
		'      \"SyncToken\":\"0\",'+
		'      \"MetaData\":{  '+
		'         \"CreateTime\":\"2019-07-10T10:53:10-07:00\",'+
		'         \"LastUpdatedTime\":\"2019-07-10T10:53:10-07:00\"'+
		'      },'+
		'      \"CustomField\":[  ],'+
		'      \"DocNumber\":\"1047\",'+
		'      \"TxnDate\":\"2019-07-10\",'+
		'      \"CurrencyRef\":{  '+
		'         \"value\":\"USD\",'+
		'         \"name\":\"United States Dollar\"'+
		'      },'+
		'      \"LinkedTxn\":[  '+
		''+
		'      ],'+
		'      \"Line\":[  '+
		'         {  '+
		'            \"Id\":\"1\",'+
		'            \"LineNum\":1,'+
		'            \"Amount\":178.75,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"1\",'+
		'                  \"name\":\"Services\"'+
		'               },'+
		'               \"UnitPrice\":8.125,'+
		'               \"Qty\":22,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Id\":\"2\",'+
		'            \"LineNum\":2,'+
		'            \"Amount\":41.25,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"2\",'+
		'                  \"name\":\"Hours\"'+
		'               },'+
		'               \"UnitPrice\":1.875,'+
		'               \"Qty\":22,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Id\":\"3\",'+
		'            \"LineNum\":3,'+
		'            \"Amount\":55.00,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"3\",'+
		'                  \"name\":\"Concrete\"'+
		'               },'+
		'               \"UnitPrice\":2.5,'+
		'               \"Qty\":22,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Id\":\"4\",'+
		'            \"LineNum\":4,'+
		'            \"Amount\":288.75,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"4\",'+
		'                  \"name\":\"Design\"'+
		'               },'+
		'               \"UnitPrice\":8.75,'+
		'               \"Qty\":33,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Id\":\"5\",'+
		'            \"LineNum\":5,'+
		'            \"Amount\":7.50,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"5\",'+
		'                  \"name\":\"Rock Fountain\"'+
		'               },'+
		'               \"UnitPrice\":2.5,'+
		'               \"Qty\":3,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Id\":\"6\",'+
		'            \"LineNum\":6,'+
		'            \"Amount\":9.38,'+
		'            \"DetailType\":\"SalesItemLineDetail\",'+
		'            \"SalesItemLineDetail\":{  '+
		'               \"ItemRef\":{  '+
		'                  \"value\":\"6\",'+
		'                  \"name\":\"Gardening\"'+
		'               },'+
		'               \"UnitPrice\":3.125,'+
		'               \"Qty\":3,'+
		'               \"TaxCodeRef\":{  '+
		'                  \"value\":\"NON\"'+
		'               }'+
		'            }'+
		'         },'+
		'         {  '+
		'            \"Amount\":580.63,'+
		'            \"DetailType\":\"SubTotalLineDetail\",'+
		'            \"SubTotalLineDetail\":{  '+
		''+
		'            }'+
		'         }'+
		'      ],'+
		'      \"TxnTaxDetail\":{  '+
		'         \"TotalTax\":0'+
		'      },'+
		'      \"CustomerRef\":{  '+
		'         \"value\":\"67\",'+
		'         \"name\":\"RAJPUT ATUL ABC\"'+
		'      },'+
		'      \"BillAddr\":{  '+
		'         \"Id\":\"117\",'+
		'         \"Line1\":\"ATUL RAJPUT ABC\",'+
		'         \"City\":\"Aligarh\",'+
		'         \"Country\":\"India\",'+
		'         \"PostalCode\":\"202001\"'+
		'      },'+
		'      \"ShipAddr\":{  '+
		'         \"Id\":\"118\",'+
		'         \"Line1\":\"ATUL RAJPUT ABC\",'+
		'         \"Country\":\"hi\",'+
		'         \"PostalCode\":\"32501\"'+
		'      },'+
		'      \"DueDate\":\"2019-08-09\",'+
		'      \"TotalAmt\":580.63,'+
		'      \"ApplyTaxAfterDiscount\":false,'+
		'      \"PrintStatus\":\"NeedToPrint\",'+
		'      \"EmailStatus\":\"NotSet\",'+
		'      \"Balance\":580.63'+
		'   },'+
		'   \"time\":\"2019-07-12T11:59:37.850-07:00\"'+
		'}';
		QB_InvoiceJSONResp obj = QB_InvoiceJSONResp.parse(json);
		System.assert(obj != null);
	}
}