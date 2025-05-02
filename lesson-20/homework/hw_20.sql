--create database hw_20;
CREATE TABLE #Sales (
    SaleID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    Quantity INT,
    Price DECIMAL(10,2),
    SaleDate DATE
);


INSERT INTO #Sales (CustomerName, Product, Quantity, Price, SaleDate) VALUES
('Alice', 'Laptop', 1, 1200.00, '2024-01-15'),
('Bob', 'Smartphone', 2, 800.00, '2024-02-10'),
('Charlie', 'Tablet', 1, 500.00, '2024-02-20'),
('David', 'Laptop', 1, 1300.00, '2024-03-05'),
('Eve', 'Smartphone', 3, 750.00, '2024-03-12'),
('Frank', 'Headphones', 2, 100.00, '2024-04-08'),
('Grace', 'Smartwatch', 1, 300.00, '2024-04-25'),
('Hannah', 'Tablet', 2, 480.00, '2024-05-05'),
('Isaac', 'Laptop', 1, 1250.00, '2024-05-15'),
('Jack', 'Smartphone', 1, 820.00, '2024-06-01');

create table Fruits(Name varchar(50), Fruit varchar(50))
insert into Fruits values ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Apple'), ('Francesko', 'Orange'),
							('Francesko', 'Banana'), ('Francesko', 'Orange'), ('Li', 'Apple'), 
							('Li', 'Orange'), ('Li', 'Apple'), ('Li', 'Banana'), ('Mario', 'Apple'), ('Mario', 'Apple'), 
							('Mario', 'Apple'), ('Mario', 'Banana'), ('Mario', 'Banana'), 
							('Mario', 'Orange')

create table Family(ParentId int, ChildID int)
insert into Family values (1, 2), (2, 3), (3, 4)

CREATE TABLE #Orders
(
CustomerID     INTEGER,
OrderID        INTEGER,
DeliveryState  VARCHAR(100) NOT NULL,
Amount         MONEY NOT NULL,
PRIMARY KEY (CustomerID, OrderID)
);


INSERT INTO #Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES
(1001,1,'CA',340),(1001,2,'TX',950),(1001,3,'TX',670),
(1001,4,'TX',860),(2002,5,'WA',320),(3003,6,'CA',650),
(3003,7,'CA',830),(4004,8,'TX',120);

create table #residents(resid int identity, fullname varchar(50), address varchar(100))

insert into #residents values 
('Dragan', 'city=Bratislava country=Slovakia name=Dragan age=45'),
('Diogo', 'city=Lisboa country=Portugal age=26'),
('Celine', 'city=Marseille country=France name=Celine age=21'),
('Theo', 'city=Milan country=Italy age=28'),
('Rajabboy', 'city=Tashkent country=Uzbekistan age=22');

CREATE TABLE #Routes
(
RouteID        INTEGER NOT NULL,
DepartureCity  VARCHAR(30) NOT NULL,
ArrivalCity    VARCHAR(30) NOT NULL,
Cost           MONEY NOT NULL,
PRIMARY KEY (DepartureCity, ArrivalCity)
);

INSERT INTO #Routes (RouteID, DepartureCity, ArrivalCity, Cost) VALUES
(1,'Tashkent','Samarkand',100),
(2,'Samarkand','Bukhoro',200),
(3,'Bukhoro','Khorezm',300),
(4,'Samarkand','Khorezm',400),
(5,'Tashkent','Jizzakh',100),
(6,'Jizzakh','Samarkand',50);

CREATE TABLE #RankingPuzzle
(
     ID INT
    ,Vals VARCHAR(10)
)

 
INSERT INTO #RankingPuzzle VALUES
(1,'Product'),
(2,'a'),
(3,'a'),
(4,'a'),
(5,'a'),
(6,'Product'),
(7,'b'),
(8,'b'),
(9,'Product'),
(10,'c')

CREATE TABLE #Consecutives
(
     Id VARCHAR(5)  
    ,Vals INT /* Value can be 0 or 1 */
)
 
INSERT INTO #Consecutives VALUES
('a', 1),
('a', 0),
('a', 1),
('a', 1),
('a', 1),
('a', 0),
('b', 1),
('b', 1),
('b', 0),
('b', 1),
('b', 0)

CREATE TABLE #EmployeeSales (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    EmployeeName VARCHAR(100),
    Department VARCHAR(50),
    SalesAmount DECIMAL(10,2),
    SalesMonth INT,
    SalesYear INT
);

INSERT INTO #EmployeeSales (EmployeeName, Department, SalesAmount, SalesMonth, SalesYear) VALUES
('Alice', 'Electronics', 5000, 1, 2024),
('Bob', 'Electronics', 7000, 1, 2024),
('Charlie', 'Furniture', 3000, 1, 2024),
('David', 'Furniture', 4500, 1, 2024),
('Eve', 'Clothing', 6000, 1, 2024),
('Frank', 'Electronics', 8000, 2, 2024),
('Grace', 'Furniture', 3200, 2, 2024),
('Hannah', 'Clothing', 7200, 2, 2024),
('Isaac', 'Electronics', 9100, 3, 2024),
('Jack', 'Furniture', 5300, 3, 2024),
('Kevin', 'Clothing', 6800, 3, 2024),
('Laura', 'Electronics', 6500, 4, 2024),
('Mia', 'Furniture', 4000, 4, 2024),
('Nathan', 'Clothing', 7800, 4, 2024);

CREATE TABLE Products (
    ProductID   INT PRIMARY KEY,
    Name        VARCHAR(50),
    Category    VARCHAR(50),
    Price       DECIMAL(10,2),
    Stock       INT
);

INSERT INTO Products (ProductID, Name, Category, Price, Stock) VALUES
(1, 'Laptop', 'Electronics', 1200.00, 15),
(2, 'Smartphone', 'Electronics', 800.00, 30),
(3, 'Tablet', 'Electronics', 500.00, 25),
(4, 'Headphones', 'Accessories', 150.00, 50),
(5, 'Keyboard', 'Accessories', 100.00, 40),
(6, 'Monitor', 'Electronics', 300.00, 20),
(7, 'Mouse', 'Accessories', 50.00, 60),
(8, 'Chair', 'Furniture', 200.00, 10),
(9, 'Desk', 'Furniture', 400.00, 5),
(10, 'Printer', 'Office Supplies', 250.00, 12),
(11, 'Scanner', 'Office Supplies', 180.00, 8),
(12, 'Notebook', 'Stationery', 10.00, 100),
(13, 'Pen', 'Stationery', 2.00, 500),
(14, 'Backpack', 'Accessories', 80.00, 30),
(15, 'Lamp', 'Furniture', 60.00, 25);

CREATE TABLE Orders (
    OrderID    INT PRIMARY KEY,
    ProductID  INT,
    Quantity   INT,
    OrderDate  DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Orders (OrderID, ProductID, Quantity, OrderDate) VALUES
(1, 1, 2, '2024-03-01'),
(2, 3, 5, '2024-03-05'),
(3, 2, 3, '2024-03-07'),
(4, 5, 4, '2024-03-10'),
(5, 8, 1, '2024-03-12'),
(6, 10, 2, '2024-03-15'),
(7, 12, 10, '2024-03-18'),
(8, 7, 6, '2024-03-20'),
(9, 6, 2, '2024-03-22'),
(10, 4, 3, '2024-03-25'),
(11, 9, 2, '2024-03-28'),
(12, 11, 1, '2024-03-30'),
(13, 14, 4, '2024-04-02'),
(14, 15, 5, '2024-04-05'),
(15, 13, 20, '2024-04-08');

--1
select CustomerName, SaleDate from #Sales s1
where exists (select 1 from #Sales s2 where s2.SaleDate = s1.SaleDate and Month(s2.SaleDate) = 3 and YEAR(s2.SaleDate) = 2024);
--2
with cte as (
	select product, sum(Quantity*Price) as revenue from #Sales group by Product)
select product from cte
where revenue=(select max(revenue) from cte  );
--3
select min(Quantity*Price) as second_revenue from #Sales
where  Quantity*Price in (select distinct top 2 (Quantity*Price) as revenue from #Sales  order by (Quantity*Price) desc);
--4
select  YEAR(SaleDate) as Year ,MONTH(SaleDate) as Month,sum(quantity) as Month_quantity from #Sales
group by year(SaleDate),MONTH(SaleDate);
--5
select CustomerName, Product, SaleDate from #Sales s1
where exists (select 1 from #Sales s2 where s2.SaleDate < s1.SaleDate and s2.Product = s1.Product);
--6
select name, 
		(select count(f2.Fruit) from Fruits f2 where f2.Name = f1.name	and f2.Fruit = 'Apple')  as Apple, 
		(select count(f2.Fruit) from Fruits f2 where f2.Name = f1.name	and f2.Fruit = 'Orange')  as Orange,
		(select count(f2.Fruit) from Fruits f2 where f2.Name = f1.name	and f2.Fruit = 'Banana')  as Banana 
	from Fruits f1
group by Name;
--7
select f1.ParentId as PID , f2.ChildID as CHID  from Family f1
inner join Family f2 on f2.ChildID > f1.ParentId 
order by f1.ParentId,f2.ChildID;
--8
select * from #Orders o1
where exists (select 1 from #Orders o2 where o2.CustomerID = o1.CustomerID and o2.DeliveryState = 'CA') and DeliveryState = 'TX';
--9
select * from #residents
update #residents
set address = case 
        when address like '%age=%' then 
            stuff(address, charindex('age=', address), 0, ' name=' + fullname+' ') 
        else 
            address + ' name=' + fullname
		end
where address not like '%name=%';
--10
with cte as( 
			select cast(DepartureCity + '-' + ArrivalCity as varchar(max)) as Route, ArrivalCity, cost from #Routes
			union all
			select cast( cte.Route + '-' + r.ArrivalCity as  varchar(max) ) , r.ArrivalCity, cte.cost + r.cost from cte 
			inner join #Routes r on cte.ArrivalCity = r.DepartureCity),
	cte1 as(
	select * from cte
		where 	ArrivalCity = 'Khorezm' 
		and SUBSTRING(Route, 1,charindex('-',Route,1)-1)='Tashkent')
	select (select Route from cte1 c2 where c2.Cost = Max(c1.Cost) ) as Route , Max(c1.Cost) as Cost  from cte1 c1
	union all
	select (select Route from cte1 c2 where c2.Cost = Min(c1.Cost) ) as Route , Min(c1.Cost) as Cost  from cte1 c1;
--11
select *, row_number() over(partition by vals order by id) as rn from #RankingPuzzle;
--12
with cte as (select *, row_number() over(partition by id order by (select null)) as rn from #Consecutives),
cte2 as (select * , count(*) as Max_count from #Consecutives group by id, Vals)
select * from cte c1
inner join cte2 c2 on c1.Id = c2.Id and c1.Vals = c2.Vals 
order by c1.id;
--13
select * from #EmployeeSales e1
where SalesAmount > (select avg(SalesAmount) from #EmployeeSales e2 where e2.Department = e1.Department );
--14
select * from #EmployeeSales e1
where exists (select 1 from #EmployeeSales e2 where e2.SalesMonth = e1.SalesMonth group by SalesMonth having MAX(e2.SalesAmount) = e1.SalesAmount)	
select * from #EmployeeSales;
--15
select * from #EmployeeSales e1
where not exists (
	select 1 from #EmployeeSales e2 
	where e2.EmployeeID = e1.EmployeeID 
	group by e2.EmployeeID 
	having count(SalesMonth)<>(select count(distinct SalesMonth) from #EmployeeSales ) );
--16
select Name from Products
where Price> (select avg(price) from Products);
--17
select name, Stock from Products
where Stock < (select MAX(Stock) from Products);
--18
select name from Products
where category in (select category from Products
where name='Laptop') and name <> 'Laptop';
--19
select * from Products
where Price > (select min(Price) from Products where Category = 'Electronics') 
--20
select * from Products p1
where price > (select avg(Price) from Products p2 where p2.Category = p1.Category);
--21
select * from Products p
where exists (select 1 from Orders o where o.ProductID = p.ProductID);
--22
select name from Products
where ProductID in (select ProductID from Orders group by ProductID having sum(Quantity) > (select avg(Quantity) from Orders));
--23
select * from Products p
where not exists (select 1 from Orders o where o.ProductID = p.ProductID);
--24
select * from Products p
where ProductID = (select top 1 ProductID from Orders group by ProductID order by sum(Quantity) desc );
--25
select * from Products p
where exists (
				select 1 from Orders o 
				where o.ProductID = p.ProductID
				 group by ProductID 
				 having sum(Quantity) > (select AVG(Quantity) from Orders) );
