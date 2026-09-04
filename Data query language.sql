use bankingdb;

Create table student(
   stud_id varchar(50), stud_name varchar(50), address varchar(50),
   city varchar(50)
   );
   
   insert into student values(1,'shashank','RJPM','Lucknow');
   
   alter table student add column DOB date;
   
   desc student;
   
   alter table student modify column stud_name varchar(100);

-- drop column 'city'--
-- syntax: alter table <table_name> drop column <column_name>;
   alter table student drop column city;
   
   Create table if not exists teacher(
      teacher_id int(50), teacher_name varchar(100), hiring_date date,
      age int, salary int(100)
      );
      
      desc teacher;
      
      insert into teacher values(1,'kamal','2021-08-09',28,50000),
      (2,'reshma','2020-12-12',34,67000),(3,'ujwal','2023-11-23',25,15000),
      (4,'jay','2025-11-01',30,56000);
      
      select *from teacher;
      
      select *from student;
      
      desc student;
      
      alter table student add constraint pk_stud_id primary key(stud_id);
      
      -- rename column --
      -- syntax: alter table <table_name> rename column <old column_name> to <new column_name>;
      alter table student rename column stud_name to name; 
      
      insert into student values('s01','gaurav','dharampeth','2005-10-10'),
      ('s02','kumal','reshimbag','1999-10-08'),('s03','farhan','mominpura','1997-12-10'),('s04','vaibhav','vayusena nagar','2000-02-14'),
      ('s05','vishal','pratap nagar','2009-08-07'),('s06','kumar','ravi nagar','2004-10-22');
      
      select * from student;
      
      -- how to count total records of table--
      -- alias declaration--
      select count(*) as 'Number of students'
      from student;
      
      select DOB,month(DOB),monthname(DOB),dayname(DOB),dayofweek(DOB),curdate() as 'Today Date',
      datediff(curdate(),DOB) as 'number of day till today',year(datediff(curdate(),DOB))as 'year'
      from student;
      
	select *from employee;
      
	select city,count(*)as 'Number of employee'
    FROM employee
    group by city
    order by city desc;
