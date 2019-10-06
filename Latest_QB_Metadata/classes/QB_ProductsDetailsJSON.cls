public class QB_ProductsDetailsJSON {

	public class Item {
		public String Name;
		public Boolean sparse;
		public String Id;
	}

	public QueryResponse QueryResponse = new QueryResponse();

	public class QueryResponse {
		public List<Item> Item=new list<Item>();
		public Integer startPosition;
		public Integer maxResults;
	}

	
	public static QB_ProductsDetailsJSON parse(String json) {
		return (QB_ProductsDetailsJSON) System.JSON.deserialize(json, QB_ProductsDetailsJSON.class);
	}
}