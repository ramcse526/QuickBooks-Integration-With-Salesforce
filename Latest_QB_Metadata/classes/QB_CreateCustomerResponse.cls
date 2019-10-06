public class QB_CreateCustomerResponse {

	public class BillAddr {
		public String Id;
		public String Line1;
		public String City;
		public String Country;
		public String CountrySubDivisionCode;
		public String PostalCode;
	}

	public class CurrencyRef {
		public String value;
		public String name;
	}

	public Customer Customer;
	public String ctime;

	public class PrimaryPhone {
		public String FreeFormNumber;
	}
    
     public class Mobile {   //Change
        public String FreeFormNumber;
    }

	public class Customer {
		public Boolean Taxable;
		public BillAddr BillAddr;
		public String Notes;
		public Boolean Job;
		public Boolean BillWithParent;
		public Integer Balance;
		public Integer BalanceWithJobs;
		public CurrencyRef CurrencyRef;
		public String PreferredDeliveryMethod;
		public Boolean IsProject;
		public String domain;
		public Boolean sparse;
		public String Id;
		public String SyncToken;
		public MetaData MetaData;
		public String Title;
		public String GivenName;
		public String MiddleName;
		public String FamilyName;
		public String Suffix;
		public String FullyQualifiedName;
		public String CompanyName;
		public String DisplayName;
		public String PrintOnCheckName;
		public Boolean Active;
		public PrimaryPhone PrimaryPhone;
		public PrimaryEmailAddr PrimaryEmailAddr;
        public Mobile Mobile; //change
	}

	public class MetaData {
		public String CreateTime;
		public String LastUpdatedTime;
	}

	public class PrimaryEmailAddr {
		public String Address;
	}

	
	public static QB_CreateCustomerResponse parse(String json) {
		return (QB_CreateCustomerResponse) System.JSON.deserialize(json, QB_CreateCustomerResponse.class);
	}
}