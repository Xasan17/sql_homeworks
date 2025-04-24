CREATE TABLE Employee ( Id INT, Name VARCHAR(50), Salary INT, ManagerId INT );

INSERT INTO Employee (Id, Name, Salary, ManagerId) VALUES (1, 'Joe', 70000, 3), (2, 'Henry', 80000, 4), (3, 'Sam', 60000, NULL), (4, 'Max', 90000, NULL);

CREATE TABLE weather ( Id INT, RecordDate DATE, Temperature INT );

INSERT INTO weather (Id, RecordDate, Temperature) VALUES (1, '2015-01-01', 10), (2, '2015-01-02', 25), (3, '2015-01-03', 20), (4, '2015-01-04', 30);

CREATE TABLE Activity ( player_id INT, device_id INT, event_date DATE, games_played INT );

INSERT INTO Activity (player_id, device_id, event_date, games_played) VALUES (1, 2, '2016-03-01', 5), (1, 2, '2016-05-02', 6), (2, 3, '2017-06-25', 1), (3, 1, '2016-03-02', 0), (3, 4, '2018-07-03', 5);

CREATE TABLE MultipleVals ( Id INT ,[Vals] VARCHAR(100) ) 

Insert Into MultipleVals values (1,'a,b,c') ,(2,'x,y,z') 

CREATE TABLE fruits ( fruit_list VARCHAR(100) );

INSERT INTO fruits (fruit_list) VALUES ('apple,banana,orange,grape');

CREATE TABLE RemoveLastComma ( Id INT ,Val VARCHAR(100) ) 

INSERT INTO RemoveLastComma VALUES (1,'Pawan'), (2,'Pawan,Avtaar,'), (3,','), (4,'Hello,'), (5,'a,a,b,c,'), (6,NULL), (7,'')  
CREATE TABLE FindSameCharacters ( Id INT ,Vals VARCHAR(10) ) 

INSERT INTO FindSameCharacters VALUES (1,'aa'), (2,'cccc'), (3,'abc'), (4,'aabc'), (5,NULL), (6,'a'), (7,'zzz'), (8,'abc')
CREATE TABLE Splitter ( Id INT ,Vals VARCHAR(100) ) 

INSERT INTO Splitter VALUES (1,'P.K'), (2,'a.b'), (3,'c.d'), (4,'e.J'), (5,'t.u.b') 

CREATE TABLE testDots ( ID INT ,Vals VARCHAR(100) ) 

INSERT INTO testDots VALUES (1,'0.0'), (2,'2.3.1.1'), (3,'4.1.a.3.9'), (4,'1.1.'), (5,'a.b.b.b.b.b..b..b'), (6,'6.') 

CREATE TABLE GetIntegers ( Id INT ,VALS VARCHAR(100) ) 

INSERT INTO GetIntegers VALUES (1,'P1') ,(2,'1 - Hero') ,(3,'2 - Ramesh') ,(4,'3 - KrishnaKANT') ,(5,'21 - Avtaar') ,(6,'5Laila') ,(7,'6 MMT') ,(8,'7#7#') ,(9,'#') ,(10,'8') ,(11,'98') ,(12,'111') ,(13,NULL) 

CREATE TABLE RemoveDuplicateIntsFromNames ( PawanName INT , Pawan_slug_name VARCHAR(1000) ) 

INSERT INTO RemoveDuplicateIntsFromNames VALUES (1, 'PawanA-111' ), (2, 'PawanB-123' ), (3, 'PawanB-32' ), (4, 'PawanC-4444' ), (5, 'PawanD-3' ) 

CREATE TABLE TestPercent ( Strs VARCHAR(100) ) 

INSERT INTO TestPercent SELECT 'Pawan' UNION ALL SELECT 'Pawan%' UNION ALL SELECT 'Pawan%Kumar' UNION ALL SELECT '%' 

CREATE TABLE [dbo].[TestMultipleColumns]

(

[Id] [int] NULL,

[Name] varchar(100) NULL

)

INSERT INTO dbo.[TestMultipleColumns] VALUES

(1, 'Pawan,Kumar'),

(2, 'Sandeep,Goyal'),

(3, 'Isha,Mattoo'),

(4, 'Gopal,Ranjan'),

(5, 'Neeraj,Garg'),

(6, 'Deepak,Sharma'),

(7, ' Mayank,Tripathi')


CREATE TABLE CountSpaces ( texts VARCHAR(100) ) 

INSERT INTO CountSpaces VALUES ('P Q R S '), (' L M N O 0 0 '), ('I am here only '), (' Welcome to the new world '), (' Hello world program'), (' Are u nuts ')

create table p1 (id int, code int) create table p2 (id int, code int) insert into p1 select 1,0 insert into p1 select 2,1 insert into p2 select 1,5 insert into p2 select 2,5

CREATE TABLE WeekPercentagePuzzle ( Area INT , [Date] DATE , SalesLocal INT , SalesRemote INT , [DayName] VARCHAR(4) , [DayOfWeek] SMALLINT , FinancialWeek TINYINT , [MonthName] VARCHAR(15) , FinancialYear INT ) 

INSERT INTO WeekPercentagePuzzle VALUES (1, '2015-04-01', 0, 50, 'Wed', 4, 1, 'April', 2015), (2, '2015-04-01', null, null , 'Wed', 4 , 1 , 'April', 2015), (3, '2015-04-01', 100 , 0 , 'Wed', 4 , 1 , 'April', 2015), (3, '2015-04-01', 50 , 100 , 'Wed', 4, 1, 'April', 2015), (3, '2015-04-04', 50 , 50 , 'Sat', 7, 1, 'April', 2015) 

CREATE TABLE SeperateNumbersAndCharcters ( Value VARCHAR(100) ) 

INSERT INTO SeperateNumbersAndCharcters VALUES ('dskfsda1224'), ('123'), ('ABC'), ('23874283bsdjfhsjadkhfas09') ;

--1
select id, SUBSTRING(name,1,charindex(',',name,1)-1) as FirstName, SUBSTRING(name,charindex(',',name,1)+1 ,len(name)-charindex(',',name,1)) as LastName  from TestMultipleColumns;
--2
select * from TestPercent
where Strs like '%/%%' escape '/'
--3

select id, REPLACE(vals,'.',' ') from Splitter
--4
select translate('1234ABC123456XYZ1234567890ADS', '1234567890', 'XXXXXXXXXX') as result
--5
select * from Splitter
where len(Vals)-len(REPLACE(Vals,'.',''))>2
--6
select (len('absxasandakslaklcjdxasankjslkdjlxasan') - len(REPLACE('absxasandakslaklcjdxasankjslkdjlxasan', 'xasan', '')))/ len('xasan') as result
--7
select len(texts)- len(replace(texts, ' ' ,'')) as count_space from CountSpaces
--8
select e1.id,e1.Name,e1.Salary, e2.Name as Manager  from Employee e1
inner join Employee e2 on e1.ManagerId = e2.Id and e1.Salary > e2.Salary;
--9
select value,replace(translate(value, '0123456789', REPLICATE(' ',10)),' ' ,'') as num,
	 replace(translate(value, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', REPLICATE(' ',52)),' ' ,'') as string
from SeperateNumbersAndCharcters;
--10
select w2.Id from weather w1
inner join weather w2 on w1.Id+1 =w2.Id and w2.Temperature > w1.Temperature;
--11
select a1.player_id, a2.device_id from (select player_id, min(event_date) as event_date from Activity
group by player_id)as a1 inner join Activity a2 on a1.player_id = a2.player_id and a1.event_date = a2.event_date 
--12
select a1.player_id, a2.event_date from (select player_id, min(event_date) as event_date from Activity
group by player_id)as a1 inner join Activity a2 on a1.player_id = a2.player_id and a1.event_date = a2.event_date 
--13
WITH SplitList AS (
  SELECT 
    value,
    ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS rn
  FROM fruits
  CROSS APPLY STRING_SPLIT(fruit_list, ',')
)
SELECT value AS third_fruit
FROM SplitList
WHERE rn = 3;
--14
declare @string varchar(100) ='sdgfhsdgfhs@121313131' ;
with cte as (
	select substring(@string,1,1 ) as string, 1 as level
	union all
	select SUBSTRING(@string,level+1,1), level+1 from cte 
	where level < LEN(@string)  )
select string from cte ;
--15
select p1.id, case when p1.code = 0 then p2.code else p1.code end as code from p1
left join p2 on p1.id = p2.id
--16
select DATEPART(WEEKDAY, Date) from WeekPercentagePuzzle;

with cte as (
select area, FinancialWeek, SUM(ISNULL(SalesLocal,0)+ ISNULL(SalesRemote,0)) as Total from WeekPercentagePuzzle
group by area,FinancialWeek )
select 
	w.Area, 
	w.Date,
	ISNULL( w.SalesLocal + w.SalesRemote,0) as Sales,
	 c.Total, 
	 case when c.Total >0 then cast(round((ISNULL( w.SalesLocal + w.SalesRemote,0)*100.0/c.Total),2) as decimal(5,2)) else null end Percentage 
from WeekPercentagePuzzle w
inner join cte c on w.Area = c.Area and w.FinancialWeek = c.FinancialWeek;
--17
WITH CTE AS (
SELECT Id , 
    SUBSTRING(Vals, 1, CHARINDEX(',', Vals, 1) - 1) AS col1,
    SUBSTRING(Vals, CHARINDEX(',', Vals, 1) + 1, (CHARINDEX(',', Vals, CHARINDEX(',', Vals, 1) + 1) - CHARINDEX(',', Vals, 1) - 1)) AS col2,
    SUBSTRING(Vals, CHARINDEX(',', Vals, CHARINDEX(',', Vals) + 1) + 1, LEN(Vals)) AS col3
FROM MultipleVals )
	SELECT Id, CONCAT_WS(',', col2,col1,col3) AS Vals FROM CTE;
--18
SELECT ID, Vals
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals = REPLICATE(SUBSTRING(Vals, 1, 1), LEN(Vals));
--19
with cte1 as (
SELECT PawanName, 
	SUBSTRING(Pawan_slug_name, 1, CHARINDEX('-', Pawan_slug_name )-1) as string, 
	SUBSTRING(Pawan_slug_name,CHARINDEX('-', Pawan_slug_name )+1, LEN(Pawan_slug_name)) as num FROM RemoveDuplicateIntsFromNames),
cte2 as (
	select PawanName, CONCAT(string,'-', num) as Pawan_slug_name from cte1  
	where len(num) >1 and num <> REPLICATE(SUBSTRING(num, 1 , 1), len(num))),
cte3 as (select c1.PawanName, c1.string from cte1 c1 left join cte2 c2 on c1.PawanName = c2.PawanName where c2.Pawan_slug_name is null)
select * from cte2
union 
select * from cte3
--20
SELECT ID, Vals
FROM FindSameCharacters
WHERE LEN(Vals) > 1
  AND Vals = REPLICATE(SUBSTRING(Vals, 1, 1), LEN(Vals));
--21
SELECT 
    VALS,
    CAST(
        LEFT(VALS, PATINDEX('%[^0-9]%', VALS + 'x') - 1) 
        AS INT
    ) AS LeadingInteger
FROM GetIntegers
WHERE PATINDEX('[0-9]%', VALS) = 1;
