-- creating database baics
Create database basics;

-- Using basics database
Use basics;

-- Creating Employee table 
Create table employee(
e_id int not null, 
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20),
PRIMARY KEY(e_id)
);

-- Insering values into table
insert into employee 
	Values(1, 'Priyanka', 70000, 25, 'female', 'IT');

insert into employee 
	values (2, 'Nikhil', 80000, 26, 'male', 'IT');

insert into employee 
	values (3, 'Sangeetha', 80000, 30, 'female', 'Construction');

insert into employee 
	values (4, 'Erica', 110000, 45, 'female', 'Operations');

insert into employee 
	values (5, 'John', 40000, 28, 'male', 'IT');

insert into employee 
	values (6, 'Max', 95000, 33, 'male', 'Tele communications');

insert into employee 
	values (7, 'Danial', 35000, 41, 'male', 'IT');

insert into employee 
	values (8, 'Chris', 100000, 55, 'male', 'IT');

insert into employee 
	values (9, 'Peter', 20000, 34, 'male', 'Food');

-- Getting data

-- entire data 
select * from employee;

select e_name from employee;

--extracting multiple fields from the table
select e_name, e_age from employee;

-- DISTINCT
select distinct e_gender from employee;

-- WHERE 

select * from employee where e_gender='female';

select * from employee where e_salary>30000;

-- filtering queries with multiple conditions

-- and operator
select * from employee where e_gender='female' and e_salary > 50000;

-- or operator
select * from employee where e_age<25 or e_age >=30;

-- not operator 
select * from employee where not e_dept='Construction'; 

-- like and between operators

-- LIKE is used to extract records where particular pattern is present

-- % and _ operators are used in conjunction with LIKE operator 

-- % --> represents single character 
-- _ --> represents 0, 1 or more characters 

select * from employee where e_age like '2_';

select * from employee where e_name like 'priya%';


-- BETWEEN operator select values between given range
-- Syntax Select * from tbname where e_age between lowerrange and upperranger inclusive of boundaries

Select * from employee where e_age between 20 and 30;

-- Functions in SQL 

-- MIN() gives minimun value in the specified field 

select MIN(e_salary) from employee;

-- MAX() gives maxnimum value in the specifies field

select MAX(e_age) from employee; 

--COUNT() returns number of records which satisfies the specified condition

select COUNT(*) from employee where e_gender='male';
select COUNT(*) from employee where e_gender='female';

-- SUM() retuns total sum of numeric column (If non numeric row is passed as an aurgument, It will give an error)

select SUM(e_salary) from employee;

--AVG() returns avaerage value of numneric column

select AVG(e_age) from employee;

/*
---- STRING functions ----

--LTRIM(str) removes blank spaces on left side of the character expression
-- LOWER(str) Converts all characters to lower case characters
-- UPPER(str) converts all characters to upper case characters
-- REVERSE(str) reverse all characters in a string
-- SUBSTRING(str, startIndex, lengthofSubstr) gives a sub string from given string

*/

select '                  happy';
select LTRIM('                  happy');

select LOWER('HAPPY');

select UPPER('happy');

select REVERSE('happy');

select SUBSTRING('Hello World', 6, 6);

/*

ORDER BY is used to sort data in ascnding order or descending order
Syntax: SELECT cloumn_list from tbname ORDER BY col1, col2 .... ASC|DESC

By default order is ascending 

*/

select * from employee ORDER BY e_salary;
select * from employee ORDER BY e_salary DESC;


/*
TOP clause is used to retrieve top N records (acts as LIMIT).
Syntax: SELECT TOP X col_list from tbname;
*/

select TOP 2 * from employee;

-- Using TOP and ORDER BY together

-- fetch 3 oldest employees of the company

SELECT TOP 3 * from employee ORDER BY e_age DESC;


/*
GROUP BY is used to get aggregated result with respect to a group

*/
 -- get the sum of salaries from each individual department 

select SUM(e_salary), e_dept from employee GROUP BY e_dept;

-- get average salary of male and females

select AVG(e_salary), e_gender from employee GROUP BY e_gender;

/*
HAVING clause is used in combination with GROUP BY to impose conditions on groups

Syntax: Must follow GROUP BY and should preceed ORDER BY clause if used

SELECT col_names from tbname where condition GROUP BY col_name HAVING condition ORDER BY col 

*/
select AVG(e_salary) as salary,e_dept as department from employee 
group by e_dept
having avg(e_salary)> 100000;


-- UPDATE values in table 

Update employee SET e_dept = 'Operations' where e_id=2;

-- DELETE statement is used to delete existing records in a table 
-- Syntax: DELETE from tbname where condition;

delete from employee where e_name='Chris';

-- TRUNCATE statement deletes all the data in the table, structure of the table is intact
-- Syntax: TRUNCATE TABLE tbname;

truncate table employee;

/*
ALTER TABLE is used to add, delete or modify columns in existing table
Syntax: ALTER TABLE tb_name
		add col_name datatype;

		ALTER TABLE tb_name
		DELETE COLUMN col_name datatype;
*/

ALTER TABLE employee
	ADD e_dob date;

ALTER TABLE employee
	DROP COLUMN e_dob;

create table employee_source(
e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20)

PRIMARY KEY(e_id)
);

create table employee_target(
e_id int not null,
e_name varchar(20),
e_salary int,
e_age int,
e_gender varchar(20),
e_dept varchar(20)

PRIMARY KEY(e_id)
);

insert into employee_source values (1, 'Sam', 93000, 40, 'Male', 'Operations');
insert into employee_source values (2, 'Bob', 80000, 21, 'Male', 'Support');
insert into employee_source values (3, 'Anne', 120000, 25, 'Female', 'Analytics');
insert into employee_source values (6, 'Jeff', 60000, 27, 'Male', 'Operations');
insert into employee_source values (7, 'Adam', 55000, 28, 'Male', 'Content');
insert into employee_source values (8, 'Priya', 23000, 37, 'Female', 'Tech');

insert into employee_target values (1, 'Sam', 95000, 45, 'Male', 'Operations');
insert into employee_target values (2, 'Bob', 80000, 21, 'Male', 'Support');
insert into employee_target values (3, 'Anne', 125000, 25, 'Female', 'Analytics');
insert into employee_target values (4, 'Jeff', 63000, 29, 'Male', 'Analytics');
insert into employee_target values (5, 'Adam', 59000, 28, 'Male', 'Operations');
insert into employee_target values (6, 'Priya', 29000, 36, 'Female', 'Sales');

select * from employee_source;
select * from employee_target;

/*
MERGE is the combination of INSERT, UPDATE and DELETE statements in one statement
For merge we require 2 tables, Source and target table

Source table contains all the changes that needs to be applied on target table 
Target table is the table upon which we apply all the changes 

Merge statemnets combines source and target table using common coloumn in both the tables

Syntax: MERGE Target_table as T
		USING Source_table as S
			on[JOIN Condition]
		WHEN MATCHED
			THEN[Update statement]
		WHEN NOT MATCHED
			THEN[insert statement]
		WHEN NOT MATCHED BY SOURCE
			THEN[Delete Statement];

*/

MERGE employee_target as T
	USING employee_source as S
	ON T.e_id = S.e_id
WHEN MATCHED
	THEN update set T.e_salary = S.e_salary, T.e_age = S.e_age
WHEN NOT MATCHED
	THEN insert (e_id, e_name, e_age, e_gender, e_dept)
		values(S.e_id, S.e_name, S.e_age, S.e_gender, S.e_dept)
WHEN NOT MATCHED BY SOURCE
	THEN delete;

