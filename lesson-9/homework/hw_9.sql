--1
SELECT p.ProductName, s.SupplierName FROM Products p
CROSS JOIN Suppliers s; 
--2
SELECT  d.DepartmentName, e.Name FROM Departments d  
CROSS JOIN Employees e;
--3
SELECT s.SupplierName, p.ProductName  FROM Products p
INNER JOIN Suppliers s  ON p.SupplierID = s.SupplierID;
--4
SELECT c.FirstName , o.OrderID FROM Orders o
INNER JOIN Customers c ON o.CustomerID=c.CustomerID;
--5
SELECT  s.Name, c.CourseName FROM Students s  
CROSS JOIN Courses c;
--6
SELECT p.ProductName, o.OrderID FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID; 
--7
SELECT e.* FROM Employees e
INNER JOIN Departments d ON e.DepartmentID = d.DepartmentID;
--8
SELECT s.Name, e.CourseID FROM Students s
INNER JOIN Enrollments e ON s.StudentID = e.StudentID;
--9
SELECT o.OrderID ,o.OrderDate, o.Quantity, o.TotalAmount FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID;
 --10
SELECT * FROM Orders o
INNER JOIN Products p ON  o.ProductID = p.ProductID
WHERE p.Price > 100
--11
SELECT e.Name, d.DepartmentName 
FROM Employees e
CROSS JOIN Departments d
WHERE e.DepartmentID <> d.DepartmentID;
--12
SELECT o.OrderID ,o.OrderDate, o.Quantity, o.TotalAmount FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID 
WHERE o.Quantity>p.StockQuantity;
--13
SELECT c.FirstName, s.ProductID FROM Sales s
INNER JOIN Customers c ON s.CustomerID = c.CustomerID
WHERE s.SaleAmount>=500;
--14
SELECT S.Name, c.CourseName FROM Students s 
INNER JOIN Enrollments e ON s.StudentID = e.StudentID
INNER JOIN Courses c ON e.CourseID = c.CourseID;
--15
SELECT p.ProductName, s.SupplierName FROM Products p
INNER JOIN Suppliers s ON p.SupplierID = s.SupplierID
WHERE s.SupplierName LIKE '%Tech%';
--16
SELECT o.OrderID ,o.OrderDate, o.Quantity, o.TotalAmount FROM Orders o
INNER JOIN Payments p ON o.OrderID = p.OrderID
WHERE p.Amount<o.TotalAmount;
--17
SELECT e2.Name, e2.Salary, e2.HireDate FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID = e2.ManagerID
WHERE e1.Salary < e2.Salary;
--18
SELECT p.ProductName FROM Products p
INNER JOIN Categories c ON p.Category = c.CategoryID
WHERE c.CategoryName = 'Electronics' OR c.CategoryName = 'Furniture' ;
--19
SELECT s.SaleID, s.SaleDate, s.SaleAmount FROM Sales s
INNER JOIN Customers c ON s.CustomerID=c.CustomerID 
WHERE c.Country = 'USA';
--20
SELECT o.OrderID ,o.OrderDate, o.Quantity, o.TotalAmount FROM Orders o
INNER JOIN Customers c ON o.CustomerID = c.CustomerID 
WHERE c.Country = 'Germany' AND o.TotalAmount > 100;
--21
SELECT 
e1.EmployeeID AS Employee1_ID, 
    e1.Name AS Employee1_Name, 
    e1.DepartmentID AS Employee1_Dept, 
    e2.EmployeeID AS Employee2_ID, 
    e2.Name AS Employee2_Name, 
    e2.DepartmentID AS Employee2_Dept FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID < e2.EmployeeID
WHERE e1.DepartmentID <> e2.DepartmentID;
--22
SELECT pa.*
FROM Products p
INNER JOIN Orders o ON p.ProductID = o.ProductID
INNER JOIN Payments pa ON o.OrderID = pa.OrderID
WHERE pa.Amount <> (o.Quantity * p.Price);
--23
SELECT s.* FROM Students s
LEFT JOIN Enrollments e ON s.StudentID = e.StudentID
WHERE e.StudentID IS NULL;
--24
SELECT DISTINCT e1.Name, e1.Salary, e1.HireDate FROM Employees e1
INNER JOIN Employees e2 ON e1.EmployeeID = e2.ManagerID
WHERE e1.Salary <= e2.Salary;
--25
SELECT c.* FROM Customers c
INNER JOIN Orders o ON c.CustomerID = o.CustomerID
LEFT JOIN Payments p ON p.OrderID = o.OrderID
WHERE p.OrderID IS NULL;
