USE Test_Northwind
GO

SET STATISTICS IO ON
SET STATISTICS TIME ON

--��� �������
SELECT Country, CustomerID, City, [Address], Phone
FROM Customers
WHERE (Country BETWEEN 'UK' AND 'UK') AND (CustomerID BETWEEN 'A' AND 'Y')


SET STATISTICS TIME OFF
SET STATISTICS IO OFF
--  ����� �� = 422 ��, ����������� ����� = 3556 ��.

CREATE NONCLUSTERED INDEX Customers_nonclustered
	ON Customers (Country, CustomerID) INCLUDE (City, [Address], phone)
GO

SET STATISTICS IO ON
SET STATISTICS TIME ON

--� ��������
SELECT CustomerID, Country, City, [Address], Phone
FROM Customers WITH (INDEX (Customers_nonclustered))
WHERE (Country BETWEEN 'UK' AND 'UK') AND (CustomerID BETWEEN 'A' AND 'Y')

SET STATISTICS TIME OFF
SET STATISTICS IO OFF
--   ����� �� = 78 ��, ����������� ����� = 744 ��.

DROP INDEX Customers_nonclustered ON Customers


