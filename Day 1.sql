create database n325_db;

-- to display database --
show databases;

-- to select the database --
use n325_db;

create database ds;
-- drop the database--
drop database ds;
-- command to create table--
CREATE table IF NOT exists employee
(
emp_id int,emp_name varchar(20),salary double,hiring_date date
);

-- describe the table--
desc employee;

describe employee;

-- insert records in table --
insert into employee(emp_id,emp_name,hiring_date) values(1,'Suresh','2026-08-27');

-- to display/retrive table --
select *from employee;

-- to display records of specific column from table --
select emp_id from employee;