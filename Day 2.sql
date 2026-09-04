Create database bankingdb;

use bankingdb;

Create table IF NOT EXISTS Customers(
    CustomerID int, FirstName varchar(50),
    LastName varchar(50), Email varchar(100),
    Phone varchar(20)
    );

desc customer;

-- to add new column 'AccountCreation'--->DATE--
alter table customers
add AccountCreationDate date;

insert into Customers(
CustomerId,FirstName,LastName,Email,Phone,AccountCreationDate)
values(101,'Raj','Kuver','raj_k@gmail.com',9881004242,'2025-10-25');

-- to retrieve data from table--
-- syntax; Select*from <table_name>;--
select*from Customers;

select FirstName,Email,AccountCreationDate
from Customers;

