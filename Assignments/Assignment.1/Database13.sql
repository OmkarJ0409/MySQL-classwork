/*
This file consists of a database named DISASTER_RELIEF_FUND having tables Disasters, Disaster_Locations, Relief_Fund, Beneficiary, and Relief_Fund_Office.

Table.1 - DISASTERS TABLE - (Stores details of disaster types)
        Attributes: Disaster_id, Disaster_type, Area_affected_per_SqKm, Disaster_Casualties, Fund_Amount

Table.2 - DISASTER_LOCATIONS TABLE - (Stores disaster affected locations)
        Attributes: Location_id, Location_name, Area_affected_per_SqKm, Disaster_Casualties, Fund_allocated

Table.3 - RELIEF_FUND TABLE - (Stores relief fund details by disaster type and allocation time)
        Attributes: Fund_id, Fund_Amount, Disaster_type, Fund_allocation_Time

Table.4 - BENEFICIARY TABLE - (Stores beneficiaries details of relief funds)
        Attributes: Beneficiary_id, Beneficiary_name, Beneficiary_Address, Fund_Given, Disaster_type, Damaged_area

Table.5 - RELIEF_FUND_OFFICE TABLE - (Stores relief fund office info and fund allocations)
        Attributes: Office_id, Office_Address, Total_Fund, Beneficiary_id (FK), Fund_allocated, Date

Step-by-step Creation of Disaster_Relief_Fund Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Disasters Table + Insert Data  
Step 4: Create Disaster_Locations Table + Insert Data  
Step 5: Create Relief_Fund Table + Insert Data  
Step 6: Create Beneficiary Table + Insert Data  
Step 7: Create Relief_Fund_Office Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Disaster_Relief_Fund;

-- Step 2: Use the Database
use Disaster_Relief_Fund;

-- Step 3: Create Disasters Table ----------------------------------------------------------
create table Disasters(
    Disaster_id int primary key,
    Disaster_type text,
    Area_affected_per_SqKm int,
    Disaster_Casualties int,
    Fund_Amount int
);

insert into Disasters values
(1, 'Flood', 120, 200, 5000000),
(2, 'Earthquake', 150, 300, 7000000),
(3, 'Cyclone', 100, 220, 4500000),
(4, 'Drought', 80, 60, 2000000),
(5, 'Landslide', 70, 90, 2500000),
(6, 'Tsunami', 200, 500, 10000000),
(7, 'Forest Fire', 95, 130, 2800000),
(8, 'Avalanche', 65, 40, 1500000),
(9, 'Volcanic Eruption', 85, 180, 3500000),
(10, 'Storm', 110, 210, 4000000);

-- To display table data
select * from Disasters;

-- To remove complete records from table
truncate table Disasters;

-- To remove complete records and attributes from table
drop table Disasters;


-- Step 4: Create Disaster_Locations Table ----------------------------------------------------------
create table Disaster_Locations(
    Location_id int primary key,
    Location_name varchar(50),
    Area_affected_per_SqKm int,
    Disaster_Casualties int,
    Fund_allocated int
);

insert into Disaster_Locations values
(1, 'Assam', 120, 200, 5000000),
(2, 'Bihar', 90, 150, 3000000),
(3, 'Odisha', 100, 220, 4500000),
(4, 'Gujarat', 80, 50, 2000000),
(5, 'Kerala', 70, 90, 2500000),
(6, 'Maharashtra', 150, 300, 7000000),
(7, 'West Bengal', 95, 130, 2800000),
(8, 'Tamil Nadu', 65, 40, 1500000),
(9, 'Uttarakhand', 85, 180, 3500000),
(10, 'Andhra Pradesh', 110, 210, 4000000);

-- To display table data
select * from Disaster_Locations;

-- To remove complete records from table
truncate table Disaster_Locations;

-- To remove complete records and attributes from table
drop table Disaster_Locations;


-- Step 5: Create Relief_Fund Table ----------------------------------------------------------
create table Relief_Fund(
    Fund_id int primary key,
    Fund_Amount int,
    Disaster_type text,
    Fund_allocation_Time varchar(20)
);

insert into Relief_Fund values
(1, 5000000, 'Flood', 'Morning'),
(2, 7000000, 'Earthquake', 'Evening'),
(3, 4500000, 'Cyclone', 'Morning'),
(4, 2000000, 'Drought', 'Afternoon'),
(5, 2500000, 'Landslide', 'Morning'),
(6, 10000000, 'Tsunami', 'Evening'),
(7, 2800000, 'Forest Fire', 'Afternoon'),
(8, 1500000, 'Avalanche', 'Morning'),
(9, 3500000, 'Volcanic Eruption', 'Evening'),
(10, 4000000, 'Storm', 'Afternoon');

-- To display table data
select * from Relief_Fund;

-- To remove complete records from table
truncate table Relief_Fund;

-- To remove complete records and attributes from table
drop table Relief_Fund;


-- Step 6: Create Beneficiary Table ----------------------------------------------------------
create table Beneficiary(
    Beneficiary_id int primary key,
    Beneficiary_name varchar(50),
    Beneficiary_Address varchar(50),
    Fund_Given int,
    Disaster_type text,
    Damaged_area varchar(50)
);

insert into Beneficiary values
(1, 'Amit Sharma', 'Guwahati', 50000, 'Flood', 'Sector 5'),
(2, 'Priya Verma', 'Patna', 30000, 'Earthquake', 'Block C'),
(3, 'Ravi Kumar', 'Bhubaneswar', 45000, 'Cyclone', 'Zone A'),
(4, 'Sana Ali', 'Rajkot', 20000, 'Drought', 'District 2'),
(5, 'Vikram Rao', 'Kochi', 25000, 'Landslide', 'Hillview'),
(6, 'Sunita Mishra', 'Mumbai', 70000, 'Tsunami', 'Coastline'),
(7, 'Manoj Yadav', 'Kolkata', 28000, 'Forest Fire', 'North Zone'),
(8, 'Neha Singh', 'Chennai', 15000, 'Avalanche', 'Snow Valley'),
(9, 'Rajesh Gupta', 'Dehradun', 35000, 'Volcanic Eruption', 'Highland'),
(10, 'Ankita Joshi', 'Vijayawada', 40000, 'Storm', 'Riverbank');

-- To display table data
select * from Beneficiary;

-- To remove complete records from table
truncate table Beneficiary;

-- To remove complete records and attributes from table
drop table Beneficiary;


-- Step 7: Create Relief_Fund_Office Table ----------------------------------------------------------
create table Relief_Fund_Office(
    Office_id int primary key,
    Office_Address varchar(50),
    Total_Fund int,
    Beneficiary_id int,
    Fund_allocated int,
    Date date,
    foreign key (Beneficiary_id) references Beneficiary(Beneficiary_id)
);

insert into Relief_Fund_Office values
(1, 'Guwahati Office', 1000000, 1, 50000, '2025-04-01'),
(2, 'Patna Relief Center', 1500000, 2, 30000, '2025-04-02'),
(3, 'Odisha Unit', 2000000, 3, 45000, '2025-04-03'),
(4, 'Rajkot Center', 800000, 4, 20000, '2025-04-04'),
(5, 'Kochi Branch', 900000, 5, 25000, '2025-04-05'),
(6, 'Mumbai HQ', 2500000, 6, 70000, '2025-04-06'),
(7, 'Kolkata Zonal', 1100000, 7, 28000, '2025-04-07'),
(8, 'Chennai Helpdesk', 600000, 8, 15000, '2025-04-08'),
(9, 'Dehradun Base', 1300000, 9, 35000, '2025-04-09'),
(10, 'Vijayawada Office', 1400000, 10, 40000, '2025-04-10');

-- To display table data
select * from Relief_Fund_Office;

-- To remove complete records from table
truncate table Relief_Fund_Office;

-- To remove complete records and attributes from table
drop table Relief_Fund_Office;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Disasters;
select * from Disaster_Locations;
select * from Relief_Fund;
select * from Beneficiary;
select * from Relief_Fund_Office;