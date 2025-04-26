--1
drop table #MonthlySales
select p.ProductName, Sum(s.Quantity) as Total_quantity, SUM(s.Quantity * p.Price) as TotalRevenue into #MonthlySales  from Sales s
inner join Products p on s.ProductID = p.ProductID
WHERE MONTH(s.SaleDate) = MONTH(GETDATE()) AND YEAR(s.SaleDate) = YEAR(GETDATE())
group by p.ProductName;
--2
create view vw_ProductSalesSummary as 
select p.ProductID, p.ProductName, p.Category , SUM(s.Quantity) as TotalQuantitySold from Products p
inner join Sales s on p.ProductID = s.ProductID 
group by p.ProductID, p.ProductName, p.Category;
--3
create function fn_GetTotalRevenueForProduct(@ProductID INT)
returns table
as
return  
	(select p.ProductID, p.ProductName, p.Category , SUM(s.Quantity*p.Price) as TotalQuantitySold from Products p
	inner join Sales s on p.ProductID = s.ProductID 
	where p.ProductID = @ProductID
	group by p.ProductID, p.ProductName, p.Category);
--4
create function fn_GetSalesByCategory(@Category VARCHAR(50))
returns table 
as 
return (
	select ProductName, SUM(s.Quantity) as TotalQuantity, SUM(s.Quantity * p.Price) as TotalRevenue from Products p
	inner join Sales s on p.ProductID = s.ProductID
	where Category = @Category
	group by p.ProductName);
--5
Create function dbo.fn_IsPrime (@Number INT)
Returns varchar(10)
	as 
	begin
	declare @num int =2
	declare @answer int = 1
	while @num*@num <= @Number
		begin 
			if @number%@num = 0 
				begin 
			SET @answer = 0; 
				break
				end
			else set @num = @num+1
		end
		return case when @answer =1 then 'Yes' else 'No' END;
	end
 select dbo.fn_IsPrime (101);
--6
create function fn_GetNumbersBetween(@start int, @end int )
	returns table 
	as 
	return
		(with cte as (
			select @start as Number 
			union all 
			select Number+1 from cte 
				where Number < @end )
		select * from cte);
--7
CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        SELECT DISTINCT salary
        FROM (
            SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
            FROM Employee
        ) AS ranked
        WHERE rnk = @N

    );
END
--8
WITH cte1 AS (
    SELECT requester_id AS user_id, COUNT(*) AS request_count
    FROM requestAccepted
    GROUP BY requester_id
),
cte2 AS (
    SELECT accepter_id AS user_id, COUNT(*) AS request_count
    FROM requestAccepted
    GROUP BY accepter_id
),
combined AS (
    SELECT * FROM cte1
    UNION ALL
    SELECT * FROM cte2
)
SELECT top 1 user_id as id, SUM(request_count) AS num
FROM combined
GROUP BY user_id
order by num desc;
--9
create view vw_CustomerOrderSummary
as
select c.customer_id, c.name, count(*) as total_orders , SUM(o.amount) as total_amount , MAX(o.order_date) as last_order_date  from Customers c
inner join Orders o on c.customer_id = o.customer_id
group by c.customer_id, c.name;
--10
SELECT
    RowNumber,
    MAX(TestCase) OVER (ORDER BY RowNumber ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS FilledTestCase,
	status
FROM Gaps
ORDER BY RowNumber;
