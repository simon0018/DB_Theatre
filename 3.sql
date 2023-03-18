USE Test_Northwind
GO

--Без индекса
--   Время ЦП = 734 мс, затраченное время = 4022 мс.
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT Customers.Country, Orders.EmployeeID, Products.CategoryID, OrderDetails.Quantity
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
               INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
			   INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE (Customers.Country BETWEEN 'Belgium' AND 'Belgium') AND
	  (Orders.EmployeeID BETWEEN 5 AND 5) AND
	  (Products.CategoryID BETWEEN 1 AND 4) AND
	  (OrderDetails.Quantity >= 10)

SET STATISTICS IO OFF
SET STATISTICS TIME OFF

--Кластеризованный
--   Время ЦП = 125 мс, затраченное время = 507 мс.

CREATE CLUSTERED INDEX Clast_Customers ON Customers(CustomerID)
CREATE CLUSTERED INDEX Clast_Orders ON Orders(EmployeeID)
CREATE CLUSTERED INDEX Clast_Products ON Products (ProductID)
CREATE CLUSTERED INDEX Clast_OrderDetails ON OrderDetails (OrderID,ProductID)

SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT Customers.Country, Orders.EmployeeID, Products.CategoryID, OrderDetails.Quantity
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
               INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
			   INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE (Customers.Country BETWEEN 'Belgium' AND 'Belgium') AND
	  (Orders.EmployeeID BETWEEN 5 AND 5) AND
	  (Products.CategoryID BETWEEN 1 AND 4) AND
	  (OrderDetails.Quantity >= 10)

SET STATISTICS IO OFF
SET STATISTICS TIME OFF

DROP INDEX Clast_Customers ON Customers
DROP INDEX Clast_Orders ON Orders
DROP INDEX Clast_Products ON Products
DROP INDEX Clast_OrderDetails ON OrderDetails

--Некластеризованный
--   Время ЦП = 265 мс, затраченное время = 639 мс.

CREATE NONCLUSTERED INDEX Non_Customers ON Customers(Country)
CREATE NONCLUSTERED INDEX Non_Orders ON Orders(EmployeeID)
CREATE NONCLUSTERED INDEX Non_Products ON Products (CategoryID)
CREATE NONCLUSTERED INDEX Non_OrderDetails ON OrderDetails (Quantity)

SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT Customers.Country, Orders.EmployeeID, Products.CategoryID, OrderDetails.Quantity
FROM Customers INNER JOIN Orders ON Customers.CustomerID = Orders.CustomerID
               INNER JOIN OrderDetails ON OrderDetails.OrderID = Orders.OrderID
			   INNER JOIN Products ON Products.ProductID = OrderDetails.ProductID
WHERE (Customers.Country BETWEEN 'Belgium' AND 'Belgium') AND
	  (Orders.EmployeeID BETWEEN 5 AND 5) AND
	  (Products.CategoryID BETWEEN 1 AND 4) AND
	  (OrderDetails.Quantity >= 10)

SET STATISTICS IO OFF
SET STATISTICS TIME OFF

DROP INDEX Non_Customers ON Customers
DROP INDEX Non_Orders ON Orders
DROP INDEX Non_Products ON Products
DROP INDEX Non_OrderDetails ON OrderDetails