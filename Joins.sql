Use basics;

create table department(
d_id int not null,
d_name varchar(20),
d_location varchar(20),
PRIMARY KEY(d_id)
);

insert into department values(1, 'IT', 'Ontario');
insert into department values(2, 'Construction', 'British Columbia');
insert into department values(3, 'Operations', 'Calgary');
insert into department values(4, 'Finance', 'Texas');
insert into department values(5, 'Food', 'Austin');
insert into department values(7, 'Food', 'New York');

select * from employee;
select * from department;

-- Inner join 
-- Retrieves all records that have matching values in both the tables. Also known as Simple join
-- Syntax: SELECT col_names from tb_name1 INNER JOIN tb_name2 on tb_name1.col_x = tb_name2.col_y

select * from employee
	Inner join department
	on employee.e_dept = department.d_name;

-- Left join
-- Retrieves all the records from left table and matched records from right table
-- Syntax: Select col_names from tb_name1 left join tb_name2 on tb_name1.col_x = tb_name2.col_y

select * from employee 
	left join department 
	on employee.e_dept = department.d_name;

-- Right join
-- Retrieves all the records from right table and matched records from left table
-- Syntax: Select col_names from tb_name1 right join tb_name2 on tb_name1.col_x = tb_name2.col_y

select * from employee 
	right join department
	on employee.e_dept = department.d_name;

-- full join
-- Retrieves all records from both tables
-- Syntax: Select col_names from tb_name1 full join tb_name2 on tb_name1.col_x = tb_name2.col_y

select * from employee 
	full join department
	on employee.e_dept = department.d_name;


-- UPDATE using join
-- Query statement is change the age of the employee whose depatment is IT and location is New York
update employee 
	set e_age = e_age+10
	from employee
	join department
	on employee.e_dept = department.d_name
	where department.d_location = 'New York' and department.d_name = 'Food';

-- Delete using Join

delete employee 
	from employee 
	join department
	on employee.e_dept = department.d_name
	where department.d_location = 'New York';
