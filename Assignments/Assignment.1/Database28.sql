/*
This file consists of a database named DATING_APP, which stores data related to users, their profiles, matches, messages exchanged, and preferences.

Table.1 - USERS TABLE - (Stores basic user information)
        Attributes: User_id, User_name, Email, Date_Joined, Last_Active, Gender

Table.2 - PROFILES TABLE - (Stores extended profile details)
        Attributes: Profile_id, User_id, Age, Location, Bio, Interests

Table.3 - MATCHES TABLE - (Stores matches between users)
        Attributes: Match_id, User1_id, User2_id, Match_Date, Status

Table.4 - MESSAGES TABLE - (Stores messages exchanged between matched users)
        Attributes: Message_id, Match_id, Sender_id, Message_Text, Time

Table.5 - PREFERENCES TABLE - (Stores dating preferences of users)
        Attributes: Preference_id, User_id, Interested_In, Age_Range, Distance_Kms, Addiction_Habits

Step-by-step Creation of DATING_APP Database:
Step 1: Create the Database  
Step 2: Use the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Profiles Table + Insert Data  
Step 5: Create Matches Table + Insert Data  
Step 6: Create Messages Table + Insert Data  
Step 7: Create Preferences Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Dating_App;

-- Step 2: Use the Database
use Dating_App;


-- Step 3: Create Users Table ------------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(25),
    Date_Joined date,
    Last_Active timestamp,
    Gender varchar(6)
);

insert into Users values
(1, 'Alice', 'alice@example.com', '2023-01-01', '2024-05-31 10:30:00', 'Female'),
(2, 'Bob', 'bob@example.com', '2023-01-05', '2024-05-31 09:20:00', 'Male'),
(3, 'Cathy', 'cathy@example.com', '2023-02-10', '2024-05-31 11:00:00', 'Female'),
(4, 'David', 'david@example.com', '2023-02-12', '2024-05-30 20:45:00', 'Male'),
(5, 'Eva', 'eva@example.com', '2023-03-01', '2024-05-29 21:00:00', 'Female'),
(6, 'Frank', 'frank@example.com', '2023-03-15', '2024-05-31 14:15:00', 'Male'),
(7, 'Grace', 'grace@example.com', '2023-04-01', '2024-05-31 07:40:00', 'Female'),
(8, 'Henry', 'henry@example.com', '2023-04-10', '2024-05-31 08:55:00', 'Male'),
(9, 'Ivy', 'ivy@example.com', '2023-05-05', '2024-05-31 12:20:00', 'Female'),
(10, 'Jack', 'jack@example.com', '2023-05-15', '2024-05-31 13:00:00', 'Male');

-- To view Users data
select * from Users;

-- To clear Users data
truncate table Users;

-- To drop Users table
drop table Users;


-- Step 4: Create Profiles Table ---------------------------------------------------------
create table Profiles(
    Profile_id int primary key,
    User_id int,
    Age int,
    Location varchar(50),
    Bio text,
    Interests text,
    foreign key (User_id) references Users(User_id)
);

insert into Profiles values
(1, 1, 26, 'Mumbai', 'Love hiking and photography.', 'Travel, Music, Art'),
(2, 2, 28, 'Delhi', 'Fitness enthusiast.', 'Gym, Coding, Coffee'),
(3, 3, 24, 'Bangalore', 'Quiet and creative.', 'Books, Painting, Dogs'),
(4, 4, 30, 'Hyderabad', 'Food lover.', 'Cooking, Gaming, Cricket'),
(5, 5, 27, 'Chennai', 'Fun-loving.', 'Dance, Movies, Yoga'),
(6, 6, 29, 'Pune', 'Work hard, party harder.', 'Tech, Parties, Startups'),
(7, 7, 25, 'Kolkata', 'Looking for meaningful talks.', 'Poetry, Meditation, History'),
(8, 8, 31, 'Ahmedabad', 'Music is life.', 'Singing, Travel, Netflix'),
(9, 9, 23, 'Goa', 'Beach bum.', 'Surfing, Parties, Nature'),
(10, 10, 26, 'Jaipur', 'Adventurer at heart.', 'Climbing, Road trips, Motorbikes');

-- To view Profiles data
select * from Profiles;

-- To clear Profiles data
truncate table Profiles;

-- To drop Profiles table
drop table Profiles;


-- Step 5: Create Matches Table ----------------------------------------------------------
create table Matches(
    Match_id int primary key,
    User1_id int,
    User2_id int,
    Match_Date date,
    Status varchar(20),
    foreign key (User1_id) references Users(User_id),
    foreign key (User2_id) references Users(User_id)
);

insert into Matches values
(1, 1, 2, '2023-02-01', 'Active'),
(2, 3, 4, '2023-02-20', 'Inactive'),
(3, 5, 6, '2023-03-10', 'Active'),
(4, 7, 8, '2023-04-15', 'Active'),
(5, 9, 10, '2023-05-01', 'Pending'),
(6, 2, 3, '2023-06-01', 'Blocked'),
(7, 1, 4, '2023-06-05', 'Active'),
(8, 5, 7, '2023-06-10', 'Inactive'),
(9, 6, 9, '2023-06-15', 'Pending'),
(10, 8, 10, '2023-06-20', 'Active');

-- To view Matches data
select * from Matches;

-- To clear Matches data
truncate table Matches;

-- To drop Matches table
drop table Matches;


-- Step 6: Create Messages Table ---------------------------------------------------------
create table Messages(
    Message_id int primary key,
    Match_id int,
    Sender_id int,
    Message_Text text,
    Time timestamp,
    foreign key (Match_id) references Matches(Match_id)
);

insert into Messages values
(1, 1, 1, 'Hi Bob! Nice to meet you!', '2024-05-30 10:01:00'),
(2, 1, 2, 'Hey Alice! Same here!', '2024-05-30 10:05:00'),
(3, 2, 3, 'Hello David.', '2024-05-30 11:00:00'),
(4, 2, 4, 'Hi Cathy!', '2024-05-30 11:05:00'),
(5, 3, 5, 'Hey Frank, how are you?', '2024-05-29 18:30:00'),
(6, 3, 6, 'Doing great Eva!', '2024-05-29 18:32:00'),
(7, 4, 7, 'Hi Henry!', '2024-05-28 19:10:00'),
(8, 4, 8, 'Hey Grace!', '2024-05-28 19:12:00'),
(9, 5, 9, 'Hello Jack!', '2024-05-28 20:00:00'),
(10, 5, 10, 'Hi Ivy!', '2024-05-28 20:05:00');

-- To view Messages data
select * from Messages;

-- To clear Messages data
truncate table Messages;

-- To drop Messages table
drop table Messages;


-- Step 7: Create Preferences Table -------------------------------------------------------
create table Preferences(
    Preference_id int primary key,
    User_id int,
    Interested_In varchar(50),
    Age_Range varchar(10),
    Distance_Kms int,
    Addiction_Habits text,
    foreign key (User_id) references Users(User_id)
);

insert into Preferences values
(1, 1, 'Male', '25-30', 50, 'Non-smoker'),
(2, 2, 'Female', '23-28', 40, 'Occasional drinker'),
(3, 3, 'Male', '24-32', 30, 'None'),
(4, 4, 'Female', '25-30', 20, 'Smoker'),
(5, 5, 'Male', '26-34', 60, 'Non-drinker'),
(6, 6, 'Female', '23-29', 35, 'None'),
(7, 7, 'Male', '22-28', 25, 'Non-smoker'),
(8, 8, 'Female', '26-30', 40, 'Social drinker'),
(9, 9, 'Male', '24-29', 30, 'None'),
(10, 10, 'Female', '25-32', 50, 'Occasional smoker');

-- To view Preferences data
select * from Preferences;

-- To clear Preferences data
truncate table Preferences;

-- To drop Preferences table
drop table Preferences;


-- Step 8: View All Tables ----------------------------------------------------------------
select * from Users;
select * from Profiles;
select * from Matches;
select * from Messages;
select * from Preferences;