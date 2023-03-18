USE Test_Northwind
GO


--Без индекса
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT  Customers.CustomerID, Customers.CompanyName,
        Customers.City, Orders.ShipName, Orders.ShippedDate
FROM Customers INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
WHERE (Customers.City BETWEEN 'Cork' AND 'Cork') 
       AND (YEAR(Orders.ShippedDate) BETWEEN 1998 AND 1998)

SET STATISTICS IO OFF
SET STATISTICS TIME OFF
--   Время ЦП = 297 мс, затраченное время = 3483 мс.


--С некластеризованным индексом
CREATE NONCLUSTERED INDEX Customers_nonclustered
	ON Customers (City, CustomerID) INCLUDE (CompanyName)
CREATE NONCLUSTERED INDEX Orders_nonclustered
	ON Orders (ShipName, CustomerID) INCLUDE (ShippedDate)
GO
SET STATISTICS IO ON
SET STATISTICS TIME ON

SELECT  Customers.CustomerID, Customers.CompanyName,
        Customers.City, Orders.ShipName, Orders.ShippedDate
FROM Customers INNER JOIN Orders
		ON Customers.CustomerID = Orders.CustomerID
WHERE (Customers.City BETWEEN 'Cork' AND 'Cork') 
	  AND (YEAR(Orders.ShippedDate) BETWEEN 1998 AND 1998)

SET STATISTICS IO OFF
SET STATISTICS TIME OFF
--   Время ЦП = 125 мс, затраченное время = 408 мс.


DROP INDEX Orders_nonclustered ON Orders
DROP INDEX Customers_nonclustered ON Customers