use basics;
/*
There are 2 types of user defined functions 

-- Scalar Valued Functions
return type is Scalar(int, date, varchar)
Syntax: CREATE FUNCTION fname(@param datatype, @param datatype ...)
		RETURNS return_datatype
		AS
		BEGIN 
		 -- function body 
		RETURN value
		END
*/

-- Scalar function 
create function add_sum(@a int, @b int)
returns int
as
begin
	declare @result int
	set @result = @a + @b
return @result
end;

select dbo.add_sum(2,3);

select * from employee;
/*
-- Table Valued Functions
return table as result
Syntax: CREATE FUNCTION fname(@param datatype, @param datatype...)
		RETURNS table 
		AS
		RETURN(select col_list from tb_name where condition);
there will be no begin and end values 
*/
-- table valued function
create function select_gender(@gender as varchar(20))
returns table 
as 
return (select * from employee where e_gender = @gender); 

 -- we are getting all the records from the table which is returned by select_gender function

select * from dbo.select_gender('male');