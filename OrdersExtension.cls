public with sharing class OrdersExtension 
{
    public Order TheOrders {get; set;}
    public Pricebook2 PB {get; set;}
    
    public OrdersExtension(ApexPages.StandardController sController)
    {
        PageReference currPage = ApexPages.currentPage();
        Pricebook2 PB = new Pricebook2();
        TheOrders = (Order)sController.getRecord();
    }	
    /*
    public PageReference save()
    {
        Account acc = new Account();
        TheOrders.AccountId = '0015e00000J5S8xAAF';
        
        date myDate = date.today();
        TheOrders.EffectiveDate = date.today();
        TheOrders.Status = 'Draft';
        
        Insert TheOrders;
        TheOrders.Status = 'Activated';
        upsert TheOrders;
        PageReference pgRef = ApexPages.currentPage();
        TheOrders = new Order();
                
        //TheOrders.StatusCode = 'D';
        //TheOrders.Status = 'Draft';
        //update TheOrders;
        
        return pgRef;
    }*/
    
    public PageReference save()
    {
        Account acc = new Account(); 
        Pricebook2 Price = new Pricebook2();
        Order TheOrders = new Order
        (
            AccountId = '0015e00000J5S8xAAF',
            Status='Draft',
            EffectiveDate = date.today(),
            Customer_Orders__c = TheOrders.Customer_Orders__c,
            Quantity__c = TheOrders.Quantity__c,
            First_Name__c = TheOrders.First_Name__c,
            Last_Name__c = TheOrders.Last_Name__c,
            Email__c = TheOrders.Email__c,
            Street_Address__c = TheOrders.Street_Address__c,
            City__c = TheOrders.City__c,
            States__c = TheOrders.States__c,
            Zip_Code__c = TheOrders.Zip_Code__c,
			Payment_Method__c = TheOrders.Payment_Method__c,
			Card_Number__c = TheOrders.Card_number__c,
            Experation_Date__c = TheOrders.Experation_Date__c,
            Security_Number__c = TheOrders.Security_Number__c
        );
        
        insert TheOrders;
        //TheOrders.StatusCode = 'A';
        //From here, there needs to be code that's active.

        //TheOrders.Status = 'Activated';
        //update TheOrders;
        PageReference pgRef = ApexPages.currentPage();
        return pgRef;
    }
    
    public static Integer CallMethods(Order currOrder)
    {
        Integer Ord = 0;
        if(LastNameValidator(currOrder.Last_Name__c))
        {
            Ord++;
        }
        
        if(CityValidator(currOrder.City__c))
        {
            Ord++;
        }
        
        if(StreetAddressValidator(currOrder.Street_Address__c))
        {
            Ord++;
        }
        
        if(AptNumberValidator(currOrder.Apt_Number__c))
        {
            Ord++;
        }
        
        return Ord;
    }
    
    public static Boolean LastNameValidator(String Last_Name)
    {
        Boolean Last_Name_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('[a-zA-Z0-9]+');
        
        Matcher MyMatcher = LastNamePattern.matcher(Last_Name);
        
        Last_Name_Valid = MyMatcher.matches();
        
        return Last_Name_Valid;
    }
    
    public static Boolean CityValidator(String City)
    {
        Boolean City_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('[a-zA-Z0-9]+');
        
        Matcher MyMatcher = LastNamePattern.matcher(City);
        
        City_Valid = MyMatcher.matches();
        
        return City_Valid;
    }
    
    public static Boolean StreetAddressValidator(String SA) //SA short for Street Address
    {
        Boolean SA_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('/^[a-zA-Z]+$/');
        
        Matcher MyMatcher = LastNamePattern.matcher(SA);
        
        SA_Valid = MyMatcher.matches();
        
        return SA_Valid;
    }
    
    public static Boolean AptNumberValidator(String AptNumber)
    {
        Boolean AptNumber_Valid; // = new Boolean()
                
        Pattern LastNamePattern = Pattern.compile('/^[a-zA-Z]+$/');
        
        Matcher MyMatcher = LastNamePattern.matcher(AptNumber);
        
        AptNumber_Valid = MyMatcher.matches();
        
        return AptNumber_Valid;
    }
    
    
       
}