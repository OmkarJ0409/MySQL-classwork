/*
This file consists of a database named IMDB_RATINGS having tables Movies, Users, Ratings, Genres, and Reviews.

Table.1 - MOVIES TABLE - (Stores movie information)
        Attributes: Movie_id, Title, Release_date, Duration, Language

Table.2 - USERS TABLE - (Stores user information)
        Attributes: User_id, User_name, Email, Country, Join_date

Table.3 - RATINGS TABLE - (Stores movie ratings given by users)
        Attributes: Rating_id, User_id, Movie_id, Rating, Rating_Date

Table.4 - GENRES TABLE - (Stores movie genre details)
        Attributes: Genre_id, Movie_id, Genre_type, Subgenre, Age_rating

Table.5 - REVIEWS TABLE - (Stores user reviews for movies)
        Attributes: Review_id, Movie_id, User_id, Review_Text, Review_date

Step-by-step Creation of IMDB_Ratings Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Movies Table + Insert Data  
Step 4: Create Users Table + Insert Data  
Step 5: Create Ratings Table + Insert Data  
Step 6: Create Genres Table + Insert Data  
Step 7: Create Reviews Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database IMDB_Ratings;

-- Step 2: Use the Database
use IMDB_Ratings;


-- Step 3: Create Movies Table ----------------------------------------------------------
create table Movies(
    Movie_id int primary key,
    Title varchar(50),
    Release_date date,
    Duration varchar(20),
    Language varchar(40)
);

insert into Movies values
(1, 'inception', '2010-07-16', '2h 28m', 'english'),
(2, 'parasite', '2019-05-30', '2h 12m', 'korean'),
(3, 'interstellar', '2014-11-07', '2h 49m', 'english'),
(4, 'dangal', '2016-12-23', '2h 41m', 'hindi'),
(5, 'spirited away', '2001-07-20', '2h 5m', 'japanese'),
(6, 'the dark knight', '2008-07-18', '2h 32m', 'english'),
(7, 'your name', '2016-08-26', '1h 52m', 'japanese'),
(8, 'the godfather', '1972-03-24', '2h 55m', 'english'),
(9, 'avengers: endgame', '2019-04-26', '3h 2m', 'english'),
(10, 'pk', '2014-12-19', '2h 33m', 'hindi');

-- To view Movies data
select * from Movies;

-- To clear table data
truncate table Movies;

-- To drop the table
drop table Movies;


-- Step 4: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(20),
    Country varchar(20),
    Join_date date
);

insert into Users values
(1, 'john_doe', 'john@mail.com', 'usa', '2021-01-15'),
(2, 'jane_smith', 'jane@mail.com', 'uk', '2021-03-22'),
(3, 'akira_ito', 'akira@mail.com', 'japan', '2021-06-10'),
(4, 'rahul_mehta', 'rahul@mail.com', 'india', '2022-02-05'),
(5, 'lucas_rossi', 'lucas@mail.com', 'brazil', '2021-08-18'),
(6, 'fatima_khan', 'fatima@mail.com', 'uae', '2022-05-30'),
(7, 'emma_white', 'emma@mail.com', 'australia', '2020-11-25'),
(8, 'lee_wong', 'lee@mail.com', 'china', '2023-01-09'),
(9, 'maria_garcia', 'maria@mail.com', 'spain', '2021-12-11'),
(10, 'kiran_sharma', 'kiran@mail.com', 'india', '2022-07-14');

-- To view Users data
select * from Users;

-- To clear table data
truncate table Users;

-- To drop the table
drop table Users;


-- Step 5: Create Ratings Table ----------------------------------------------------------
create table Ratings(
    Rating_id int primary key,
    User_id int,
    Movie_id int,
    Rating decimal(10,2),
    Rating_Date date,
    foreign key (User_id) references Users(User_id),
    foreign key (Movie_id) references Movies(Movie_id)
);

insert into Ratings values
(1, 1, 1, 9.5, '2021-02-01'),
(2, 2, 2, 9.0, '2021-04-10'),
(3, 3, 5, 8.8, '2021-06-20'),
(4, 4, 4, 9.2, '2022-03-15'),
(5, 5, 3, 9.3, '2021-08-25'),
(6, 6, 6, 9.7, '2022-06-01'),
(7, 7, 7, 8.9, '2020-12-10'),
(8, 8, 8, 9.6, '2023-02-17'),
(9, 9, 9, 8.7, '2022-01-03'),
(10, 10, 10, 9.1, '2022-07-30');

-- To view Ratings data
select * from Ratings;

-- To clear table data
truncate table Ratings;

-- To drop the table
drop table Ratings;


-- Step 6: Create Genres Table ----------------------------------------------------------
create table Genres(
    Genre_id int primary key,
    Movie_id int,
    Genre_type varchar(50),
    Subgenre varchar(50),
    Age_rating varchar(20),
    foreign key (Movie_id) references Movies(Movie_id)
);

insert into Genres values
(1, 1, 'sci-fi', 'thriller', 'pg-13'),
(2, 2, 'drama', 'thriller', 'r'),
(3, 3, 'sci-fi', 'adventure', 'pg-13'),
(4, 4, 'sports', 'biopic', 'pg'),
(5, 5, 'animation', 'fantasy', 'pg'),
(6, 6, 'action', 'crime', 'pg-13'),
(7, 7, 'romance', 'fantasy', 'pg'),
(8, 8, 'crime', 'drama', 'r'),
(9, 9, 'action', 'superhero', 'pg-13'),
(10, 10, 'comedy', 'drama', 'pg');

-- To view Genres data
select * from Genres;

-- To clear table data
truncate table Genres;

-- To drop the table
drop table Genres;


-- Step 7: Create Reviews Table ----------------------------------------------------------
create table Reviews(
    Review_id int primary key,
    Movie_id int,
    User_id int,
    Review_Text text,
    Review_date date,
    foreign key (User_id) references Users(User_id),
    foreign key (Movie_id) references Movies(Movie_id)
);

insert into Reviews values
(1, 1, 1, 'mind-blowing concept and visuals!', '2021-02-02'),
(2, 2, 2, 'brilliant social commentary.', '2021-04-11'),
(3, 5, 3, 'beautiful animation and story.', '2021-06-21'),
(4, 4, 4, 'inspiring and emotional.', '2022-03-16'),
(5, 3, 5, 'great plot and acting.', '2021-08-26'),
(6, 6, 6, 'ledger was phenomenal!', '2022-06-02'),
(7, 7, 7, 'visually stunning and emotional.', '2020-12-11'),
(8, 8, 8, 'a classic. unforgettable performances.', '2023-02-18'),
(9, 9, 9, 'epic conclusion to the saga.', '2022-01-04'),
(10, 10, 10, 'unique and thought-provoking.', '2022-07-31');

-- To view Reviews data
select * from Reviews;

-- To clear table data
truncate table Reviews;

-- To drop the table
drop table Reviews;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Movies;
select * from Users;
select * from Ratings;
select * from Genres;
select * from Reviews;