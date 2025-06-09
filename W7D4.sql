#1.Implementa una vista denominata Product al fine di creare unʼanagrafica (dimensione) prodotto completa. 
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome prodotto, il nome della sottocategoria associata e 
#il nome della categoria associata.
CREATE VIEW Product AS
SELECT D.ProductKey, 
       D.EnglishProductName, 
       SUB.ProductSubcategoryKey, 
       SUB.EnglishProductSubcategoryName, 
       CAT.ProductCategoryKey, 
       CAT.EnglishProductCategoryName
FROM dimproduct D
INNER JOIN dimproductsubcategory SUB ON D.ProductSubcategoryKey=SUB.ProductSubcategoryKey
INNER JOIN dimproductcategory CAT ON SUB.ProductCategoryKey=CAT.ProductCategoryKey;

SELECT * FROM Product;

#2.Implementa una vista denominata Reseller al fine di creare unʼanagrafica (dimensione) reseller completa. 
#La vista, se interrogata o utilizzata come sorgente dati, deve esporre il nome del reseller, il nome della città e il nome della regione.
CREATE VIEW Reseller AS
SELECT R.ResellerKey,
       R.ResellerName,
       G.GeographyKey,
       G.City,
       G.StateProvinceName AS Region
FROM DimReseller R
LEFT JOIN DimGeography G ON R.GeographyKey = G.GeographyKey;

SELECT * FROM Reseller;

#3.Crea una vista denominata Sales che deve restituire la data dellʼordine, il codice documento, la riga di corpo del documento, 
#la quantità venduta, lʼimporto totale e il profitto.

CREATE VIEW Sales AS
SELECT F.OrderDate,
       F.SalesOrderNumber,
       F.SalesOrderLineNumber,
       F.OrderQuantity,
       F.SalesAmount,
       (F.SalesAmount - F.TotalProductCost) AS Profit,
       F.ProductKey,
       F.ResellerKey
FROM FactResellerSales F;

SELECT * FROM Sales;
select SalesAmount, TotalProductCost
from factresellersales;

