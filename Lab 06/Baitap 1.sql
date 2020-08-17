
CREATE DATABASE Lab11
GO
USE Lab11

BAI 1
CREATE VIEW ProductList
AS
SELECT ProductID, Name FROM AdventureWorks2016CTP3.Production.Product

SELECT * FROM ProductList

BAI 2
CREATE VIEW SalesOrderDetail
AS
SELECT pr.ProductID, pr.Name, od.UnitPrice, od.OrderQty,
		od.UnitPrice*od.OrderQty as [Total Price]
FROM AdventureWorks2016CTP3.Sales.SalesOrderDetail od
JOIN AdventureWorks2016CTP3.Production.Product pr
ON od.ProductID=pr.ProductID

SELECT * FROM SalesOrderDetail


