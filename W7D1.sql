#1.Scrivi una query per verificare che il campo ProductKey nella tabella DimProduct sia una chiave primaria. 
SELECT ProductKey, COUNT(ProductKey) AS duplicati
FROM dimproduct
GROUP BY ProductKey
HAVING COUNT(ProductKey)>1;

SELECT *
FROM dimproduct
WHERE ProductKey IS NULL;

#2.Scrivi una query per verificare che la combinazione dei campi SalesOrderNumber e SalesOrderLineNumber sia una PK.
SELECT SalesOrderNumber, SalesOrderLineNumber, COUNT(*) AS duplicati
FROM factresellersales
GROUP BY SalesOrderNumber, SalesOrderLineNumber  
HAVING COUNT(*) > 1;

SELECT *
FROM factresellersales
WHERE SalesOrderNumber IS NULL
OR SalesOrderLineNumber IS NULL;

#3.Conta il numero transazioni (SalesOrderLineNumber) realizzate ogni giorno a partire dal 1 Gennaio 2020.
DESCRIBE factresellersales;

SELECT OrderDate, COUNT(*) AS N_transazioni
FROM factresellersales
WHERE OrderDate >="2020/01/01"
GROUP BY OrderDate;

#4.Calcola il fatturato totale (FactResellerSales.SalesAmount),la quantità totale venduta (FactResellerSales.OrderQuantity) 
#e il prezzo medio di vendita (FactResellerSales.UnitPrice) per prodotto (DimProduct) a partire dal 1 Gennaio 2020. 
#Il result set deve esporre pertanto il nome del prodotto, il fatturato totale, la quantità totale venduta e il prezzo medio di vendita. 
#I campi in output devono essere parlanti!
SELECT D.ProductKey,D.EnglishProductName, SUM(F.SalesAmount) AS SalesTotal, SUM(F.OrderQuantity) AS QuantityTotal, AVG(F.UnitPrice) AS AvgUnitPrice 
FROM dimproduct AS D
INNER JOIN factresellersales AS F ON D.ProductKey=F.ProductKey
WHERE F.OrderDate >="2020-01-01"
GROUP BY D.EnglishProductName, D.ProductKey
ORDER BY AVG(F.UnitPrice) DESC;

#1.Calcola il fatturato totale (FactResellerSales.SalesAmount) e la quantità totale venduta (FactResellerSales.OrderQuantity) 
#per Categoria prodotto (DimProductCategory). 
#Il result set deve esporre pertanto il nome della categoria prodotto, il fatturato totale e la quantità totale venduta. 
#I campi in output devono essere parlanti!
SELECT Cat.EnglishProductCategoryName AS CategoryName, SUM(F.SalesAmount) AS TotalAmount, SUM(F.OrderQuantity) AS TotalQuantity
FROM factresellersales AS F
INNER JOIN dimproduct AS D ON F.ProductKey=D.ProductKey
INNER JOIN dimproductsubcategory AS Sub ON D.ProductSubcategoryKey=Sub.ProductSubcategoryKey
INNER JOIN dimproductcategory AS Cat ON Sub.ProductCategoryKey=Cat.ProductCategoryKey
GROUP BY Cat.EnglishProductCategoryName;

#2.Calcola il fatturato totale per area città (DimGeography.City) realizzato a partire dal 1 Gennaio 2020. 
#Il result set deve esporre lʼelenco delle città con fatturato realizzato superiore a 60K.
SELECT G.City, SUM(F.SalesAmount) AS TotalAmount
FROM factresellersales F
INNER JOIN dimreseller D ON F.ResellerKey=D.ResellerKey
INNER JOIN dimgeography G ON D.GeographyKey=G.GeographyKey
WHERE F.OrderDate>="2020-01-01" 
GROUP BY G.City
HAVING SUM(F.SalesAmount)>60000
ORDER BY SUM(F.SalesAmount) DESC;



