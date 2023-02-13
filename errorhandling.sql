/*
Exception: An error condition during a program execution is an exeption

The mechanism for solving such exception is exception handling

SQL provides try & catch blocks for exception handling

Syntax: BEGIN TRY
		sql statements
		END TRY
		BEGIN CATCH 
		print error or Rollback transaction
		END CATCH
*/

declare @value1 int;
declare @value2 int;

BEGIN TRY 
set @value1 = 1;
set @value2 = @value1/0;
END TRY
BEGIN CATCH
print error_message()
END CATCH;

-- User defined error messages

use basics;

select * from employee;

begin try 
select e_salary + e_name from employee
end try
begin catch
print 'Cannot add numerical value with string value'
end catch
