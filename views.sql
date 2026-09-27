-- create or replace view statement is used to modify an existing view

use bankingdb;

show tables;

create table customerss(
 customer_id int primary key,
 customer_name varchar(100),
 city varchar(50),
 age int,
 balance decimal(12,2)
);

desc customerss;

insert into customerss
(customer_id,customer_name,city, age ,balance)
values
(101,'rahul sharma','nagpur',28,45000.00),
(102,'priya patil','pune',32,72000.00),
(103,'amit varma','mumbai',25,38000.00),
(104,'sneha joshi','nagpur',30,65000.00),
(105,'rohan deshmukh','pune',35,80000.00);

select *from customerss; 

create view citywise_highest_balance as
select city,sum(balance)
from customerss
group by city 
order by sum(balance) desc;

select * from citywise_highest_balance;

desc citywise_highest_balance;

-- find views in mysql--

show full tables where table_type = 'view';

-- where
create view customer_bal_gt_50000 as 
select * 
from customerss
where balance>50000;

select * from customer_bal_gt_50000 where city='nagpur';

select * from customer_bal_gt_50000;

set sql_safe_updates =0;

delete from customer_bal_gt_50000 where age=35;

-- order by
select*
from customerss
order by balance desc;

-- group by
create view citywise_nu_cust_view as
select city ,count(*)as total_customers
from customerss
group by city;

select * from citywise_nu_cust_view;

-- modify the existing view
create or replace view citywise_nu_cust_view as
select city,avg(balance) as avg_balance from customerss group by city;

-- having
create view avg_gt_40000 as
select city,avg(balance) as avg_balance
from customerss 
group by city
having avg(balance)>40000;

select * from avg_gt_40000 where city='pune';

create view premium_city_view as
select city ,sum(balance)as total_balance
from customerss
group by city 
having sum(balance)>100000;

select * from premium_city_view;

-- change in existing view--
create or replace view premium_city_view as
select city ,sum(balance)as total_balance
from customerss
group by city 
having sum(balance)>100000 and city='nagpur';

-- create a view with calculated columns

create view customer_balance_status as
select
 customer_id,
 customer_name,
 city,
 balance
from customerss
where balance>50000;

##display view
select* 
from customer_balance_status;

-- create a view with calculated columns
create view customer_balance_status as
select
  customer_id,
  customer_name,
  balance,
  case
    when balance >=50000 then 'high balance'
    else 'low balance'
  end as balance_status
from customerss;  

select * from customer_balance_status;

##display view
select* 
from customer_balance_status;

-- banking analysis with aggregate function
create view banking_analysis_view as
select 
  city,
  count(*)as 'number of customers',
  min(balance) as 'minimum balance',
  max(balance)as 'maximum balance',
  round(avg(balance),2)as 'average balance',
  sum(balance) as 'total balance'
from customerss
group by city;

select * from banking_analysis_view;