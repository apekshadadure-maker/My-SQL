create database Bank;

use bank;
CREATE TABLE CUSTOMERS
(
    CustomerID INT,
    FirstName varchar(50),
    LastName varchar(50),
    Email varchar(100),
    Phone varchar(15)
 );
 
 describe Customers;
 
 ALTER TABLE Customers
 ADD AccountCreationDate DATE;
 
 Insert into Customers(CustomerID,FirstName, LastName, Email, Phone, AccountCreationDate)
 values (101, 'Raj', 'Karve', 'raj_k@gmail.com', 9881004242, '2025-10-25');
 
CREATE TABLE Persons(
   ID int NOT NULL,
   LastName varchar(255) NOT NULL,
   FirstName varchar(255) NOT NULL,
   Age int
  );
  
  desc Persons;
  
  -- add null constraints to 'Age' column --
  ALTER Table Persons modify column Age int NOT NULL;
  
  insert into Persons values(3, 'Manmode', 'Twinkle', 45, 'manmode@gmail.com');
  
  Select FirstName, LastName, concat(FirstName, " ",LastName) as 'Employee Name' from Persons;
  
  -- unique --
  ALTER TABLE Persons add column Email varchar(200);
  ALTER TABLE Persons modify column Email varchar(200) unique;
  
  desc Persons;
  insert into Persons values(2, 'Saxsena', 'Rajeev', 23, 'rajeev-saxxsena@gmail.com'), (3, 'Kapoor', 'Jay', 26, 'kapoor_jay12@gmail.com'), (4, 'Kale', 'Prachi', 23, 'prachi_kale@gmail.com');
  
  Select *from Persons;
  
  select ID, count(*)
  FROM Persons
  GROUP by ID
  HAVING COUNT(*)>1;
  
  SELECT *From Persons
  WHERE ID = 3;
 
 set sql_safe_updates = 0;
 
  
  DELETE FROM Persons
  WHERE ID = 3
  AND LastName = 'Manmode'
  AND FirstName = 'Twinkle'
  AND Email is NULL;
  
  update Persons
  set id = 4
  where id = 3
  and LastName = 'Kapoor'
  and FirstName = 'Jay';
  
  update Persons
  set id = 6
  where id = 4
  and LastName = 'Kale'
  and FirstName = 'Prachi';
  
  SELECT *from Persons;
  
  ALTER TABLE Persons
  Modify column ID Int Primary Key;
  
  desc Persons;
update Persons
  set Age = 27
  where Age = 23
  and LastName = 'Kale'
  and FirstName = 'Prachi';  
  
-- Check () Constraint on 'age' Column --
ALTER TABLE Persons modify column Age int check(age>18);

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
     references department(departmentID),
     
     foreign key(employeeID)
     references manager(manager_ID)
     );
   
    desc employee_child;
    
    desc manager;
    Drop table IF exists employee_child;
    Drop table IF exists manager;
     
     create table manager(
     manager_ID int primary key,
     manager_Name varchar(200)
     );
     
 select * from employee;

select City, count(*) as 'Number of Employee'
FROM employee
GROUP BY City
ORDER BY City desc;

#aggregation

select count(*) as 'total employee' from employee;

select sum(salary) as 'total salary' from employee;

select department, sum(salary) as 'total salary'
from employee
group by department;

select department, avg(salary) as 'average salary'
from employee
group by department;

Select Department, concat("₹", round(avg(salary), 0)) as 'Average Salary'
from employee
group by department;

-- concat -> merge two values
-- round -> you don't have point after any digit

-- AGGREGATION function on salary department wise --

select
    department,
    concat("₹", round(sum(salary), 0)) as 'Total Salary',
    concat("₹", round(max(salary), 0)) as 'Maximum Salary',
    concat("₹", round(min(salary), 0)) as 'Minimum Salary',
    count(*) as 'Number of Employees'
from employee
group by department
order by avg(salary);



-- Pattern Matching:

-- Find Employee Whose name starting 'S' --
select * from employee
where EmployeeName like 'S%';

-- Find Employee Whose name ending 'K' --
select * from employee
where EmployeeName like '%K';

-- Employee whose name contains 'a'
select * from employee
where EmployeeName like '%a%';

select city from employee
where city like '_____';

select *from employee
where city="mumbai";

## windows function
-- syntax:
/*
   select column_name1,
   window_function(column_name2)
   over ([partition by column_name3] [order by column_name4]) as new_column
   from table_name;
*/ -- 7 sep --

-- row_number()--

use bankingdb;
-- row_number()--
 select
      salary,
      row_number() over(order by salary desc)
from employee;      



-- 2) assign rank to each employee w.r.to salary--

select 
     salary,
     rank() over(order by salary desc)
     from employee;
     
     use n325_db;
     
     create table company(
		emp_id int primary key,
        emp_name varchar(100),
        department varchar(50),
        job_role varchar(50),
        salary decimal(10,2) default 20000,
        hiring_date date,
        city varchar(50)
     );
     
     insert into company
     (emp_id, emp_name, department, job_role, salary, hiring_date,city)
     values
    (101, 'Rahul Sharma', 'IT', 'Developer', 65000, '2021-01-15', 'Nagpur'),
    (102, 'Priya Singh', 'HR', 'HR Manager', 75000, '2020-05-20', 'Mumbai'),
    (103, 'Amit Kumar', 'IT', 'Developer', 70000, '2022-03-18', 'Pune'),
	(104, 'Sneha Patil', 'Finance', 'Accountant', 60000, '2021-07-12', 'Nagpur'),
	(105, 'Rohit Verma', 'IT', 'Tester', 55000, '2023-02-18', 'Mumbai'),
	(106, 'Neha Joshi', 'HR', 'Recruiter', 50000, '2022-11-25', 'Pune'),
	(107, 'Vikas Gupta', 'Finance', 'Manager', 85000, '2019-09-30', 'Delhi'),
    (108, 'Anjali Rao', 'IT', 'Developer', 60000, '2020-12-05', 'Delhi'),
    (109, 'Suresh Yadav', 'Sales', 'Executive', 45000, '2023-06-15', 'Nagpur'),
    (110, 'Pooja Mehta', 'Sales', 'Manager', 70000, '2021-10-10', 'Mumbai');

select * from company;

## STRING FUNCTIONS
select emp_name, length(emp_name) as 'No of Characters' from company;

-- CONCAT()
select concat(emp_name, ' _ ', department) from company;


-- SUBSTR(string, start_position, length)
select city, substr(city,1,3) from company;

select substr(emp_name, 2, 4), substring(emp_name, 2, 4) from company;

select emp_name,substring(emp_name, 2, 4) from company;

-- TRIM() Removes unnecessary space --
SELECT 
    emp_name, TRIM(emp_name) AS cleaned_name
FROM company;
 select trim('  nagpur  '),length(trim('   nagpur    ')) from dual;
 
 -- replace(old_str,new,str)--
 select emp_name from company;
 select
     emp_name,
     replace(emp_name, 'a','@') as modified_name,replace(emp_name,'g','9'),replace(emp_name,'s','5')
from company;

## Mathematical function
-- 1) round()
select 
   emp_name,
   salary,
   round(salary / 12,2) as mouthly_salary
 from company;
 
 -- 2) floor()
 select
    salary/12,
    floor(salary/12) as rounded_down_salary,
    ceil(salary/12) as rounded_high_salary
 from company;
 
 -- 3) abs()
 select abs(-222) from dual;
 
 
 select
    emp_name,job_role,salary,salary-60000,
    abs(salary - 60000) as salary_difference_with_abs
from company;

-- 4) mod();
select    
    emp_id,
    mod(emp_id,2) as remainder,
    mod(salary,2)
 from company;
 
 -- 5) power()
 select
    salary,
    power(salary,2) as salary_square
from company;    
  
 ## comparision operators
 -- 1) greatest(): return the largest values
 select max(salary) from company;
 select salary from company;
 
 select greatest(45,56,98,12,45,6789,765,1234543) from dual;
 
 select greatest(salary,40000)as 'salary greater than 40000' from company;
 
 
 select
    department,
    salary,
    greatest(salary,60000) as salary_greater_than_60000
    from company;
  
 -- 2) least() --> return smallest value --
 select least(12,11,34,09,45,3) from dual;
 
 select
    salary,
    least(salary,60000) as salary_less_than_60000
    from company;
    
    ## comparision operators
    
    select emp_name,salary
    from company
    where salary > 60000;
    
    select department,concat('₹' , round(sum(salary),0)) as 'departmentwise_salary'
    from company
    group by department having sum(salary)>120000 order by sum(salary) desc;
    
    -- distinct() --> it returns unique values of columns--
    select count(distinct city) as 'unique cities',
    count(city) as 'total cities' from company;
    
    -- salary increased by 25%--
    select emp_name,salary,salary*1.25 as 'salary increased by 25%'
    from company
    where city='nagpur';
    
    select salary, salary*(1-0.25) as 'salary reduced by 25%',salary*0.9 as 'salary reduced by 10%'
    from company;
    
  # not equal to --> <>
  select *
  from company where salary != 50000;
  
  # comparision baseed on classification
  select salary,
      case
         when salary >= 75000 then 'high salary'
         when salary >= 60000 then 'medium salary'
         else 'low salary'
     end as salary_category
  from company;
  
  ## aggregate functions in sql
  -- aggregation functions performs calculation on multiple rows.
  
  select count(emp_id) as total_employees_in_company
  from company;
  
  select department,count(*) as 'department_wise_employees' 
  from company group  by department;
  
  select department,sum(salary) as total_employees
  from company group by department;
  
  select department,avg(salary) as total_salary
  from company
  group by department;
  
  select department,avg(salary) as total_salary
  from company
  group by department;
  
  -- max()
  select city,max(salary) as 'maximum_salary',min(salary) as 'minimum_salary'
  from company group by department;
  
  -- all aggregation function --
  select
     count(*) as total_employees,
     sum(salary) as total_salary,
     avg(salary) as average_salary,
     max(salary) as highest_salary,
     min(salary) as lowest_salary
 from company;    
  
   
  
  
