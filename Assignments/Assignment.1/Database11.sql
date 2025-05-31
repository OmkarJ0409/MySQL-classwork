/*
This file consists of a database named JOB_RECRUITMENT having tables Jobs, Managers, HRs, Users, and Selected_Recruits.

Table.1 - JOBS TABLE - (Stores details of job positions available)
        Attributes: Job_id, Job_name, Job_Description, Available_Positions, Salary

Table.2 - MANAGERS TABLE - (Stores details of managers conducting interviews)
        Attributes: Manager_id, Manager_name, Contact, Interviews, Date

Table.3 - HRS TABLE - (Stores details of HR personnel conducting interviews)
        Attributes: Hr_id, Hr_name, Contact, Interviews, Date

Table.4 - USERS TABLE - (Stores details of users applying for jobs)
        Attributes: User_id, User_name, Contact, Job_id (FK), Status

Table.5 - SELECTED_RECRUITS TABLE - (Stores details of candidates selected for jobs)
        Attributes: Recruit_id, Recruit_name, Contact, Job_id (FK), Job_Description, Salary

Step-by-step Creation of Job_Recruitment Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Jobs Table + Insert Data  
Step 4: Create Managers Table + Insert Data  
Step 5: Create HRs Table + Insert Data  
Step 6: Create Users Table + Insert Data  
Step 7: Create Selected_Recruits Table + Insert Data  
Step 8: View Data  
*/

-- Step 1: Create the Database
create database Job_Recruitment;

-- Step 2: Use the Database
use Job_Recruitment;

-- Step 3: Create Jobs Table ----------------------------------------------------------
create table Jobs(
    Job_id int primary key,
    Job_name varchar(20),
    Job_Description text,
    Available_Positions int,
    Salary int
);

insert into Jobs values
(1, 'Developer', 'Develops software applications', 5, 70000),
(2, 'Tester', 'Tests software for bugs', 3, 50000),
(3, 'Manager', 'Manages team and projects', 2, 90000),
(4, 'Designer', 'Designs UI/UX elements', 4, 60000),
(5, 'HR Executive', 'Handles recruitment', 3, 55000),
(6, 'Data Analyst', 'Analyzes data for insights', 2, 65000),
(7, 'System Admin', 'Maintains IT systems', 1, 60000),
(8, 'Technical Writer', 'Writes documentation', 2, 45000),
(9, 'Support Engineer', 'Provides tech support', 3, 50000),
(10, 'Product Owner', 'Owns product backlog', 1, 95000);

-- To display table data
select * from Jobs;

-- To remove complete records from table
truncate table Jobs;

-- To remove complete records and attributes from table
drop table Jobs;


-- Step 4: Create Managers Table ----------------------------------------------------------
create table Managers(
    Manager_id int primary key,
    Manager_name varchar(50),
    Contact varchar(10),
    Interviews int,
    Date date
);

insert into Managers values
(1, 'Alice', '9876543210', 4, '2024-01-15'),
(2, 'Bob', '9876543211', 5, '2024-01-16'),
(3, 'Charlie', '9876543212', 2, '2024-01-17'),
(4, 'Diana', '9876543213', 3, '2024-01-18'),
(5, 'Ethan', '9876543214', 4, '2024-01-19'),
(6, 'Fiona', '9876543215', 5, '2024-01-20'),
(7, 'George', '9876543216', 2, '2024-01-21'),
(8, 'Helen', '9876543217', 3, '2024-01-22'),
(9, 'Isaac', '9876543218', 4, '2024-01-23'),
(10, 'Jasmine', '9876543219', 1, '2024-01-24');

-- To display table data
select * from Managers;

-- To remove complete records from table
truncate table Managers;

-- To remove complete records and attributes from table
drop table Managers;


-- Step 5: Create HRs Table ----------------------------------------------------------
create table HRs(
    Hr_id int primary key,
    Hr_name varchar(50),
    Contact varchar(10),
    Interviews int,
    Date date
);

insert into HRs values
(1, 'Karan', '9999980001', 3, '2024-01-15'),
(2, 'Leena', '9999980002', 2, '2024-01-16'),
(3, 'Manoj', '9999980003', 5, '2024-01-17'),
(4, 'Neha', '9999980004', 3, '2024-01-18'),
(5, 'Omkar', '9999980005', 4, '2024-01-19'),
(6, 'Payal', '9999980006', 1, '2024-01-20'),
(7, 'Ravi', '9999980007', 3, '2024-01-21'),
(8, 'Sneha', '9999980008', 2, '2024-01-22'),
(9, 'Tina', '9999980009', 4, '2024-01-23'),
(10, 'Uday', '9999980010', 5, '2024-01-24');

-- To display table data
select * from HRs;

-- To remove complete records from table
truncate table HRs;

-- To remove complete records and attributes from table
drop table HRs;


-- Step 6: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Contact varchar(10),
    Job_id int,
    Status varchar(10),
    foreign key (Job_id) references Jobs(Job_id)
);

insert into Users values
(1, 'Varun', '9000000001', 1, 'Pending'),
(2, 'Riya', '9000000002', 2, 'Pending'),
(3, 'Sahil', '9000000003', 3, 'Selected'),
(4, 'Tina', '9000000004', 4, 'Rejected'),
(5, 'Umesh', '9000000005', 5, 'Selected'),
(6, 'Vikas', '9000000006', 6, 'Pending'),
(7, 'Aarti', '9000000007', 7, 'Pending'),
(8, 'Bhavesh', '9000000008', 8, 'Rejected'),
(9, 'Chetna', '9000000009', 9, 'Selected'),
(10, 'Deepak', '9000000010', 10, 'Pending');

-- To display table data
select * from Users;

-- To remove complete records from table
truncate table Users;

-- To remove complete records and attributes from table
drop table Users;


-- Step 7: Create Selected_Recruits Table ----------------------------------------------------------
create table Selected_Recruits(
    Recruit_id int primary key,
    Recruit_name varchar(50),
    Contact varchar(10),
    Job_id int,
    Job_Description text,
    Salary int,
    foreign key (Job_id) references Jobs(Job_id)
);

insert into Selected_Recruits values
(1, 'Sahil', '9000000003', 3, 'Manages daily tasks and teams', 90000),
(2, 'Umesh', '9000000005', 5, 'Oversees recruitment processes', 55000),
(3, 'Chetna', '9000000009', 9, 'Solves support tickets', 50000),
(4, 'Raj', '9000000011', 1, 'Develops backend systems', 70000),
(5, 'Simran', '9000000012', 4, 'Designs web layouts', 60000),
(6, 'Ajay', '9000000013', 6, 'Analyzes business metrics', 65000),
(7, 'Meena', '9000000014', 7, 'Monitors system logs', 60000),
(8, 'Nitin', '9000000015', 2, 'Executes test cases', 50000),
(9, 'Divya', '9000000016', 8, 'Writes user guides', 45000),
(10, 'Om', '9000000017', 10, 'Manages product roadmap', 95000);

-- To display table data
select * from Selected_Recruits;

-- To remove complete records from table
truncate table Selected_Recruits;

-- To remove complete records and attributes from table
drop table Selected_Recruits;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Jobs;
select * from Managers;
select * from HRs;
select * from Users;
select * from Selected_Recruits;