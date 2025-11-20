SELECT * FROM SalesLT.Product;

SELECT Name, StandardCost, ListPrice
FROM SalesLT.Product;

SELECT Name, ListPrice - StandardCost
FROM SalesLT.Product;

SELECT Name AS ProductName, ListPrice - StandardCost AS Markup
FROM SalesLT.Product;

-- 10
SELECT ProductNumber, Color, Size, Color + ', ' + Size AS ProductDetails
FROM SalesLT.Product


-- Work with datatypes
-- 1
SELECT ProductID + ':' + Name AS ProductName
FROM SalesLT.Product;

-- 3
SELECT CAST(ProductID AS varchar(5)) + ':' + Name AS ProductName
FROM SalesLT.Product

-- 5 convert is specific for SQLSERVER
SELECT CONVERT(varchar(5), ProductID) + ':' + Name AS ProductName
FROM SalesLT.Product

-- 7
SELECT SellStartDate,
  CONVERT(nvarchar(30), SellStartDate) AS ConvertedDate,
  CONVERT(nvarchar(30), SellStartDate, 126) AS ISO8601FormatDate
FROM SalesLT.Product;

-- 8
SELECT Name, CAST(Size AS Integer) AS NumericSize
FROM SalesLT.Product


-- 10
SELECT Name, TRY_CAST(Size AS Integer) AS NumericSize
FROM SalesLT.Product

-- HAndle NULL values

-- 1
SELECT Name, ISNULL(TRY_CAST(Size AS Integer), 0) AS NumericSize
FROM SalesLT.Product


-- 3 replace null values with specified in the second param of ISNULL function
SELECT ProductNumber, ISNULL(Color, '') + ', ' + ISNULL(Size, '') AS ProductDetails
FROM SalesLT.Product


-- 4 Replace with NULL when 'Multi' value is found
SELECT Name, NULLIF(Color, 'Multi') AS SingleColor
FROM SalesLT.Product;

-- 5 
SELECT Name, COALESCE(SellEndDate, SellStartDate) AS StatusLastUpdated
FROM SalesLT.Product;

-- 6 check if SellEndDate is null
SELECT
   CASE
    WHEN SellEndDate IS NULL THEN 'Currently for Sale'
    ELSE 'No longer Available'
   END AS SalesStatus 
FROM SalesLT.Product;

-- 7
SELECT
  CASE Size
    WHEN 'S' THEN 'Small'
    WHEN 'M' THEN 'MEdium'
    WHEN 'L' THEN 'Large'
    WHEN 'XL' THEN 'Extra-Large'
    ELSE ISNULL(Size, 'N/A')
  END AS ProductSize
FROM SalesLT.Product;

-- CHALLENGE 1
-- 1
SELECT *
FROM SalesLT.Customer;

-- 2
SELECT Title, FirstName, MiddleName, LastName, Suffix
FROM SalesLT.Customer;

-- 3 
SELECT SalesPerson, ISNULL(Title, '') + ' ' + LastName AS CustomerName, Phone
FROM SalesLT.Customer;

-- CHALLENGE 2
-- 1
SELECT CONVERT(varchar(20),CustomerID) + ':' + CompanyName AS CustomerCompany
FROM SalesLT.Customer;

-- 2
-- mine
SELECT '*' + CAST(SalesOrderNumber AS varchar(20))  + ' (' + CAST(RevisionNumber AS varchar(20)) + ')*',
    CONVERT(nvarchar(20), OrderDate, 102)
FROM SalesLT.SalesOrderHeader;
-- solution
SELECT PurchaseOrderNumber + '(' + STR(RevisionNumber, 1) + ')' AS OrderRevision,
    CONVERT(nvarchar(20), OrderDate, 102)
FROM SalesLT.SalesOrderHeader;


-- CHALLENGE 3
-- 1
SELECT FirstName + ' ' + ISNULL(MiddleName + ' ', '') + LastName
FROM SalesLT.Customer;

-- 2
UPDATE SalesLT.Customer
SET EmailAddress =  NULL
WHERE CustomerID % 7 = 1;

SELECT CustomerID, COALESCE(EmailAddress, Phone) AS PrimaryContact
FROM SalesLT.Customer;

-- 3
UPDATE SalesLT.SalesOrderHeader
SET ShipDate = NULL
WHERE SalesOrderID > 71899;

SELECT SalesOrderID, OrderDate, 
    CASE 
        WHEN ShipDate IS NULL THEN 'Awaiting Shipment'
        ELSE 'Shipped'
    END AS ShippingStatus
FROM SalesLT.SalesOrderHeader;

SELECT UNIQUE ProductCategoryID
FROM SalesLT.Product;