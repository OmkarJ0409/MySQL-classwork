/*
This file consists of a database named CROP_FERTILIZERS having tables Crops, Fertilizers, Crop_Yield, Soil_Tests, and Fertilizer_Applications.

Table.1 - CROPS TABLE - (Stores crop details)
        Attributes: Crop_id, Crop_name, Crop_type, Growth_time, Optimal_pH_Level

Table.2 - FERTILIZERS TABLE - (Stores fertilizer types and manufacturers)
        Attributes: Fertilizer_id, Fertilizer_name, Type, NPK_ratio, Manufacturer

Table.3 - CROP_YIELD TABLE - (Stores crop yield data per field)
        Attributes: Field_id, Crop_id, Planting_Date, Expected_Harvest, Irrigation_Type

Table.4 - SOIL_TESTS TABLE - (Stores soil test details per field)
        Attributes: Test_id, Field_id, pH_Level, Field_Area, Test_Date

Table.5 - FERTILIZER_APPLICATIONS TABLE - (Stores fertilizer usage data)
        Attributes: Application_id, Field_id, Fertilizer_id, Date_Applied, Quantity_Kg

Step-by-step Creation of Crop_Fertilizers Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Crops Table + Insert Data  
Step 4: Create Fertilizers Table + Insert Data  
Step 5: Create Crop_Yield Table + Insert Data  
Step 6: Create Soil_Tests Table + Insert Data  
Step 7: Create Fertilizer_Applications Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Crop_Fertilizers;

-- Step 2: Use the Database
use Crop_Fertilizers;


-- Step 3: Create Crops Table ----------------------------------------------------------
create table Crops(
    Crop_id int primary key,
    Crop_name varchar(50),
    Crop_type varchar(50),
    Growth_time varchar(30),
    Optimal_pH_Level int
);

insert into Crops values
(1, 'wheat', 'cereal', '120 days', 6),
(2, 'rice', 'cereal', '150 days', 5),
(3, 'maize', 'cereal', '100 days', 6),
(4, 'soybean', 'legume', '90 days', 6),
(5, 'potato', 'tuber', '110 days', 5),
(6, 'tomato', 'vegetable', '80 days', 6),
(7, 'sugarcane', 'cash crop', '365 days', 7),
(8, 'cotton', 'fiber crop', '180 days', 6),
(9, 'chickpea', 'legume', '100 days', 6),
(10, 'barley', 'cereal', '120 days', 6);

-- To display table data
select * from Crops;

-- To remove complete records from table
truncate table Crops;

-- To remove complete records and attributes from table
drop table Crops;


-- Step 4: Create Fertilizers Table ----------------------------------------------------------
create table Fertilizers(
    Fertilizer_id int primary key,
    Fertilizer_name varchar(50),
    Type text,
    NPK_ratio varchar(10),
    Manufacturer varchar(50)
);

insert into Fertilizers values
(1, 'urea', 'nitrogen based', '46-0-0', 'iffco'),
(2, 'dap', 'phosphorus based', '18-46-0', 'rcf'),
(3, 'mop', 'potassium based', '0-0-60', 'gsfc'),
(4, 'compost', 'organic', 'n/a', 'local manufacturer'),
(5, 'npk 20:20:0', 'mixed', '20-20-0', 'iffco'),
(6, 'biofertilizer a', 'bio', 'n/a', 'krishi labs'),
(7, 'ammonium sulfate', 'nitrogen based', '21-0-0', 'fertico'),
(8, 'vermicompost', 'organic', 'n/a', 'greenearth'),
(9, 'super phosphate', 'phosphorus based', '0-18-0', 'agrigrow'),
(10, 'npk 10:26:26', 'mixed', '10-26-26', 'growmore');

-- To display table data
select * from Fertilizers;

-- To remove complete records from table
truncate table Fertilizers;

-- To remove complete records and attributes from table
drop table Fertilizers;


-- Step 5: Create Crop_Yield Table ----------------------------------------------------------
create table Crop_Yield(
    Field_id int primary key,
    Crop_id int,
    Planting_Date date,
    Expected_Harvest varchar(50),
    Irrigation_Type varchar(50),
    foreign key (Crop_id) references Crops(Crop_id)
);

insert into Crop_Yield values
(1, 1, '2025-01-10', 'mid may', 'drip'),
(2, 2, '2025-02-15', 'late july', 'flood'),
(3, 3, '2025-03-01', 'june', 'sprinkler'),
(4, 4, '2025-04-05', 'july', 'drip'),
(5, 5, '2025-05-12', 'august', 'manual'),
(6, 6, '2025-06-20', 'september', 'sprinkler'),
(7, 7, '2025-01-01', 'december', 'drip'),
(8, 8, '2025-03-18', 'september', 'flood'),
(9, 9, '2025-02-28', 'june', 'sprinkler'),
(10, 10, '2025-03-05', 'july', 'drip');

-- To display table data
select * from Crop_Yield;

-- To remove complete records from table
truncate table Crop_Yield;

-- To remove complete records and attributes from table
drop table Crop_Yield;


-- Step 6: Create Soil_Tests Table ----------------------------------------------------------
create table Soil_Tests(
    Test_id int primary key,
    Field_id int,
    pH_Level int,
    Field_Area varchar(50),
    Test_Date date,
    foreign key (Field_id) references Crop_Yield(Field_id)
);

insert into Soil_Tests values
(1, 1, 6, 'north field', '2025-01-15'),
(2, 2, 5, 'east field', '2025-02-20'),
(3, 3, 6, 'south field', '2025-03-10'),
(4, 4, 7, 'west field', '2025-04-12'),
(5, 5, 6, 'central plot', '2025-05-15'),
(6, 6, 6, 'greenhouse', '2025-06-25'),
(7, 7, 7, 'canal side', '2025-01-20'),
(8, 8, 6, 'hill area', '2025-03-22'),
(9, 9, 5, 'lowland', '2025-02-18'),
(10, 10, 6, 'upland', '2025-03-10');

-- To display table data
select * from Soil_Tests;

-- To remove complete records from table
truncate table Soil_Tests;

-- To remove complete records and attributes from table
drop table Soil_Tests;


-- Step 7: Create Fertilizer_Applications Table ----------------------------------------------------------
create table Fertilizer_Applications(
    Application_id int primary key,
    Field_id int,
    Fertilizer_id int,
    Date_Applied date,
    Quantity_Kg int,
    foreign key (Fertilizer_id) references Fertilizers(Fertilizer_id),
    foreign key (Field_id) references Crop_Yield(Field_id)
);

insert into Fertilizer_Applications values
(1, 1, 1, '2025-01-20', 50),
(2, 2, 2, '2025-02-25', 40),
(3, 3, 3, '2025-03-15', 60),
(4, 4, 4, '2025-04-18', 70),
(5, 5, 5, '2025-05-20', 45),
(6, 6, 6, '2025-06-30', 30),
(7, 7, 7, '2025-01-25', 55),
(8, 8, 8, '2025-03-25', 35),
(9, 9, 9, '2025-02-22', 40),
(10, 10, 10, '2025-03-15', 50);

-- To display table data
select * from Fertilizer_Applications;

-- To remove complete records from table
truncate table Fertilizer_Applications;

-- To remove complete records and attributes from table
drop table Fertilizer_Applications;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Crops;
select * from Fertilizers;
select * from Crop_Yield;
select * from Soil_Tests;
select * from Fertilizer_Applications;