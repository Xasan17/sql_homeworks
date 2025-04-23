--1
with cte_recursive as (
	select 5 as number
	union all 
	select number+1 from cte_recursive where number<20)
select * from cte_recursive;
--2
with cte_2 as (
	select 1 as number, 1 as level 
	union all
	select number*2, level+1 from cte_2 
	where level<10)
select * from cte_2;
--3
select e.FirstName, e.LastName, Total_sales from (select EmployeeID, sum(SalesAmount) as Total_sales from Sales group by EmployeeID) s 
inner join Employees e on e.EmployeeID  = s.EmployeeID 

--4
with cte_avg as (
	select avg(salary) as avg_salary from Employees)
	select * from cte_avg
--5
select ProductName, s.Max_Sale_products from Products p
inner join (select ProductID, max(salesAmount) as Max_Sale_products from Sales group by ProductID) s on s.ProductID = p.ProductID ;
--6
 with cte_count as (
	select EmployeeID, count(EmployeeID) as count_sales from sales
	group by EmployeeID)
select e.FirstName, e.LastName from Employees e
inner join cte_count c on e.EmployeeID = c.EmployeeID and c.count_sales>5 ;
--7
with cte_sales as (
	select ProductID, sum(SalesAmount) as Sum_salary from Sales
	group by ProductID)
select ProductName, Sum_salary from Products p
inner join cte_sales c on p.ProductID = c.ProductID and c.Sum_salary>500;
--8
with cte_avg as (
	select avg(Salary) as avg_salary from Employees  )
select FirstName,LastName, Salary from  Employees
inner join cte_avg on Salary > avg_salary;
--9
select p.ProductName, s.count_sale from Products p
inner join (select ProductID, count(SalesAmount) count_sale from Sales group by ProductID) s 
on p.ProductID = s.ProductID;
--10
with cte_any_sales as (select distinct EmployeeID from Sales)
select e.FirstName, e.LastName from Employees e
left join cte_any_sales c on e.EmployeeID = c.EmployeeID 
where c.EmployeeID is null;
--11
with cte_fuctorial as (
	select 1 as fuctorial, 1 as level  
	union all 
	select fuctorial * level, level +1  from cte_fuctorial
	where level<=2) 
	select max(fuctorial) as fuctorial from cte_fuctorial;
--12
with cte_fibonachi as (
	select 1 as number1 ,1 number2, 1 as level
	union all 
	select number2,  number1+number2, level+1 from cte_fibonachi
	where level <10 )
	select number1 from cte_fibonachi ;

--13
with cte as (
	select id, 1 as position , SUBSTRING(String, 1 , 1) as Sub_string ,String, len(String) as String_length from Example
	union all
	select id, position+1, SUBSTRING(string, position+1, 1), String, String_length  from cte
	where position<String_length	)
select id,Sub_string from cte
order by id;
--14
with cte1 as (
	select e.EmployeeID, e.FirstName,e.LastName, s.TotalSales from Employees e
	inner join (select EmployeeID, Sum(SalesAmount) as TotalSales from Sales group by EmployeeID) s on e.EmployeeID = s.EmployeeID
	)
select EmployeeID, FirstName, LastName, TotalSales, rank() over(order by TotalSales desc ) as Rank from cte1
--15
select * from Sales
select * from Employees
with cte as (
	select top 5 EmployeeID, count(EmployeeID) as Top_count from Sales 
	group by EmployeeID
	order by count(EmployeeID) desc)
	select  e.FirstName,e.LastName, c.Top_count from Employees e
	inner join cte c on e.EmployeeID = c.EmployeeID;
--16
with cte1 as (
	select year(SaleDate) as SalesYear ,MONTH(SaleDate) as Month, sum(SalesAmount) as TotalMonth from Sales
	group by YEAR(SaleDate), MONTH(SaleDate))
select c1.TotalMonth - c2.TotalMonth as diff_amount from cte1 c1
inner join cte1 c2 on c1.SalesYear = c2.SalesYear and c1.Month = c2.Month+1
where c1.Month = Month(GETDATE());
--17
select CategoryID, SUM(SalesAmount) as Sum_category from (select p.CategoryID, s.SalesAmount from Products p
inner join Sales s on p.ProductID = s.ProductID) d
group by CategoryID ;
--18
with cte as (
	select * from Sales
	where YEAR(SaleDate) = (select max(year(saledate)) from sales)
 )
 select ProductName, SUM(SalesAmount) as Product_year from Products p
 inner join cte c on p.ProductID = c.ProductID
 group by p.ProductName ;
--19
select e.FirstName, e.LastName, s.Total_Sales from  
(select EmployeeID, SUM(SalesAmount) as Total_Sales,YEAR(SaleDate) as Year, datepart(quarter,SaleDate) as Quarter 
from Sales 
group by EmployeeID, YEAR(SaleDate), datepart(quarter,SaleDate) 
having SUM(SalesAmount) >5000) s
inner join Employees e
 on e.EmployeeID = s.EmployeeID;
 --20
 select e.FirstName, e.LastName, s.Total_sales from (select top 3 EmployeeID, SUM(SalesAmount) as Total_sales from Sales group by EmployeeID order by Total_sales desc) s
 inner join Employees e on e.EmployeeID = s.EmployeeID;
 --21
 declare @n int = 5;
 with cte as (
	select cast ('1' as varchar(100)) as num , 2 as level
	union all 
	select cast (num + cast(level as varchar(10)) as varchar(100)), level+1 from cte where level<=@n )
select num from cte;
--22
select e.FirstName, e.LastName, s.Total_sales 
from (
	select top 1 
		EmployeeID, 
		SUM(SalesAmount) as Total_sales 
		from Sales 
		where DATEDIFF(MONTH,SaleDate, GETDATE())<=6 
		group by EmployeeID 
		order by Total_sales desc ) s
	inner join Employees e on s.EmployeeID = e.EmployeeID;
--23
with cte_reqursive as (
	select id,StepNumber, Count, case when count < 0 then 0
	when  count between 0 and 10 then count else 10 end as split_string  from Numbers
	where 
	union all
	select id,  from cte 
	) 
select * from Numbers

WITH RecursiveCTE AS (
    SELECT 
        Id, 
        StepNumber, 
        [Count], 
        CASE 
            WHEN [Count] < 0 THEN 0 
            WHEN [Count] > 10 THEN 10 
            ELSE [Count] 
        END AS Total
    FROM Numbers 
    WHERE StepNumber = 1
    UNION ALL
    SELECT 
        n.Id,
        n.StepNumber,
        n.[Count],
        CASE 
            WHEN r.Total + n.[Count] < 0 THEN 0
            WHEN r.Total + n.[Count] > 10 THEN 10
            ELSE r.Total + n.[Count]
        END AS Total
    FROM Numbers n
    JOIN RecursiveCTE r 
        ON n.Id = r.Id AND n.StepNumber = r.StepNumber + 1
)
SELECT * FROM RecursiveCTE
ORDER BY Id, StepNumber;
--24
WITH cte1 AS (
    SELECT ScheduleID, StartTime AS Time FROM Schedule
    UNION
    SELECT ScheduleID, EndTime FROM Schedule
    UNION
    SELECT ScheduleID, StartTime FROM Activity
    UNION
    SELECT ScheduleID, EndTime FROM Activity
),
cte2 AS (
    SELECT ScheduleID, Time
    FROM cte1
),
cte3 AS (
    SELECT 
        a.ScheduleID,
        a.Time AS StartTime,
        MIN(b.Time) AS EndTime
    FROM cte2 a
    JOIN cte2 b ON a.ScheduleID = b.ScheduleID AND b.Time > a.Time
    GROUP BY a.ScheduleID, a.Time
)
SELECT 
    c.ScheduleID,
    c.StartTime,
    c.EndTime,
    ISNULL(a.ActivityName, 'Work') AS ActivityName
FROM cte3 c
LEFT JOIN Activity a
  ON c.ScheduleID = a.ScheduleID 
 AND c.StartTime >= a.StartTime 
 AND c.EndTime <= a.EndTime
ORDER BY c.ScheduleID, c.StartTime;
--25
WITH SalesWithDetails AS (
    SELECT 
        s.SalesID,
        e.DepartmentID,
        s.ProductID,
        s.SalesAmount
    FROM Sales s
    JOIN Employees e ON s.EmployeeID = e.EmployeeID
)
SELECT 
    d.DepartmentName,
    p.ProductName,
    SUM(t.salesAmount) AS TotalSales
FROM (
    SELECT 
        swd.DepartmentID,
        swd.ProductID,
        swd.SalesAmount
    FROM SalesWithDetails swd
) AS t
JOIN Departments d ON t.DepartmentID = d.DepartmentID
JOIN Products p ON t.ProductID = p.ProductID
GROUP BY d.DepartmentName, p.ProductName
ORDER BY d.DepartmentName, p.ProductName;
