/*
This file consists of a database named WORLD_HAPPINESS_INDEX, which stores information about countries, their happiness scores, economic indicators, demographics, and wellbeing factors.

Table.1 - COUNTRIES TABLE - (Stores country details)
        Attributes: Country_id, Country_name, ISO_code, Region, Subregion

Table.2 - HAPPINESS_SCORES TABLE - (Stores annual happiness scores and ranks)
        Attributes: Score_id, Country_id, Year, Happiness_Score, Country_Rank

Table.3 - ECONOMIC_INDICATORS TABLE - (Stores GDP, social support, and freedom scores)
        Attributes: Indicator_id, Country_id, GDP_per_capita, Social_Support, Freedom_Score

Table.4 - DEMOGRAPHICS TABLE - (Stores population stats of each country)
        Attributes: Demo_id, Country_id, Population_lakhs, Median_age, Literact_rate, Gender_ratio

Table.5 - WELLBEING_FACTOR TABLE - (Stores life expectancy, generosity, and corruption perception)
        Attributes: Factor_id, Country_id, Life_Expectancy, Geneoricity, Corruption

Step-by-step Creation of World_Happiness_Index Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Countries Table + Insert Data  
Step 4: Create Happiness_Scores Table + Insert Data  
Step 5: Create Economic_Indicators Table + Insert Data  
Step 6: Create Demographics Table + Insert Data  
Step 7: Create Wellbeing_Factor Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database World_Happiness_Index;

-- Step 2: Use the Database
use World_Happiness_Index;


-- Step 3: Create Countries Table ----------------------------------------------------------
create table Countries(
    Country_id int primary key,
    Country_name varchar(20),
    ISO_code varchar(5),
    Region varchar(30),
    Subregion varchar(30)
);

insert into Countries values
(1, 'finland', 'FI', 'europe', 'northern europe'),
(2, 'denmark', 'DK', 'europe', 'northern europe'),
(3, 'norway', 'NO', 'europe', 'northern europe'),
(4, 'iceland', 'IS', 'europe', 'northern europe'),
(5, 'netherlands', 'NL', 'europe', 'western europe'),
(6, 'switzerland', 'CH', 'europe', 'western europe'),
(7, 'sweden', 'SE', 'europe', 'northern europe'),
(8, 'new zealand', 'NZ', 'oceania', 'australia and new zealand'),
(9, 'canada', 'CA', 'americas', 'northern america'),
(10, 'australia', 'AU', 'oceania', 'australia and new zealand');

-- To view Countries data
select * from Countries;

-- To clear Countries data
truncate table Countries;

-- To drop Countries table
drop table Countries;


-- Step 4: Create Happiness_Scores Table ----------------------------------------------------------
create table Happiness_Scores(
    Score_id int primary key,
    Country_id int,
    Year year,
    Happiness_Score int,
    Country_Rank int,
    foreign key (Country_id) references Countries(Country_id)
);

insert into Happiness_Scores values
(1, 1, 2023, 7, 1),
(2, 2, 2023, 6, 2),
(3, 3, 2023, 6, 3),
(4, 4, 2023, 6, 4),
(5, 5, 2023, 6, 5),
(6, 6, 2023, 6, 6),
(7, 7, 2023, 6, 7),
(8, 8, 2023, 6, 8),
(9, 9, 2023, 6, 9),
(10, 10, 2023, 6, 10);

-- To view Happiness_Scores data
select * from Happiness_Scores;

-- To clear Happiness_Scores data
truncate table Happiness_Scores;

-- To drop Happiness_Scores table
drop table Happiness_Scores;


-- Step 5: Create Economic_Indicators Table ----------------------------------------------------------
create table Economic_Indicators(
    Indicator_id int primary key,
    Country_id int,
    GDP_per_capita varchar(10),
    Social_Support varchar(50),
    Freedom_Score int,
    foreign key (Country_id) references Countries(Country_id)
);

insert into Economic_Indicators values
(1, 1, '1.34', 'high', 8),
(2, 2, '1.25', 'high', 7),
(3, 3, '1.29', 'high', 8),
(4, 4, '1.30', 'high', 7),
(5, 5, '1.27', 'high', 8),
(6, 6, '1.32', 'high', 7),
(7, 7, '1.28', 'high', 7),
(8, 8, '1.20', 'medium', 6),
(9, 9, '1.18', 'medium', 6),
(10, 10, '1.23', 'medium', 6);

-- To view Economic_Indicators data
select * from Economic_Indicators;

-- To clear Economic_Indicators data
truncate table Economic_Indicators;

-- To drop Economic_Indicators table
drop table Economic_Indicators;


-- Step 6: Create Demographics Table ----------------------------------------------------------
create table Demographics(
    Demo_id int primary key,
    Country_id int,
    Population_lakhs int,
    Median_age int,
    Literact_rate int,
    Gender_ratio int,
    foreign key (Country_id) references Countries(Country_id)
);

insert into Demographics values
(1, 1, 55, 43, 99, 105),
(2, 2, 58, 45, 98, 103),
(3, 3, 54, 44, 99, 104),
(4, 4, 5, 40, 99, 106),
(5, 5, 41, 42, 98, 102),
(6, 6, 21, 44, 99, 101),
(7, 7, 57, 43, 98, 104),
(8, 8, 50, 38, 97, 100),
(9, 9, 37, 39, 96, 99),
(10, 10, 26, 40, 97, 100);

-- To view Demographics data
select * from Demographics;

-- To clear Demographics data
truncate table Demographics;

-- To drop Demographics table
drop table Demographics;


-- Step 7: Create Wellbeing_Factor Table ----------------------------------------------------------
create table Wellbeing_Factor(
    Factor_id int primary key,
    Country_id int,
    Life_Expectancy varchar(50),
    Geneoricity varchar(50),
    Corruption varchar(10),
    foreign key (Country_id) references Countries(Country_id)
);

insert into Wellbeing_Factor values
(1, 1, '82 years', 'generous', 'low'),
(2, 2, '81 years', 'generous', 'low'),
(3, 3, '82 years', 'generous', 'low'),
(4, 4, '83 years', 'generous', 'low'),
(5, 5, '81 years', 'generous', 'low'),
(6, 6, '83 years', 'generous', 'low'),
(7, 7, '82 years', 'generous', 'low'),
(8, 8, '80 years', 'moderate', 'medium'),
(9, 9, '82 years', 'moderate', 'medium'),
(10, 10, '81 years', 'moderate', 'medium');

-- To view Wellbeing_Factor data
select * from Wellbeing_Factor;

-- To clear Wellbeing_Factor data
truncate table Wellbeing_Factor;

-- To drop Wellbeing_Factor table
drop table Wellbeing_Factor;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Countries;
select * from Happiness_Scores;
select * from Economic_Indicators;
select * from Demographics;
select * from Wellbeing_Factor;