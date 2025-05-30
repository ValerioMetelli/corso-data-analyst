#Esploro la tabella dimproduct
SELECT * FROM dimproduct
#Interrogo la tabella selezionando i campi desiderati assegnando alias "parlanti"
SELECT ProductKey AS CodiceID, ProductAlternateKey AS ProductID, EnglishProductName AS Model, Color, StandardCost, FinishedGoodsFlag 
FROM dimproduct;
#espongo solo i prodotti finiti FinishedGoodsFlag=1
SELECT ProductKey AS CodiceID, ProductAlternateKey AS ProductID, EnglishProductName AS Model, Color, StandardCost, FinishedGoodsFlag 
FROM dimproduct
WHERE FinishedGoodsFlag=1;
#Espongo i campi ProductAlternateKey (deve cominciare per BK o FR) e ProductKey, StandardCost, ListPrice
SELECT ProductAlternateKey, ProductKey, StandardCost, Listprice 
FROM dimproduct
WHERE ProductAlternateKey LIKE "BK%" OR ProductAlternateKey LIKE "FR%";
#Aggiungo un campo calcolato 
SELECT ProductAlternateKey, ProductKey, StandardCost, Listprice, Listprice-StandardCost AS Markup 
FROM dimproduct
WHERE ProductAlternateKey LIKE "BK%" OR ProductAlternateKey LIKE "FR%";
#Elenco dei proditti finiti il cui prezzo di listino è compreso tra 1000 e 2000
SELECT ProductKey AS CodiceID, ProductAlternateKey AS ProductID, EnglishProductName AS Model, Color, ListPrice 
FROM dimproduct
WHERE FinishedGoodsFlag=1
AND ListPrice BETWEEN 1000 AND 2000;
#Esploro tabella DimEmployee, selezionando solo gli agenti SalesPersonFlag=1
SELECT * FROM dimemployee
WHERE SalesPersonFlag=1;
#Esploro la tabella FactResellerSales
SELECT * FROM factresellersales;
#Filtro per data dal 01/01/2020 e per questi codici prodotto 597, 598, 477, 214, aggiungo un campo calcolato Profit
SELECT SalesOrderNumber,SalesOrderLineNumber,OrderDate,DueDate, ShipDate, ProductKey, ResellerKey,PromotionKey,EmployeeKey,SalesTerritoryKey,OrderQuantity,UnitPrice,TotalProductCost,SalesAmount, SalesAmount-TotalProductCost AS Profit
FROM factresellersales
WHERE OrderDate >="2020-01-01"
AND ProductKey IN (597, 598, 477, 214);


