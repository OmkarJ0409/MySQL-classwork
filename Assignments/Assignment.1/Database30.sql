/*
This File consists of a database named GOOGLE_PLAYSTORE having tables Apps, Developers, Installs, Categories, and Reviews.

Table.1 - APPS TABLE - (Stores details about various apps)
        Apps table has the following attributes:
            App_id, App_Name, Category_id, Developer_id, Rating, Price

Table.2 - DEVELOPERS TABLE - (Stores details about app developers)
        Developers table has the following attributes:
            Developer_id, Developer_Name, Country, Email, Website

Table.3 - INSTALLS TABLE - (Stores app install records by users)
        Installs table has the following attributes:
            Install_id, App_id, User_id, Install_Date, Device_Type
        App_id is a foreign key referencing Apps(App_id)

Table.4 - CATEGORIES TABLE - (Stores app categories)
        Categories table has the following attributes:
            Category_id, Category_name, Type, Popularity_Rank, Description

Table.5 - REVIEWS TABLE - (Stores user reviews of apps)
        Reviews table has the following attributes:
            Review_id, App_id, User_id, Rating, Review_text
        App_id is a foreign key referencing Apps(App_id)

Step-by-step Creation of Google_Playstore Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Apps Table + Insert Data into Apps Table
Step 4: Create Developers Table + Insert Data into Developers Table
Step 5: Create Installs Table + Insert Data into Installs Table
Step 6: Create Categories Table + Insert Data into Categories Table
Step 7: Create Reviews Table + Insert Data into Reviews Table
Step 8: View Data
*/

-- Step 1: Create the Database
create database Google_Playstore;

-- Step 2: Use the database
use Google_Playstore;

-- Step 3: Create Apps Table -----------------------------------------------------------------------
create table Apps(
    App_id int primary key,                -- Unique App ID
    App_Name varchar(50),                  -- Name of the app
    Category_id int,                       -- Category ID (foreign key reference not enforced here)
    Developer_id int,                      -- Developer ID (foreign key reference not enforced here)
    Rating varchar(5),                     -- App rating as string (e.g., '4.5')
    Price int                             -- Price in USD (0 if free)
);

-- Insert records into Apps table
insert into Apps values
(1, 'Google Maps', 4, 1, '4.5', 0),
(2, 'Facebook', 1, 2, '4.0', 0),
(3, 'Snapchat', 1, 3, '4.2', 0),
(4, 'Spotify', 2, 4, '4.6', 10),
(5, 'TikTok', 3, 5, '4.4', 0),
(6, 'Netflix', 3, 6, '4.3', 15),
(7, 'Uber', 4, 7, '4.1', 0),
(8, 'Twitter', 1, 8, '4.0', 0),
(9, 'Instagram', 1, 9, '4.5', 0),
(10, 'Microsoft Word', 4, 10, '4.7', 5);

-- To display table data
select * from Apps;

-- To remove complete records from table
truncate table Apps;

-- To remove complete records and attributes from table
drop table Apps;


-- Step 4: Create Developers Table ------------------------------------------------------------------
create table Developers(
    Developer_id int primary key,          -- Unique Developer ID
    Developer_Name varchar(50),            -- Name of the developer/company
    Country varchar(20),                   -- Country of origin
    Email varchar(50),                     -- Support/contact email
    Website varchar(50)                    -- Developer website URL
);

-- Insert records into Developers table
insert into Developers values
(1, 'Google LLC', 'USA', 'support@google.com', 'https://www.google.com'),
(2, 'Facebook', 'USA', 'help@fb.com', 'https://www.facebook.com'),
(3, 'Snap Inc.', 'USA', 'contact@snap.com', 'https://www.snapchat.com'),
(4, 'Spotify AB', 'Sweden', 'support@spotify.com', 'https://www.spotify.com'),
(5, 'TikTok Ltd.', 'China', 'support@tiktok.com', 'https://www.tiktok.com'),
(6, 'Netflix Inc.', 'USA', 'help@netflix.com', 'https://www.netflix.com'),
(7, 'Uber Technologies', 'USA', 'help@uber.com', 'https://www.uber.com'),
(8, 'Twitter Inc.', 'USA', 'support@twitter.com', 'https://www.twitter.com'),
(9, 'Instagram LLC', 'USA', 'support@instagram.com', 'https://www.instagram.com'),
(10, 'Microsoft', 'USA', 'support@microsoft.com', 'https://www.microsoft.com');

-- To display table data
select * from Developers;

-- To remove complete records from table
truncate table Developers;

-- To remove complete records and attributes from table
drop table Developers;


-- Step 5: Create Installs Table -------------------------------------------------------------------
create table Installs(
    Install_id int primary key,           -- Unique Install record ID
    App_id int,                          -- ID of the installed app
    User_id varchar(20),                 -- User identifier
    Install_Date varchar(50),            -- Date of install (YYYY-MM-DD)
    Device_Type varchar(50),             -- Device platform (e.g., Android, iOS)
    foreign key (App_id) references Apps(App_id)
);

-- Insert records into Installs table
insert into Installs values
(1, 1, 'user001', '2025-05-01', 'Android'),
(2, 2, 'user002', '2025-05-02', 'iOS'),
(3, 3, 'user003', '2025-05-03', 'Android'),
(4, 4, 'user004', '2025-05-04', 'Android'),
(5, 5, 'user005', '2025-05-05', 'iOS'),
(6, 6, 'user006', '2025-05-06', 'Android'),
(7, 7, 'user007', '2025-05-07', 'iOS'),
(8, 8, 'user008', '2025-05-08', 'Android'),
(9, 9, 'user009', '2025-05-09', 'iOS'),
(10, 10, 'user010', '2025-05-10', 'Android');

-- To display table data
select * from Installs;

-- To remove complete records from table
truncate table Installs;

-- To remove complete records and attributes from table
drop table Installs;


-- Step 6: Create Categories Table ------------------------------------------------------------------
create table Categories(
    Category_id int primary key,           -- Unique Category ID
    Category_name varchar(50),             -- Name of category
    Type varchar(20),                      -- Type (e.g., Free or Paid)
    Popularity_Rank varchar(5),            -- Popularity rank as string
    Description varchar(50)                 -- Brief description
);

-- Insert records into Categories table
insert into Categories values
(1, 'Social Networking', 'Free', '1', 'Apps for social interaction'),
(2, 'Music & Audio', 'Free', '2', 'Music streaming and audio apps'),
(3, 'Video Players & Editors', 'Free', '3', 'Apps for video playback and editing'),
(4, 'Productivity', 'Free', '4', 'Tools to enhance productivity'),
(5, 'Games', 'Free', '5', 'Popular gaming apps'),
(6, 'Health & Fitness', 'Free', '6', 'Health tracking and fitness apps'),
(7, 'Finance', 'Free', '7', 'Money management and banking'),
(8, 'Photography', 'Free', '8', 'Photo editing and sharing'),
(9, 'Education', 'Free', '9', 'Learning and educational apps'),
(10, 'Communication', 'Free', '10', 'Messaging and calling apps');

-- To display table data
select * from Categories;

-- To remove complete records from table
truncate table Categories;

-- To remove complete records and attributes from table
drop table Categories;


-- Step 7: Create Reviews Table ---------------------------------------------------------------------
create table Reviews(
    Review_id int primary key,             -- Unique Review ID
    App_id int,                          -- App being reviewed
    User_id int,                        -- User ID giving review
    Rating varchar(5),                  -- Rating given (e.g., '5')
    Review_text varchar(50),            -- Review comment
    foreign key (App_id) references Apps(App_id)
);

-- Insert records into Reviews table
insert into Reviews values
(1, 1, 1001, '5', 'Very useful navigation app!'),
(2, 2, 1002, '4', 'Good social features'),
(3, 3, 1003, '4', 'Fun to use but some bugs'),
(4, 4, 1004, '5', 'Love the music selection'),
(5, 5, 1005, '4', 'Great videos and trends'),
(6, 6, 1006, '5', 'Best streaming app!'),
(7, 7, 1007, '3', 'Sometimes unreliable rides'),
(8, 8, 1008, '4', 'Good for quick updates'),
(9, 9, 1009, '5', 'Awesome photo sharing'),
(10, 10, 1010, '5', 'Great for document editing');

-- To display table data
select * from Reviews;

-- To remove complete records from table
truncate table Reviews;

-- To remove complete records and attributes from table
drop table Reviews;


-- Step 8: View Data -------------------------------------------------------------------------------
select * from Apps;
select * from Developers;
select * from Installs;
select * from Categories;
select * from Reviews;
