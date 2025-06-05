#Uso una describe per visionare le tabelle Dimproduct e DimProductSubcategory
DESCRIBE dimproduct;
DESCRIBE dimproductsubcategory;
#Esposizione anagrafica prodotti facendo una left join tra DimProduct e DimProductSubcategory
SELECT P. EnglishProductName, P. ListPrice, C.EnglishProductSubcategoryName AS SubCategoryName
FROM dimproduct P
LEFT JOIN dimproductsubcategory S ON P. ProductsubcategoryKey = S. ProductsubcategoryKey;
#Esploro la tabella DimProductCategory
Select * from dimproductcategory;
#Espozione anagrafica prodotti facendo due left join tra DImproduct, Dimproductsubcategory e dimproductcategory
SELECT P. EnglishProductName, P. ListPrice, S.EnglishProductSubcategoryName AS SubCategoryName, C. EnglishProductCategoryName 
FROM dimproduct P
LEFT JOIN dimproductsubcategory S ON P. ProductsubcategoryKey = S. ProductsubcategoryKey
LEFT JOIN dimproductcategory C ON S. ProductCategoryKey = C. ProductCategoryKey;
#Esponi lʼelenco dei soli prodotti venduti (DimProduct, FactResellerSales). 
SELECT DISTINCT P. EnglishProductName, F. UnitPrice, F. SalesAmount
FROM dimproduct P
INNER JOIN factresellersales F ON P. ProductKey = F. ProductKey;
#Esponi lʼelenco dei prodotti non venduti (considera i soli prodotti finiti cioè quelli per i quali il campo FinishedGoodsFlag è uguale a 1).
SELECT DISTINCT P. EnglishProductName
FROM dimproduct P
LEFT JOIN factresellersales F ON P. ProductKey=F. ProductKey
WHERE F. SalesAmount IS NULL
AND P.FinishedGoodsFlag = 1;
#Esponi lʼelenco delle transazioni di vendita (FactResellerSales) indicando anche il nome del prodotto venduto (DimProduct)
SELECT F. SalesOrderNumber, F. SalesAmount, F. OrderQuantity, F. OrderDate, D. EnglishProductName
FROM factresellersales F
INNER JOIN dimproduct D ON F. ProductKey= D. ProductKey;
#Esponi lʼelenco delle transazioni di vendita indicando la categoria di appartenenza di ciascun prodotto venduto.
SELECT F.SalesOrderNumber, F.SalesOrderLineNumber, F.OrderDate, F.SalesAmount, F.OrderQuantity, D.EnglishProductName, CAT.EnglishProductCategoryName
FROM factresellersales F
INNER JOIN dimproduct D ON F. ProductKey = D. ProductKey
INNER JOIN dimproductsubcategory SUB ON D. ProductSubcategoryKey = SUB. ProductSubcategoryKey
INNER JOIN dimproductcategory CAT ON SUB. ProductCategoryKey = CAT. ProductCategoryKey;
#Esplora la tabella DimReseller.
DESCRIBE dimreseller;
SELECT *
FROM dimreseller;
#Esponi in output lʼelenco dei reseller indicando, per ciascun reseller, anche la sua area geografica:
SELECT R. ResellerKey, R. GeographyKey, R. Phone, R. ResellerName, R. AddressLine1, G. EnglishCountryRegionName AS RegionName
FROM dimreseller R
LEFT JOIN dimgeography G ON R. GeographyKey = G. GeographyKey;
#Esponi lʼelenco delle transazioni di vendita. 
#Il result set deve esporre i campi: SalesOrderNumber, SalesOrderLineNumber, OrderDate, UnitPrice, Quantity, TotalProductCost. 
#Il result set deve anche indicare il nome del prodotto, il nome della categoria del prodotto, il nome del reseller e lʼarea geografica.
SELECT SALE.SalesOrderNumber, SALE.SalesOrderLineNumber, SALE.OrderDate, SALE.UnitPrice, SALE.OrderQuantity, SALE.TotalProductCost, 
	PROD.EnglishProductName, CAT.EnglishProductCategoryName, SELL.ResellerName, GEO.StateProvinceName
FROM factresellersales SALE
INNER JOIN dimproduct PROD ON SALE.ProductKey=PROD.ProductKey
INNER JOIN dimreseller SELL ON SALE.ResellerKey=SELL.ResellerKey
INNER JOIN dimproductsubcategory SUB ON PROD.ProductSubcategoryKey=SUB.ProductSubcategoryKey
INNER JOIN dimproductcategory CAT ON SUB.ProductCategoryKey=CAT.ProductCategoryKey
INNER JOIN dimgeography GEO ON SELL.GeographyKey=GEO.GeographyKey;