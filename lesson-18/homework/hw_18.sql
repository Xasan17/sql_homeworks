--1
drop proc EmployeeBonus
create proc EmployeeBonus
as 
begin 
	create table #EmployeeBonus (EmployeeID int, FullName varchar(50) , Department varchar(50), Salary float(10), BonusAmount float(10))
	insert into #EmployeeBonus
	select EmployeeID, FirstName+ ' '+ LastName as FullName, e.Department, Salary, cast(round(Salary * BonusPercentage / 100,2) as float) as BonusAmount from Employees  e
	inner join DepartmentBonus d on e.Department = d.Department;
	select * from #EmployeeBonus
end;

exec EmployeeBonus
--2
create proc Departmen_bonus @DepName varchar(50), @procent float(5)
	as 
		begin
			update Employees
			set Salary = Salary*(1+@procent)
			where Department = @DepName;	 
			select EmployeeID,FirstName+ ' '+ LastName as FullName, Department, Salary from Employees
			where Department = @DepName
		end;
exec Departmen_bonus 'IT', 0.11
--3
Merge into Products_Current as target
using Products_New as Source
on target.productID = Source.ProductID
when matched and target.Price<> source.Price then 
	update set target.Price=source.Price
when not matched by source then delete
when not matched by target then insert values 
	(source.productid, source.productName , source.Price); 
--4
SELECT 
    t.id,
    CASE 
        WHEN t.p_id IS NULL THEN 'Root'
        WHEN COUNT(c.id) > 0 THEN 'Inner'
        ELSE 'Leaf'
    END AS type
FROM 
    Tree t
LEFT JOIN 
    Tree c
ON 
    t.id = c.p_id
GROUP BY 
    t.id, t.p_id
--5
SELECT s.user_id, 
       ROUND(COALESCE(SUM(CASE WHEN c.action = 'confirmed' THEN 1 ELSE 0 END) * 1.0 
                      / NULLIF(COUNT(c.action), 0), 0), 2) AS confirmation_rate
FROM Signups s
LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id;
--6
select * from Employees
where salary in (select Min(Salary) from Employees);
--7
create proc GetProductSalesSummary @ProductID int
as 
begin 
	select p.ProductName, sum(s.Quantity) as Total_Quantity , sum(s.Quantity*p.Price) as TotalAmount, min(s.SaleDate) as FirstSales_date, max(s.SaleDate) as LastSales_date from Products p
	left join Sales s on p.ProductID = s.ProductID
	where p.ProductID = @ProductID
	group by p.ProductName;
end;
