/*
This file consists of a database named GYM having tables Members, Plans, Trainers, Supplements, and Equipments.

Table.1 - MEMBERS TABLE - (Stores gym members' details)
        Attributes: Member_id, Member_name, Plan, Contact, Joining_Date

Table.2 - PLANS TABLE - (Stores gym plan details)
        Attributes: Plan_id, Plan_type, Fees, Group_Discount, Training_Sessions

Table.3 - TRAINERS TABLE - (Stores trainer details and their assigned clients)
        Attributes: Trainer_id, Trainer_name, Contact, Client_name, Client_Plan

Table.4 - SUPPLEMENTS TABLE - (Stores supplement product details)
        Attributes: Supplement_id, Supplement_name, Supplement_brand, Flavour, Cost

Table.5 - EQUIPMENTS TABLE - (Stores gym equipment details)
        Attributes: Equipment_id, Equipment_name, Equipment_Cost, Installation_Date, Servicing_Date

Step-by-step Creation of GYM Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Members Table + Insert Data
Step 4: Create Plans Table + Insert Data
Step 5: Create Trainers Table + Insert Data
Step 6: Create Supplements Table + Insert Data
Step 7: Create Equipments Table + Insert Data
Step 8: View Data
*/

-- Step 1: Create the Database
create database Gym;

-- Step 2: Use the database
use Gym;

-- Step 3: Create Members Table ----------------------------------------------------------
create table Members(
    Member_id int primary key,
    Member_name varchar(50),
    Plan varchar(50),
    Contact varchar(10),
    Joining_Date date
);

insert into Members values
(1, 'Amit Sharma', 'Gold', '9876543210', '2025-01-10'),
(2, 'Priya Verma', 'Silver', '9876543211', '2025-02-15'),
(3, 'Ravi Singh', 'Platinum', '9876543212', '2025-03-05'),
(4, 'Sneha Rao', 'Basic', '9876543213', '2025-04-01'),
(5, 'Vikas Nair', 'Gold', '9876543214', '2025-03-12'),
(6, 'Anjali Mehta', 'Silver', '9876543215', '2025-04-20'),
(7, 'Rahul Joshi', 'Basic', '9876543216', '2025-01-18'),
(8, 'Komal Patel', 'Gold', '9876543217', '2025-02-05'),
(9, 'Karan Desai', 'Platinum', '9876543218', '2025-03-22'),
(10, 'Neha Kulkarni', 'Silver', '9876543219', '2025-04-15');

-- To display table data
select * from Members;

-- To remove complete records from table
truncate table Members;

-- To remove complete records and attributes from table
drop table Members;


-- Step 4: Create Plans Table ----------------------------------------------------------
create table Plans(
    Plan_id int primary key,
    Plan_type varchar(50),
    Fees int,
    Group_Discount varchar(50),
    Training_Sessions varchar(50)
);

insert into Plans values
(1, 'Basic', 1000, '5% for 3+', '4 per month'),
(2, 'Silver', 2000, '10% for 4+', '8 per month'),
(3, 'Gold', 3000, '15% for 5+', '12 per month'),
(4, 'Platinum', 4000, '20% for 5+', 'Unlimited'),
(5, 'Student Special', 1500, '10% for groups', '6 per month'),
(6, 'Corporate', 3500, '25% for 10+', 'Unlimited'),
(7, 'Weekend', 1200, '5% for 3+', '4 per month'),
(8, 'Couples', 2500, '10% for couples', '10 per month'),
(9, 'Senior Citizen', 1800, '10% for groups', '6 per month'),
(10, 'Annual Elite', 10000, '25% yearly', 'Unlimited');

-- To display table data
select * from Plans;

-- To remove complete records from table
truncate table Plans;

-- To remove complete records and attributes from table
drop table Plans;


-- Step 5: Create Trainers Table ----------------------------------------------------------
create table Trainers(
    Trainer_id int primary key,
    Trainer_name varchar(50),
    Contact varchar(10),
    Client_name varchar(50),
    Client_Plan varchar(50)
);

insert into Trainers values
(1, 'Raj Malhotra', '9876500010', 'Amit Sharma', 'Gold'),
(2, 'Pooja Iyer', '9876500011', 'Priya Verma', 'Silver'),
(3, 'Aman Sheikh', '9876500012', 'Ravi Singh', 'Platinum'),
(4, 'Simran Khanna', '9876500013', 'Sneha Rao', 'Basic'),
(5, 'Aditya Bansal', '9876500014', 'Vikas Nair', 'Gold'),
(6, 'Meena Reddy', '9876500015', 'Anjali Mehta', 'Silver'),
(7, 'Rahul Sen', '9876500016', 'Rahul Joshi', 'Basic'),
(8, 'Karishma Jain', '9876500017', 'Komal Patel', 'Gold'),
(9, 'Nikhil Shah', '9876500018', 'Karan Desai', 'Platinum'),
(10, 'Anita Kulkarni', '9876500019', 'Neha Kulkarni', 'Silver');

-- To display table data
select * from Trainers;

-- To remove complete records from table
truncate table Trainers;

-- To remove complete records and attributes from table
drop table Trainers;


-- Step 6: Create Supplements Table ----------------------------------------------------------
create table Supplements(
    Supplement_id int primary key,
    Supplement_name varchar(50),
    Supplement_brand varchar(50),
    Flavour varchar(50),
    Cost int
);

insert into Supplements values
(1, 'Whey Protein', 'ON', 'Chocolate', 2500),
(2, 'Creatine', 'MuscleBlaze', 'Unflavoured', 1200),
(3, 'BCAA', 'GNC', 'Orange', 1800),
(4, 'Pre-Workout', 'Cellucor', 'Fruit Punch', 2200),
(5, 'Mass Gainer', 'Dymatize', 'Vanilla', 2800),
(6, 'Multivitamin', 'MuscleTech', 'Unflavoured', 900),
(7, 'Omega 3', 'Now Foods', 'Unflavoured', 850),
(8, 'Whey Isolate', 'MyProtein', 'Strawberry', 3000),
(9, 'Fat Burner', 'Labrada', 'Berry', 1900),
(10, 'ZMA', 'GAT', 'Unflavoured', 1000);

-- To display table data
select * from Supplements;

-- To remove complete records from table
truncate table Supplements;

-- To remove complete records and attributes from table
drop table Supplements;


-- Step 7: Create Equipments Table ----------------------------------------------------------
create table Equipments(
    Equipment_id int primary key,
    Equipment_name varchar(50),
    Equipment_Cost int,
    Installation_Date date,
    Servicing_Date date
);

insert into Equipments values
(1, 'Treadmill', 50000, '2023-01-10', '2025-01-10'),
(2, 'Bench Press', 30000, '2023-02-15', '2025-02-15'),
(3, 'Squat Rack', 45000, '2023-03-20', '2025-03-20'),
(4, 'Lat Pulldown', 25000, '2023-04-05', '2025-04-05'),
(5, 'Dumbbells Set', 20000, '2023-05-10', '2025-05-10'),
(6, 'Elliptical', 40000, '2023-06-12', '2025-06-12'),
(7, 'Leg Press', 55000, '2023-07-22', '2025-07-22'),
(8, 'Cable Crossover', 60000, '2023-08-08', '2025-08-08'),
(9, 'Rowing Machine', 35000, '2023-09-17', '2025-09-17'),
(10, 'Kettlebells', 15000, '2023-10-01', '2025-10-01');

-- To display table data
select * from Equipments;

-- To remove complete records from table
truncate table Equipments;

-- To remove complete records and attributes from table
drop table Equipments;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Members;
select * from Plans;
select * from Trainers;
select * from Supplements;
select * from Equipments;
