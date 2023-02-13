/*
-- UNION Operator 
-- used to combine the result set of two or more Select statements. We will get no duplicate values 
-- Syntax: select col_list from tb_nname1
		   union
		   select col_list from tb_name2
The number and order of fields should be same in all the select queries
*/

/*
-- UNION ALL
-- used to combine the result set of two or more Select statements. We will all the values including duplicate values 
-- Syntax: select col_list from tb_nname1
		   union all
		   select col_list from tb_name2
The number and order of fields should be same in all the select queries
*/

/*
-- EXCEPT 
-- combines two select statements and returns unique records from left query which are not part of the right query
-- Syntax: select col_list from tb_nname1
		   Except
		   select col_list from tb_name2
The number and order of fields should be same in all the select queries
*/

/*
-- INTERSECT 
-- combines two select statements and returns common records from both the left and right queries of the operator
-- Syntax: select col_list from tb_nname1
		   Intersect
		   select col_list from tb_name2
The number and order of fields should be same in all the select queries
*/
