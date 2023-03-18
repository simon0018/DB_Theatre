USE Test_Northwind
GO

--��� �������
--   ����� �� = 734 ��, ����������� ����� = 4022 ��.
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

--����������������
--   ����� �� = 125 ��, ����������� ����� = 507 ��.

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

--������������������
--   ����� �� = 265 ��, ����������� ����� = 639 ��.

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