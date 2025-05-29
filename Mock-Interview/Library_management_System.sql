-- Create a database
-- Database Name ---> Library Management System
create database Library_Management_System;

-- Select the database
use Library_Management_System;

-- Create (5-10) tables in the databases having 5 ttributes(minimum)
/*
Table.1- Libraries(Library_id,Name,Address,Incharge,Contact)
Table.2- Staff(Staff_id,Name,Age,Gender,Contact)
Table.3- Students(Student_id,Name,Age,Gender,Contact,Address)
Table.4- Books(Book_id,Name,Type,Subtype,Price,Issued)
Table.5- Issued_Books(Issued_id,Book_id,Name,Issuer_name,Student,Duration)
Table.6- Returned_Books(Returned_id,Book_id,Name,Returned_Person,Student,Date)
Table.7- Fees(Fees_id,Library_id,Duration,Access,Restrictions)
*/

-- Create Table.1-Libraries---------------------------------------------------------------------
create table Libraries(
Library_id int primary key,
Name varchar(50),
Address text,
Incharge varchar(50),
Contact varchar(10)
);

insert into Libraries 
values
(1,'AB','A123','Omkar','9876543210'),
(2,'BC','B123','Prasleen','9876543211'),
(3,'AC','C123','Mansi','9876543212'),
(4,'CD','D123','Divya','9876543213'),
(5,'AD','E123','Rajat','9876543214'),
(6,'AS','F123','Rajas','9876543215'),
(7,'AW','G123','Raj','9876543216'),
(8,'AQ','H123','Omar','9876543217'),
(9,'AT','I123','Om','9876543218'),
(10,'AR','J123','Harsh','9876543219');

-- To display table data
select * from Libraries;

-- To remove complete records from table
truncate table Libraries;

-- To remove complete records and attributes from table
drop table Libraries;


-- Create Table.2-Staff-------------------------------------------------------------------------
create table Staff(
Staff_id int primary key,
Name varchar(50),
Age int,
Gender varchar(10),
Contact varchar(10)
);
insert into Staff
values
(1,'Raj1',20,'Male','9876123450'),
(2,'Raj2',22,'Male','9876123451'),
(3,'Raj3',21,'Male','9876123452'),
(4,'Rutuja',19,'Female','9876123453'),
(5,'Vivek',24,'Male','9876123454'),
(6,'Saurabh',28,'Male','9876123455'),
(7,'Sneha',21,'Female','9876123456'),
(8,'Divya',22,'Female','9876123457'),
(9,'Harshit',20,'Male','9876123458'),
(10,'Mansi',19,'Female','9876123459');

-- To display table data
select * from Staff;

-- To remove complete records from table
truncate table Staff;

-- To remove complete records and attributes from table
drop table Staff;

-- Create Table.3-Students----------------------------------------------------------------------
create table Students(
Student_id int primary key,
Name varchar(50),
Age int,
Gender varchar(10),
Contact varchar(10),
Address text
);

insert into Students
values
(101,'om',25,'Male','9999988888','abc'),
(102,'om1',21,'Male','9999988887','def'),
(103,'payal',20,'Female','9999988886','ghi'),
(104,'om3',18,'Male','9999988885','jkl'),
(105,'om4',19,'Male','9999988884','mno'),
(106,'snehal',20,'Female','9999988883','pqr'),
(107,'dipti',24,'Female','9999988882','stu'),
(108,'ditya',23,'Female','9999988881','vwx'),
(109,'om8',20,'Male','9999988880','yz'),
(110,'varsha',25,'Female','9999988889','az');

-- To display table data
select * from Students;

-- To remove complete records from table
truncate table Students;

-- To remove complete records and attributes from table
drop table Students;

-- Create Table.4-Books-------------------------------------------------------------------------
create table Books(
Book_id int primary key,
Name varchar(50),
Type varchar(50),
Subtype text,
Price int,
Issued date
);

insert into Books 
values
(1, 'Algorithms', 'Education', 'Computer Science', 800, '2025-05-01'),
(2, 'The Great Gatsby', 'Fiction', 'Novel', 300, '2025-05-02'),
(3, 'Clean Code', 'Education', 'Programming', 650, '2025-05-03'),
(4, '1984', 'Fiction', 'Dystopian', 250, '2025-05-04'),
(5, 'A Brief History of Time', 'Science', 'Physics', 500, '2025-05-05'),
(6, 'Sapiens', 'Non-fiction', 'History', 450, '2025-05-06'),
(7, 'Atomic Habits', 'Self-help', 'Productivity', 400, '2025-05-07'),
(8, 'The Alchemist', 'Fiction', 'Philosophy', 350, '2025-05-08'),
(9, 'Python Crash Course', 'Education', 'Programming', 600, '2025-05-09'),
(10, 'To Kill a Mockingbird', 'Fiction', 'Classic', 320, '2025-05-10');

-- To display table data
select * from Books;

-- To remove complete records from table
truncate table Books;

-- To remove complete records and attributes from table
drop table Books;

-- Create Table.5-Issued_Books------------------------------------------------------------------
create table Issued_Books(
Issued_id int primary key,
Book_id int,
Name varchar(50),
Issuer_name varchar(50),
Student varchar(50),
Duration varchar(20),
foreign key (Book_id) references Books(Book_id)
);

insert into Issued_Books values
(1, 1, 'Introduction to Algorithms', 'Raj1', 'om', '15 days'),
(2, 2, 'The Great Gatsby', 'Raj2', 'payal', '10 days'),
(3, 3, 'Clean Code', 'Rutuja', 'snehal', '20 days'),
(4, 4, '1984', 'Vivek', 'dipti', '7 days'),
(5, 5, 'A Brief History of Time', 'Saurabh', 'om1', '30 days'),
(6, 6, 'Sapiens', 'Sneha', 'om3', '10 days'),
(7, 7, 'Atomic Habits', 'Divya', 'om4', '12 days'),
(8, 8, 'The Alchemist', 'Harshit', 'varsha', '25 days'),
(9, 9, 'Python Crash Course', 'Mansi', 'ditya', '18 days'),
(10, 10, 'To Kill a Mockingbird', 'Raj3', 'om8', '14 days');

-- To display table data
select * from Issued_Books;

-- To remove complete records from table
truncate table Issued_Books;

-- To remove complete records and attributes from table
drop table Issued_Books;

-- Create Table.6-Returned_Books----------------------------------------------------------------
create table Returned_Books(
Returned_id int primary key,
Book_id int,
Name varchar(50),
Returned_Person varchar(50),
Student varchar(50),
Date date,
foreign key (Book_id) references Books(Book_id)
);

insert into Returned_Books values
(1, 1, 'Introduction to Algorithms', 'Raj1', 'om', '2025-05-16'),
(2, 2, 'The Great Gatsby', 'Raj2', 'payal', '2025-05-17'),
(3, 3, 'Clean Code', 'Rutuja', 'snehal', '2025-05-18'),
(4, 4, '1984', 'Vivek', 'dipti', '2025-05-19'),
(5, 5, 'A Brief History of Time', 'Saurabh', 'om1', '2025-05-20'),
(6, 6, 'Sapiens', 'Sneha', 'om3', '2025-05-21'),
(7, 7, 'Atomic Habits', 'Divya', 'om4', '2025-05-22'),
(8, 8, 'The Alchemist', 'Harshit', 'varsha', '2025-05-23'),
(9, 9, 'Python Crash Course', 'Mansi', 'ditya', '2025-05-24'),
(10, 10, 'To Kill a Mockingbird', 'Raj3', 'om8', '2025-05-25');


-- To display table data
select * from Returned_Books;

-- To remove complete records from table
truncate table Returned_Books;

-- To remove complete records and attributes from table
drop table Returned_Books;

-- Create Table.7-Fees--------------------------------------------------------------------------
create table Fees(
Fees_id int primary key,
Library_id int,
Fees int,
Duration varchar(50),
Access varchar(50),
Restrictions varchar(50),
foreign key (Library_id) references Libraries(Library_id)
);

insert into Fees 
values
(1, 1,100 ,'Monthly', 'All Sections', 'No Loud Talking'),
(2, 2,500 ,'Quarterly', 'Research Section', 'Valid ID Required'),
(3, 3,1200 ,'Yearly', 'All', 'No Eating'),
(4, 4,50 ,'Monthly', 'General Access', 'Wear Uniform'),
(5, 5, 700,'Yearly', 'Digital Section', 'Keep Silence'),
(6, 6, 90,'Monthly', 'Science Area', 'No Phone Calls'),
(7, 7, 250,'Quarterly', 'Open Study', 'No Entry After 5 PM'),
(8, 8, 750,'Yearly', 'Archives', 'Gloves Required'),
(9, 9, 650,'Monthly', 'Fiction Area', 'Membership Required'),
(10, 10, 100,'Yearly', 'All Sections', 'Strict Supervision');

-- To display table data
select * from Fees;

-- To remove complete records from table
truncate table Fees;

-- To remove complete records and attributes from table
drop table Fees;