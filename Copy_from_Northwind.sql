--CREATE DATABASE Test_Northwind
USE Test_Northwind
GO

--DELETE FROM Products
--DELETE FROM Customers
--DELETE FROM Orders

IF OBJECT_ID ('Products') IS NOT NULL DROP TABLE Products
IF OBJECT_ID ('Customers') IS NOT NULL DROP TABLE Customers
IF OBJECT_ID ('Orders') IS NOT NULL DROP TABLE Orders
IF OBJECT_ID ('OrderDetails') IS NOT NULL DROP TABLE OrderDetails


SELECT * INTO Customers FROM Northwind..Customers
DECLARE @count INT
SELECT @count = 10000
WHILE @count >= 0
  BEGIN
    INSERT INTO Customers SELECT * FROM Northwind..Customers
    SELECT @count = @count - 1
  END

SELECT * INTO Orders FROM Northwind..Orders
SELECT * INTO OrderDetails FROM Northwind.."Order Details"

SELECT * INTO Products FROM Northwind..Products
SELECT @count = 10000
WHILE @count >= 0
  BEGIN
    INSERT INTO Products (ProductName,SupplierID,CategoryID,QuantityPerUnit,
                                          UnitPrice,UnitsInStock,UnitsOnOrder,
                                                       ReorderLevel,Discontinued)
    SELECT ProductName,SupplierID,CategoryID,
             QuantityPerUnit,UnitPrice,UnitsInStock,
                UnitsOnOrder,ReorderLevel,Discontinued 
    FROM Northwind..Products
    SELECT @count = @count - 1
  END


IF OBJECT_ID ('Customers_with_index') IS NOT NULL DROP TABLE Customers_with_index
IF OBJECT_ID ('Orders_with_index') IS NOT NULL DROP TABLE Orders_with_index


SELECT * INTO Customers_with_index FROM Customers
SELECT * INTO Orders_with_index FROM Orders

