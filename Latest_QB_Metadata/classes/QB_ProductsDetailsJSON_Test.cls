@IsTest
public class QB_ProductsDetailsJSON_Test {
	
	static testMethod void testParse() {
		String json = '{'+
		' \"QueryResponse\": {'+
		'  \"Item\": ['+
		'   {'+
		'    \"Name\": \"1/4x4 Concrete Screw BRONZE\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"44\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"1/8 Nicropress Fitting Alum\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"46\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"12x3/4 TEK BRONZE 5/16 HEAD\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"45\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"1st Responder Discount\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"53\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"2 Track 2 Vent Slider\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"39\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"2 Track Acrylic Slider\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"20\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"20/20 Charcoal Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"33\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"2x2 30\' BRONZE\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"50\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"2x2 HS Patio 30\' BRONZE\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"41\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"3 Track 3 Vent Slider\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"27\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"3/8x5 Stainless Steel EYEBOLT\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"48\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"4 Track 3 Vent Slider\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"14\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"4 Track 4 Vent Slider\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"28\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Acrylic\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"73\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Acrylic Cleaner\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"5\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Acrylic Replacement\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"72\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Aluminum Installation\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"29\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Bad Debt\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"35\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"BUGSWEEP 36 BRZ\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"54\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Cable Tie Triangle Plate WHITE\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"47\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Complete Door - 8\\\" BRONZE,\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"42\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Delta Door\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"36\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Deposit\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"9\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Discount\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"55\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Elite Roof\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"24\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Final Payment\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"23\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Front Entry Door\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"22\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Gutter Replacement\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"11\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Hex Caps\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"51\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Incomplete Job\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"60\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Install 7\\\" Super Gutter\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"49\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Install Front Entry\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"13\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Install Lanai\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"18\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Insurance Discount\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"56\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Late Charge\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"57\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Misc. Repairs\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"40\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Miscellaneous Hardware\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"58\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"New Door Installation\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"30\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"PayPal Line Discount\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"71\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"PayPal Sales\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"69\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"PayPal Shipping\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"70\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Permitting & Engineering Fees\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"59\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"PmntDiscount_5010 - Job Materials\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"63\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Pool Cage Installation\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"3\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Pool Cage Tie\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"43\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Prime Entry Door\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"19\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Reimb Group\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"62\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Removal of Exisiting\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"32\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Remove & Replace Panels\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"52\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Repair Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"26\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Repairs\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"4\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Replace Existing Window Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"25\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Replacement Screen Door\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"17\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Rescreen - Sun Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"38\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Rescreen - Super Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"7\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Rescreen 18/14\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"6\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Roll-Up Shutters\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"31\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Sales\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"61\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"74\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"20/20 No-See-Um - Re-Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"75\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Tuff-Screen - Re-screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"76\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Sliding Screen Door\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"10\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Square Gift Card\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"65\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Square Item\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"66\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Square Line Discount\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"67\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Square Shipping\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"68\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Square Tips\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"64\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Tapcon Replacement\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"15\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Tie Down Cable Installation\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"16\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Uniquie Technologies\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"37\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Vinyl Repairs\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"34\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Window\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"21\"'+
		'   },'+
		'   {'+
		'    \"Name\": \"Window Craftsmen Screen\",'+
		'    \"sparse\": true,'+
		'    \"Id\": \"12\"'+
		'   }'+
		'  ],'+
		'  \"startPosition\": 1,'+
		'  \"maxResults\": 73'+
		' },'+
		' \"time\": \"2019-07-25T06:44:12.502-07:00\"'+
		'}';
        QB_ProductsDetailsJSON.Item Item = new QB_ProductsDetailsJSON.Item();
        QB_ProductsDetailsJSON.QueryResponse qr = new QB_ProductsDetailsJSON.QueryResponse();
        
		QB_ProductsDetailsJSON obj = QB_ProductsDetailsJSON.parse(json);
     
		System.assert(obj != null);
	}
}