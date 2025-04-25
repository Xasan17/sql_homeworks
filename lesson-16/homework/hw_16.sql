create database hw_16;
DROP TABLE IF EXISTS Grouped;
CREATE TABLE Grouped
(
  Product  VARCHAR(100) PRIMARY KEY,
  Quantity INTEGER NOT NULL
);
INSERT INTO Grouped (Product, Quantity) VALUES
('Pencil', 3), ('Eraser', 4), ('Notebook', 2);

DROP TABLE IF EXISTS #RegionSales;
CREATE TABLE #RegionSales (
  Region      VARCHAR(100),
  Distributor VARCHAR(100),
  Sales       INTEGER NOT NULL,
  PRIMARY KEY (Region, Distributor)
);
INSERT INTO #RegionSales (Region, Distributor, Sales) VALUES
('North','ACE',10), ('South','ACE',67), ('East','ACE',54),
('North','ACME',65), ('South','ACME',9), ('East','ACME',1), ('West','ACME',7),
('North','Direct Parts',8), ('South','Direct Parts',7), ('West','Direct Parts',12);

CREATE TABLE Employee (id INT, name VARCHAR(255), department VARCHAR(255), managerId INT);
TRUNCATE TABLE Employee;
INSERT INTO Employee VALUES
(101, 'John', 'A', NULL), (102, 'Dan', 'A', 101), (103, 'James', 'A', 101),
(104, 'Amy', 'A', 101), (105, 'Anne', 'A', 101), (106, 'Ron', 'B', 101);

CREATE TABLE Products (product_id INT, product_name VARCHAR(40), product_category VARCHAR(40));
CREATE TABLE Orders (product_id INT, order_date DATE, unit INT);
TRUNCATE TABLE Products;
INSERT INTO Products VALUES
(1, 'Leetcode Solutions', 'Book'),
(2, 'Jewels of Stringology', 'Book'),
(3, 'HP', 'Laptop'), (4, 'Lenovo', 'Laptop'), (5, 'Leetcode Kit', 'T-shirt');
TRUNCATE TABLE Orders;
INSERT INTO Orders VALUES
(1,'2020-02-05',60),(1,'2020-02-10',70),
(2,'2020-01-18',30),(2,'2020-02-11',80),
(3,'2020-02-17',2),(3,'2020-02-24',3),
(4,'2020-03-01',20),(4,'2020-03-04',30),(4,'2020-03-04',60),
(5,'2020-02-25',50),(5,'2020-02-27',50),(5,'2020-03-01',50);

DROP TABLE IF EXISTS Orders;
CREATE TABLE Orders (
  OrderID    INT PRIMARY KEY,
  CustomerID INT NOT NULL,
  [Count]    MONEY NOT NULL,
  Vendor     VARCHAR(100) NOT NULL
);
INSERT INTO Orders VALUES
(1,1001,12,'Direct Parts'), (2,1001,54,'Direct Parts'), (3,1001,32,'ACME'),
(4,2002,7,'ACME'), (5,2002,16,'ACME'), (6,2002,5,'Direct Parts');

CREATE TABLE Device(
  Device_id INT,
  Locations VARCHAR(25)
);
INSERT INTO Device VALUES
(12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'), (12,'Bangalore'),
(12,'Hosur'), (12,'Hosur'),
(13,'Hyderabad'), (13,'Hyderabad'), (13,'Secunderabad'),
(13,'Secunderabad'), (13,'Secunderabad');

DROP TABLE IF EXISTS Employee;
CREATE TABLE Employee (
  EmpID INT,
  EmpName VARCHAR(30),
  Salary FLOAT,
  DeptID INT
);
INSERT INTO Employee VALUES
(1001,'Mark',60000,2), (1002,'Antony',40000,2), (1003,'Andrew',15000,1),
(1004,'Peter',35000,1), (1005,'John',55000,1), (1006,'Albert',25000,3), (1007,'Donald',35000,3);

create table Tickets (
	Ticket_id varchar(50),
	Number int ) 

insert into Tickets values 
('A23423', 25),( 'A23423', 45) ,('A23423' ,78),('B35643' , 25),('B35643' , 45),('B35643' ,98),( 'C98787', 67),('C98787' , 86),('C98787', 91)
create table numbers (
	Number int);
insert into numbers values 
(25),(45),(78)

CREATE TABLE Spending (
  User_id INT,
  Spend_date DATE,
  Platform VARCHAR(10),
  Amount INT
);
INSERT INTO Spending VALUES
(1,'2019-07-01','Mobile',100),
(1,'2019-07-01','Desktop',100),
(2,'2019-07-01','Mobile',100),
(2,'2019-07-02','Mobile',100),
(3,'2019-07-01','Desktop',100),
(3,'2019-07-02','Desktop',100);

--1
WITH cte AS (
    SELECT Product, quantity, 1 AS level
    FROM Grouped
    UNION ALL
    SELECT Product, quantity, level + 1
    FROM cte
    WHERE level < quantity
)
SELECT Product,1 as quantity
FROM cte
--2
with cte1 as (
 select distinct region from #RegionSales),
 cte2 as (
select distinct Distributor from #RegionSales)
select c1.Region,c2.Distributor, isnull(r1.Sales,0) as Sales from cte1 c1 cross join cte2 c2 left join #RegionSales r1
on  c1.Region = r1.Region and c2.Distributor = r1.Distributor;
--3
select e1.name from Employee e1
inner join Employee e2 on e1.id = e2.managerId 
group by e1.id , e1.name 
having count(*) >= 5;
--4
select p.product_name, sum(o.unit) as unit from Products p
inner join Orders o on p.product_id = o.product_id 
where o.order_date >= '2020-02-01' and o.order_date <'2020-03-01'
group by p.product_name 
having sum(o.unit)>=100 
--5
with cte as ( 
select customerid, Vendor, SUM(Count) as Total_count from Orders 
group by customerid, Vendor)
select customerId, Vendor from cte
where Total_count in (select max(Total_count) from cte group by CustomerID)
order by customerId;
--6
DECLARE @Check_Prime INT = 100;
with cte as (
	select @Check_Prime/2+1 as num,  @Check_Prime % ( @Check_Prime/2+1) as status
	union all 
	select num-1, @Check_Prime%(num-1) from cte
	where num>2) 
select case when @Check_Prime/2-sum(case when status<>0 then 1 end)=0 then 'This number is prime' else 'This number is not prime' end answer from cte;
--7
with cte as (
	select Device_id, locations, count(*) as location  from Device
group by Device_id, Locations),
cte0 as (select Device_id,count(distinct locations) as no_of_location, count(*) as no_of_signals from Device
group by Device_id)
select c1.Device_id,c0.no_of_location, c1.Locations as max_signal_location, c0.no_of_signals from cte c1 inner join (select device_id, max(location) as max_signal_location  from cte
group by Device_id ) c2 on c1.Device_id = c2.Device_id and c1.location = c2.max_signal_location 
inner join cte0 c0 on c1.Device_id = c0.Device_id
--8
select e.EmpID, e.EmpName, e.Salary from Employee e
inner join (select DeptID ,AVG(Salary) as Avg_salarty from Employee group by DeptID) d on e.DeptID=d.DeptID and e.Salary>=d.Avg_salarty
--9
with cte as (
select t.Ticket_id, case when count(distinct n.Number) =3 then 100 when count(distinct n.Number)=0 then 0 else 10 end as ball from Tickets t
left join numbers n on t.Number = n.Number 
group by t.Ticket_id)
select sum(ball) as Price from cte;
--10
WITH UserPlatform AS (
  SELECT
    User_id,
    Spend_date,
    MAX(CASE WHEN Platform = 'Mobile' THEN 1 ELSE 0 END) AS used_mobile,
    MAX(CASE WHEN Platform = 'Desktop' THEN 1 ELSE 0 END) AS used_desktop,
    SUM(Amount) AS total_amount
  FROM Spending
  GROUP BY User_id, Spend_date
),
Classified AS (
  SELECT
    Spend_date,
    CASE 
      WHEN used_mobile = 1 AND used_desktop = 1 THEN 'Both'
      WHEN used_mobile = 1 THEN 'Mobile'
      WHEN used_desktop = 1 THEN 'Desktop'
    END AS Platform,
    total_amount,
    User_id
  FROM UserPlatform
),
Aggregated AS (
  SELECT
    Spend_date,
    Platform,
    COUNT(DISTINCT User_id) AS Total_users,
    SUM(total_amount) AS Total_Amount
  FROM Classified
  GROUP BY Spend_date, Platform
)
SELECT
  d.date AS Spend_date,
  p.platform AS Platform,
  COALESCE(a.Total_Amount, 0) AS Total_Amount,
  COALESCE(a.Total_users, 0) AS Total_users
FROM
  (SELECT DISTINCT Spend_date AS date FROM Spending) d
CROSS JOIN
  (SELECT 'Mobile' AS platform UNION ALL SELECT 'Desktop' UNION ALL SELECT 'Both') p
LEFT JOIN Aggregated a
  ON a.Spend_date = d.date AND a.Platform = p.platform
ORDER BY d.date, 
         CASE p.platform
           WHEN 'Mobile' THEN 1
           WHEN 'Desktop' THEN 2
           WHEN 'Both' THEN 3
         END;






