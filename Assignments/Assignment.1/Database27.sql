/*
This file consists of a database named VEHICLE_DATASET, which stores data related to vehicles, owners, maintenance records, dealerships, and vehicle sales.

Table.1 - VEHICLES TABLE - (Stores details of vehicles)
        Attributes: Vehicle_id, Make, Model, Year, Vehicle_type, Price

Table.2 - OWNERS TABLE - (Stores personal details of vehicle owners)
        Attributes: Owner_id, Name, Address, Phone_Number, Email

Table.3 - MAINTENANCE_RECORDS TABLE - (Stores maintenance records of vehicles)
        Attributes: Record_id, Vehicle_id, Series_id, Service_Type, Service_Cost

Table.4 - DEALERSHIPS TABLE - (Stores information about dealerships)
        Attributes: Dealership_id, Name, Location, Phone_Number, Manager_name

Table.5 - SALES TABLE - (Stores vehicle sales information)
        Attributes: Sale_id, Vehicle_id, Owner_id, Sale_Date, Sale_Price

Step-by-step Creation of VEHICLE_DATASET Database:
Step 1: Create the Database  
Step 2: Use the Database  
Step 3: Create Vehicles Table + Insert Data  
Step 4: Create Owners Table + Insert Data  
Step 5: Create Maintenance_Records Table + Insert Data  
Step 6: Create Dealerships Table + Insert Data  
Step 7: Create Sales Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Vehicle_Dataset;

-- Step 2: Use the Database
use Vehicle_Dataset;


-- Step 3: Create Vehicles Table ---------------------------------------------------------
create table Vehicles(
    Vehicle_id int primary key,
    Make varchar(50),
    Model varchar(50),
    Year year,
    Vehicle_type varchar(30),
    Price int
);

insert into Vehicles values
(1, 'toyota', 'camry', 2020, 'sedan', 24000),
(2, 'honda', 'civic', 2019, 'sedan', 22000),
(3, 'ford', 'f-150', 2021, 'truck', 35000),
(4, 'tesla', 'model 3', 2022, 'electric', 45000),
(5, 'bmw', 'x5', 2021, 'suv', 58000),
(6, 'audi', 'a4', 2020, 'sedan', 40000),
(7, 'chevrolet', 'malibu', 2018, 'sedan', 18000),
(8, 'jeep', 'wrangler', 2022, 'suv', 42000),
(9, 'nissan', 'altima', 2019, 'sedan', 21000),
(10, 'hyundai', 'elantra', 2020, 'sedan', 19000);

-- To view Vehicles data
select * from Vehicles;

-- To clear Vehicles data
truncate table Vehicles;

-- To drop Vehicles table
drop table Vehicles;


-- Step 4: Create Owners Table -----------------------------------------------------------
create table Owners(
    Owner_id int primary key,
    Name varchar(50),
    Address text,
    Phone_Number varchar(10),
    Email varchar(25)
);

insert into Owners values
(1, 'john smith', '123 main st, dallas', '9876543210', 'john@email.com'),
(2, 'lisa ray', '456 park ave, nyc', '9123456780', 'lisa@email.com'),
(3, 'michael lee', '789 elm st, sf', '9988776655', 'michael@email.com'),
(4, 'anita kapoor', '12 bridge rd, mumbai', '8877665544', 'anita@email.com'),
(5, 'kevin brown', '9 maple st, boston', '9332211445', 'kevin@email.com'),
(6, 'emily white', '34 pine rd, la', '9123445566', 'emily@email.com'),
(7, 'steve rogers', '67 liberty st, chicago', '9001122334', 'steve@email.com'),
(8, 'tony stark', 'avengers tower, nyc', '9011223344', 'tony@email.com'),
(9, 'sarah ali', '11 hilltop, london', '9345567890', 'sarah@email.com'),
(10, 'bruce wayne', 'wayne manor, gotham', '9123456789', 'bruce@email.com');

-- To view Owners data
select * from Owners;

-- To clear Owners data
truncate table Owners;

-- To drop Owners table
drop table Owners;


-- Step 5: Create Maintenance_Records Table ----------------------------------------------
create table Maintenance_Records(
    Record_id int primary key,
    Vehicle_id int,
    Series_id int,
    Service_Type varchar(50),
    Service_Cost int,
    foreign key (Vehicle_id) references Vehicles(Vehicle_id)
);

insert into Maintenance_Records values
(1, 1, 101, 'oil change', 80),
(2, 2, 102, 'tire rotation', 60),
(3, 3, 103, 'brake check', 120),
(4, 4, 104, 'battery replacement', 200),
(5, 5, 105, 'engine tuning', 350),
(6, 6, 106, 'air filter change', 70),
(7, 7, 107, 'transmission check', 400),
(8, 8, 108, 'coolant refill', 90),
(9, 9, 109, 'spark plug replacement', 110),
(10, 10, 110, 'general inspection', 100);

-- To view Maintenance_Records data
select * from Maintenance_Records;

-- To clear Maintenance_Records data
truncate table Maintenance_Records;

-- To drop Maintenance_Records table
drop table Maintenance_Records;


-- Step 6: Create Dealerships Table ------------------------------------------------------
create table Dealerships(
    Dealership_id int primary key,
    Name varchar(50),
    Location varchar(50),
    Phone_Number varchar(10),
    Manager_name varchar(50)
);

insert into Dealerships values
(1, 'auto galaxy', 'dallas', '9876500001', 'rachel green'),
(2, 'speed motors', 'new york', '9876500002', 'ross geller'),
(3, 'elite autos', 'los angeles', '9876500003', 'monica geller'),
(4, 'royal rides', 'chicago', '9876500004', 'chandler bing'),
(5, 'future wheels', 'houston', '9876500005', 'joey tribbiani'),
(6, 'prime motors', 'san francisco', '9876500006', 'phoebe buffay'),
(7, 'luxury lane', 'boston', '9876500007', 'janice litman'),
(8, 'city car hub', 'mumbai', '9876500008', 'rahul mehra'),
(9, 'urban drive', 'seattle', '9876500009', 'nina kapoor'),
(10, 'drive safe ltd', 'denver', '9876500010', 'jack ryan');

-- To view Dealerships data
select * from Dealerships;

-- To clear Dealerships data
truncate table Dealerships;

-- To drop Dealerships table
drop table Dealerships;


-- Step 7: Create Sales Table ------------------------------------------------------------
create table Sales(
    Sale_id int primary key,
    Vehicle_id int,
    Owner_id int,
    Sale_Date date,
    Sale_Price int,
    foreign key (Vehicle_id) references Vehicles(Vehicle_id),
    foreign key (Owner_id) references Owners(Owner_id)
);

insert into Sales values
(1, 1, 1, '2023-01-15', 23500),
(2, 2, 2, '2023-02-10', 21500),
(3, 3, 3, '2023-03-22', 34000),
(4, 4, 4, '2023-04-18', 44000),
(5, 5, 5, '2023-05-12', 57000),
(6, 6, 6, '2023-06-25', 39000),
(7, 7, 7, '2023-07-30', 17500),
(8, 8, 8, '2023-08-14', 41500),
(9, 9, 9, '2023-09-05', 20000),
(10, 10, 10, '2023-10-19', 18500);

-- To view Sales data
select * from Sales;

-- To clear Sales data
truncate table Sales;

-- To drop Sales table
drop table Sales;


-- Step 8: View All Tables ----------------------------------------------------------------
select * from Vehicles;
select * from Owners;
select * from Maintenance_Records;
select * from Dealerships;
select * from Sales;