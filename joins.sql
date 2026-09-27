create database shoppingdb;
use shoppingdb;

 create table customers(
  customer_id int primary key,
  customer_name varchar(50),
  city varchar(50)
  );
  
  create table products(
   product_id int primary key,
   product_name varchar(50),
   category varchar(50),
   price decimal(10,2)
   );
   
   create table orders(
   order_id int primary key,
   customer_id int,product_id int,
   quantity int,
   order_date date,
   foreign key(customer_id) references customers(customer_id),
   foreign key(product_id) references products (product_id)
   );

desc orders;

   insert into customers values
   (101,'rahul sharma','nagpur'),(102,'priya verma','pune'),
   (103,'amit patil','mumbai'),(104,'sneha joshi','nashik');
   
   insert into products values
   (201,'laptop','electronics',55000),(202,'keyboard','accessories',1500),
   (203,'headphone','accessories',2500),(204,'moniter','electronics',12000);
   
   insert into orders values
   (1001,101,201,1,'2026-09-01'),
   (1002,102,202,2,'2026-09-03'),
   (1003,103,203,3,'2026-09-05'),
   (1004,104,204,4,'2026-09-07');
   
   select * from customers;
   select * from products;
   select * from orders;
   
   -- there table joins--
   -- total purchase city wise
   select c.city,sum(p.price) as 'total amount'
   from customers c
   inner join orders o on c.customer_id=o.customer_id
   inner join products p on p.product_id=o.product_id
   group by c.city order by sum(p.price) desc;
   
   
   -- top 2 
    select c.city,sum(p.price) as 'total amount'
   from customers c
   inner join orders o on c.customer_id=o.customer_id
   inner join products p on p.product_id=o.product_id
   group by c.city order by sum(p.price) desc limit 2;
   
   -- last 2 city purchase wise 
   select c.city,sum(p.price) as 'total amount'
   from customers c
   inner join orders o on c.customer_id=o.customer_id
   inner join products p on p.product_id=o.product_id
   group by c.city order by sum(p.price) asc limit 2;
   
   
   select p.category,dayname(o.order_date),c.city,sum(p.price)
   from customers c
   inner join orders o on c.customer_id=o.customer_id
   inner join products p on p.product_id=o.product_id
   group by p.category,dayname(o.order_date),c.city order by sum(p.price)desc;
   
   select 
   p.product_name,
   c.city,	
   c.customer_id,
   count(o.order_id)as order_count
   from customers c 
   inner join orders o on c.customer_id=o.customer_id
   inner join products p on o.product_id=p.product_id
   group by c.customer_id,c.city,p.product_name;