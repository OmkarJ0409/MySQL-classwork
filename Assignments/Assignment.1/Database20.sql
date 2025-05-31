/*
This file consists of a database named STEAM(Video_Game_Platform) having tables Users, Games, Purchases, Reviews, and System_Requirements.

Table.1 - USERS TABLE - (Stores user information)
        Attributes: User_id, User_name, Email, Country, Join_date

Table.2 - GAMES TABLE - (Stores game information)
        Attributes: Game_id, Title, Developer, Genre, Release_date

Table.3 - PURCHASES TABLE - (Stores purchase details of games by users)
        Attributes: Purchase_id, User_id, Game_id, Purchase_date, Price

Table.4 - REVIEWS TABLE - (Stores user reviews and ratings for games)
        Attributes: Review_id, User_id, Game_id, Rating, Review_Text

Table.5 - SYSTEM_REQUIREMENTS TABLE - (Stores minimum system requirements per game)
        Attributes: Game_id, Min_CPU, Min_RAM_GB, Min_GPU, Storage_GB

Step-by-step Creation of Steam Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Games Table + Insert Data  
Step 5: Create Purchases Table + Insert Data  
Step 6: Create Reviews Table + Insert Data  
Step 7: Create System_Requirements Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Steam;

-- Step 2: Use the Database
use Steam;


-- Step 3: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(50),
    Country varchar(30),
    Join_date date
);

insert into Users values
(1, 'alex_gamer', 'alex@mail.com', 'usa', '2020-03-10'),
(2, 'li_chen', 'li@mail.com', 'china', '2021-05-15'),
(3, 'maria123', 'maria@mail.com', 'mexico', '2019-11-02'),
(4, 'raj99', 'raj@mail.com', 'india', '2022-01-20'),
(5, 'sophie', 'sophie@mail.com', 'france', '2020-06-05'),
(6, 'markus_88', 'markus@mail.com', 'germany', '2018-12-10'),
(7, 'jane_d', 'jane@mail.com', 'uk', '2021-07-19'),
(8, 'tommyv', 'tommy@mail.com', 'canada', '2020-09-25'),
(9, 'natsuki_k', 'natsuki@mail.com', 'japan', '2021-03-12'),
(10, 'ali_rez', 'ali@mail.com', 'iran', '2019-10-01');

-- To view Users data
select * from Users;

-- To clear Users data
truncate table Users;

-- To drop Users table
drop table Users;


-- Step 4: Create Games Table ----------------------------------------------------------
create table Games(
    Game_id int primary key,
    Title varchar(50),
    Developer varchar(50),
    Genre varchar(50),
    Release_date date
);

insert into Games values
(1, 'cyberpunk 2077', 'cd projekt', 'rpg', '2020-12-10'),
(2, 'elden ring', 'fromsoftware', 'action rpg', '2022-02-25'),
(3, 'minecraft', 'mojang', 'sandbox', '2011-11-18'),
(4, 'valorant', 'riot games', 'fps', '2020-06-02'),
(5, 'gta v', 'rockstar games', 'open world', '2013-09-17'),
(6, 'fifa 23', 'ea sports', 'sports', '2022-09-27'),
(7, 'portal 2', 'valve', 'puzzle', '2011-04-19'),
(8, 'dota 2', 'valve', 'moba', '2013-07-09'),
(9, 'cs:go', 'valve', 'fps', '2012-08-21'),
(10, 'terraria', 're-logic', 'sandbox', '2011-05-16');

-- To view Games data
select * from Games;

-- To clear Games data
truncate table Games;

-- To drop Games table
drop table Games;


-- Step 5: Create Purchases Table ----------------------------------------------------------
create table Purchases(
    Purchase_id int primary key,
    User_id int,
    Game_id int,
    Purchase_date date,
    Price int,
    foreign key (User_id) references Users(User_id),
    foreign key (Game_id) references Games(Game_id)
);

insert into Purchases values
(1, 1, 1, '2021-01-15', 59),
(2, 2, 2, '2022-03-10', 60),
(3, 3, 3, '2020-05-12', 25),
(4, 4, 4, '2022-02-11', 0),
(5, 5, 5, '2019-11-01', 30),
(6, 6, 6, '2022-10-02', 70),
(7, 7, 7, '2021-06-20', 10),
(8, 8, 8, '2020-07-04', 0),
(9, 9, 9, '2021-08-22', 0),
(10, 10, 10, '2021-05-05', 15);

-- To view Purchases data
select * from Purchases;

-- To clear Purchases data
truncate table Purchases;

-- To drop Purchases table
drop table Purchases;


-- Step 6: Create Reviews Table ----------------------------------------------------------
create table Reviews(
    Review_id int primary key,
    User_id int,
    Game_id int,
    Rating decimal(3,2),
    Review_Text text,
    foreign key (User_id) references Users(User_id),
    foreign key (Game_id) references Games(Game_id)
);

insert into Reviews values
(1, 1, 1, 8.5, 'great graphics but buggy at launch'),
(2, 2, 2, 9.2, 'amazing open world and boss fights'),
(3, 3, 3, 10.0, 'the best sandbox game ever'),
(4, 4, 4, 7.5, 'fun fps but toxic community'),
(5, 5, 5, 9.0, 'still fun after all these years'),
(6, 6, 6, 8.0, 'better than fifa 22'),
(7, 7, 7, 9.5, 'clever puzzles and story'),
(8, 8, 8, 7.8, 'classic moba experience'),
(9, 9, 9, 8.2, 'intense competitive gameplay'),
(10, 10, 10, 9.0, 'awesome pixel art and gameplay');

-- To view Reviews data
select * from Reviews;

-- To clear Reviews data
truncate table Reviews;

-- To drop Reviews table
drop table Reviews;


-- Step 7: Create System_Requirements Table ----------------------------------------------------------
create table System_Requirements(
    Game_id int primary key,
    Min_CPU varchar(50),
    Min_RAM_GB varchar(50),
    Min_GPU varchar(50),
    Storage_GB varchar(50),
    foreign key (Game_id) references Games(Game_id)
);

insert into System_Requirements values
(1, 'intel i5-3570k', '8 gb', 'gtx 780', '70 gb'),
(2, 'intel i7-8700k', '12 gb', 'gtx 1060', '60 gb'),
(3, 'intel i3', '4 gb', 'intel hd 4000', '2 gb'),
(4, 'intel i3-4150', '4 gb', 'gt 730', '10 gb'),
(5, 'intel i5-3470', '8 gb', 'gtx 660', '65 gb'),
(6, 'intel i5-6600k', '8 gb', 'gtx 1050', '50 gb'),
(7, 'intel core duo', '2 gb', 'nvidia 8600', '8 gb'),
(8, 'dual core 2.8ghz', '4 gb', 'nvidia 8600', '15 gb'),
(9, 'intel core 2 duo e6600', '2 gb', 'gt 610', '8 gb'),
(10, 'intel i3-2100', '4 gb', 'radeon hd 7850', '3 gb');

-- To view System_Requirements data
select * from System_Requirements;

-- To clear System_Requirements data
truncate table System_Requirements;

-- To drop System_Requirements table
drop table System_Requirements;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Users;
select * from Games;
select * from Purchases;
select * from Reviews;
select * from System_Requirements;