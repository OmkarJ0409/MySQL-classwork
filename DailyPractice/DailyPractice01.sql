create database Hotel;
use Hotel;
-- -----------------------Table-1.Employees-----------------------------------------------
create table Employees(
Employee_id int primary key,
Employee_name varchar(50),
Age int,
Contact varchar(12),
Job_Role varchar(20)
);

insert into Employees
values
(1,'Omkar',23,'9876543210','Manager'),
(2,'Raj',20,'9876543211','Reception staff'),
(3,'Riya',22,'9876543212','Reception staff'),
(4,'Harshit',30,'9876543213','Cleaning staff'),
(5,'Jatin',35,'9876543214','Guard');

select * from Employees;
-- ------------------------------Table-2.Customers --------------------------------------
create table Customers(
Customer_id int primary key,
Customer_name varchar(50),
Employee_id int,
Contact varchar(12),
Document varchar(30),
Foreign key (Employee_id) references Employees(Employee_id)
);

insert into Customers
values
(101,'Mansi',3,'1234567890','Pan Card'),
(102,'Soumya',2,'1234567891','Adhar Card'),
(103,'Rajas',2,'1234567892','Driving License'),
(104,'Prasleen',2,'1234567893','Pan Card'),
(105,'Divya',3,'1234567894','Driving License');

select * from Customers;
-- --------------------------------------Table-3.CheckIns---------------------------------------------------
create table CheckIns(
Check_in_id int primary key,
Employee_id int,
Customer_id int,
Stay_Duration varchar(50),
Date_Time Date,
Foreign key (Employee_id) references Employees(Employee_id),
Foreign key (Customer_id) references Customers(Customer_id) 
);

insert into CheckIns
values
(01,3,101,'2 Days','2025-01-22'),
(02,2,102,'1 Days 1 Night','2025-01-25'),
(03,2,103,'3 Days 2 Night','2025-02-12'),
(04,2,104,'1 Days','2025-02-01'),
(05,3,105,'10 Days','2025-02-21');

select * from CheckIns;
-- -----------------------------------------Table-4.Rooms-------------------------------
create table Rooms(
Room_id int primary key,
Room_no int,
Floor_no varchar(50),
Room_type varchar(50),
Staff_assigned int,
foreign key (Staff_assigned) references Employees(Employee_id)
);

insert into Rooms
values
(1,201,'2nd Floor','1BHK AC Room',4),
(2,302,'3rd Floor','2BHK AC Room with Balcony',4),
(3,203,'2nd Floor','1BHK NON-AC Room',4),
(4,102,'1st Floor','1BHK AC Room',4),
(5,502,'5th Floor','3BHK AC Room with open terrace',4);

select * from Rooms;

-- ------------------------------------Table-5.Logs---------------------------------
create table Logs(
Log_id int primary key,
Receptionist_id int,
Customer_id int,
Customer_check_in varchar(50),
Customer_check_out varchar(50),
foreign key (Receptionist_id) references Employees(Employee_id),
foreign key (Customer_id) references Customers(Customer_id)
);

insert into Logs
values
(1,2,102,'2025-01-25','2025-01-27'),
(2,3,105,'2025-02-21','2025-03-03'),
(3,3,101,'2025-01-22','2025-01-24'),
(4,2,103,'2025-02-12','2025-02-15'),
(5,2,104,'2025-02-01','2025-02-01');

select * from Logs;

truncate table Logs;
drop table Logs;
