//JSON format
/*{
    "Name" : "ABC Pvt Ltd",
    "Type" : "Consulting",
    "Industry" : "Education",
    "AnnualRevenue" : 2000000,
    "Established" : 2000
}*/

//Get an account record, convert that into JSON format
Account acc = [SELECT Name, Type, Industry, AnnualRevenue 
                FROM Account WHERE Type != null 
                AND Industry != null 
                AND AnnualRevenue != null 
                LIMIT 1];
String jsonString = JSON.serialize(acc);
System.debug(jsonString);

//Get 5 account records, convert them into json format
List<Account> accounts = [SELECT Id, Name, Type, Industry, AnnualRevenue
                            FROM Account
                            WHERE Type != null
                            AND Industry != null
                            AND AnnualRevenue != null
                            LIMIT 5];
String jsonString = JSON.serialize(accounts);
System.debug(jsonString);

//Get an opportunity record, convert that into json format
//Name, Type, Stage, Amount
Opportunity opp = [SELECT Id, Name, Type, StageName, Amount 
                    FROM Opportunity 
                    WHERE Type != null 
                    AND StageName != null 
                    AND Amount != null 
                    LIMIT 1];
String jsonString = JSON.serialize(opp);
System.debug(jsonString);

//Get top 10 opportunities based on Amount, convert them into json format
List<Opportunity> opps = [SELECT Id, Name, Type, StageName, Amount 
                            FROM Opportunity 
                            WHERE Amount != null
                            AND StageNAme != null
                            AND Type != null
                            ORDER BY Amount DESC
                            LIMIT 10];
String jsonString = JSON.serialize(opps);
system.debug(jsonString);

//Test REST Callouts
RestCallouts.getAnimals();
RestCallouts.getAirlines();
RestCallouts.getEmployee();
RestCallouts.getCaseInfo();
RestCallouts.postAnimal();

//Test CovidInfo Callout
CovidInfoCallout.getCovidInfo();

//Test Posts Callout
PostsCallout.postPosts();

//Test SOAP Callouts
SoapCallouts.getParksByCountry('United States');
SoapCallouts.doAddCallout(54, 68);
SoapCallouts.doMultiplyCallout(23, 46);