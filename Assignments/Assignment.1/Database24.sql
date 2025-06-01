/*
This file consists of a database named COVID19, which stores comprehensive data related to COVID-19 including daily cases, testing information, vaccination rollout, hospital infrastructure, and variants tracking.

Table.1 - CASES TABLE - (Stores daily COVID-19 case statistics per country)
        Attributes: Case_id, Country, Date, Confirmed_Cases, Deaths, Recovered

Table.2 - TESTINGS TABLE - (Stores data on COVID-19 tests conducted per country per day)
        Attributes: Test_id, Country, Date, Test_Conducted, Positive_Rate, Test_type

Table.3 - VACCINATIONS TABLE - (Stores data about vaccination progress per country)
        Attributes: Vaccination_id, Country, Date, Total_Vaccinated, Fully_Vaccinated, Booster_Doses

Table.4 - HOSPITALS TABLE - (Stores hospital infrastructure data related to COVID-19)
        Attributes: Hospital_id, Hospital_name, Country, ICU_beds, Covid_Patients, Staff

Table.5 - VARIANTS TABLE - (Stores data about different COVID-19 variants and characteristics)
        Attributes: Variant_id, Variant_name, First_Reported, Contagiousness, Vaccine_Effectiveness, Severity

Step-by-step Creation of COVID19 Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Cases Table + Insert Data  
Step 4: Create Testings Table + Insert Data  
Step 5: Create Vaccinations Table + Insert Data  
Step 6: Create Hospitals Table + Insert Data  
Step 7: Create Variants Table + Insert Data  
Step 8: View Data  
*/

-- Step 1: Create the Database
create database Covid19;

-- Step 2: Use the Database
use Covid19;

-- Step 3: Create Cases Table ----------------------------------------------------------
create table Cases(
    Case_id int primary key,
    Country varchar(20),
    Date date,
    Confirmed_Cases int,
    Deaths int,
    Recovered int
);

insert into Cases values
(1, 'india', '2020-04-01', 2000, 50, 150),
(2, 'usa', '2020-04-01', 10000, 500, 200),
(3, 'italy', '2020-04-01', 9000, 600, 400),
(4, 'brazil', '2020-04-01', 8500, 300, 250),
(5, 'spain', '2020-04-01', 8000, 400, 350),
(6, 'germany', '2020-04-01', 7500, 200, 500),
(7, 'france', '2020-04-01', 7000, 220, 480),
(8, 'uk', '2020-04-01', 6500, 270, 460),
(9, 'russia', '2020-04-01', 6000, 150, 420),
(10, 'china', '2020-04-01', 5000, 80, 490);

-- To view Cases data
select * from Cases;

-- To clear Cases data
truncate table Cases;

-- To drop Cases table
drop table Cases;


-- Step 4: Create Testings Table ----------------------------------------------------------
create table Testings(
    Test_id int primary key,
    Country varchar(20),
    Date date,
    Test_Conducted int,
    Positive_Rate varchar(10),
    Test_type varchar(30)
);

insert into Testings values
(1, 'india', '2020-04-01', 50000, '4.0%', 'rt-pcr'),
(2, 'usa', '2020-04-01', 200000, '5.0%', 'antigen'),
(3, 'italy', '2020-04-01', 100000, '6.0%', 'rt-pcr'),
(4, 'brazil', '2020-04-01', 80000, '7.0%', 'rt-pcr'),
(5, 'spain', '2020-04-01', 75000, '5.5%', 'antibody'),
(6, 'germany', '2020-04-01', 70000, '3.0%', 'rt-pcr'),
(7, 'france', '2020-04-01', 68000, '4.5%', 'antigen'),
(8, 'uk', '2020-04-01', 65000, '5.2%', 'rt-pcr'),
(9, 'russia', '2020-04-01', 62000, '2.5%', 'rt-pcr'),
(10, 'china', '2020-04-01', 60000, '1.5%', 'rt-pcr');

-- To view Testings data
select * from Testings;

-- To clear Testings data
truncate table Testings;

-- To drop Testings table
drop table Testings;


-- Step 5: Create Vaccinations Table ----------------------------------------------------------
create table Vaccinations(
    Vaccination_id int primary key,
    Country varchar(20),
    Date date,
    Total_Vaccinated int,
    Fully_Vaccinated int,
    Booster_Doses int
);

insert into Vaccinations values
(1, 'india', '2021-01-15', 10000000, 5000000, 1000000),
(2, 'usa', '2021-01-15', 20000000, 15000000, 5000000),
(3, 'italy', '2021-01-15', 5000000, 3000000, 800000),
(4, 'brazil', '2021-01-15', 4000000, 2500000, 600000),
(5, 'spain', '2021-01-15', 3500000, 2000000, 500000),
(6, 'germany', '2021-01-15', 6000000, 4000000, 900000),
(7, 'france', '2021-01-15', 5500000, 3500000, 850000),
(8, 'uk', '2021-01-15', 7000000, 5000000, 1000000),
(9, 'russia', '2021-01-15', 3000000, 2000000, 400000),
(10, 'china', '2021-01-15', 25000000, 20000000, 7000000);

-- To view Vaccinations data
select * from Vaccinations;

-- To clear Vaccinations data
truncate table Vaccinations;

-- To drop Vaccinations table
drop table Vaccinations;


-- Step 6: Create Hospitals Table ----------------------------------------------------------
create table Hospitals(
    Hospital_id int primary key,
    Hospital_name varchar(50),
    Country varchar(20),
    ICU_beds int,
    Covid_Patients int,
    Staff int
);

insert into Hospitals values
(1, 'aiims delhi', 'india', 100, 75, 500),
(2, 'cedars sinai', 'usa', 150, 100, 700),
(3, 'san raffaele', 'italy', 120, 90, 600),
(4, 'sao paulo general', 'brazil', 110, 85, 550),
(5, 'clinic barcelona', 'spain', 130, 95, 620),
(6, 'charité berlin', 'germany', 140, 100, 700),
(7, 'chu lille', 'france', 125, 80, 580),
(8, 'nhs royal', 'uk', 115, 70, 530),
(9, 'moscow city hospital', 'russia', 105, 65, 510),
(10, 'beijing hospital', 'china', 160, 110, 750);

-- To view Hospitals data
select * from Hospitals;

-- To clear Hospitals data
truncate table Hospitals;

-- To drop Hospitals table
drop table Hospitals;


-- Step 7: Create Variants Table ----------------------------------------------------------
create table Variants(
    Variant_id int primary key,
    Variant_name varchar(50),
    First_Reported varchar(50),
    Contagiousness text,
    Vaccine_Effectiveness varchar(50),
    Severity varchar(50)
);

insert into Variants values
(1, 'alpha', 'uk', 'moderately contagious', '70%', 'moderate'),
(2, 'beta', 'south africa', 'highly contagious', '60%', 'high'),
(3, 'gamma', 'brazil', 'very contagious', '65%', 'high'),
(4, 'delta', 'india', 'extremely contagious', '50%', 'severe'),
(5, 'omicron', 'south africa', 'ultra contagious', '40%', 'mild'),
(6, 'lambda', 'peru', 'moderately contagious', '55%', 'moderate'),
(7, 'mu', 'colombia', 'highly contagious', '60%', 'moderate'),
(8, 'epsilon', 'usa', 'mildly contagious', '70%', 'low'),
(9, 'zeta', 'brazil', 'low spread', '75%', 'mild'),
(10, 'theta', 'philippines', 'uncertain behavior', '65%', 'uncertain');

-- To view Variants data
select * from Variants;

-- To clear Variants data
truncate table Variants;

-- To drop Variants table
drop table Variants;

-- Step 8: View Data ----------------------------------------------------------
select * from Cases;
select * from Testings;
select * from Vaccinations;
select * from Hospitals;
select * from Variants;