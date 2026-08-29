use n325_db;

Create Table Accounts(
AccountID INT,
AccountType varchar(20),
Balance decimal(10,2)
);

-- structur of table--

desc Accounts;

show tables;

create table transactions(
transactionID INT,
transactionDate Date,
accont decimal(10,2),
transactionType varchar(20)
);

-- structur of table--
desc Accounts;
desc transactions;

create table branches(
 branchID INT, branchname varchar(100),
 branchaddress varchar(200), branchephone varchar(15)
 );
 
 create table accountbranches(
 assignmentdate date
 );
 
 create table loans(
 loanID INT, loanamount decimal(10,2),intrestrate decimal(5,2),startdate date,enddate date
 );
 -- structure of table;
 desc accounts;
 desc transactions;
 
 show tables;
 
# modify the table structure by using ALTER command
/*
1) Add new columns
2) Modify existing column
3) Rename columns
4)Add constraints
5)Remove constrints
*/

desc customers;
show tables;

-- change datatype of existing column--
 
ALTER table customers modify phone varchar(30);

desc customers;

-- Add existing balance constraints--
ALTER table customers
add constraint chk_Minbalance
CHECK(balance>=5000);

-- Drop 'accountbranches' table--
-- syntax; DROP table <table_name>;--
DROP table accountbranches;

desc customers;

-- Add primary key constraints to 'CustomerID' in customers table--
alter table customers
add primary key (customerID);

-- add unique constaints to 'phone' of 'Customers'table--
alter table customers
add unique(phone);
 