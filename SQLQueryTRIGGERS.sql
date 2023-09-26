create table EmployeeTrack
(
id int primary key identity(1,1),
description varchar(255)
)

--CREATE TRIGGER--
create trigger tr_Employee
on Employee after insert
as begin
declare @id int
declare @name varchar(20)
declare @email varchar(30)
select @id=id,@name=name,@email=email from inserted
insert into EmployeeTrack values('new record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' added')
end
insert into employee values(16,'Aditya','aditya@gmail.com',24,40000.00,'Nanded',140)

select * from Employee
select * from EmployeeTrack

--DELETE TRIGGER--
Create trigger tr_Employee_delete
on Employee after delete
as begin
declare @id int
declare @name varchar(20)
declare @email varchar(30)
select @id=id,@name=name,@email=email from deleted
insert into EmployeeTrack values('record with details'+cast(@id as varchar)+' name'+
@name+' email '+@email+' date '+ cast( GETDATE() as varchar(20))+' removed')
end
delete from employee where id =16

select * from EmployeeTrack



