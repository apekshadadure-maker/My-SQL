create database bankingDB;
use bankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

desc Accounts;

CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

Describe Accounts;
Describe Transactions;
describe Branches;
describe AccountBranches;
describe Loans;

ALTER TABLE Customers
ADD DateOfBirth DATE;

describe Customers;

show table status;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);

insert into Customers (CustomerID,FirstName,LastName,Email,Phone,DateofBirth)
values (101,"Rahul","Sharma",'rahulsharma@gmail.com','9263708019','1998-04-15');

insert into Customers (CustomerID,FirstName,LastName,Email,Phone,DateofBirth)
values (102,"Kunal",'Modi','kunal@gmail.com','723456780','1997-06-20');

update Customers set Phone=9881913245 where CustomerID=101;
update Customers set Email='rahul_sharma@gmail.com' where CustomerID=101;
select*from Customers;

-- set SQL_SAFE_UPDATES=0; this command is use when the safe updates want --  when 'where' clause is not used.
desc Customers;

desc Customers;

ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (Balance >= 1000);

-- violates the condition it doesn't accept balance less than 1000 --
insert into Accounts values (202,'Current',999,102);


DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);


#########################################
-- Add Primary Keys
ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD CONSTRAINT PK_Branches
PRIMARY KEY (BranchID);

ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

-- Add Required Columns


ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Loans
ADD CustomerID INT;


ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);