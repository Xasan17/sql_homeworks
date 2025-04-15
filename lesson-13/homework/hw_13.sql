CREATE TABLE Employees (
    EMPLOYEE_ID int,
    FIRST_NAME varchar(50),
    LAST_NAME varchar(50),
    EMAIL varchar(255),
    PHONE_NUMBER varchar(50),
    HIRE_DATE date,
    JOB_ID varchar(50),
    SALARY float,
    COMMISSION_PCT float,
    MANAGER_ID int,
    DEPARTMENT_ID int
);

INSERT INTO Employees VALUES 
(100, TRIM('Steven '), TRIM('King '), TRIM('SKING '), TRIM('515.123.4567 '), '1987-06-17', TRIM('AD_PRES '), 24000.00, 0.00, 0, 90),
(101, TRIM('Neena '), TRIM('Kochhar '), TRIM('NKOCHHAR '), TRIM('515.123.4568 '), '1987-06-18', TRIM('AD_VP '), 17000.00, 0.00, 100, 90),
(102, TRIM('Lex '), TRIM('De Haan '), TRIM('LDEHAAN '), TRIM('515.123.4569 '), '1987-06-19', TRIM('AD_VP '), 17000.00, 0.00, 100, 90),
(103, TRIM('Alexander '), TRIM('Hunold '), TRIM('AHUNOLD '), TRIM('590.423.4567 '), '1987-06-20', TRIM('IT_PROG '), 9000.00, 0.00, 102, 60),
(104, TRIM('Bruce '), TRIM('Ernst '), TRIM('BERNST '), TRIM('590.423.4568 '), '1987-06-21', TRIM('IT_PROG '), 6000.00, 0.00, 103, 60),
(105, TRIM('David '), TRIM('Austin '), TRIM('DAUSTIN '), TRIM('590.423.4569 '), '1987-06-22', TRIM('IT_PROG '), 4800.00, 0.00, 103, 60),
(106, TRIM('Valli '), TRIM('Pataballa '), TRIM('VPATABAL '), TRIM('590.423.4560 '), '1987-06-23', TRIM('IT_PROG '), 4800.00, 0.00, 103, 60),
(107, TRIM('Diana '), TRIM('Lorentz '), TRIM('DLORENTZ '), TRIM('590.423.5567 '), '1987-06-24', TRIM('IT_PROG '), 4200.00, 0.00, 103, 60),
(108, TRIM('Nancy '), TRIM('Greenberg '), TRIM('NGREENBE '), TRIM('515.124.4569 '), '1987-06-25', TRIM('FI_MGR '), 12000.00, 0.00, 101, 100),
(109, TRIM('Daniel '), TRIM('Faviet '), TRIM('DFAVIET '), TRIM('515.124.4169 '), '1987-06-26', TRIM('FI_ACCOUNT '), 9000.00, 0.00, 108, 100),
(110, TRIM('John '), TRIM('Chen '), TRIM('JCHEN '), TRIM('515.124.4269 '), '1987-06-27', TRIM('FI_ACCOUNT '), 8200.00, 0.00, 108, 100),
(111, TRIM('Ismael '), TRIM('Sciarra '), TRIM('ISCIARRA '), TRIM('515.124.4369 '), '1987-06-28', TRIM('FI_ACCOUNT '), 7700.00, 0.00, 108, 100),
(112, TRIM('Jose Manuel '), TRIM('Urman '), TRIM('JMURMAN '), TRIM('515.124.4469 '), '1987-06-29', TRIM('FI_ACCOUNT '), 7800.00, 0.00, 108, 100),
(113, TRIM('Luis '), TRIM('Popp '), TRIM('LPOPP '), TRIM('515.124.4567 '), '1987-06-30', TRIM('FI_ACCOUNT '), 6900.00, 0.00, 108, 100),
(114, TRIM('Den '), TRIM('Raphaely '), TRIM('DRAPHEAL '), TRIM('515.127.4561 '), '1987-07-01', TRIM('PU_MAN '), 11000.00, 0.00, 100, 30),
(115, TRIM('Alexander '), TRIM('Khoo '), TRIM('AKHOO '), TRIM('515.127.4562 '), '1987-07-02', TRIM('PU_CLERK '), 3100.00, 0.00, 114, 30),
(116, TRIM('Shelli '), TRIM('Baida '), TRIM('SBAIDA '), TRIM('515.127.4563 '), '1987-07-03', TRIM('PU_CLERK '), 2900.00, 0.00, 114, 30),
(117, TRIM('Sigal '), TRIM('Tobias '), TRIM('STOBIAS '), TRIM('515.127.4564 '), '1987-07-04', TRIM('PU_CLERK '), 2800.00, 0.00, 114, 30),
(118, TRIM('Guy '), TRIM('Himuro '), TRIM('GHIMURO '), TRIM('515.127.4565 '), '1987-07-05', TRIM('PU_CLERK '), 2600.00, 0.00, 114, 30);

CREATE TABLE Students (
    StudentID int,
    FullName varchar(100),
    Grade decimal(5,2)
);

INSERT INTO Students VALUES 
(1,'James Alexander Hamilton',98.5),
(2,'Arthur George Mason',78.2),
(3,'Lily B Peters',81),
(4,'Kayne Thomas Derek',87.3),
(5,'April Dukane Paris',79.1),
(6,'Payton Carl Johnson',97.1);

CREATE TABLE Employee (
    EmployeeID INTEGER PRIMARY KEY,
    ManagerID INTEGER NULL,
    JobTitle VARCHAR(100) NOT NULL
);

INSERT INTO Employee (EmployeeID, ManagerID, JobTitle) VALUES 
(1001,NULL,'President'),
(2002,1001,'Director'),
(3003,1001,'Office Manager'),
(4004,2002,'Engineer'),
(5005,2002,'Engineer'),
(6006,2002,'Engineer');

CREATE TABLE Orders (
    CustomerID INTEGER,
    OrderID INTEGER,
    DeliveryState VARCHAR(100) NOT NULL,
    Amount MONEY NOT NULL,
    PRIMARY KEY (CustomerID, OrderID)
);

INSERT INTO Orders (CustomerID, OrderID, DeliveryState, Amount) VALUES 
(1001,1,'CA',340),
(1001,2,'TX',950),
(1001,3,'TX',670),
(1001,4,'TX',860),
(2002,5,'WA',320),
(3003,6,'CA',650),
(3003,7,'CA',830),
(4004,8,'TX',120);

CREATE TABLE Ungroup (
    ProductDescription VARCHAR(100) PRIMARY KEY,
    Quantity INTEGER NOT NULL
);

INSERT INTO Ungroup (ProductDescription, Quantity) VALUES 
('Pencil',3),
('Eraser',4),
('Notebook',2);

CREATE TABLE DMLTable (
    SequenceNumber INTEGER PRIMARY KEY,
    String VARCHAR(100) NOT NULL
);

INSERT INTO DMLTable (SequenceNumber, String) VALUES 
(1,'SELECT'),
(2,'Product,'),
(3,'UnitPrice,'),
(4,'EffectiveDate'),
(5,'FROM'),
(6,'Products'),
(7,'WHERE'),
(8,'UnitPrice'),
(9,'> 100');

CREATE TABLE Equations (
    Equation VARCHAR(200) PRIMARY KEY,
    TotalSum INTEGER NULL
);

INSERT INTO Equations (Equation) VALUES 
('123'),
('1+2+3'),
('1+2-3'),
('1+23'),
('1-2+3'),
('1-2-3'),
('1-23'),
('12+3'),
('12-3');

CREATE TABLE Student (
    StudentName VARCHAR(50) PRIMARY KEY,
    Birthday DATE
);

INSERT INTO Student (StudentName, Birthday) VALUES 
('Susan', '2015-04-15'),
('Tim', '2015-04-15'),
('Jacob', '2015-04-15'),
('Earl', '2015-02-05'),
('Mike', '2015-05-23'),
('Angie', '2015-05-23'),
('Jenny', '2015-11-19'),
('Michelle', '2015-12-12'),
('Aaron', '2015-12-18');

CREATE TABLE TestMax (
    Year1 INT,
    Max1 INT,
    Max2 INT,
    Max3 INT
);

INSERT INTO TestMax VALUES 
(2001,10,101,87),
(2002,103,19,88),
(2003,21,23,89),
(2004,27,28,91);

CREATE TABLE cinema (
    id INT PRIMARY KEY,
    movie VARCHAR(50),
    description VARCHAR(255),
    rating DECIMAL(3, 1)
);

INSERT INTO cinema (id, movie, description, rating) VALUES 
(1, 'War', 'great 3D', 8.9),
(2, 'Science', 'fiction', 8.5),
(3, 'Irish', 'boring', 6.2),
(4, 'Ice song', 'Fantacy', 8.6),
(5, 'House card', 'Interesting', 9.1);

CREATE TABLE SingleOrder (
    Id INT,
    Vals VARCHAR(10)
);

INSERT INTO SingleOrder VALUES 
(0,'All'),
(1,'Pawan'),
(2,'Avtaar'),
(3,'Kishan'),
(4,'Vaibhav'),
(5,'Ashutosh');

SELECT * FROM SingleOrder;

CREATE TABLE person (
    id INT,
    ssn VARCHAR(13),
    passportid VARCHAR(10),
    itin VARCHAR(10)
);

INSERT INTO person VALUES 
(1, '111-11-1111', 'aa155', '123itin'),
(2, NULL, 'aa156', '124itin'),
(3, NULL, NULL, '125itin'),
(4, NULL, NULL, NULL),
(5, '222-22-2222', NULL, '126itin'),
(6, '333-33-3333', 'aa157', NULL);

CREATE TABLE PlayerScores (
    PlayerA INTEGER,
    PlayerB INTEGER,
    Score INTEGER NOT NULL,
    PRIMARY KEY (PlayerA, PlayerB)
);

INSERT INTO PlayerScores (PlayerA, PlayerB, Score) VALUES 
(1001,2002,150),
(3003,4004,15),
(4004,3003,125);

CREATE TABLE Personal (
    SpacemanID INTEGER PRIMARY KEY,
    JobDescription VARCHAR(100) NOT NULL,
    MissionCount INTEGER NOT NULL
);

INSERT INTO Personal (SpacemanID, JobDescription, MissionCount) VALUES 
(1001,'Astrogator',6),
(2002,'Astrogator',12),
(3003,'Astrogator',17),
(4004,'Geologist',21),
(5005,'Geologist',9),
(6006,'Geologist',8),
(7007,'Technician',13),
(8008,'Technician',2),
(9009,'Technician',7);


--1
SELECT CONCAT(EMPLOYEE_ID ,'-', FIRST_NAME, ' ', LAST_NAME) AS Fullname FROM Employees;
--2
UPDATE Employees
SET PHONE_NUMBER = REPLACE(PHONE_NUMBER, '124', '999')
WHERE PHONE_NUMBER LIKE '%124%';
--3
SELECT FIRST_NAME, LEN(FIRST_NAME) Len_name FROM Employees
WHERE FIRST_NAME LIKE '[A,J,M]%';
--4
SELECT MANAGER_ID, SUM(SALARY) AS Salary_MANAG FROM Employees 
GROUP BY MANAGER_ID;
--5
SELECT Year1, (SELECT MAX(v) 
     FROM (VALUES (Max1), (Max2), (Max3)) AS value_list(v)) AS HighestValue  FROM TestMax	 
--6
SELECT movie,description, rating FROM cinema
WHERE ID%2 = 1 AND description != 'boring'
--7
SELECT * FROM SingleOrder
ORDER BY  IIF(ID=0,1,0), id;
--8
SELECT COALESCE(ssn, passportid, itin, NULL) AS First_Non_Null FROM person;
--9 
SELECT  Employee_ID, First_Name, Last_Name, ROUND(DATEDIFF(DAY,Hire_Date, GETDATE())/365,2) AS Years_of_Service  FROM Employees
WHERE DATEDIFF(DAY,Hire_Date, GETDATE())/365>10 AND DATEDIFF(DAY,Hire_Date, GETDATE())/365<15;
--10
SELECT e1.* FROM EMPLOYEES e1
INNER JOIN (SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY FROM Employees
GROUP BY DEPARTMENT_ID ) AS e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e1.SALARY > e2.AVG_SALARY;
--11
SELECT
  STRING_AGG(CASE WHEN value LIKE '[A-Z]' THEN value ELSE '' END, '') AS Uppercase,
  STRING_AGG(CASE WHEN value LIKE '[a-z]' THEN value ELSE '' END, '') AS Lowercase,
  STRING_AGG(CASE WHEN value LIKE '[0-9]' THEN value ELSE '' END, '') AS Numbers,
  STRING_AGG(CASE WHEN value NOT LIKE '[A-Za-z0-9]' THEN value ELSE '' END, '') AS Others
FROM STRING_SPLIT('tf56sd#%OqH', ' ');
SELECT * FROM STRING_SPLIT('tf56sd#%OqH', '')
--12
SELECT * FROM Students
SELECT 
	LEFT(FULLNAME,CHARINDEX(' ', FULLNAME)) AS First_Name, 
	SUBSTRING(FullName, CHARINDEX(' ', FULLNAME)+1,CHARINDEX(' ', FULLNAME, CHARINDEX(' ', FULLNAME,1)+1)-(CHARINDEX(' ', FULLNAME)+1)) Middle_Name,
	RIGHT(FullName,LEN(FULLNAME)-(CHARINDEX(' ', FULLNAME, CHARINDEX(' ', FULLNAME,1)+1))) AS Last_Name
FROM Students;
--13
SELECT o1.* FROM Orders o1
INNER JOIN (SELECT * FROM Orders WHERE DeliveryState ='CA' ) AS o2 ON o1.CustomerID = o2.CustomerID
WHERE o1.DeliveryState = 'TX';
--14
WITH Numbers AS (
    
    SELECT TOP (100) ROW_NUMBER() OVER (ORDER BY (SELECT NULL)) AS n
    FROM sys.all_objects 
)
SELECT 
    u.ProductDescription
FROM Ungroup u
CROSS APPLY (
    SELECT n 
    FROM Numbers 
    WHERE n <= u.Quantity
) AS Num;
--15
SELECT STRING_AGG(String, ' ' ) AS 'Select' FROM DMLTable;
--16
SELECT *, 
	CASE WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE())<1 THEN 'New Hire' 
	WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) BETWEEN 1 AND 4 THEN 'Junior'
	WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) BETWEEN 5 AND 9 THEN 'Mid-Level'
	WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE()) BETWEEN 10 AND 19 THEN 'Senior'
	WHEN DATEDIFF(YEAR,HIRE_DATE, GETDATE())>=20 THEN 'Veteran' END 
 FROM Employees;
 --17
SELECT e1.* FROM EMPLOYEES e1
INNER JOIN (SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY FROM Employees
GROUP BY DEPARTMENT_ID ) AS e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID
WHERE e1.SALARY > e2.AVG_SALARY;
--18
SELECT CONCAT(FIRST_NAME,' ', LAST_NAME) AS FULL_NAME , SALARY FROM Employees
WHERE CONCAT(FIRST_NAME,' ', LAST_NAME) LIKE '%a%' AND CAST(SALARY AS INT) % 5 = 0;
--19
SELECT e2.Count_Emp, ROUND(e1.Count_NoJun_Emp/e2.Count_Emp*100,2) AS percentage FROM (SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS Count_NoJun_Emp FROM Employees
WHERE DATEDIFF(YEAR,HIRE_DATE, GETDATE()) >=3
GROUP BY DEPARTMENT_ID) e1
INNER JOIN (SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) AS Count_Emp FROM Employees
GROUP BY DEPARTMENT_ID) e2 ON e1.DEPARTMENT_ID = e2.DEPARTMENT_ID;
--20
SELECT p1.JobDescription,
    MAX(CASE WHEN MissionCount = P2.MaxMissionCount THEN SpacemanID END) AS MostExperiencedID,
    MAX(CASE WHEN MissionCount = P2.MinMissionCount THEN SpacemanID END) AS LeastExperiencedID
FROM Personal p1
INNER JOIN (
    SELECT JobDescription, 
           MAX(MissionCount) AS MaxMissionCount, 
           MIN(MissionCount) AS MinMissionCount
    FROM Personal
    GROUP BY JobDescription
) p2 
    ON p1.JobDescription = p2.JobDescription 
   AND (p1.MissionCount = p2.MaxMissionCount OR p1.MissionCount = p2.MinMissionCount)
GROUP BY p1.JobDescription;
--21
SELECT s1.StudentID, s1.FullName, COALESCE(s1.Grade + s2.Grade, s1.Grade) AS Sum_previous FROM Students s1
LEFT JOIN Students s2 ON s1.StudentID = s2.StudentID+1;
--22
SELECT e1.*, 
	CASE WHEN e1.JobTitle = 'President' THEN 0
	WHEN e2.EmployeeID=(SELECT TOP 1  EmployeeID FROM Employee WHERE JobTitle = 'President') THEN 1
	WHEN e2.ManagerID = (SELECT TOP 1  EmployeeID FROM Employee WHERE JobTitle = 'President') THEN  2
	ELSE 3 END AS hierarchical FROM Employee e1
LEFT JOIN Employee e2 ON e1.ManagerID = e2.EmployeeID;
--23
SELECT Equation, 
  CAST(EVALUATE(Equation) AS INT) AS Result -- в некоторых системах, либо EXEC, либо кастомная функция
FROM Equations;
--24
SELECT * FROM Student
WHERE Birthday IN (SELECT Birthday FROM Student GROUP BY Birthday HAVING COUNT(Birthday)>1);
--25
SELECT 
	CASE WHEN PlayerA>PlayerB THEN PlayerA ELSE PlayerB END AS PlayerA ,
	CASE WHEN PlayerA>=PlayerB THEN PlayerB ELSE PlayerA END AS PlayerB, 
	SUM(Score) AS Total_Score 
FROM PlayerScores
GROUP BY CASE WHEN PlayerA>PlayerB THEN PlayerA ELSE PlayerB END ,
	CASE WHEN PlayerA>=PlayerB THEN PlayerB ELSE PlayerA END;
