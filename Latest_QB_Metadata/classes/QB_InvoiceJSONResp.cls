public class QB_InvoiceJSONResp {

	public class Line {
		public String Id;
		public Integer LineNum;
		public Double Amount;
		public String DetailType;
		public SalesItemLineDetail SalesItemLineDetail;
		public CustomField SubTotalLineDetail;
	}

	public class BillAddr {
		public String Id;
		public String Line1;
		public String City;
		public String Country;
		public String PostalCode;
	}

	public class CurrencyRef {
		public String value;
		public String name;
	}

	public class ShipAddr {
		public String Id;
		public String Line1;
		public String Country;
		public String PostalCode;
	}

	public class Invoice {
		public Integer Deposit;
		public Boolean AllowIPNPayment;
		public Boolean AllowOnlinePayment;
		public Boolean AllowOnlineCreditCardPayment;
		public Boolean AllowOnlineACHPayment;
		public String domain;
		public Boolean sparse;
		public String Id;
		public String SyncToken;
		public MetaData MetaData;
		public List<CustomField> CustomField;
		public String DocNumber;
		public String TxnDate;
		public CurrencyRef CurrencyRef;
		public List<CustomField> LinkedTxn;
		public List<Line> Line;
		public TxnTaxDetail TxnTaxDetail;
		public CurrencyRef CustomerRef;
		public BillAddr BillAddr;
		public ShipAddr ShipAddr;
		public String DueDate;
		public Double TotalAmt;
		public Boolean ApplyTaxAfterDiscount;
		public String PrintStatus;
		public String EmailStatus;
		public Double Balance;
	}

	public class TaxCodeRef {
		public String value;
	}

	public class MetaData {
		public String CreateTime;
		public String LastUpdatedTime;
	}

	public class SalesItemLineDetail {
		public CurrencyRef ItemRef;
		public Double UnitPrice;
		public Integer Qty;
		public TaxCodeRef TaxCodeRef;
	}

	public class CustomField {
	}

	public class TxnTaxDetail {
		public Integer TotalTax;
	}

	public Invoice Invoice;

	
	public static QB_InvoiceJSONResp parse(String json) {
		return (QB_InvoiceJSONResp) System.JSON.deserialize(json, QB_InvoiceJSONResp.class);
	}
}