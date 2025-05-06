create database hw_22;
use hw_22;
CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    customer_id INT,
    customer_name VARCHAR(100),
    product_category VARCHAR(50),
    product_name VARCHAR(100),
    quantity_sold INT,
    unit_price DECIMAL(10,2),
    total_amount DECIMAL(10,2),
    order_date DATE,
    region VARCHAR(50)
);

INSERT INTO sales_data VALUES
    (1, 101, 'Alice', 'Electronics', 'Laptop', 1, 1200.00, 1200.00, '2024-01-01', 'North'),
    (2, 102, 'Bob', 'Electronics', 'Phone', 2, 600.00, 1200.00, '2024-01-02', 'South'),
    (3, 103, 'Charlie', 'Clothing', 'T-Shirt', 5, 20.00, 100.00, '2024-01-03', 'East'),
    (4, 104, 'David', 'Furniture', 'Table', 1, 250.00, 250.00, '2024-01-04', 'West'),
    (5, 105, 'Eve', 'Electronics', 'Tablet', 1, 300.00, 300.00, '2024-01-05', 'North'),
    (6, 106, 'Frank', 'Clothing', 'Jacket', 2, 80.00, 160.00, '2024-01-06', 'South'),
    (7, 107, 'Grace', 'Electronics', 'Headphones', 3, 50.00, 150.00, '2024-01-07', 'East'),
    (8, 108, 'Hank', 'Furniture', 'Chair', 4, 75.00, 300.00, '2024-01-08', 'West'),
    (9, 109, 'Ivy', 'Clothing', 'Jeans', 1, 40.00, 40.00, '2024-01-09', 'North'),
    (10, 110, 'Jack', 'Electronics', 'Laptop', 2, 1200.00, 2400.00, '2024-01-10', 'South'),
    (11, 101, 'Alice', 'Electronics', 'Phone', 1, 600.00, 600.00, '2024-01-11', 'North'),
    (12, 102, 'Bob', 'Furniture', 'Sofa', 1, 500.00, 500.00, '2024-01-12', 'South'),
    (13, 103, 'Charlie', 'Electronics', 'Camera', 1, 400.00, 400.00, '2024-01-13', 'East'),
    (14, 104, 'David', 'Clothing', 'Sweater', 2, 60.00, 120.00, '2024-01-14', 'West'),
    (15, 105, 'Eve', 'Furniture', 'Bed', 1, 800.00, 800.00, '2024-01-15', 'North'),
    (16, 106, 'Frank', 'Electronics', 'Monitor', 1, 200.00, 200.00, '2024-01-16', 'South'),
    (17, 107, 'Grace', 'Clothing', 'Scarf', 3, 25.00, 75.00, '2024-01-17', 'East'),
    (18, 108, 'Hank', 'Furniture', 'Desk', 1, 350.00, 350.00, '2024-01-18', 'West'),
    (19, 109, 'Ivy', 'Electronics', 'Speaker', 2, 100.00, 200.00, '2024-01-19', 'North'),
    (20, 110, 'Jack', 'Clothing', 'Shoes', 1, 90.00, 90.00, '2024-01-20', 'South'),
    (21, 111, 'Kevin', 'Electronics', 'Mouse', 3, 25.00, 75.00, '2024-01-21', 'East'),
    (22, 112, 'Laura', 'Furniture', 'Couch', 1, 700.00, 700.00, '2024-01-22', 'West'),
    (23, 113, 'Mike', 'Clothing', 'Hat', 4, 15.00, 60.00, '2024-01-23', 'North'),
    (24, 114, 'Nancy', 'Electronics', 'Smartwatch', 1, 250.00, 250.00, '2024-01-24', 'South'),
    (25, 115, 'Oscar', 'Furniture', 'Wardrobe', 1, 1000.00, 1000.00, '2024-01-25', 'East')

	CREATE TABLE OneColumn (
    Value SMALLINT
);
INSERT INTO OneColumn VALUES (10), (20), (30), (40), (100);

CREATE TABLE Row_Nums (
    Id INT,
    Vals VARCHAR(10)
);
INSERT INTO Row_Nums VALUES
(101,'a'), (102,'b'), (102,'c'), (103,'f'), (103,'e'), (103,'q'), (104,'r'), (105,'p');

CREATE TABLE MyData (
    Id INT, Grp INT, Val1 INT, Val2 INT
);
INSERT INTO MyData VALUES
(1,1,30,29), (2,1,19,0), (3,1,11,45), (4,2,0,0), (5,2,100,17);

CREATE TABLE TheSumPuzzle (
    ID INT, Cost INT, Quantity INT
);
INSERT INTO TheSumPuzzle VALUES
(1234,12,164), (1234,13,164), (1235,100,130), (1235,100,135), (1236,12,136);

CREATE TABLE SampleInput (
    Id INT,
    Vals VARCHAR(10)
);

INSERT INTO SampleInput (Id, Vals) VALUES
(101, 'a'),
(102, 'b'),
(102, 'c'),
(103, 'f'),
(103, 'e'),
(103, 'q'),
(104, 'r'),
(105, 'p');


--1
select customer_id,
		customer_name, 
		total_amount, 
		sum(total_amount) over(partition by customer_id order by order_date) as Running_total 
from sales_data
--2
select distinct product_category, sum(quantity_sold) over(partition by product_category) as Quantity_category from sales_data
--3
select distinct product_category, max(total_amount) over(partition by product_category) as Max_category from sales_data
--4
select distinct product_category, min(total_amount) over(partition by product_category) as Min_category from sales_data
--5
select *, avg(total_amount) over(order by order_date rows between 1 preceding and 1 following ) as MovingAVG from sales_data;
--6
select distinct region, sum(total_amount) over(partition by region) as Region_Amount from sales_data
--7
select 
		distinct customer_id, 
		customer_name, 
		sum(Total_amount) as Customer_Amount,
		rank() over(order by sum(Total_amount) desc)
 from sales_data
 group by customer_id, customer_name
--8
select customer_id, 
		Customer_name, 
		Total_Amount, 
		Total_Amount - lag(Total_Amount) over(partition by customer_id order by Order_date) as diff 
from sales_data;
--9
with cte as (
select product_category, product_name, unit_price, DENSE_RANK() over(partition by product_category order by unit_price desc) as dr from sales_data)
select distinct product_category,product_name, unit_price from cte
where dr<4;
--10
select region,order_date,total_amount, sum(total_amount) over(partition by region order by order_date) as Sum_region from sales_data
--11
select distinct product_category, sum(total_amount) over(partition by product_category) as product_sale from sales_data
--12
select id, sum(id) over(order by id) SumPreValues from Table_id;
--13
select Value, Sum(Value) over(order by Value rows between 1 preceding and current row) as [Sum of Previous] from OneColumn;
--14
select *, ROW_NUMBER() over(order by vals) as RowNumber  from Row_Nums
--15
select customer_id from sales_data
group by customer_id
having count(distinct product_category)>1
--16
select customer_id,region, avg(total_amount) as Region_avg from sales_data s1
group by customer_id,region
having avg(total_amount) > (select avg(total_amount) from sales_data s2 where s2.region = s1.region)
--17
select customer_id,region,customer_name, sum(total_amount) as total_sales , RANK() over(partition by region order by sum(total_amount) desc) as r
from sales_data
group by region,customer_id, customer_name ;
--18
select customer_id, customer_name, total_amount, sum(total_amount) over(partition by customer_id order by order_date) as cumulative_sales
from sales_data;
--19
select Year(order_date) as Year ,
		month(order_date) as Month, 
		sum(Total_amount),
		cast(round(((sum(Total_amount)-lag(sum(Total_amount),1, sum(Total_amount)) over(order by Year(order_date),month(order_date)))/lag(sum(Total_amount),1, sum(Total_amount)) over(order by Year(order_date),month(order_date)))*100,2) as float) as per
from sales_data
group by Year(order_date), month(order_date);
--20
with cte as (
select	
	customer_id, 
	customer_name, 
	total_amount,  
	FIRST_VALUE(total_amount) over(order by order_date desc) as fv,
	order_date
from sales_data)
select customer_id, 
	customer_name, 
	total_amount,
	order_date  
from cte
where fv<=total_amount;
--21
select product_name from sales_data
where unit_price > (select avg(unit_price) from sales_data) 
--22
select *,
	case when row_number() over(partition by grp order by id) =1 then sum(val1+Val2) over(partition by grp) 
	 else null end as Tot 
from MyData;
--23
select id, sum(cost) as Cost,case when count(distinct quantity)=1 then Max(Quantity) else sum(quantity) end as Quantity from TheSumPuzzle
group by id;
--25
WITH Numbered AS (
    SELECT
        *,
        case when ROW_NUMBER() OVER (ORDER BY Id )=1 then 2 else 0 end AS rn
    FROM SampleInput
)
	Select *, 
		case when lag(id) over(order by id, vals ) <> id and rn%2=0 then lag(rn) over(order by id, vals)+2 
			 else  lag(rn) over(order by id, vals)+1 end as Changed 
		 
from Numbered ;
 
