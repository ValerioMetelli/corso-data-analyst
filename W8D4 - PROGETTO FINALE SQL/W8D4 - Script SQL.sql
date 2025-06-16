#Creo il db
create database ToysGroup;
use ToysGroup;

#TASK 2: creazione tabelle
create table Category (
	CategoryID int primary key not null auto_increment,
    CategoryName varchar(50)
);
    
create table Region (
	RegionID int primary key not null auto_increment,
    RegionName varchar(50)
);

create table Country (
	CountryID int primary key not null auto_increment,
    CountryName varchar(50),
    RegionID int not null,
    foreign key (RegionID) references Region(RegionID)
);

create table Product (
	ProductID int primary key not null auto_increment,
    CategoryID int not null,
    ProductName varchar(50),
    StandardCost decimal(10,2),
    Listprice decimal(10,2),
    Weight decimal (8,2),
    Size varchar(10),
    FinishedGoodsFlag tinyint,
    foreign key (CategoryID) references Category(CategoryID)
);

create table Sales (
	SalesOrderID int primary key not null auto_increment,
    ProductID int not null,
    CountryID int not null,
    OrderDate date,
    ShipDate date,
    OrderQuantity int,
    SalesAmount decimal (8,2),
    TotalProductCost decimal(8,2),
    UnitPrice decimal(8,2),
    foreign key (ProductID) references Product(ProductID),
    foreign key (CountryID) references Country(CountryID)
);

#TASK 3: Popolo tabelle
insert into Category (CategoryName) values 
('Bikes'),
('Clothing'),
('Accessories'),
('Sports'),
('Electronics');

insert into Region (RegionName) values
('WestEurope'),
('SouthEurope'),
('NorthAmerica'),
('EastAsia'),
('Oceania');

insert into Country (CountryName, RegionID) values
('France', 1),
('Germany', 1),
('Netherlands', 1),
('Italy', 2),
('Spain', 2),
('Greece', 2),
('USA', 3),
('Canada', 3),
('Japan', 4),
('Australia', 5);

insert into Product (CategoryID, ProductName, StandardCost, ListPrice, Weight, Size, FinishedGoodsFlag) values
(1, 'Mountain Bike Pro', 250.00, 499.99, 15.50, 180.00, 1),
(1, 'City Bike Classic', 180.00, 349.99, 12.30, 170.00, 1),
(1, 'Kids Bike Rainbow', 80.00, 159.99, 8.20, 120.00, 1),
(2, 'Cycling Jersey Blue', 15.00, 39.99, 0.25, 0.00, 1),
(2, 'Bike Gloves Pro', 12.00, 29.99, 0.15, 0.00, 1),
(2, 'Helmet Sport', 25.00, 79.99, 0.80, 0.00, 1),
(3, 'Water Bottle Steel', 5.00, 14.99, 0.30, 0.00, 1),
(3, 'Bike Lock Premium', 18.00, 45.99, 1.20, 0.00, 1),
(4, 'Soccer Ball Official', 12.00, 34.99, 0.45, 22.00, 1),
(4, 'Tennis Racket Junior', 35.00, 89.99, 0.75, 68.00, 1),
(5, 'GPS Bike Computer', 120.00, 299.99, 0.18, 0.00, 1),
(5, 'LED Light Set', 8.00, 24.99, 0.12, 0.00, 1),
(1, 'Electric Bike Deluxe', 450.00, 899.99, 18.50, 185.00, 1),
(2, 'Winter Cycling Jacket', 35.00, 89.99, 0.60, 0.00, 1),
(3, 'Premium Bike Pump', 22.00, 59.99, 0.85, 0.00, 1),
(4, 'Basketball Official', 18.00, 49.99, 0.62, 24.00, 1),
(5, 'Smart Fitness Tracker', 89.00, 199.99, 0.08, 0.00, 1),
(1, 'Bike Frame Raw', 120.00, 0.00, 3.20, 180.00, 0),
(1, 'Bike Wheel Component', 45.00, 0.00, 1.80, 70.00, 0),
(2, 'Fabric Roll Blue', 8.00, 0.00, 2.50, 0.00, 0),
(3, 'Metal Chain Links', 3.50, 0.00, 0.15, 0.00, 0),
(4, 'Rubber Ball Core', 2.00, 0.00, 0.20, 20.00, 0),
(5, 'Circuit Board Basic', 25.00, 0.00, 0.05, 0.00, 0),
(1, 'Vintage Bike Retro', 200.00, 449.99, 14.20, 175.00, 1),
(2, 'Cycling Shorts Premium', 28.00, 69.99, 0.18, 0.00, 1),
(3, 'Bike Computer Basic', 45.00, 119.99, 0.25, 0.00, 1),
(4, 'Volleyball Professional', 15.00, 39.99, 0.28, 21.00, 1);

insert into Sales (ProductID, CountryID, OrderDate, ShipDate, OrderQuantity, SalesAmount, TotalProductCost, UnitPrice) values
(1, 1, '2024-01-15', '2024-01-18', 2, 999.98, 500.00, 499.99),
(1, 2, '2024-01-20', '2024-01-23', 1, 499.99, 250.00, 499.99),
(2, 3, '2024-02-10', '2024-02-13', 3, 1049.97, 540.00, 349.99),
(3, 4, '2024-02-14', '2024-02-17', 5, 799.95, 400.00, 159.99),
(4, 1, '2024-03-05', '2024-03-08', 10, 399.90, 150.00, 39.99),
(5, 5, '2024-03-12', '2024-03-15', 8, 239.92, 96.00, 29.99),
(6, 2, '2024-03-20', '2024-03-23', 4, 319.96, 100.00, 79.99),
(7, 6, '2024-04-02', '2024-04-05', 15, 224.85, 75.00, 14.99),
(8, 7, '2024-04-10', '2024-04-13', 6, 275.94, 108.00, 45.99),
(9, 8, '2024-05-01', '2024-05-04', 20, 699.80, 240.00, 34.99),
(10, 9, '2024-05-15', '2024-05-18', 3, 269.97, 105.00, 89.99),
(11, 1, '2024-06-01', '2024-06-04', 2, 599.98, 240.00, 299.99),
(12, 10, '2024-06-10', '2024-06-13', 12, 299.88, 96.00, 24.99),
(1, 4, '2024-06-20', '2024-06-23', 1, 499.99, 250.00, 499.99),
(3, 1, '2024-07-05', '2024-07-08', 3, 479.97, 240.00, 159.99),
(4, 2, '2024-07-12', '2024-07-15', 15, 599.85, 225.00, 39.99),
(5, 3, '2024-08-01', '2024-08-04', 6, 179.94, 72.00, 29.99),
(6, 5, '2024-08-10', '2024-08-13', 2, 159.98, 50.00, 79.99),
(7, 6, '2024-08-20', '2024-08-23', 20, 299.80, 100.00, 14.99),
(8, 7, '2024-09-01', '2024-09-04', 4, 183.96, 72.00, 45.99),
(9, 8, '2024-09-15', '2024-09-18', 25, 874.75, 300.00, 34.99),
(10, 9, '2024-10-01', '2024-10-04', 2, 179.98, 70.00, 89.99),
(11, 10, '2024-10-10', '2024-10-13', 1, 299.99, 120.00, 299.99),
(12, 1, '2024-11-01', '2024-11-04', 8, 199.92, 64.00, 24.99),
(2, 2, '2024-11-15', '2024-11-18', 2, 699.98, 360.00, 349.99),
(1, 3, '2023-12-20', '2023-12-23', 1, 499.99, 250.00, 499.99),
(2, 4, '2023-11-15', '2023-11-18', 2, 699.98, 360.00, 349.99),
(3, 1, '2023-10-10', '2023-10-13', 4, 639.96, 320.00, 159.99),
(4, 5, '2023-09-20', '2023-09-23', 12, 479.88, 180.00, 39.99),
(5, 6, '2023-08-15', '2023-08-18', 10, 299.90, 120.00, 29.99),
(6, 7, '2023-07-01', '2023-07-04', 3, 239.97, 75.00, 79.99),
(7, 8, '2023-06-10', '2023-06-13', 25, 374.75, 125.00, 14.99),
(8, 9, '2023-05-20', '2023-05-23', 5, 229.95, 90.00, 45.99),
(9, 10, '2023-04-15', '2023-04-18', 30, 1049.70, 360.00, 34.99),
(10, 1, '2023-03-01', '2023-03-04', 1, 89.99, 35.00, 89.99),
(11, 2, '2023-02-10', '2023-02-13', 3, 899.97, 360.00, 299.99),
(12, 3, '2023-01-20', '2023-01-23', 15, 374.85, 120.00, 24.99),
(13, 1, '2024-03-15', '2024-03-18', 1, 899.99, 450.00, 899.99),
(13, 2, '2024-07-20', '2024-07-23', 2, 1799.98, 900.00, 899.99),
(14, 3, '2024-01-10', '2024-01-13', 5, 449.95, 175.00, 89.99),
(14, 4, '2024-09-05', '2024-09-08', 3, 269.97, 105.00, 89.99),
(15, 5, '2024-04-12', '2024-04-15', 8, 479.92, 176.00, 59.99),
(15, 6, '2024-08-25', '2024-08-28', 4, 239.96, 88.00, 59.99),
(16, 7, '2024-05-18', '2024-05-21', 15, 749.85, 270.00, 49.99),
(16, 8, '2024-10-03', '2024-10-06', 10, 499.90, 180.00, 49.99),
(17, 9, '2024-02-28', '2024-03-03', 3, 599.97, 267.00, 199.99),
(17, 10, '2024-06-14', '2024-06-17', 2, 399.98, 178.00, 199.99),
(24, 1, '2024-08-08', '2024-08-11', 1, 449.99, 200.00, 449.99),
(25, 2, '2024-05-30', '2024-06-02', 6, 419.94, 168.00, 69.99),
(26, 3, '2024-11-10', '2024-11-13', 4, 479.96, 180.00, 119.99),
(27, 4, '2024-07-02', '2024-07-05', 12, 479.88, 180.00, 39.99),
(13, 5, '2023-08-15', '2023-08-18', 1, 899.99, 450.00, 899.99),
(14, 6, '2023-11-20', '2023-11-23', 2, 179.98, 70.00, 89.99),
(16, 7, '2023-09-10', '2023-09-13', 8, 399.92, 144.00, 49.99);

#TASK 4
#1. Definire unicità PK
select CategoryID, count(*)
from Category
group by CategoryID
having count(*) > 1;

select RegionID, count(*) as Duplicates
from Region
group by RegionID
having count(*)>1;

select ProductID, count(*) as Duplicates
from Product
group by ProductID
having count(*)>1;

select CountryID, count(*) as Duplicates
from Country
group by CountryID
having count(*)>1;

select SalesOrderID, count(*) as Duplicates
from Sales
group by SalesorderID
having count(*)>1;

#2. campi: SalesOrderID, OrderDate, ProductName, CategoryName, CountryName, RegionName, Campo booleano 180gg
select S.SalesOrderID, 
	S.OrderDate, 
    P.ProductName, 
    Cat.CategoryName, 
    Coun.CountryName, 
    R.RegionName,
	datediff(curdate(), S.OrderDate) > 180 as MoreThan180Days
from Sales S
inner join Product P on S.ProductID = P.ProductID
inner join Category Cat on P.CategoryID = Cat.CategoryID
inner join Country Coun on S.CountryID = Coun.CountryID
inner join Region R on Coun.RegionID = R.RegionID
order by S.OrderDate;

#3. Somma quantità prodotti venduti > della media dell'ultimo anno censito. 
#result set: P.ProductID e somma quantità per prodotto

/* Mi trovo la somma delle quantità per prodotto
select ProductID, sum(OrderQuantity)
from Sales
group by ProductID;
*/

/* Mi trovo l'ultimo anno censito
select max(year(OrderDate))
from Sales;
*/

/*Mi trovo la quantità media rispetto all'ultimo anno censito
select avg(OrderQuantity)
from Sales
where year(OrderDate) = (select max(year(OrderDate))
from Sales);
*/

select ProductID, sum(OrderQuantity) as TotalQuantity
from Sales
group by ProductID
having sum(OrderQuantity) > (select avg(OrderQuantity)
from Sales
where year(OrderDate) = (select max(year(OrderDate))
from Sales));

#4. Elenco prodotti venduti e per ognuno il fatturato totale per anno
select S.ProductID, 
	P.ProductName, 
    sum(S.SalesAmount) as TotalAmount, 
    year(S.OrderDate) as Year
from Sales S
inner join Product P on S.ProductID = P.ProductID
group by S.ProductID, P.ProductName, year(S.OrderDate)
order by S.ProductID;

#5. Elenco fatturato raggruppato per stato e anno. Ordinandoli per data e fatturato decrescente
select Coun.CountryName, year(S.OrderDate) as Year, sum(S.SalesAmount) as TotalSales
from Sales S
inner join Country Coun on S.CountryID = Coun.CountryID
group by Coun.CountryName, year(S.OrderDate)
order by year(S.OrderDate) desc, TotalSales desc;

#6.	Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato?
select Cat.CategoryName, sum(S.OrderQuantity) as TotalQuantity, sum(S.SalesAmount) as TotalSales
from Sales S
inner join Product P on S. ProductID = P.ProductID
inner join Category Cat on P.CategoryID = Cat.CategoryID
group by Cat.CategoryName
order by TotalQuantity desc;

#7	Rispondere alla seguente domanda: quali sono i prodotti invenduti? Proponi due approcci risolutivi differenti.
#Primo approccio:
select P.ProductName
from Product P
left join Sales S on P.ProductID = S.ProductID
where S.ProductID is null;

#Secondo approccio:
select ProductName
from Product
where ProductID not in(select ProductID from Sales);

#8 Creare una vista sui prodotti in modo tale da esporre una versione denormalizzata delle informazioni utili 
#(codice prodotto, nome prodotto, nome categoria)
create view ProductInfo as
select P.ProductID, P.ProductName, Cat.CategoryName
from Product P
inner join Category Cat on P.CategoryID = Cat.CategoryID;

#9	Creare una vista per le informazioni geografiche
create view GeographicInfo as 
select Coun.CountryID, Coun.CountryName, R.RegionName
from Country Coun
inner join Region R on Coun.RegionID = R.RegionID;

