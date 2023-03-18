USE Test_Northwind
GO

SET STATISTICS IO ON
SET STATISTICS TIME ON

--Без индекса
SELECT Country, CustomerID, City, [Address], Phone
FROM Customers
WHERE (Country BETWEEN 'UK' AND 'UK') AND (CustomerID BETWEEN 'A' AND 'Y')


SET STATISTICS TIME OFF
SET STATISTICS IO OFF
--  Время ЦП = 422 мс, затраченное время = 3556 мс.

CREATE NONCLUSTERED INDEX Customers_nonclustered
	ON Customers (Country, CustomerID) INCLUDE (City, [Address], phone)
GO

SET STATISTICS IO ON
SET STATISTICS TIME ON

--С индексом
SELECT CustomerID, Country, City, [Address], Phone
FROM Customers WITH (INDEX (Customers_nonclustered))
WHERE (Country BETWEEN 'UK' AND 'UK') AND (CustomerID BETWEEN 'A' AND 'Y')

SET STATISTICS TIME OFF
SET STATISTICS IO OFF
--   Время ЦП = 78 мс, затраченное время = 744 мс.

DROP INDEX Customers_nonclustered ON Customers


