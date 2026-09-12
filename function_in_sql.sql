## windows function
-- syntax:
/*

  select column_name1,
  window_function (column_name2)
  over ([partiition by column_name3]  [ order by column_name4] as new column
  from table_name ;
  
  */


use bankingdb;





-- 1)ROW_NUMBER()  
 
 select salary ,
 row_number()over(order by salary desc)
 from employee;
 
 -- 2) assign rank to each employee
 
select salary ,
 rank()over(order by salary desc)
 from employee;
 
 use bankingdb;
 create table sales(
 sale_id int primary key	,
 employee_name varchar (50),
 department varchar (50),
 sale_date date,
 amount decimal (10,2)
 );
 
 desc sales;
 insert into  sales ( sale_id, employee_name, department , sale_date, amount)
 values 
 (1,'amit','electronics','2026-01-05',50000),
 (2,'priya','electronics','2026-01-10',75000),
 (3,'rahul','electronics','2026-01-05',75000),
 (4,' sneha','electronics','2026-01-15',90000),
 (5,'vikas','clothing','2026-01-10',40000),
 (6,'neha', 'clothing','2026-01-19',60000),
 (7,'rohit','clothing','2026-10-10', 60000),
 (8,' pooja',' clothing','2026-01-10',85000),
 (9, 'karan','furniture','2026-02-10',30000),
 (10,'anjali','furniture','2026-02-10',55000);
 
 
 
 -- 1
-- 10assign row number 
 
 select 
 * ,row_number()over ( order by amount desc ) as 'ROW NUMBER',
 rank ()over ( order by amount desc ) as 'Rank',
 dense_rank () over ( order by amount desc ) as 'dense rank'
 from sales ;
 
 -- 2) partition by ( only applied on categorical column)--
 

 select department,amount ,
 rank () over (partition by department order by amount desc) as 'department rank',
  dense_rank () over (partition by department order by amount desc) as 'department dense  rank',
  sum(amount) 
  over (partition by department order by amount  desc ) as ' total amount'
 from sales ;
 
    select department,amount ,
 rank () over (partition by department order by amount desc) as 'department rank',
  dense_rank () over (partition by department order by amount desc) as 'department dense  rank',
  sum(amount) 
  over (partition by department order by amount  desc ) as ' running total department wise '
 from sales ;
 
 -- 3) percentage wise contribution of each department
 
 select
 employee_name,department ,amount,
  round (amount/sum(amount) over( partition by department)*100,2)  as 'depatmentwise_employee_contribution'
 from sales;
 
 
 
 -- lag()--> comapare with the previous value --
 select 
 sale_id ,department, sale_date,amount , 
 lag ( amount) over (order by sale_date),
 lead ( amount) over (order by sale_date)
 
 from sales;
 
 -- lead():> compare current value with the next value -- 
 
 
 
 
 