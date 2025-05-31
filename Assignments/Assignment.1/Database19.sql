/*
This file consists of a database named SPOTIFY having tables Users, Artists, Songs, Playlists, and Listening_History.

Table.1 - USERS TABLE - (Stores user information)
        Attributes: User_id, User_name, Email, Join_date, Country

Table.2 - ARTISTS TABLE - (Stores artist information)
        Attributes: Artist_id, Artist_name, Country, Debut_Year, Genre

Table.3 - SONGS TABLE - (Stores songs information)
        Attributes: Song_id, Title, Artist_id, Genre, Duration

Table.4 - PLAYLISTS TABLE - (Stores user playlists)
        Attributes: Playlist_id, User_id, Playlist_name, Created_Date, is_public

Table.5 - LISTENING_HISTORY TABLE - (Stores users’ listening history)
        Attributes: History_id, User_id, Song_id, Listen_Date, Device

Step-by-step Creation of Spotify Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Artists Table + Insert Data  
Step 5: Create Songs Table + Insert Data  
Step 6: Create Playlists Table + Insert Data  
Step 7: Create Listening_History Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Spotify;

-- Step 2: Use the Database
use Spotify;


-- Step 3: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(50),
    Join_date date,
    Country varchar(30)
);

insert into Users values
(1, 'john_doe', 'john@mail.com', '2021-01-15', 'usa'),
(2, 'emma_smith', 'emma@mail.com', '2020-11-10', 'uk'),
(3, 'hiro_tanaka', 'hiro@mail.com', '2022-06-01', 'japan'),
(4, 'arjun_mehta', 'arjun@mail.com', '2021-07-23', 'india'),
(5, 'lucia_fernandez', 'lucia@mail.com', '2022-01-08', 'spain'),
(6, 'maria_garcia', 'maria@mail.com', '2023-03-11', 'mexico'),
(7, 'li_wei', 'li@mail.com', '2021-09-30', 'china'),
(8, 'sara_ali', 'sara@mail.com', '2020-05-20', 'uae'),
(9, 'daniel_ross', 'daniel@mail.com', '2021-04-16', 'canada'),
(10, 'fatima_khan', 'fatima@mail.com', '2022-08-04', 'pakistan');

-- To view Users data
select * from Users;

-- To clear Users data
truncate table Users;

-- To drop Users table
drop table Users;


-- Step 4: Create Artists Table ----------------------------------------------------------
create table Artists(
    Artist_id int primary key,
    Artist_name varchar(50),
    Country varchar(30),
    Debut_Year year,
    Genre varchar(30)
);

insert into Artists values
(1, 'taylor swift', 'usa', 2006, 'pop'),
(2, 'ed sheeran', 'uk', 2011, 'pop'),
(3, 'arijit singh', 'india', 2013, 'bollywood'),
(4, 'bts', 'south korea', 2013, 'k-pop'),
(5, 'bad bunny', 'puerto rico', 2016, 'reggaeton'),
(6, 'shakira', 'colombia', 1990, 'latin pop'),
(7, 'the weeknd', 'canada', 2010, 'r&b'),
(8, 'dua lipa', 'uk', 2015, 'pop'),
(9, 'akira yamaoka', 'japan', 1993, 'ambient'),
(10, 'david guetta', 'france', 2001, 'edm');

-- To view Artists data
select * from Artists;

-- To clear Artists data
truncate table Artists;

-- To drop Artists table
drop table Artists;


-- Step 5: Create Songs Table ----------------------------------------------------------
create table Songs(
    Song_id int primary key,
    Title varchar(50),
    Artist_id int,
    Genre varchar(30),
    Duration varchar(10),
    foreign key (Artist_id) references Artists(Artist_id)
);

insert into Songs values
(1, 'blank space', 1, 'pop', '3:51'),
(2, 'shape of you', 2, 'pop', '4:24'),
(3, 'tum hi ho', 3, 'bollywood', '4:22'),
(4, 'dynamite', 4, 'k-pop', '3:19'),
(5, 'dakiti', 5, 'reggaeton', '3:25'),
(6, 'hips don''t lie', 6, 'latin', '3:38'),
(7, 'blinding lights', 7, 'r&b', '3:20'),
(8, 'levitating', 8, 'pop', '3:23'),
(9, 'promise', 9, 'ambient', '4:41'),
(10, 'titanium', 10, 'edm', '4:05');

-- To view Songs data
select * from Songs;

-- To clear Songs data
truncate table Songs;

-- To drop Songs table
drop table Songs;


-- Step 6: Create Playlists Table ----------------------------------------------------------
create table Playlists(
    Playlist_id int primary key,
    User_id int,
    Playlist_name varchar(50),
    Created_Date date,
    is_public varchar(10),
    foreign key (User_id) references Users(User_id)
);

insert into Playlists values
(1, 1, 'workout hits', '2022-01-20', 'yes'),
(2, 2, 'romantic vibes', '2021-11-15', 'no'),
(3, 3, 'j-pop mix', '2022-06-05', 'yes'),
(4, 4, 'bollywood melodies', '2021-07-30', 'no'),
(5, 5, 'spanish heat', '2022-02-01', 'yes'),
(6, 6, 'party time', '2023-03-12', 'yes'),
(7, 7, 'study chill', '2021-10-01', 'no'),
(8, 8, 'arabic beats', '2020-06-15', 'yes'),
(9, 9, 'canadian hits', '2021-04-18', 'no'),
(10, 10, 'indie pop', '2022-08-05', 'yes');

-- To view Playlists data
select * from Playlists;

-- To clear Playlists data
truncate table Playlists;

-- To drop Playlists table
drop table Playlists;


-- Step 7: Create Listening_History Table ----------------------------------------------------------
create table Listening_History(
    History_id int primary key,
    User_id int,
    Song_id int,
    Listen_Date date,
    Device varchar(20),
    foreign key (User_id) references Users(User_id),
    foreign key (Song_id) references Songs(Song_id)
);

insert into Listening_History values
(1, 1, 1, '2022-01-21', 'mobile'),
(2, 2, 2, '2021-11-16', 'desktop'),
(3, 3, 4, '2022-06-06', 'tablet'),
(4, 4, 3, '2021-07-31', 'mobile'),
(5, 5, 5, '2022-02-02', 'desktop'),
(6, 6, 6, '2023-03-13', 'mobile'),
(7, 7, 7, '2021-10-02', 'tablet'),
(8, 8, 8, '2020-06-16', 'mobile'),
(9, 9, 9, '2021-04-19', 'desktop'),
(10, 10, 10, '2022-08-06', 'mobile');

-- To view Listening_History data
select * from Listening_History;

-- To clear Listening_History data
truncate table Listening_History;

-- To drop Listening_History table
drop table Listening_History;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Users;
select * from Artists;
select * from Songs;
select * from Playlists;
select * from Listening_History;