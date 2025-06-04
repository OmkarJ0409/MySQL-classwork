/*
This File consists of a database name COMPANY having tables Managers,Employees,Salary,Devices and Staffs.
    
    Table.1 - MANAGER TABLE - (Stores details about department managers)
			Manager table have given attributes such as :-
				Manager_id,Manager_Name,Department,Contact and Age.
                
	Table.2 - EMPLOYEE TABLE - (Stores employees and links them to their managers)
			Employees table also have 5 attributes that are :-
				Employee_id,Employee_Name,Department,Manager_id  and Contact.
                
	Table.3 - SALARY TABLE (Stores salary for both managers and employees)
			Salary table have 5 attributes that are :-
				Salary_id,Employee_id,Department,Role and Salary.
	
    Table.4 - DEVICES TABLE (Inventory of company devices)
			Device table has 5 attributes :-
				Device_id,Device_type,Device_specs,Device_units and Conditions.
    
    Table.5 - STAFF TABLE (Auxiliary/support staff details (cleaners, guards, etc.))
			Staff table has 5 attributes :-
				Staff_id,Staff_Name,Role,Contact and Age.
      
      
Step-by-step Creation of Company Database :-
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create the Managers Table + Insert Data into Managers Table
Step 4: Create the Employees Table + Insert Data into Employees Table
Step 5: Create the Salary Table + Insert Data into Salary Table
Step 6: Create the Devices Table + Insert Data into Devices Table
Step 7: Create the Staff Table + Insert Data into Staff Table
Step 8: View Data (
	select * from Managers;
	select * from Employees;
	select * from Salary;
	select * from Devices;
	select * from Staff;
	)
*/


-- create a database first
create database company;

-- to work on this database, you need to use it first
-- to execute (ctrl + enter)
use company;

-- Table-1.Managers--------------------------------------------------------------------

create table Managers(								-- Create Managers Table 
Manager_id int primary key,							-- Id of the Manager
Manager_Name varchar(50) not null,					-- Name of Manager
Department varchar(50) not null,					-- Department of Manager
Contact varchar(12),								-- Manager Contact details
Age int												-- Manager Age
);

-- Insert multiple records into a table
insert into Managers
values
(1,'Mangesh mane','Development',9876543210,35),
(2,'Sahil More','Marketing',9876543211,30),
(3,'Ramesh Jadhav','Customer Support',9876543212,28),
(4,'Raj Patil','Research and Analysis',9876543213,45),
(5,'Harsh Patkar','HR',9876543214,25);

-- To display table data
select * from Managers;

-- To remove complete records from table
truncate table Managers;

-- To remove complete records and attributes from table
drop table Managers;


-- Table-2.Employees---------------------------------------------------------------------

create table Employees(								-- Create Employees Table
Employee_id int primary key,						-- Id of the Employees
Employee_Name varchar(50) not null,					-- Employee Name
Department varchar(50) not null,					-- Department of the Employee
Manager_id int,										-- Manager id of that Employee
Contact varchar(12),								-- Employee Contact Details
foreign key (Manager_id) references Managers(Manager_id)
);

-- Insert multiple records into a table
insert into Employees 
values
(101,'Raj kadam','HR',5,1234567890),
(102,'Omkar Jagtap','Development',1,1234567891),
(103,'Mansi Jadhav','Development',1,1234567892),
(104,'Ashish pawar','Customer Support',3,1234567893),
(105,'Manas Kajale','Research and Analysis',4,1234567894);

-- To display table data
select * from Employees;

-- To remove complete records from table
truncate table Employees;

-- To remove complete records and attributes from table
drop table Employees;


-- Table-3.Salary------------------------------------------------------------------------

create table Salary(								-- Create Salary Table
Salary_id int primary key,							-- salary id
id int,												-- id of the employee/ manager
Department varchar(50),								-- The persons Department
Role varchar(50),									-- Their Role
Salary int											-- Salary of that person
);

-- Insert multiple records into a table
insert into Salary
values
(1,1,'Development','Manager',50000),
(2,2,'Marketing','Manager',35000),
(3,3,'Customer Support','Manager',30000),
(4,4,'Research and Analysis','Manager',80000),
(5,5,'HR','Manager',40000),
(6,101,'HR','Employee',20000),
(7,102,'Development','Employee',35000),
(8,103,'Development','Employee',38000),
(9,104,'Customer Support','Employee',18000),
(10,105,'Research and Analysis','Employee',58000);

-- To display table data
select * from Salary;

-- To remove complete records from table
truncate table Salary;

-- To remove complete records and attributes from table
drop table Salary;


-- Table-4.Devices-------------------------------------------------------------------

create table Devices(									-- Create table Devices
Device_id int primary key,								-- Device id of the devices
Device_type varchar(50),								-- Device tpye(ex-mouse ,keyboard,monitor,etc..)
Device_specs text,										-- Device Specifications
Device_units int,										-- Total Devices
Conditions varchar(15)									-- Devices conditions working/not-working
);

-- Insert multiple records into a table
insert into Devices
values
(1,'Monitor','Samsung U28E590DSL',10,'Working'),
(2,'Monitor','BenQ PD2700U',2,'Not-Working'),
(3,'Keyboard','Logitech K780 Multi-Device Wireless Keyboard',10,'Working'),
(4,'Keyboard','Logitech K780 Multi-Device Wireless Keyboard',1,'Not-Working'),
(5,'Mouse','Dell Km117 Wireless Keyboard Mouse',7,'Working'),
(6,'Mouse','Logitech MX Master Wireless Mouse',5,'Working');

-- To display table data
select * from Devices;

-- To remove complete records from table
truncate table Devices;

-- To remove complete records and attributes from table
drop table Devices;


-- Table-5.Staff----------------------------------------------------------------------------------

create table Staff(										-- Create table Staff
Staff_id int primary key,								-- staff id
Staff_Name varchar(50),									-- staff name
Role varchar(50),										-- Staff role type
Contact varchar(20),									-- Staff contact Details
Age int													-- Staff age
);

-- Insert multiple records into a table
insert into Staff 
values
(1001,'Ramesh yadav','Cleaning staff','9876543210',30),
(1002,'Mirabai yadav','Cleaning staff','9876543211',26),
(1003,'Varsha patil','Cleaning staff','9876543212',29),
(1004,'Manoj Pawar','Guard','9876543213',40),
(1005,'Ram Singh','Guard','9876543214',35);

-- To display table data
select * from Staff;

-- To remove complete records from table
truncate table Staff;

-- To remove complete records and attributes from table
drop table Staff;