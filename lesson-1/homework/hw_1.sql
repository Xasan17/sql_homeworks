--Easy
--1
--Data – raw facts and values that can be processed to obtain useful information.
--Database – an organized collection of data stored electronically.
--Relational Database – a database structured in tables that are linked together using keys (primary and foreign).
--Table – the main structure of a database, where data is organized into rows and columns.

--2
--Key Features of SQL Server
--Security – Supports authentication, encryption, and access control management.
--Scalability – Capable of handling large volumes of data and high workloads.
--High Availability – Ensures fault tolerance through Always On, replication, and clustering.
--Data Integration – Works with various tools for data extraction, transformation, and loading (ETL).
--Performance Optimization – Uses indexing, caching, and query optimization to enhance efficiency.

--3
--Authentication Modes in SQL Server
--Windows Authentication – Uses Windows credentials for login.
--SQL Server Authentication – Requires a username and password managed by SQL Server.
--Mixed Mode Authentication – Supports both Windows Authentication and SQL Server Authentication, allowing flexibility in user access.


--Medium
--1
CREATE DATABASE SchoolDB;

USE SchoolDB;

--2
CREATE TABLE Students (StudentID INT PRIMARY KEY,
Name VARCHAR(50), age INT);

--3
--Differences Between SQL Server, SSMS, and SQL
--SQL Server – A relational database management system (RDBMS) developed by Microsoft.
--SSMS (SQL Server Management Studio) – A graphical interface for managing SQL Server, executing queries, and administering databases.
--SQL (Structured Query Language) – A programming language used to work with relational databases.

--Hard
--1
--DQL (Data Query Language) – Used to retrieve data from the database.
--For example

SELECT * FROM Students;

--2
--DML (Data Manipulation Language) – Responsible for modifying data (insertion, updating, deletion).
--INSERT
INSERT INTO Students (StudentID,name,age) VALUES (1,'Xasan',19);
--UPDATE
UPDATE Students 
SET age=21
WHERE StudentID=1;

--DELETE 
DELETE FROM Students
WHERE StudentID=1; 

--3
--DDL (Data Definition Language) – Manages the database structure (creating, modifying, deleting tables).
--CREATE 
CREATE TABLE Employees (ID INT PRIMARY KEY, name VARCHAR(50));
--ALTER
ALTER TABLE Employees
ADD salary  INT; 
--DELETE
DROP TABLE Employees;

--4
--DCL (Data Control Language) – Regulates data access (user permission management).
--FOR EXAMPLE: GRANT AND REVOKE.

--5
--TCL (Transaction Control Language) – Manages transactions (commit or rollback changes).
BEGIN TRAN
INSERT INTO Students (StudentID,Name,age) VALUES (2,'Alisher',25)
COMMIT; 

BEGIN TRAN
DELETE FROM Students 
WHERE StudentID=2
ROLLBACK;
--2
INSERT INTO Students (StudentID,Name,age) VALUES (1,'Xasan',21),(3,'Tolagan',28),(4,'Sodiq',26)

--3
BACKUP DATABASE SchoolDB  
TO DISK = 'D:\Дата аналитика\HW\SchoolDB.bak'  
WITH FORMAT, INIT,  
NAME = 'Full Backup of SchoolDB';
