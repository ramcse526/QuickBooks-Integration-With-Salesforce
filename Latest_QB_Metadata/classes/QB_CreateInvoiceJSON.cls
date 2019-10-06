public class QB_CreateInvoiceJSON {

	public class Line {
		public Decimal Amount;
		public String DetailType;
        public String Description;
		public SalesItemLineDetail SalesItemLineDetail = new SalesItemLineDetail();
		public SubTotalLineDetail SubTotalLineDetail = new SubTotalLineDetail();
		public DiscountLineDetail DiscountLineDetail = new DiscountLineDetail();
	}

	public class DiscountLineDetail {
		public Boolean PercentBased;
		public Decimal DiscountPercent;
		//public ItemRef DiscountAccountRef;
	}

	public class TaxCodeRef {
		public String value;
	}

	public class SubTotalLineDetail {
	}

	public class SalesItemLineDetail {
		public ItemRef ItemRef = new ItemRef();
		public Decimal UnitPrice;
		public Decimal Qty;
	}

	public List<Line> Line = new List<Line>();
    public ItemRef CustomerRef =new ItemRef();

	public class ItemRef {
		public String value;
		public String name;
	}

	
	public static QB_CreateInvoiceJSON parse(String json) {
		return (QB_CreateInvoiceJSON) System.JSON.deserialize(json, QB_CreateInvoiceJSON.class);
	}
}

/*public class QB_CreateInvoiceJSON {

	public class Line {
		public String DetailType;
        public String Description;
		public Decimal Amount;
		public SalesItemLineDetail SalesItemLineDetail=new SalesItemLineDetail();
	}

	public List<Line> Line = new List<Line>();
	public CustomerRef CustomerRef =new CustomerRef();

	public class SalesItemLineDetail {
		public ItemRef ItemRef=new ItemRef();
        public Decimal Qty; 
        public Decimal UnitPrice;
        public Decimal DiscountRate;
      //  public Decimal DiscountPercent;
	}

	public class ItemRef {
		public String name;
		public String value;
	}

	public class CustomerRef {
		public String value;
	}

	
	public static QB_CreateInvoiceJSON parse(String json) {
		return (QB_CreateInvoiceJSON) System.JSON.deserialize(json, QB_CreateInvoiceJSON.class);
	}
}*/