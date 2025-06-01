/*
This file consists of a database named TELEVISION_SERIES, which stores data related to various television series including their episodes, cast & crew, genres, and platform distribution details.

Table.1 - SERIES TABLE - (Stores core information about each television series)
        Attributes: Series_id, Title, Start_Year, End_Year, Number_of_Seasons, Platform

Table.2 - EPISODES TABLE - (Stores episode-level information for each series)
        Attributes: Episode_id, Series_id, Season_Number, Episode_Number, Title, Air_Date

Table.3 - CAST_CREW TABLE - (Stores actors and their roles in the series)
        Attributes: Cast_id, Series_id, Actor_name, Character_name, Role_type

Table.4 - GENRE TABLE - (Stores genre details of series)
        Attributes: Genre_id, Series_id, Genre_name, Subgenre, Audience_Rating

Table.5 - PLATFORMS TABLE - (Stores platform launch information for series)
        Attributes: Platform_id, Series_id, Platform_name, Series_Launch_Date, Subscription_type

Step-by-step Creation of TELEVISION_SERIES Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Series Table + Insert Data  
Step 4: Create Episodes Table + Insert Data  
Step 5: Create Cast_Crew Table + Insert Data  
Step 6: Create Genre Table + Insert Data  
Step 7: Create Platforms Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Television_Series;

-- Step 2: Use the Database
use Television_Series;


-- Step 3: Create Series Table ----------------------------------------------------------
create table Series(
    Series_id int primary key,
    Title varchar(50),
    Start_Year year,
    End_Year year,
    Number_of_Seasons int,
    Platform varchar(20)
);

insert into Series values
(1, 'breaking bad', 2008, 2013, 5, 'netflix'),
(2, 'stranger things', 2016, 2024, 5, 'netflix'),
(3, 'game of thrones', 2011, 2019, 8, 'hbo'),
(4, 'sherlock', 2010, 2017, 4, 'bbc'),
(5, 'friends', 1994, 2004, 10, 'nbc'),
(6, 'the office', 2005, 2013, 9, 'nbc'),
(7, 'the crown', 2016, 2023, 6, 'netflix'),
(8, 'the mandalorian', 2019, 2023, 3, 'disney+'),
(9, 'house of cards', 2013, 2018, 6, 'netflix'),
(10, 'dark', 2017, 2020, 3, 'netflix');

-- To view Series data
select * from Series;

-- To clear Series data
truncate table Series;

-- To drop Series table
drop table Series;


-- Step 4: Create Episodes Table ----------------------------------------------------------
create table Episodes(
    Eposide_id int primary key,
    Series_id int,
    Season_Number int,
    Eposide_Number int,
    Title varchar(50),
    Air_Date date,
    foreign key (Series_id) references Series(Series_id)
);

insert into Episodes values
(1, 1, 1, 1, 'pilot', '2008-01-20'),
(2, 1, 1, 2, 'cat''s in the bag...', '2008-01-27'),
(3, 2, 1, 1, 'chapter one', '2016-07-15'),
(4, 3, 1, 1, 'winter is coming', '2011-04-17'),
(5, 4, 1, 1, 'a study in pink', '2010-07-25'),
(6, 5, 1, 1, 'the one where monica gets a roommate', '1994-09-22'),
(7, 6, 1, 1, 'pilot', '2005-03-24'),
(8, 7, 1, 1, 'wolferton splash', '2016-11-04'),
(9, 8, 1, 1, 'chapter 1: the mandalorian', '2019-11-12'),
(10, 10, 1, 1, 'secrets', '2017-12-01');

-- To view Episodes data
select * from Episodes;

-- To clear Episodes data
truncate table Episodes;

-- To drop Episodes table
drop table Episodes;


-- Step 5: Create Cast_Crew Table ----------------------------------------------------------
create table Cast_Crew(
    Cast_id int primary key,
    Series_id int,
    Actor_name varchar(50),
    Character_name varchar(50),
    Role_type varchar(50),
    foreign key (Series_id) references Series(Series_id)
);

insert into Cast_Crew values
(1, 1, 'bryan cranston', 'walter white', 'lead'),
(2, 1, 'aaron paul', 'jesse pinkman', 'supporting'),
(3, 2, 'millie bobby brown', 'eleven', 'lead'),
(4, 3, 'emilia clarke', 'daenerys targaryen', 'lead'),
(5, 4, 'benedict cumberbatch', 'sherlock holmes', 'lead'),
(6, 5, 'jennifer aniston', 'rachel green', 'lead'),
(7, 6, 'steve carell', 'michael scott', 'lead'),
(8, 7, 'olivia colman', 'queen elizabeth ii', 'lead'),
(9, 8, 'pedro pascal', 'din djarin', 'lead'),
(10, 10, 'louis hofmann', 'jonas kahnwald', 'lead');

-- To view Cast_Crew data
select * from Cast_Crew;

-- To clear Cast_Crew data
truncate table Cast_Crew;

-- To drop Cast_Crew table
drop table Cast_Crew;


-- Step 6: Create Genre Table ----------------------------------------------------------
create table Genre(
    Genre_id int primary key,
    Series_id int,
    Genre_name varchar(50),
    Subgenre varchar(50),
    Audience_Rating decimal(5,2),
    foreign key (Series_id) references Series(Series_id)
);

insert into Genre values
(1, 1, 'crime', 'drama', 9.5),
(2, 2, 'sci-fi', 'thriller', 8.8),
(3, 3, 'fantasy', 'drama', 9.3),
(4, 4, 'mystery', 'crime', 8.6),
(5, 5, 'comedy', 'romance', 8.9),
(6, 6, 'comedy', 'mockumentary', 8.8),
(7, 7, 'drama', 'historical', 8.6),
(8, 8, 'sci-fi', 'adventure', 8.7),
(9, 9, 'drama', 'political', 8.7),
(10, 10, 'sci-fi', 'mystery', 8.8);

-- To view Genre data
select * from Genre;

-- To clear Genre data
truncate table Genre;

-- To drop Genre table
drop table Genre;


-- Step 7: Create Platforms Table ----------------------------------------------------------
create table Platforms(
    Platform_id int primary key,
    Series_id int,
    Platform_name varchar(50),
    Series_Launch_Date date,
    Subscription_type varchar(50),
    foreign key (Series_id) references Series(Series_id)
);

insert into Platforms values
(1, 1, 'netflix', '2014-02-01', 'subscription'),
(2, 2, 'netflix', '2016-07-15', 'subscription'),
(3, 3, 'hbo', '2011-04-17', 'subscription'),
(4, 4, 'bbc', '2010-07-25', 'free'),
(5, 5, 'nbc', '1994-09-22', 'cable'),
(6, 6, 'nbc', '2005-03-24', 'cable'),
(7, 7, 'netflix', '2016-11-04', 'subscription'),
(8, 8, 'disney+', '2019-11-12', 'subscription'),
(9, 9, 'netflix', '2013-02-01', 'subscription'),
(10, 10, 'netflix', '2017-12-01', 'subscription');

-- To view Platforms data
select * from Platforms;

-- To clear Platforms data
truncate table Platforms;

-- To drop Platforms table
drop table Platforms;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Series;
select * from Episodes;
select * from Cast_Crew;
select * from Genre;
select * from Platforms;