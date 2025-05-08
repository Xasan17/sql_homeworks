create database hw_23;
CREATE TABLE Dates (
    Id INT,
    Dt DATETIME
);
INSERT INTO Dates VALUES
(1,'2018-04-06 11:06:43.020'),
(2,'2017-12-06 11:06:43.020'),
(3,'2016-01-06 11:06:43.020'),
(4,'2015-11-06 11:06:43.020'),
(5,'2014-10-06 11:06:43.020');

CREATE TABLE MyTabel (
    Id INT,
    rID INT,
    Vals INT
);
INSERT INTO MyTabel VALUES
(121, 9, 1), (121, 9, 8),
(122, 9, 14), (122, 9, 0), (122, 9, 1),
(123, 9, 1), (123, 9, 2), (123, 9, 10);

CREATE TABLE TestFixLengths (
    Id INT,
    Vals VARCHAR(100)
);
INSERT INTO TestFixLengths VALUES
(1,'11111111'), (2,'123456'), (2,'1234567'), 
(2,'1234567890'), (5,''), (6,NULL), 
(7,'123456789012345');

CREATE TABLE TestMaximum (
    ID INT,
    Item VARCHAR(20),
    Vals INT
);
INSERT INTO TestMaximum VALUES
(1, 'a1',15), (1, 'a2',20), (1, 'a3',90),
(2, 'q1',10), (2, 'q2',40), (2, 'q3',60), (2, 'q4',30),
(3, 'q5',20);

CREATE TABLE SumOfMax (
    DetailedNumber INT,
    Vals INT,
    Id INT
);
INSERT INTO SumOfMax VALUES
(1,5,101), (1,4,101), (2,6,101), (2,3,101),
(3,3,102), (4,2,102), (4,3,102);

CREATE TABLE TheZeroPuzzle (
    Id INT,
    a INT,
    b INT
);
INSERT INTO TheZeroPuzzle VALUES
(1,10,4), (2,10,10), (3,1, 10000000), (4,15,15);

CREATE TABLE Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    Product VARCHAR(50),
    Category VARCHAR(50),
    QuantitySold INT,
    UnitPrice DECIMAL(10,2),
    SaleDate DATE,
    Region VARCHAR(50),
    CustomerID INT
);

INSERT INTO Sales (Product, Category, QuantitySold, UnitPrice, SaleDate, Region, CustomerID)
VALUES
('Laptop', 'Electronics', 10, 800.00, '2024-01-01', 'North', 1),
('Smartphone', 'Electronics', 15, 500.00, '2024-01-02', 'North', 2),
('Tablet', 'Electronics', 8, 300.00, '2024-01-03', 'East', 3),
('Headphones', 'Electronics', 25, 100.00, '2024-01-04', 'West', 4),
('TV', 'Electronics', 5, 1200.00, '2024-01-05', 'South', 5),
('Refrigerator', 'Appliances', 3, 1500.00, '2024-01-06', 'South', 6),
('Microwave', 'Appliances', 7, 200.00, '2024-01-07', 'East', 7),
('Washing Machine', 'Appliances', 4, 1000.00, '2024-01-08', 'North', 8),
('Oven', 'Appliances', 6, 700.00, '2024-01-09', 'West', 9),
('Smartwatch', 'Electronics', 12, 250.00, '2024-01-10', 'East', 10),
('Vacuum Cleaner', 'Appliances', 5, 400.00, '2024-01-11', 'South', 1),
('Gaming Console', 'Electronics', 9, 450.00, '2024-01-12', 'North', 2),
('Monitor', 'Electronics', 14, 300.00, '2024-01-13', 'West', 3),
('Keyboard', 'Electronics', 20, 50.00, '2024-01-14', 'South', 4),
('Mouse', 'Electronics', 30, 25.00, '2024-01-15', 'East', 5),
('Blender', 'Appliances', 10, 150.00, '2024-01-16', 'North', 6),
('Fan', 'Appliances', 12, 75.00, '2024-01-17', 'South', 7),
('Heater', 'Appliances', 8, 120.00, '2024-01-18', 'East', 8),
('Air Conditioner', 'Appliances', 2, 2000.00, '2024-01-19', 'West', 9),
('Camera', 'Electronics', 7, 900.00, '2024-01-20', 'North', 10);

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Region VARCHAR(50),
    JoinDate DATE
);
INSERT INTO Customers (CustomerName, Region, JoinDate)
VALUES
('John Doe', 'North', '2022-03-01'),
('Jane Smith', 'West', '2023-06-15'),
('Emily Davis', 'East', '2021-11-20'),
('Michael Brown', 'South', '2023-01-10'),
('Sarah Wilson', 'North', '2022-07-25'),
('David Martinez', 'East', '2023-04-30'),
('Laura Johnson', 'West', '2022-09-14'),
('Kevin Anderson', 'South', '2021-12-05'),
('Sophia Moore', 'North', '2023-02-17'),
('Daniel Garcia', 'East', '2022-08-22');

CREATE TABLE Products (
    ProductID INT PRIMARY KEY IDENTITY(1,1),
    ProductName VARCHAR(50),
    Category VARCHAR(50),
    CostPrice DECIMAL(10,2),
    SellingPrice DECIMAL(10,2)
);
INSERT INTO Products (ProductName, Category, CostPrice, SellingPrice)
VALUES
('Laptop', 'Electronics', 600.00, 800.00),
('Smartphone', 'Electronics', 350.00, 500.00),
('Tablet', 'Electronics', 200.00, 300.00),
('Headphones', 'Electronics', 50.00, 100.00),
('TV', 'Electronics', 900.00, 1200.00),
('Refrigerator', 'Appliances', 1100.00, 1500.00),
('Microwave', 'Appliances', 120.00, 200.00),
('Washing Machine', 'Appliances', 700.00, 1000.00),
('Oven', 'Appliances', 500.00, 700.00),
('Gaming Console', 'Electronics', 320.00, 450.00);

--1
SELECT 
    *, 
    FORMAT(MONTH(dt), '00') AS MonthPrefixedWithZero
FROM Dates;
--2
with cte as (
select id,rID, max(Vals) as MaxVals  from MyTabel
group by id,rID)
select count(id) as Distinct_Ids ,rID,sum(MaxVals) as TotalOfMaxVals  from cte
group by rID
--3
select id, Vals from TestFixLengths
where  len(vals) between 6 and 10 ;
--4
select * from TestMaximum t1
where vals = (select max(vals)  from TestMaximum t2 where t2.Id = t1.id group by id);
--5
with cte as (
	select *, row_number() over(partition by id order by vals desc) as rn from  SumOfMax)
select id, sum(vals) as SumofMax from cte
where rn<3
group by id;
--6
select *, case when a-b<>0 then cast(a-b as varchar) else '' end as OUTPUT from TheZeroPuzzle;
--7
select sum(UnitPrice*quantitySold) as total_revenue from Sales;
--8
select avg(UnitPrice) as AverageUnitPrice from Sales;
--9
select count(*) as count from Sales;
--10
select max(quantitySold) as Max_quantity from Sales;
--11
select Category, sum(QuantitySold) as Category_quantity from Sales
group by Category;
--12
select region, sum(UnitPrice*QuantitySold) as total_revenue from Sales
group by region;
--13
select top 1 Product, SUM(UnitPrice * QuantitySold) as Max_revenue
from Sales
group by Product
order by Max_revenue desc;
--14
select *, sum(UnitPrice*QuantitySold) over(order by SaleDate) as Running_total from Sales;
--15
select category, 
		sum(UnitPrice*QuantitySold) as total,
		cast(sum(UnitPrice*QuantitySold)/(select sum(UnitPrice*QuantitySold) from Sales)*100 as decimal(18,2)) as percentage
from Sales
group by Category;
--16
select c.CustomerID, c.CustomerName,s.Product,s.Category, s.QuantitySold, s.UnitPrice,s.Region from Customers c
inner join Sales s on c.CustomerID = s.CustomerID;
--17
select c.CustomerID, c.CustomerName from Sales s
right join Customers c on s.CustomerID = c.CustomerID
where s.CustomerID is null;
--18
select c.CustomerID, c.CustomerName,sum(UnitPrice*QuantitySold) as Total_amount  from Customers c
inner join Sales s on c.CustomerID = s.CustomerID
group by c.CustomerID, c.CustomerName
order by sum(UnitPrice*QuantitySold) desc;
--19
with cte as (
select distinct c.CustomerID, c.CustomerName, sum(UnitPrice*QuantitySold) over(partition by c.CustomerID) as Total_amount  from Customers c
inner join Sales s on c.CustomerID = s.CustomerID)
select * from cte 
where Total_amount = (select max(Total_amount) from cte);
--20
select c.CustomerID, c.CustomerName,sum(QuantitySold) as Total_amount  from Customers c
inner join Sales s on c.CustomerID = s.CustomerID
group by c.CustomerID, c.CustomerName
order by sum(QuantitySold) desc;
--21
select distinct ProductName from Products p
inner join Sales s on p.ProductName = s.Product
--22
select * from Products
where SellingPrice = (select max(SellingPrice) from Products);
--23
select * from Products p1
where SellingPrice > (select avg(sellingprice) from Products p2 where p2.Category = p1.Category)

