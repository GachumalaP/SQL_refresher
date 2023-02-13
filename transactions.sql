use basics;
/*
-- Transaction is a group of commands that change the data stored in database. 
-- It ensures that either all the commands are excecuted or none of the commands are executed
-- If one of the commands fails, all the data which has been changed will be rolled back 
-- All the commands in the transaction are succesful then the changes are committed

Syntax: BEGIN TRY 
			BEGIN TRANSACTION
				sql commands
		END TRY
		BEGIN CATCH 
			rollback transaction
		END CATCH;

After making a transaction, we can either commit or rollback the changes.

Syntax: ROLLBACK transaction;
Syntax: COMMIT transaction;

Once committed will not be rolled back
*/

select * from employee;

begin transaction 
 update employee set e_age = 25 where e_name = 'Priyanka';
 
commit transaction;

rollback transaction;

begin try
	begin transaction 
		update employee set e_salary = 1000000 where e_gender='female'
		update employee set e_salary = 90000 where e_gender='male'
		commit transaction
		print 'transaction committed'
end try
begin catch 
	rollback transaction
	print 'transaction rolled back'
end catch
go
