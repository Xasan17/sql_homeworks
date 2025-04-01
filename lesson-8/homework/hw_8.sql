--1
SELECT Category, COUNT(ProductID) AS Count FROM Products
GROUP BY Category;
--2
SELECT AVG(Price) AS Avg_Elec FROM Products
WHERE Category='Electronics';
--3
SELECT * FROM Customers
WHERE City LIKE 'L%';
--4
SELECT ProductName FROM Products
WHERE ProductName LIKE '%er';
--5
SELECT * FROM Customers
WHERE Country LIKE '%a';
--6
SELECT MAX(Price) AS HighestPrice  
FROM Products;
--7
SELECT * , IIF(Stockquantity<30 , 'Low Stock', 'Sufficient' ) AS Status FROM Products;
--8
SELECT Country, COUNT(CustomerID) AS Count_country FROM Customers
GROUP BY Country;
--9
SELECT MIN(Quantity) AS Min_Quantity , MAX(Quantity) AS Max_Quantity FROM Orders;
--10
SELECT DISTINCT CustomerID FROM Orders
WHERE YEAR(OrderDate)=2023
EXCEPT 
SELECT DISTINCT CustomerID FROM Invoices;
--11
SELECT ProductName FROM Products
UNION ALL
SELECT ProductName FROM Products_Discounted;
--12
SELECT ProductName FROM Products
UNION
SELECT ProductName FROM Products_Discounted;
--13
SELECT YEAR(OrderDate) AS Year, AVG(TotalAmount) AS Avg_Amount  FROM Orders
GROUP BY YEAR(OrderDate);
--14
SELECT ProductName, CASE 
	WHEN Price <100 THEN 'Low'
	WHEN Price BETWEEN 100 AND 500 THEN 'Mid'
	WHEN Price > 500 THEN 'High'
	END AS Pricegroup
FROM Products;
--15
SELECT DISTINCT City FROM Customers
ORDER BY City;
--16
SELECT ProductID, SUM(SaleAmount) AS Total_sale FROM Sales 
GROUP BY ProductID;
--17
SELECT * FROM Products
WHERE ProductName LIKE '%OO%';
--18
SELECT ProductID FROM Products
INTERSECT 
SELECT ProductID FROM Products_Discounted;
--19
SELECT TOP 3 CustomerID, SUM(TotalAmount) AS TotalSpent  FROM Invoices
GROUP BY CustomerID
ORDER BY SUM(TotalAmount) DESC;
--20
SELECT ProductID, ProductName  
FROM Products  
EXCEPT  
SELECT ProductID, ProductName  
FROM Products_Discounted;
--21
SELECT p.ProductName, COUNT(s.SaleID) AS Count_sale FROM Products p
INNER JOIN Sales s ON p.ProductID=s.ProductID
GROUP BY P.ProductName
ORDER BY Count_sale DESC;
--22
SELECT TOP 5 ProductID, SUM(Quantity) AS TotalQuantity  FROM Orders
GROUP BY ProductID
ORDER BY TotalQuantity DESC;
