use basics;

GO;
/*
View is a virtual table based on result of an sql statement
Syntax: CREATE VIEW View_name AS
		SELECT COL_1, COL_2,..
		FROM tb_name
		WHERE condition;	
For example, if we want to perform multpile operations on female employees, we can create a view for female employees and perform operations
*/

CREATE VIEW female_employees AS select * from employee where e_gender='female';

-- To get the Virtual view created, select col_names from view_name

-- drop a view 
--Syntax: DROP VIEW name_of_the_view;
--drop view female_employees;
