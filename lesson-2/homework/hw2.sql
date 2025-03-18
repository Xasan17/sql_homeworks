USE SchoolDB;

--1
CREATE TABLE Employees (EmpID INT, Name VARCHAR(50),Salary DECIMAL(10,2))
--2
INSERT INTO Employees VALUES (1,'Xasan',1500.21); 
INSERT INTO Employees VALUES (2,'Alisher', 1200),(3,'Tolagan',1319.2);
--3
UPDATE Employees
SET Salary=2000.12
WHERE EmpID=1;
--4
DELETE FROM Employees
WHERE EmpID=2;
--5
CREATE TABLE TestTable (
    ID INT IDENTITY(1,1),
    Name VARCHAR(50)
);

INSERT INTO TestTable (Name) VALUES ('Alice'), ('Bob'), ('Charlie');

DELETE FROM TestTable
WHERE Name='Alice';
--Only the row where ID = 2 is deleted, but the table and other records remain.
SELECT * FROM TestTable;
TRUNCATE TABLE TestTable
--All rows are removed, but the table remains.
SELECT * FROM TestTable;

DROP TABLE TestTable;
--The entire table is deleted from the database, and trying to query it will result in an error:

--6
ALTER TABLE Employees
ALTER COLUMN Name VARCHAR(100);
--7
ALTER TABLE Employees
ADD Department VARCHAR(50);
--8
ALTER TABLE Employees
ALTER COLUMN Salary FLOAT;
--9
CREATE TABLE Departments (
	DepartmentID INT PRIMARY KEY, 
	DepartmentName VARCHAR(50))
--10
TRUNCATE TABLE Employees;

--11
INSERT INTO Departments
SELECT 1, 'IT'
UNION
SELECT 2, 'Management'
UNION
SELECT 3, 'PTO'
UNION
SELECT 4, 'Data science'
UNION
SELECT 5, 'Data analytics'

--12
INSERT INTO Employees  VALUES (1,'Xasan',5000.21,'IT'); 
INSERT INTO Employees  VALUES (2,'Alisher', 3200,'Data science'),(3,'Tolagan',2319.2,'Data analytics');

UPDATE Employees
SET Department = 'Management'
WHERE Salary>5000;

--13
TRUNCATE TABLE Employees;
--14
ALTER TABLE Employees
DROP COLUMN Department  
--15
EXEC sp_rename 'Employees','StaffMembers';

--16
DROP TABLE Departments;

--17,18
CREATE TABLE Products (
	ProductID INT PRIMARY KEY, 
	ProductName VARCHAR(100), 
	Category VARCHAR(50), 
	Price DECIMAL(10,2) CHECK (Price >=0));
--19
ALTER TABLE Products
ADD  StockQuantity INT DEFAULT 50; 
--20
EXEC sp_rename 'Products.Category', 'ProductCategory', 'COLUMN'
--21
INSERT INTO Products (ProductID, ProductName, Category, Price, StockQuantity) VALUES 
	(1,'Oil','Natural Resources',200, 72 ),
	(2,'Cotton','Raw Cotton',99, 48 ),
	(3,'Water','Drinking',25, 102 ),
	(4,'Coal','Anthracite',105, 85 ),
	(5,'Wheat','Food',51, 63 );
--22
SELECT * INTO Products_Backup
FROM Products;

--23
EXEC sp_rename 'Products', 'Inventory'
--24
BEGIN TRAN;

DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql = @sql + 'ALTER TABLE Inventory DROP CONSTRAINT ' + QUOTENAME(dc.name) + '; '
FROM sys.check_constraints dc
JOIN sys.columns c ON dc.parent_object_id = c.object_id AND dc.parent_column_id = c.column_id
WHERE dc.parent_object_id = OBJECT_ID('Inventory') 
AND c.name = 'Price';

IF @sql <> ''
    EXEC(@sql);

ALTER TABLE Inventory ALTER COLUMN Price FLOAT;
ALTER TABLE Inventory ADD CONSTRAINT CH_Inventory CHECK (Price >= 0);

COMMIT TRAN;

--25
ALTER TABLE Inventory
ADD ProductCode INT IDENTITY(1000,5);


