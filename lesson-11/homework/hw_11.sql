--1
SELECT o.OrderID, c.FirstName, c.LastName, o.OrderDate FROM Orders o
LEFT JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE YEAR(o.OrderDate) > 2022;
--2
SELECT e.Name, d.DepartmentName FROM Employees e
INNER JOIN Departments d ON e.DepartmentId = d.DepartmentId 
WHERE d.DepartmentName IN ('Sales', 'Marketing')
--3
SELECT Dep.DepartmentName, e.Name AS TopEmployeeName , Dep.MaxSalary FROM Employees e
INNER JOIN (SELECT d.DepartmentID,d.DepartmentName, MAX(e.Salary) AS MaxSalary FROM Employees e
INNER JOIN Departments d  ON e.DepartmentID = d.DepartmentID
GROUP BY d.DepartmentID, d.DepartmentName) AS Dep ON e.DepartmentID = Dep.DepartmentID AND e.Salary = Dep.MaxSalary  AND e.EmployeeID = (
             SELECT MIN(e2.EmployeeID)
             FROM Employees e2
             WHERE e2.DepartmentID = Dep.DepartmentID 
               AND e2.Salary = Dep.MaxSalary
         ) ;
--4
SELECT c.FirstName,c.LastName, o.OrderID, o.OrderDate FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA' AND YEAR(o.OrderDate) = 2023;
--5
SELECT c.LastName, c.FirstName, COUNT(OrderID) AS TotalOrders FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
GROUP BY c.LastName, c.FirstName;
--6
SELECT p.ProductName, s.SupplierName FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName IN ('Gadget Supplies', 'Clothing Mart');
--7
SELECT LastName, 
	FirstName, 
	OrderDate AS MostRecentOrderDate,
	OrderID
	FROM (SELECT 
	c.LastName, 
	c.FirstName, 
	o.OrderID,
	o.OrderDate, 
	ROW_NUMBER() OVER (PARTITION BY o.CustomerID ORDER BY o.OrderDate DESC) AS OrderByDate   
	FROM Customers	c
	LEFT OUTER JOIN Orders o ON c.CustomerID = o.CustomerID) AS a
WHERE OrderByDate = 1;
--8
SELECT c.LastName, c.FirstName, o.OrderID, o.TotalAmount AS OrderTotal FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE o.TotalAmount > 500;
--9
SELECT p.ProductName, s.SaleDate, s.SaleAmount FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = 2022 OR s.SaleAmount > 400;
--10
SELECT p.ProductName, SUM(s.SaleAmount) AS TotlaSalesAmount FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
GROUP BY p.ProductName;
--11
SELECT e.Name, d.DepartmentName, e.Salary FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Human Resources' AND e.Salary >50000;
--12
SELECT * FROM Products p
INNER JOIN Sales s ON p.ProductID = s.ProductID
WHERE YEAR(s.SaleDate) = 2023 AND p.StockQuantity > 50;
--13
SELECT e.Name, d.DepartmentName, e.HireDate FROM Employees e
LEFT JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Sales' OR YEAR(e.HireDate) > 2020;
--14
SELECT * FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.Country = 'USA' AND PATINDEX('[0-9][0-9][0-9][0-9]%', c.Address) = 1;
--15
SELECT p.ProductName, c.CategoryName, s.SaleAmount FROM Products p
LEFT JOIN Sales s ON p.ProductID = s.ProductID
LEFT JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR s.SaleAmount >350;
--16
SELECT c.CategoryName, COUNT(*) AS ProductCount  FROM Products p
INNER JOIN Categories c ON p.Category = c.CategoryID
GROUP BY c.CategoryName;
--17
SELECT c.FirstName, c.City, o.OrderID, o.TotalAmount FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID
WHERE c.City = 'Los Angeles' AND o.TotalAmount > 300
--18
SELECT * FROM Employees e
INNER JOIN Departments d  ON  e.DepartmentID = d.DepartmentID
WHERE DepartmentName IN ('Human Resources', 'Finance') OR (
		LEN(e.Name)
     - LEN(REPLACE(LOWER(e.Name), 'a', ''))
     - LEN(REPLACE(LOWER(e.Name), 'e', ''))
     - LEN(REPLACE(LOWER(e.Name), 'i', ''))
     - LEN(REPLACE(LOWER(e.Name), 'o', ''))
     - LEN(REPLACE(LOWER(e.Name), 'u', ''))
   ) <= LEN(e.Name) - 4
--19
SELECT 
    p.ProductName,
    COUNT(s.SaleID) AS QuantitySold,
    p.Price
FROM Sales s
JOIN Products p 
    ON s.ProductID = p.ProductID
GROUP BY 
    p.ProductName,
    p.Price
HAVING COUNT(s.SaleID) > 100
   AND p.Price > 500;
--20
SELECT e.Name, d.DepartmentName, e.Salary FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID
WHERE DepartmentName IN ('Sales', 'Marketing') AND e.Salary >60000;
