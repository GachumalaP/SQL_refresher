-- use basics;

/*
Stored procedure is a prepared sql code which can be saved or reused
Syntax: CREATE PROCEDURE procedure_name
		AS
		sql_statement
		GO;

Usage: EXEC procedure_name;
*/

Create procedure employee_names
As
select e_name from employee
Go;

exec employee_names;

create procedure employee_details
As
select * from employee
Go;

exec employee_details;

/*
Stored procedures with parameters 
Syntax: CREATE PROCEDURE procedure_name
		@param1 datatype, @params2 datatype...
		AS
		sql_statement
		GO;
*/

create procedure employee_gender @gender varchar(20)
As
select * from employee where e_gender = @gender
go;

exec employee_gender @gender = 'female';