--1
SELECT p.firstName,p.lastname, a.city,a.state FROM Person p
LEFT JOIN Address a ON p.personId = a.personId;
--2
select e1.name as Employee from employee e1 
inner join employee e2 on e1.managerId = e2.id and e1.salary>e2.salary;
--3
select email from person
group by email
having count(email)>1;
--4
DELETE A from Person A, Person B
where A.email = B.email
AND A.id > B.id;
--5
select distinct g.ParentName from boys b 
right join girls g on b.ParentName = g.ParentName
where b.ParentName is null;
--6
SELECT 
    o.custid,
    SUM(od.unitprice * od.qty * (1 - od.discount)) AS TotalSalesAmount,
    MIN(od.qty) AS LeastWeight  
FROM 
    Sales.Orders o
JOIN 
    Sales.OrderDetails od ON o.orderid = od.orderid
WHERE 
    od.qty > 50
GROUP BY 
    o.custid
ORDER BY 
    o.custid;
--7
select * from cart1
select * from cart2
select * from cart1 c1
full outer join cart2 c2 on c1.Item = c2.Item;
--8
select *, case 
	when cast(substring(Score,1,charindex(':',Score)-1) as int)  > cast(substring(Score,charindex(':',Score)+1, len(Score)) as int) then substring(Match,1,charindex('-',Match)-1)
	when cast(substring(Score,1,charindex(':',Score)-1) as int) < cast(substring(Score,charindex(':',Score)+1, len(Score)) as int) then substring(Match,charindex('-',Match)+1, len(Score)) 
	else 'Draw' end as Result  
from match1
--9
select c.name as Customers from customers c
left join orders o on c.id = o.customerId
where o.customerId is null;
--10
select st.student_id, st.student_name, sub.subject_name, isnull(ex.attended_exams,0) as attended_exams from students st
cross join subjects sub
left join (select student_id, subject_name, count(student_id) as attended_exams from examinations group by student_id, subject_name) ex on st.student_id = ex.student_id and sub.subject_name = ex.subject_name
order by st.student_id, sub.subject_name;
