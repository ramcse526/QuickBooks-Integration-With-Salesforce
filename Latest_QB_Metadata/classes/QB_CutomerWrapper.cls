public class QB_CutomerWrapper {
    public class BillAddr {
        public String CountrySubDivisionCode;
        public String City;
        public String PostalCode;
        public String Line1;
        public String Line2;
        public String Country;
    }
    public class ShipAddr {
        public String CountrySubDivisionCode;
        public String City;
        public String PostalCode;
        public String Line1;
        public String Line2;
        public String Country;
     
    }
    public String FullyQualifiedName;
    public PrimaryEmailAddr PrimaryEmailAddr=new PrimaryEmailAddr();
    public String DisplayName;
    public String Suffix;
    public String Title;
    public String MiddleName;
    public String Notes;
    public String FamilyName;
    public PrimaryPhone PrimaryPhone=new PrimaryPhone();
    public Mobile Mobile=new Mobile(); 
    public String CompanyName;
    public BillAddr BillAddr = new BillAddr();
    public ShipAddr ShipAddr = new ShipAddr();
    public String GivenName;
    
    public class PrimaryPhone {
        public String FreeFormNumber;
    }
    
    public class PrimaryEmailAddr {
        public String Address;
    }
    
    public class Mobile { 
        public String FreeFormNumber;
    }
    
    public static QB_CutomerWrapper parse(String json) {
        return (QB_CutomerWrapper) System.JSON.deserialize(json, QB_CutomerWrapper.class);
    }
}