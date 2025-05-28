/*
This File consists of a database named INDIAN_CRICKET_PLAYERS having tables Players, batting_stats, bowling_stats, Injury, and Awards.

Table.1 - PLAYERS TABLE - (Stores details about the cricket players)
        Players table has the following attributes:
            Player_id, Name, Age, Roles, Team

Table.2 - BATTING_STATS TABLE - (Stores batting performance statistics of players)
        batting_stats table has the following attributes:
            Stat_id, Player_name, matches, Runs, Average

Table.3 - BOWLING_STATS TABLE - (Stores bowling performance statistics of players)
        bowling_stats table has the following attributes:
            Stat_id, Player_name, matches, Wickets, Avg_economy

Table.4 - INJURY TABLE - (Stores injury records of players)
        Injury table has the following attributes:
            injury_id, Player_name, injury_type, year, recovery_time_weeks

Table.5 - AWARDS TABLE - (Stores awards received by players)
        Awards table has the following attributes:
            award_id, Player_name, year, awarded_by, match_type
        Player_name is a foreign key referencing batting_stats(Player_name)

Step-by-step Creation of Indian_cricket_players Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Players Table + Insert Data into Players Table
Step 4: Create batting_stats Table + Insert Data into batting_stats Table
Step 5: Create bowling_stats Table + Insert Data into bowling_stats Table
Step 6: Create Injury Table + Insert Data into Injury Table
Step 7: Create Awards Table + Insert Data into Awards Table
Step 8: View Data (
    select * from Players;
    select * from batting_stats;
    select * from bowling_stats;
    select * from Injury;
    select * from Awards;
)
*/

-- Step 1: Create the Database
create database Indian_cricket_players;

-- Step 2: Use the database
use Indian_cricket_players;

-- Step 3: Create Players Table ----------------------------------------------------------------------

create table Players(
Player_id int primary key,          -- Unique Player ID
Name varchar(100),                  -- Player's full name
Age int,                           -- Player's age
Roles varchar(50),                 -- Player role (e.g., Batsman, Bowler)
Team varchar(50)                  -- Team the player belongs to
);

-- Insert records into Players table
insert into Players
values
(1,'Virat Kohli',35,'Batsman','RCB'),
(2,'Rohit Sharma',37,'Batsman','MI'),
(3,'Jasprit Bumrah',31,'Bowler','MI'),
(4,'Rishabh Pant',27,'WicketKeeper','DC'),
(5,'Hardik Pandya',33,'All-rounder','MI'),
(6, 'KL Rahul', 31, 'Batsman', 'PBKS'),
(7, 'Bhuvneshwar Kumar', 33, 'Bowler', 'SRH'),
(8, 'Shikhar Dhawan', 36, 'Batsman', 'PBKS'),
(9, 'Yuzvendra Chahal', 30, 'Bowler', 'RCB'),
(10, 'Suryakumar Yadav', 31, 'Batsman', 'MI');

-- To display table data
select * from Players;

-- To remove complete records from table
truncate table Players;

-- To remove complete records and attributes from table
drop table Players;


-- Step 4: Create batting_stats Table ------------------------------------------------------------------

create table batting_stats(
Stat_id int,                       -- Statistic unique ID
Player_name varchar(50) primary key,  -- Player's name
matches int,                      -- Number of matches played
Runs int,                         -- Total runs scored
Average int                       -- Batting average
);

-- Insert records into batting_stats table
insert into batting_stats
values
(101,'Virat Kohli',275,13000,57),
(102,'Rohit Sharma',300,11000,49),
(103,'Rishabh Pant',90,2600,38),
(104,'Hardik Pandya',120,3100,32),
(105,'Jasprit Bumrah',50,1900,60),
(106, 'KL Rahul', 100, 4500, 45),
(107, 'Shikhar Dhawan', 125, 5300, 42),
(108, 'Suryakumar Yadav', 70, 3200, 50),
(109, 'Yuzvendra Chahal', 50, 600, 15),
(110, 'Bhuvneshwar Kumar', 80, 900, 25);

-- To display table data
select * from batting_stats;

-- To remove complete records from table
truncate table batting_stats;

-- To remove complete records and attributes from table
drop table batting_stats;


-- Step 5: Create bowling_stats Table ------------------------------------------------------------------

create table bowling_stats(
Stat_id int primary key,          -- Statistic unique ID
Player_name varchar(50),          -- Player's name
matches int,                     -- Number of matches played
Wickets int,                     -- Total wickets taken
Avg_economy int                  -- Average economy rate
);

-- Insert records into bowling_stats table
insert into bowling_stats
values
(1,'Jasprit Bumrah',160,300,5),
(2,'Hardik Pandya',100,90,6),
(3,'Rishabh Pant',80,48,5),
(4,'Rohit Sharma',25,15,1),
(5,'Virat Kohli',70,31,2),
(6, 'Bhuvneshwar Kumar', 110, 160, 5),
(7, 'Yuzvendra Chahal', 100, 180, 6),
(8, 'KL Rahul', 40, 20, 7),
(9, 'Shikhar Dhawan', 10, 3, 4),
(10, 'Suryakumar Yadav', 15, 5, 6);

-- To display table data
select * from bowling_stats;

-- To remove complete records from table
truncate table bowling_stats;

-- To remove complete records and attributes from table
drop table bowling_stats;


-- Step 6: Create Injury Table -----------------------------------------------------------------------

create table Injury(
injury_id int primary key,         -- Injury record ID
Player_name varchar(50),           -- Player's name
injury_type varchar(50),           -- Type of injury
year int,                         -- Year injury occurred
recovery_time_weeks int            -- Recovery time in weeks
);

-- Insert records into Injury table
insert into Injury
values
(301,'Rohit Sharma','Hamstring Tear',2023,6),
(302,'Jasprit Bumrah','Elbow Injury',2022,7),
(303,'Rishabh Pant','ACL Tear',2023,12),
(304,'Hardik Pandya','Shoulder Strain',2022,5),
(305,'Virat Kohli','Lower Back Pain',2022,3),
(306, 'KL Rahul', 'Finger Fracture', 2023, 4),
(307, 'Bhuvneshwar Kumar', 'Knee Injury', 2022, 8),
(308, 'Shikhar Dhawan', 'Hamstring Strain', 2023, 5),
(309, 'Yuzvendra Chahal', 'Back Pain', 2024, 3),
(310, 'Suryakumar Yadav', 'Ankle Sprain', 2024, 6);

-- To display table data
select * from Injury;

-- To remove complete records from table
truncate table Injury;

-- To remove complete records and attributes from table
drop table Injury;


-- Step 7: Create Awards Table -----------------------------------------------------------------------

create table Awards(
award_id int primary key,            -- Award record ID
Player_name varchar(50),             -- Player's name
year int,                          -- Year awarded
awarded_by varchar(30),             -- Awarding authority
match_type varchar(30),             -- Match format
foreign key (Player_name) references batting_stats(Player_name)
);

-- Insert records into Awards table
insert into Awards
values
(401,'Virat Kohli',2018,'ICC','ODI'),
(402,'Rohit Sharma',2015,'Govt. of India','ODI'),
(403,'Jasprit Bumrah',2020,'ESPN','Test'),
(404,'Rishabh Pant',2019,'BCCI','T20'),
(405,'Hardik Pandya',2021,'ICC','T20'),
(406, 'KL Rahul', 2021, 'BCCI', 'ODI'),
(407, 'Shikhar Dhawan', 2018, 'ICC', 'Test'),
(408, 'Yuzvendra Chahal', 2022, 'ESPN', 'T20'),
(409, 'Suryakumar Yadav', 2023, 'BCCI', 'T20'),
(410, 'Bhuvneshwar Kumar', 2019, 'ICC', 'Test');

-- To display table data
select * from Awards;

-- To remove complete records from table
truncate table Awards;

-- To remove complete records and attributes from table
drop table Awards;


-- Step 8: View Data

select * from Players;
select * from batting_stats;
select * from bowling_stats;
select * from Injury;
select * from Awards;
