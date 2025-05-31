/*
This file consists of a database named YOUTUBE having tables Users, Channels, Videos, Comments, and Likes.

Table.1 - USERS TABLE - (Stores user information)
        Attributes: User_id, User_name, Email, Join_date, Country

Table.2 - CHANNELS TABLE - (Stores channel details created by users)
        Attributes: Channel_id, Channel_name, Owner_id, Creation_Date, Category

Table.3 - VIDEOS TABLE - (Stores uploaded videos and their details)
        Attributes: Video_id, Title, Upload_Date, Duration, Channel_id

Table.4 - COMMENTS TABLE - (Stores comments by users on videos)
        Attributes: Comment_id, Video_id, User_id, Comment_text, Timestamp

Table.5 - LIKES TABLE - (Stores reactions/likes on videos)
        Attributes: Like_id, Video_id, User_id, Like_Date, Reaction_Type

Step-by-step Creation of YOUTUBE Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Channels Table + Insert Data  
Step 5: Create Videos Table + Insert Data  
Step 6: Create Comments Table + Insert Data  
Step 7: Create Likes Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Youtube;

-- Step 2: Use the Database
use Youtube;


-- Step 3: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(30),
    Join_date date,
    Country varchar(20)
);

insert into Users values
(1, 'Alice', 'alice@mail.com', '2023-01-15', 'USA'),
(2, 'Bob', 'bob@mail.com', '2023-02-20', 'UK'),
(3, 'Charlie', 'charlie@mail.com', '2023-03-10', 'Canada'),
(4, 'Diana', 'diana@mail.com', '2023-04-05', 'Australia'),
(5, 'Ethan', 'ethan@mail.com', '2023-05-12', 'India'),
(6, 'Fiona', 'fiona@mail.com', '2023-06-25', 'Germany'),
(7, 'George', 'george@mail.com', '2023-07-30', 'France'),
(8, 'Hannah', 'hannah@mail.com', '2023-08-15', 'Brazil'),
(9, 'Ian', 'ian@mail.com', '2023-09-20', 'Japan'),
(10, 'Julia', 'julia@mail.com', '2023-10-10', 'South Korea');

-- To view Users data
select * from Users;

-- To clear table data
truncate table Users;

-- To drop the table
drop table Users;


-- Step 4: Create Channels Table ----------------------------------------------------------
create table Channels(
    Channel_id int primary key,
    Channel_name varchar(50),
    Owner_id int,
    Creation_Date date,
    Category varchar(50),
    foreign key (Owner_id) references Users(User_id)
);

insert into Channels values
(1, 'Alice Vlogs', 1, '2023-01-20', 'Lifestyle'),
(2, 'Tech Insights', 2, '2023-02-25', 'Technology'),
(3, 'Charlie Cooking', 3, '2023-03-15', 'Food'),
(4, 'Diana Fitness', 4, '2023-04-10', 'Health'),
(5, 'Ethan Music', 5, '2023-05-18', 'Music'),
(6, 'Fiona Travel', 6, '2023-06-30', 'Travel'),
(7, 'George Gaming', 7, '2023-08-02', 'Gaming'),
(8, 'Hannah Art', 8, '2023-08-20', 'Art'),
(9, 'Ian Reviews', 9, '2023-09-25', 'Reviews'),
(10, 'Julia DIY', 10, '2023-10-15', 'DIY');

-- To view Channels data
select * from Channels;

-- To clear table data
truncate table Channels;

-- To drop the table
drop table Channels;


-- Step 5: Create Videos Table ----------------------------------------------------------
create table Videos(
    Video_id int primary key,
    Title varchar(40),
    Upload_Date date,
    Duration varchar(20),
    Channel_id int,
    foreign key (Channel_id) references Channels(Channel_id)
);

insert into Videos values
(1, 'Day in my life', '2023-01-22', '10:15', 1),
(2, 'Latest Tech Gadgets 2023', '2023-03-01', '15:40', 2),
(3, 'Easy Pasta Recipe', '2023-03-20', '08:30', 3),
(4, 'Full Body Workout', '2023-04-12', '20:00', 4),
(5, 'Top 10 Songs', '2023-05-20', '12:45', 5),
(6, 'Trip to Japan', '2023-07-05', '18:50', 6),
(7, 'Gameplay Walkthrough', '2023-08-10', '25:00', 7),
(8, 'Painting Tutorial', '2023-08-25', '14:10', 8),
(9, 'Smartphone Review', '2023-09-30', '10:00', 9),
(10, 'DIY Home Decor', '2023-10-20', '09:35', 10);

-- To view Videos data
select * from Videos;

-- To clear table data
truncate table Videos;

-- To drop the table
drop table Videos;


-- Step 6: Create Comments Table ----------------------------------------------------------
create table Comments(
    Comment_id int primary key,
    Video_id int,
    User_id int,
    Comment_text text,
    Timestamp timestamp,
    foreign key (Video_id) references Videos(Video_id),
    foreign key (User_id) references Users(User_id)
);

insert into Comments values
(1, 1, 2, 'Great video Alice!', '2023-01-23 10:00:00'),
(2, 2, 3, 'Very informative.', '2023-03-02 12:30:00'),
(3, 3, 4, 'Yummy recipe!', '2023-03-21 14:15:00'),
(4, 4, 5, 'Motivating workout.', '2023-04-13 16:45:00'),
(5, 5, 6, 'Love these songs.', '2023-05-22 18:00:00'),
(6, 6, 7, 'Japan looks amazing!', '2023-07-06 20:10:00'),
(7, 7, 8, 'Great gameplay!', '2023-08-11 09:00:00'),
(8, 8, 9, 'Nice tutorial.', '2023-08-26 11:25:00'),
(9, 9, 10, 'Thanks for the review.', '2023-10-01 13:40:00'),
(10, 10, 1, 'I will try this DIY.', '2023-10-21 15:55:00');

-- To view Comments data
select * from Comments;

-- To clear table data
truncate table Comments;

-- To drop the table
drop table Comments;


-- Step 7: Create Likes Table ----------------------------------------------------------
create table Likes(
    Like_id int primary key,
    Video_id int,
    User_id int,
    Like_Date date,
    Reaction_Type varchar(50),
    foreign key (Video_id) references Videos(Video_id),
    foreign key (User_id) references Users(User_id)
);

insert into Likes values
(1, 1, 3, '2023-01-23', 'Like'),
(2, 2, 4, '2023-03-02', 'Love'),
(3, 3, 5, '2023-03-21', 'Like'),
(4, 4, 6, '2023-04-13', 'Like'),
(5, 5, 7, '2023-05-22', 'Love'),
(6, 6, 8, '2023-07-06', 'Like'),
(7, 7, 9, '2023-08-11', 'Like'),
(8, 8, 10, '2023-08-26', 'Love'),
(9, 9, 1, '2023-10-01', 'Like'),
(10, 10, 2, '2023-10-21', 'Love');

-- To view Likes data
select * from Likes;

-- To clear table data
truncate table Likes;

-- To drop the table
drop table Likes;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Users;
select * from Channels;
select * from Videos;
select * from Comments;
select * from Likes;