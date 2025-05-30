/*
This file consists of a database named PC_USERBENCHMARK having tables Components, Systems, Users, BenchMark_Results, and Component_Reviews.

Table.1 - COMPONENTS TABLE - (Stores hardware component details)
        Attributes: Component_id, Type, Brand, Model, Release_date

Table.2 - SYSTEMS TABLE - (Stores computer system details used by users)
        Attributes: System_id, os_name, Component_id (FK), motherboard_model, Built_Year

Table.3 - USERS TABLE - (Stores user information and their systems)
        Attributes: User_id, User_name, Location, Join_date, System_id (FK)

Table.4 - BENCHMARK_RESULTS TABLE - (Stores benchmark scores for components tested by users)
        Attributes: Result_id, Component_id (FK), User_id (FK), Score, Test_type

Table.5 - COMPONENT_REVIEWS TABLE - (Stores user ratings and reviews for components)
        Attributes: Review_id, User_id (FK), Component_id (FK), rating, Review_date

Step-by-step Creation of PC_UserBenchmark Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Components Table + Insert Data  
Step 4: Create Systems Table + Insert Data  
Step 5: Create Users Table + Insert Data  
Step 6: Create BenchMark_Results Table + Insert Data  
Step 7: Create Component_Reviews Table + Insert Data  
Step 8: View Data  
*/

-- Step 1: Create the Database
create database PC_UserBenchmark;

-- Step 2: Use the Database
use PC_UserBenchmark;

-- Step 3: Create Components Table ----------------------------------------------------------
create table Components(
    Component_id int primary key,
    Type varchar(50),
    Brand varchar(50),
    Model varchar(50),
    Release_date date
);

insert into Components values
(1, 'CPU', 'Intel', 'i7-12700K', '2022-01-15'),
(2, 'GPU', 'NVIDIA', 'RTX 3080', '2021-10-05'),
(3, 'RAM', 'Corsair', 'Vengeance LPX 16GB', '2020-03-22'),
(4, 'SSD', 'Samsung', '970 EVO Plus 1TB', '2020-08-14'),
(5, 'Motherboard', 'ASUS', 'ROG Strix Z690-F', '2022-02-10'),
(6, 'CPU', 'AMD', 'Ryzen 9 5900X', '2021-06-17'),
(7, 'GPU', 'AMD', 'RX 6800 XT', '2021-11-11'),
(8, 'RAM', 'G.SKILL', 'Ripjaws V 32GB', '2022-01-20'),
(9, 'SSD', 'WD', 'Black SN850 1TB', '2021-12-30'),
(10, 'Motherboard', 'MSI', 'B550 Tomahawk', '2021-03-08');

-- To display table data
select * from Components;

-- To remove complete records from table
truncate table Components;

-- To remove complete records and attributes from table
drop table Components;


-- Step 4: Create Systems Table ----------------------------------------------------------
create table Systems(
    System_id int primary key,
    os_name varchar(50),
    Component_id int,
    motherboard_model varchar(50),
    Built_Year year,
    foreign key (Component_id) references Components(Component_id)
);

insert into Systems values
(101, 'Windows 11', 1, 'ASUS Prime Z690-P', 2022),
(102, 'Windows 10', 2, 'MSI MPG Z490', 2021),
(103, 'Ubuntu 22.04', 3, 'Gigabyte B550M DS3H', 2020),
(104, 'Windows 10', 4, 'ASRock B450M Pro4', 2020),
(105, 'Windows 11', 5, 'ASUS ROG Maximus XIII', 2022),
(106, 'Linux Mint 21', 6, 'Gigabyte X570 Aorus Elite', 2021),
(107, 'Windows 11', 7, 'MSI MEG X570 Unify', 2021),
(108, 'Ubuntu 20.04', 8, 'ASRock X570 Phantom', 2020),
(109, 'Windows 10', 9, 'ASUS TUF Gaming B550', 2020),
(110, 'Windows 11', 10, 'MSI MAG B550 Tomahawk', 2022);

-- To display table data
select * from Systems;

-- To remove complete records from table
truncate table Systems;

-- To remove complete records and attributes from table
drop table Systems;


-- Step 5: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Location varchar(50),
    Join_date date,
    System_id int,
    foreign key (System_id) references Systems(System_id)
);

insert into Users values
(1, 'Alice', 'New York', '2022-04-12', 101),
(2, 'Bob', 'Los Angeles', '2021-08-25', 102),
(3, 'Charlie', 'Chicago', '2020-11-03', 103),
(4, 'Diana', 'Houston', '2020-06-15', 104),
(5, 'Ethan', 'Phoenix', '2022-02-10', 105),
(6, 'Fiona', 'Philadelphia', '2021-09-18', 106),
(7, 'George', 'San Diego', '2022-01-22', 107),
(8, 'Hannah', 'Dallas', '2021-03-13', 108),
(9, 'Ian', 'San Jose', '2020-12-01', 109),
(10, 'Julia', 'Austin', '2022-05-08', 110);

-- To display table data
select * from Users;

-- To remove complete records from table
truncate table Users;

-- To remove complete records and attributes from table
drop table Users;


-- Step 6: Create BenchMark_Results Table ----------------------------------------------------------
create table BenchMark_Results(
    Result_id int primary key,
    Component_id int,
    User_id int,
    Score decimal(10,2),
    Test_type varchar(50),
    foreign key (User_id) references Users(User_id),
    foreign key (Component_id) references Components(Component_id)
);

insert into BenchMark_Results values
(1001, 1, 1, 1523.45, 'Cinebench R23'),
(1002, 2, 2, 18922.33, '3DMark Time Spy'),
(1003, 3, 3, 4982.12, 'PassMark'),
(1004, 4, 4, 3120.50, 'CrystalDiskMark'),
(1005, 5, 5, 5623.75, 'AIDA64'),
(1006, 6, 6, 1610.20, 'Cinebench R23'),
(1007, 7, 7, 17234.80, '3DMark Fire Strike'),
(1008, 8, 8, 5100.00, 'PassMark'),
(1009, 9, 9, 3211.10, 'CrystalDiskMark'),
(1010, 10, 10, 5400.25, 'AIDA64');

-- To display table data
select * from BenchMark_Results;

-- To remove complete records from table
truncate table BenchMark_Results;

-- To remove complete records and attributes from table
drop table BenchMark_Results;


-- Step 7: Create Component_Reviews Table ----------------------------------------------------------
create table Component_Reviews(
    Review_id int primary key,
    User_id int,
    Component_id int,
    rating decimal(5,2),
    Review_date date,
    foreign key (User_id) references Users(User_id),
    foreign key (Component_id) references Components(Component_id)
);

insert into Component_Reviews values
(201, 1, 1, 4.8, '2022-04-13'),
(202, 2, 2, 4.6, '2021-08-26'),
(203, 3, 3, 4.7, '2020-11-04'),
(204, 4, 4, 4.5, '2020-06-16'),
(205, 5, 5, 4.9, '2022-02-11'),
(206, 6, 6, 4.8, '2021-09-19'),
(207, 7, 7, 4.6, '2022-01-23'),
(208, 8, 8, 4.7, '2021-03-14'),
(209, 9, 9, 4.5, '2020-12-02'),
(210, 10, 10, 4.8, '2022-05-09');

-- To display table data
select * from Component_Reviews;

-- To remove complete records from table
truncate table Component_Reviews;

-- To remove complete records and attributes from table
drop table Component_Reviews;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Components;
select * from Systems;
select * from Users;
select * from BenchMark_Results;
select * from Component_Reviews;