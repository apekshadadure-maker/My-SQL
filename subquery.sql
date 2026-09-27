use shoppingdb;

drop table if exists users;
create table users(
user_id int primary key,
username varchar(50),
country varchar(50),
followers int
);

create table posts(
post_id int primary key,
user_id int,
post_text varchar(255),
foreign key (user_id) references users(user_id)
);

insert into users 
(user_id, username, country, followers)
values 
(1, 'rahul','india', 800000),(2,'paiya', 'india', 600000),(3,'amit','india',300000),(4,'sneha','uas', 900000),
(5,'john','usa', 700000),(6,'emma','usa', 400000),(7,'rohan','uk', 200000),(8,'sophia','uk',100000);

insert into posts
(post_id,user_id,post_text)
values 
(101,1,'learning sql'),(102,1,'learning python'),(103,2,'data science'),(104,4,'machine learning'),
(105,4,'ai tutorl'),(106,5,'power bi'),(107,7,'my first post');

select * from users;

select * from posts;

select username,user_id
from users u
where exists(
 select 1
 from posts p
 where p.user_id=u.user_id
);

 -- type-3
 ##correlated subquery : a correleted subquery references a column from the outer query and 
 ##is evaluated for each outer row
 
 -- Ques: find users whose follewers are greater than their country's average
 
 select * from users;
 
 select country,avg(followers)
 from users
 group by country order by avg(followers) desc;
 
  select
  u1.username,
  u1.country,
  u1.followers
  from users u1
  where u1.followers<(
  select avg(u2.followers)
  from users u2
  where u2.country=u1.country
  );
  
  select
  u1.username,
  u1.country,
  u1.followers
  from users u1
  where u1.followers>(
  select avg(u2.followers)
  from users u2
  where u2.country=u1.country
  );
  
  -- Ques: find users above their country average
  select 
   u.username,
   u.country,
   u.followers
   from users u
   where u.followers>(
   select avg(x.followers)
   from users x
   where x.country=u.country
   );
 
 ##subquery in from 
/*
a subquery  inside from is called a
-- 1) derived table 2)table subquery 3)inline view
 
 -- it behaves like the subquerytable an dmust have a line in mysql
 */
 
   select 
    country,
    avg(followers)
    from users
    group by country;
    
select 
country_data.country,
country_data.avg_followers
from(
select
country,
avg(followers)as avg_followers
from users
group by country
)as country_data
where country_data.avg_followers>500000;

select* 
from(
select 
country,
count(user_id)as total_users,
avg(followers)as avg_followers
from users
group by country
)as country_summary where country in ('usa','india');

##derived table with where clause
select* 
from(
select 
country,
avg(followers)as avg_followers
from users
group by country
)as country_data 
where avg_followers>500000;

##subquery in where clause
-- subquery in where clause are commonly used for filtering
select distinct user_id from posts;

-- Ques.1.find user who have posts

select user_id,username
from users
where user_id in(
select distinct user_id from posts);

-- Ques.2.find users without posts
select username
from users 
where user_id not in(
select user_id
from posts
);

#nested subquery : a subquery can cantain another subquery.

select username, followers
from users 
where followers>(
select avg(followers)
from users
where country = ( 
select country
from users
where username='rahul'
));
