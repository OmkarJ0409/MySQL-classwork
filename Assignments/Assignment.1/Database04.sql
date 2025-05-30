/*
This file consists of a database named SMART_CITY having tables Buildings, Apartments, Association, Security_Guard, and Stores.

Table.1 - BUILDINGS TABLE - (Stores building society details)
        Attributes: Building_id, Building_President, Contact, Apartments, Floors

Table.2 - APARTMENTS TABLE - (Stores individual apartment details)
        Attributes: Apartment_id, Building_id, Owner_name, Current_Resident, Contact

Table.3 - ASSOCIATION TABLE - (Stores association details of buildings)
        Attributes: Association_id, Building_id, members_name, contact, Meeting_Timing

Table.4 - SECURITY_GUARD TABLE - (Stores information of security personnel)
        Attributes: Guard_id, Guard_name, contact, Shift, Job_type

Table.5 - STORES TABLE - (Stores details of local stores within city)
        Attributes: Store_id, Store_name, Store_Owner_name, Contact, Open_Hours

Step-by-step Creation of SMART_CITY Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Buildings Table + Insert Data
Step 4: Create Apartments Table + Insert Data
Step 5: Create Association Table + Insert Data
Step 6: Create Security_Guard Table + Insert Data
Step 7: Create Stores Table + Insert Data
Step 8: View Data
*/

-- Step 1: Create the Database
create database Smart_City;

-- Step 2: Use the database
use Smart_City;

-- Step 3: Create Buildings Table ----------------------------------------------------------
create table Buildings(
    Building_id int primary key,
    Building_President varchar(50),
    Contact varchar(10),
    Apartments varchar(20),
    Floors varchar(20)
);

insert into Buildings values
(1, 'Ramesh Shetty', '9876543210', 'A1-A10', '10'),
(2, 'Sneha Mehta', '9123456789', 'B1-B8', '8'),
(3, 'Amit Singh', '9012345678', 'C1-C12', '12'),
(4, 'Kavita Patel', '9988776655', 'D1-D10', '10'),
(5, 'Suresh Yadav', '8877665544', 'E1-E9', '9'),
(6, 'Nikita Sharma', '9765432109', 'F1-F6', '6'),
(7, 'Vikram Rao', '9654321098', 'G1-G11', '11'),
(8, 'Anjali Deshmukh', '9543210987', 'H1-H7', '7'),
(9, 'Harish Nair', '9432109876', 'I1-I8', '8'),
(10, 'Neha Kulkarni', '9321098765', 'J1-J10', '10');

-- To display table data
select * from Buildings;

-- To remove complete records from table
truncate table Buildings;

-- To remove complete records and attributes from table
drop table Buildings;


-- Step 4: Create Apartments Table ----------------------------------------------------------
create table Apartments(
    Apartment_id int primary key,
    Building_id int,
    Owner_name varchar(50),
    Current_Resident varchar(50),
    Contact varchar(10),
    foreign key (Building_id) references Buildings(Building_id)
);

insert into Apartments values
(101, 1, 'Sunil Desai', 'Anil Desai', '9876543211'),
(102, 1, 'Meena Rao', 'Priya Rao', '9876543212'),
(103, 2, 'Alok Mehta', 'Alok Mehta', '9123456790'),
(104, 3, 'Bhavna Shah', 'Kunal Shah', '9012345679'),
(105, 4, 'Sanjay Menon', 'Sanjay Menon', '9988776656'),
(106, 5, 'Leena Gupta', 'Asha Gupta', '8877665545'),
(107, 6, 'Tushar Jain', 'Nidhi Jain', '9765432110'),
(108, 7, 'Rajeev Nair', 'Rajeev Nair', '9654321099'),
(109, 8, 'Aarti Joshi', 'Aarti Joshi', '9543210988'),
(110, 9, 'Devendra Patil', 'Rohit Patil', '9432109877');

-- To display table data
select * from Apartments;

-- To remove complete records from table
truncate table Apartments;

-- To remove complete records and attributes from table
drop table Apartments;


-- Step 5: Create Association Table ----------------------------------------------------------
create table Association(
    Association_id int primary key,
    Building_id int,
    members_name varchar(50),
    contact varchar(10),
    Meeting_Timing varchar(50),
    foreign key (Building_id) references Buildings(Building_id)
);

insert into Association values
(201, 1, 'Vinod Shetty', '9876543213', '1st Sunday, 10 AM'),
(202, 2, 'Snehal Mehta', '9123456791', '2nd Saturday, 5 PM'),
(203, 3, 'Anita Singh', '9012345680', '1st Monday, 6 PM'),
(204, 4, 'Dilip Patel', '9988776657', 'Last Sunday, 11 AM'),
(205, 5, 'Ruchi Yadav', '8877665546', '3rd Friday, 4 PM'),
(206, 6, 'Ajay Sharma', '9765432111', '2nd Sunday, 9 AM'),
(207, 7, 'Mona Rao', '9654321100', '1st Saturday, 10 AM'),
(208, 8, 'Preeti Deshmukh', '9543210989', '3rd Tuesday, 6 PM'),
(209, 9, 'Nikhil Nair', '9432109878', 'Last Friday, 5 PM'),
(210, 10, 'Kiran Kulkarni', '9321098766', '2nd Wednesday, 11 AM');

-- To display table data
select * from Association;

-- To remove complete records from table
truncate table Association;

-- To remove complete records and attributes from table
drop table Association;


-- Step 6: Create Security_Guard Table ----------------------------------------------------------
create table Security_Guard(
    Guard_id int primary key,
    Guard_name varchar(50),
    contact varchar(10),
    Shift varchar(20),
    Job_type varchar(20)
);

insert into Security_Guard values
(301, 'Ravi Kumar', '9876543214', 'Day', 'Full-Time'),
(302, 'Sohan Lal', '9123456792', 'Night', 'Part-Time'),
(303, 'Manoj Singh', '9012345681', 'Day', 'Full-Time'),
(304, 'Rakesh Patel', '9988776658', 'Night', 'Full-Time'),
(305, 'Amit Joshi', '8877665547', 'Day', 'Part-Time'),
(306, 'Vinay Sharma', '9765432112', 'Night', 'Full-Time'),
(307, 'Naresh Reddy', '9654321101', 'Day', 'Full-Time'),
(308, 'Deepak Rao', '9543210990', 'Night', 'Part-Time'),
(309, 'Suresh Nair', '9432109879', 'Day', 'Full-Time'),
(310, 'Ajit Kulkarni', '9321098767', 'Night', 'Full-Time');

-- To display table data
select * from Security_Guard;

-- To remove complete records from table
truncate table Security_Guard;

-- To remove complete records and attributes from table
drop table Security_Guard;


-- Step 7: Create Stores Table ----------------------------------------------------------
create table Stores(
    Store_id int primary key,
    Store_name varchar(50),
    Store_Owner_name varchar(50),
    Contact varchar(10),
    Open_Hours varchar(10)
);

insert into Stores values
(401, 'Smart Mart', 'Rina Shah', '9876543215', '9AM-9PM'),
(402, 'Daily Needs', 'Manoj Jain', '9123456793', '8AM-10PM'),
(403, 'Fresh Mart', 'Suresh Kumar', '9012345682', '7AM-11PM'),
(404, 'Green Veggies', 'Nita Mehta', '9988776659', '8AM-8PM'),
(405, 'Tech Zone', 'Rahul Verma', '8877665548', '10AM-8PM'),
(406, 'Book World', 'Sonal Patel', '9765432113', '9AM-7PM'),
(407, 'Fashion Hub', 'Anjali Nair', '9654321102', '11AM-9PM'),
(408, 'Medic Plus', 'Dr. Mehul Shah', '9543210991', '8AM-10PM'),
(409, 'Toy Town', 'Pooja Rao', '9432109880', '10AM-8PM'),
(410, 'Quick Fix', 'Kiran Das', '9321098768', '9AM-9PM');

-- To display table data
select * from Stores;

-- To remove complete records from table
truncate table Stores;

-- To remove complete records and attributes from table
drop table Stores;

-- Step 8: View All Tables ----------------------------------------------------------
select * from Buildings;
select * from Apartments;
select * from Association;
select * from Security_Guard;
select * from Stores;