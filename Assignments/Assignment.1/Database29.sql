/*
This File consists of a database named IPL_TEAM_DATASET having tables Teams, Players, Venues, Matches, and Scores.

Table.1 - TEAMS TABLE - (Stores details about IPL teams)
        Teams table has the following attributes:
            Team_id, Team_Name, City, Coach, Captain, Titles_Won

Table.2 - PLAYERS TABLE - (Stores details about IPL players)
        Players table has the following attributes:
            Player_id, Player_Name, Team_id, Roles, Nationality, Age
        Team_id is a foreign key referencing Teams(Team_id)

Table.3 - VENUES TABLE - (Stores details about cricket venues)
        Venues table has the following attributes:
            Venue_id, Venue_Name, City, Capacity, Home_Team_id
        Home_Team_id is a foreign key referencing Teams(Team_id)

Table.4 - MATCHES TABLE - (Stores details about matches played)
        Matches table has the following attributes:
            Match_id, Match_Date, Venue_id, Team1_id, Team2_id, Winner_id
        Venue_id is a foreign key referencing Venues(Venue_id)

Table.5 - SCORES TABLE - (Stores match scores by teams)
        Scores table has the following attributes:
            Score_id, Match_id, Team_id, Runs, Wickets, Overs
        Team_id is a foreign key referencing Teams(Team_id)
        Match_id is a foreign key referencing Matches(Match_id)

Step-by-step Creation of IPL_Dataset Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Teams Table + Insert Data into Teams Table
Step 4: Create Players Table + Insert Data into Players Table
Step 5: Create Venues Table + Insert Data into Venues Table
Step 6: Create Matches Table + Insert Data into Matches Table
Step 7: Create Scores Table + Insert Data into Scores Table
Step 8: View Data
*/

-- Step 1: Create the Database
create database IPL_Dataset;

-- Step 2: Use the database
use IPL_Dataset;

-- Step 3: Create Teams Table -----------------------------------------------------------------------
create table Teams(
    Team_id int primary key,                  -- Unique Team ID
    Team_Name varchar(50),                    -- Name of the team
    City varchar(20),                         -- City of the team
    Coach varchar(20),                        -- Coach name
    Captain varchar(40),                      -- Captain name
    Titles_Won int                           -- Number of IPL titles won
);

-- Insert records into Teams table
insert into Teams values
(1, 'Mumbai Indians', 'Mumbai', 'Mahela Jayawardene', 'Rohit Sharma', 5),
(2, 'Chennai Super Kings', 'Chennai', 'Stephen Fleming', 'MS Dhoni', 4),
(3, 'Royal Challengers Bangalore', 'Bangalore', 'Sanju Samson', 'Faf du Plessis', 0),
(4, 'Kolkata Knight Riders', 'Kolkata', 'Brendon McCullum', 'Shreyas Iyer', 2),
(5, 'Delhi Capitals', 'Delhi', 'Ricky Ponting', 'Rishabh Pant', 0),
(6, 'Sunrisers Hyderabad', 'Hyderabad', 'Trevor Bayliss', 'Aiden Markram', 1),
(7, 'Punjab Kings', 'Mohali', 'Anil Kumble', 'Shikhar Dhawan', 0),
(8, 'Rajasthan Royals', 'Jaipur', 'Kumar Sangakkara', 'Sanju Samson', 1),
(9, 'Gujarat Titans', 'Ahmedabad', 'Ashish Nehra', 'Hardik Pandya', 1),
(10, 'Lucknow Super Giants', 'Lucknow', 'Andy Flower', 'KL Rahul', 0);

-- To display table data
select * from Teams;

-- To remove complete records from table
truncate table Teams;

-- To remove complete records and attributes from table
drop table Teams;


-- Step 4: Create Players Table ---------------------------------------------------------------------
create table Players(
    Player_id int primary key,                -- Unique Player ID
    Player_Name varchar(50),                   -- Player name
    Team_id int,                              -- Team ID (foreign key)
    Roles varchar(20),                        -- Player role (Batsman, Bowler, etc.)
    Nationality varchar(20),                  -- Player nationality
    Age int,                                 -- Player age
    foreign key (Team_id) references Teams(Team_id)
);

-- Insert records into Players table
insert into Players values
(1, 'Rohit Sharma', 1, 'Batsman', 'India', 36),
(2, 'Jasprit Bumrah', 1, 'Bowler', 'India', 29),
(3, 'MS Dhoni', 2, 'Wicketkeeper', 'India', 41),
(4, 'Faf du Plessis', 3, 'Batsman', 'South Africa', 38),
(5, 'Andre Russell', 4, 'All-rounder', 'West Indies', 34),
(6, 'Rishabh Pant', 5, 'Wicketkeeper', 'India', 26),
(7, 'Bhuvneshwar Kumar', 6, 'Bowler', 'India', 32),
(8, 'Shikhar Dhawan', 7, 'Batsman', 'India', 36),
(9, 'Sanju Samson', 8, 'Wicketkeeper', 'India', 30),
(10, 'Hardik Pandya', 9, 'All-rounder', 'India', 29);

-- To display table data
select * from Players;

-- To remove complete records from table
truncate table Players;

-- To remove complete records and attributes from table
drop table Players;


-- Step 5: Create Venues Table ----------------------------------------------------------------------
create table Venues(
    Venue_id int primary key,                 -- Unique Venue ID
    Venue_Name varchar(50),                   -- Name of venue
    City varchar(50),                         -- Venue city
    Capacity int,                            -- Seating capacity
    Home_Team_id int,                        -- Home team ID (foreign key)
    foreign key (Home_Team_id) references Teams(Team_id)
);

-- Insert records into Venues table
insert into Venues values
(1, 'Wankhede Stadium', 'Mumbai', 33000, 1),
(2, 'M. A. Chidambaram Stadium', 'Chennai', 50000, 2),
(3, 'M. Chinnaswamy Stadium', 'Bangalore', 40000, 3),
(4, 'Eden Gardens', 'Kolkata', 68000, 4),
(5, 'Arun Jaitley Stadium', 'Delhi', 41000, 5),
(6, 'Rajiv Gandhi Intl. Cricket Stadium', 'Hyderabad', 55000, 6),
(7, 'Punjab Cricket Association IS Bindra Stadium', 'Mohali', 26000, 7),
(8, 'Sawai Mansingh Stadium', 'Jaipur', 30000, 8),
(9, 'Narendra Modi Stadium', 'Ahmedabad', 132000, 9),
(10, 'BRSABV Ekana Cricket Stadium', 'Lucknow', 50000, 10);

-- To display table data
select * from Venues;

-- To remove complete records from table
truncate table Venues;

-- To remove complete records and attributes from table
drop table Venues;


-- Step 6: Create Matches Table ---------------------------------------------------------------------
create table Matches(
    Match_id int primary key,                -- Unique Match ID
    Match_Date date,                        -- Date of the match
    Venue_id int,                          -- Venue ID (foreign key)
    Team1_id int,                          -- Team 1 ID
    Team2_id int,                          -- Team 2 ID
    Winner_id int,                         -- Winner Team ID
    foreign key (Venue_id) references Venues(Venue_id)
);

-- Insert records into Matches table
insert into Matches values
(1, '2025-04-05', 1, 1, 2, 1),
(2, '2025-04-06', 2, 3, 4, 4),
(3, '2025-04-07', 3, 5, 6, 6),
(4, '2025-04-08', 4, 7, 8, 7),
(5, '2025-04-09', 5, 9, 10, 9),
(6, '2025-04-10', 6, 1, 3, 1),
(7, '2025-04-11', 7, 2, 4, 2),
(8, '2025-04-12', 8, 5, 7, 5),
(9, '2025-04-13', 9, 6, 8, 6),
(10, '2025-04-14', 10, 9, 1, 9);

-- To display table data
select * from Matches;

-- To remove complete records from table
truncate table Matches;

-- To remove complete records and attributes from table
drop table Matches;


-- Step 7: Create Scores Table ----------------------------------------------------------------------
create table Scores(
    Score_id int primary key,               -- Unique Score ID
    Match_id int,                          -- Match ID (foreign key)
    Team_id int,                           -- Team ID (foreign key)
    Runs int,                             -- Runs scored
    Wickets int,                         -- Wickets lost
    Overs int,                           -- Overs played
    foreign key (Team_id) references Teams(Team_id),
    foreign key (Match_id) references Matches(Match_id)
);

-- Insert records into Scores table
insert into Scores values
(1, 1, 1, 180, 6, 20.0),
(2, 1, 2, 175, 7, 20.0),
(3, 2, 3, 160, 8, 20.0),
(4, 2, 4, 165, 5, 20.0),
(5, 3, 5, 150, 10, 19.4),
(6, 3, 6, 152, 8, 20.0),
(7, 4, 7, 140, 9, 20.0),
(8, 4, 8, 138, 7, 20.0),
(9, 5, 9, 200, 4, 20.0),
(10, 5, 10, 190, 10, 20.0);

-- To display table data
select * from Scores;

-- To remove complete records from table
truncate table Scores;

-- To remove complete records and attributes from table
drop table Scores;


-- Step 8: View Data -------------------------------------------------------------------------------
select * from Teams;
select * from Players;
select * from Venues;
select * from Matches;
select * from Scores;
