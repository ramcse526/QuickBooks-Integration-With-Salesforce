@IsTest
public class QB_CreateCustomerResponseTest {
	
	static testMethod void testParse() {
		String json = '{'+
		' \"Customer\": {'+
		'  \"Taxable\": true,'+
		'  \"BillAddr\": {'+
		'   \"Id\": \"2011\",'+
		'   \"Line1\": \"123 Main Street\",'+
		'   \"City\": \"Mountain View\",'+
		'   \"Country\": \"USA\",'+
		'   \"CountrySubDivisionCode\": \"CA\",'+
		'   \"PostalCode\": \"94042\"'+
		'  },'+
		'  \"Notes\": \"Here are other details.\",'+
		'  \"Job\": false,'+
		'  \"BillWithParent\": false,'+
		'  \"Balance\": 0,'+
		'  \"BalanceWithJobs\": 0,'+
		'  \"CurrencyRef\": {'+
		'   \"value\": \"USD\",'+
		'   \"name\": \"United States Dollar\"'+
		'  },'+
		'  \"PreferredDeliveryMethod\": \"Print\",'+
		'  \"IsProject\": false,'+
		'  \"domain\": \"QBO\",'+
		'  \"sparse\": false,'+
		'  \"Id\": \"661\",'+
		'  \"SyncToken\": \"0\",'+
		'  \"MetaData\": {'+
		'   \"CreateTime\": \"2019-07-06T11:55:37-07:00\",'+
		'   \"LastUpdatedTime\": \"2019-07-06T11:55:37-07:00\"'+
		'  },'+
		'  \"Title\": \"Mr\",'+
		'  \"GivenName\": \"James\",'+
		'  \"MiddleName\": \"B\",'+
		'  \"FamilyName\": \"King\",'+
		'  \"Suffix\": \"Jr\",'+
		'  \"FullyQualifiedName\": \"King\'s Groceries\",'+
		'  \"CompanyName\": \"King Groceries\",'+
		'  \"DisplayName\": \"King\'s Groceries\",'+
		'  \"PrintOnCheckName\": \"King Groceries\",'+
		'  \"Active\": true,'+
		'  \"PrimaryPhone\": {'+
		'   \"FreeFormNumber\": \"(555) 555-5555\"'+
		'  },'+
		'  \"PrimaryEmailAddr\": {'+
		'   \"Address\": \"jdrew@myemail.com\"'+
		'  }'+
		' },'+
		' \"ctime\": \"2019-07-06T11:55:37.368-07:00\"'+
		'}';
		QB_CreateCustomerResponse obj = QB_CreateCustomerResponse.parse(json);
		System.assert(obj != null);
	}
}