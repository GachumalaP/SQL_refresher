/*
Temporary tables are created in tempDB and are deleted as soon as the session is terminated
Useful when we want to save data temporarily

Syntax: CREATE TABLE #tb_name();
# -> signifies it's temporary table
*/

create table #student(
s_id int,
s_name varchar(20),
);

select * from #student;

/*
CASE statements helps in multi-way decision making
Syntax: CASE 
		WHEN [condition1] then result1
		WHEN [condition2] then result2
		WHEN [condition3] then result3
		ELSE result
		END;
*/

select * from employee;

select *, grade=
	case
		when e_salary>80000 then 'A'
		when e_salary>70000 then 'B'
		else 'C'
	end
from employee;

/*
iif() an alternative for case statement
Syntax: IFF(condition, tuue, false);
*/

select
IIF(10<20, 'true','false');

select * from employee;

select *, generation = 
	iif(e_age>30, 'Old employee','Young employee')
from employee;