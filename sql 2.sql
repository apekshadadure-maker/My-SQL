create database BankingDB;

use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

insert into Customers(CuustomerID,LastName,Email,Phone,AccountCreationdate)
values(101,'Raj','Karve','raj_k@gmail.com',9881004242,'2025-10-25');
Create Table persons(
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255)NOT NULL,
   Age int
   );
desc Persons;
-- add null constraints to 'Age' column--
ALTER table Persons modify column Age int NOT NULL;   
   

insert into Persons values(1,'Deshmukh','Vaishnavi',23);

select FirstName,LastName,concat (FirstName," ",LastName) as'Employee Name' from Persons;

-- Unique --
Alter table Persons add column Email varchar(200);

ALTER table Persons modify column Email varchar(200) unique;

desc Persons;
insert into Persons values(2,'Saxsena','Rajeev',23,'rajeev-saxxsena@gmail.com'),
(3,'Kapoor','Jay',26,'kapoor_jay12@gmail.com'),(4,'Kale','Prachi',23,'prachi_kale@gmail.com');

select *from Persons;

ALTER table Persons modify column ID int primary key;

desc Persons;

-- Check() constraint on 'age' column --
alter table Persons modify column age int check(age>18);

desc Persons;

select *from Persons;

insert into Persons values(5,'Gandhi','Rahul',55,'gandhi_rahul12@gmail.com');

-- Date :01/sep/2026--
-- Default Constraint in sql--
-- Default : the default constraint is used to automatically assign a default value to a column --
-- when no value is specified during an insert operation -- 

create table employee(
   employeeID INT PRIMARY KEY,
   employeeName VARCHAR(100),
   department VARCHAR(50),
   salary DECIMAL(10,2),
   JoiningDate DATE default '2026-09-01',
   city VARCHAR(50)
   );
  
   -- alter table employee modify column joiningdate DATE default '2026/09/01';
   alter table employee modify column salary int default 20000;
   desc employee;
   
   select * from employee;
   
   -- insert one record --
   Insert INTO Employee
   (employeeID, employeeName, Department, salary, city) values (1,'rahul sharma','IT',50000,'mumbai');
   
   Insert INTO Employee
   (employeeID, employeeName, Department, city) values (2,'raju sharma','LOgistics','mumbai');
   
   Insert INTO Employee
   (employeeID, employeeName, Department, salary, city)
   values
   (3,'priya patil','HR',45000,'pune'),
   (4,'amit kumar','Finance',60000,'delhi'),
   (5,'sneha joshi','IT',55000,'nagpur'),
   (6,'rohan verma','Marketing',48000,'mumbai');
   
   #adding default constraint to an existing table:
   ALTER TABLE Employee
   ALTER city set default 'nagpur';
   
   
   desc employee;
   
   -- delete the entire row with specific condition of 'EmployeeID' is 7 of table
   delete from Employee where EmployeeID=7;
   
   -- insert using default value --
   insert INTO Employee
   (employeeID, employeeName, department, salary)
   values
   (8,'neha singh','HR','56000');
   
   create table department(
    departmentID INT primary key,
    departmentName varchar(50)
    );
    
    insert into department
    (departmentID, departmentName)
    values
    (101,'IT'),
    (102,'HR'),
    (103,'Finance');
    
    create table employee_child(
     employeeID INT primary key,
     employeeName varchar(100),
     departmentID INT,
     
     foreign key (departmentID)
     references department(departmentID)
     
     foreign key(employeeID)
     reference manager(managerID)
     );
     
     desc employee_child;
     
     create table manager(
     manager_ID int primary key,
     manager_Name varchar(200));
	
     
    
   
   
   