@IsTest
public class QB_CutomerWrapperTest {
	
	static testMethod void testParse() {
		String json = '{'+
		'  \"FullyQualifiedName\": \"King Groceries\", '+
		'  \"PrimaryEmailAddr\": {'+
		'    \"Address\": \"jdrew@myemail.com\"'+
		'  }, '+
		'  \"DisplayName\": \"King\'s Groceries\", '+
		'  \"Suffix\": \"Jr\", '+
		'  \"Title\": \"Mr\", '+
		'  \"MiddleName\": \"B\", '+
		'  \"Notes\": \"Here are other details.\", '+
		'  \"FamilyName\": \"King\", '+
		'  \"PrimaryPhone\": {'+
		'    \"FreeFormNumber\": \"(555) 555-5555\"'+
		'  }, '+
		'  \"CompanyName\": \"King Groceries\", '+
		'  \"BillAddr\": {'+
		'    \"CountrySubDivisionCode\": \"CA\", '+
		'    \"City\": \"Mountain View\", '+
		'    \"PostalCode\": \"94042\", '+
		'    \"Line1\": \"123 Main Street\", '+
		'    \"Country\": \"USA\"'+
		'  }, '+
		'  \"GivenName\": \"James\"'+
		'}';
		QB_CutomerWrapper obj = QB_CutomerWrapper.parse(json);
		System.assert(obj != null);
	}
}