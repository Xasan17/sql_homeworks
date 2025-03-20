--1
--BULK INSERT is a SQL Server command used to quickly load large amounts of data from an external file (such as CSV or TXT) into a database table.
--Purpose and Use Cases
--BULK INSERT is used for:
--Importing large datasets from text files into SQL Server tables.
--Optimizing data loading performance by using batch insertion.
--Integrating data from external sources, such as logs, exported datasets, or third-party systems.
CREATE TABLE Empl (  
    ID INT,  
    Name VARCHAR(50),  
    Age INT  
);

BULK INSERT Empl
FROM '"D:\data\A1.csv"'
WITH (  
    FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',  
    FIRSTROW = 1,  
    CODEPAGE = 'UTF-8'  
);

--2
--CSV, TXT,EXEL(XLS,XLSX),XML 

--3
CREATE TABLE Products (ProductID INT PRIMARY KEY, ProductName VARCHAR(50), Price DECIMAL(10,2));
--4
INSERT INTO Products VALUES (1,'Oil', 165),(2,'Water', 15), (3,'Cotton', 100);
--5
--In SQL Server (and in relational databases in general), NULL represents the absence 
--of a value in a column, while NOT NULL indicates that a value is required.
--NOT NULL
CREATE TABLE Orders(OrderID INT PRIMARY KEY,
	CustomerName VARCHAR(50) NOT NULL,
	OrderDate DATE NOT NULL);
INSERT INTO Orders VALUES (1,'Alisher', '2024-03-19') -- Successfully executed
INSERT INTO Orders VALUES (2,NULL, '2024-03-19') -- Error: CustomerName cannot be NULL

--NULL
CREATE TABLE Employees (
    ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT NULL  -- Возраст может быть неизвестным
);
INSERT INTO Employees (ID, Name, Age) VALUES (1, 'John', 25);
INSERT INTO Employees (ID, Name, Age) VALUES (2, 'Anna', NULL);
SELECT * FROM Employees WHERE Age IS NULL; --FIND NULL
SELECT * FROM Employees WHERE Age IS NOT NULL; --FIND NOT NULL

--6,7
-- Adds a UNIQUE constraint to the ProductName column in the Products table  
-- to ensure that product names are unique and prevent duplicate entries.
ALTER TABLE Products
ADD CONSTRAINT UQ_products_name UNIQUE (ProductName); 

--8
CREATE TABLE Categories (CategoryID INT PRIMARY KEY, CategoryName VARCHAR(50) UNIQUE)
--9
--In SQL Server, the IDENTITY column is used to automatically generate unique values 
--(typically for primary keys) when inserting new rows into a table.
--Key Features of IDENTITY:
--The value is incremented automatically when a new row is inserted.
--By default, it starts at 1 and increases by 1 (but this can be customized).
--It is commonly used for primary keys but is not inherently a unique constraint.
CREATE TABLE Customers (
	CustomerID INT IDENTITY(1,1) 
	PRIMARY KEY, Name VARCHAR(50) NOT NULL
	);
 --10
 BULK INSERT Products
 FROM 'D:\data\Products.txt'
 WITH(
	FIELDTERMINATOR = ',',  
    ROWTERMINATOR = '\n',  
    FIRSTROW = 1,  
    CODEPAGE = 'UTF-8'
	);
--11
ALTER TABLE Products
ADD CategoryID INT, 
	CONSTRAINT FK_Products_Categories FOREIGN KEY(CategoryID)
	REFERENCES Categories(CategoryID); 
--12
--The difference between PRIMARY KEY and UNIQUE KEY in SQL Server lies in their purpose and constraints.

--A PRIMARY KEY uniquely identifies each record in a table and cannot contain NULL values. Every table can have only one primary key, and it automatically creates a clustered index (unless specified otherwise).

--A UNIQUE KEY, on the other hand, also enforces uniqueness but allows NULL values (though only one per column). Unlike a primary key, a table can have multiple unique keys, and they create non-clustered indexes by default.

--In short, the primary key is the main identifier of a record, while unique keys ensure data integrity without necessarily being the table’s primary identifier.
CREATE TABLE Users (
    UserID INT PRIMARY KEY,  -- unique and can not be null
    Email VARCHAR(255) UNIQUE  -- Unique but can be NULL
);
INSERT INTO Users VALUES(1, NULL);  -- Successfully inserted  
INSERT INTO Users VALUES(NULL, 'sodiqovxasan99.@gmail.com');  --  Error  

--13
ALTER TABLE Products
ADD CONSTRAINT CK_Products_Price CHECK(Price>=0)
--14
ALTER TABLE Products
ADD Stock INT NOT NULL DEFAULT 0 ;
--15
INSERT INTO Categories VALUES (1,'Fruits')
UPDATE Products
SET CategoryID=ISNULL(CategoryID,1)
--16
--A foreign key (FOREIGN KEY) is a constraint in SQL Server that creates a relationship between two tables. 
--It ensures data integrity by guaranteeing that a value in one table exists in another.
--17
DROP TABLE Customers
CREATE TABLE Customers (
	CustomerID INT IDENTITY(1,1) PRIMARY KEY,
	Name VARCHAR(50) NOT NULL,
	Age INT CHECK (Age>=18)
	);
--18
CREATE TABLE ExampleIdentity (
	IdentityID INT IDENTITY(100,10), 
	IdentityName VARCHAR(50) NOT NULL
	);
--19
CREATE TABLE OrderDetails (
	OrderID INT,
	ProductID INT,
	Quantity INT NOT NULL,
	PRIMARY KEY(OrderID,ProductID)
	);
--20
--ISNULL – replaces NULL with a specified value (only 2 arguments).
CREATE TABLE Sales (
	ID INT PRIMARY KEY,
	CustomerName VARCHAR(50),
	ContactName VARCHAR(50)
	);
INSERT INTO Sales (ID, CustomerName, ContactName) VALUES
(1, 'John Doe', 'Mike Smith'),
(2, NULL, 'Sarah Johnson'),
(3, 'Alice Brown', NULL),
(4, NULL, NULL),
(5, 'Robert White', 'Emily Davis');

SELECT ISNULL(CustomerName, 'Unknown') AS Name FROM Sales;
--COALESCE – returns the first non-null value from a list (multiple arguments allowed).
SELECT COALESCE(CustomerName,ContactName, 'Unknow') AS Name FROM Sales;
--If both CustomerName and ContactName are NULL, it returns 'Unknown'.

--Difference:

--ISNULL – only 2 arguments.
--COALESCE – multiple arguments.

--21
DROP TABLE Employees;
CREATE TABLE Employees (
	EmpID INT PRIMARY KEY,
	Name VARCHAR(50), 
	Email VARCHAR(100) UNIQUE
	);
--22

CREATE TABLE Departments (
	DepartmentID INT PRIMARY KEY,
	EmpID INT FOREIGN KEY REFERENCES Employees(EmpID)
	ON DELETE CASCADE
	ON UPDATE CASCADE);
