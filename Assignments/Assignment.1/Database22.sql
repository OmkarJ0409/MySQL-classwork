/*
This file consists of a database named SMS_SPAM_DETECTION, which stores user details, message logs, interactions, spam features, and a blacklist for spam prevention and analysis.

Table.1 - USERS TABLE - (Stores user registration and activity details)
        Attributes: User_id, Phone_Number, Country, Signup_Date, is_Active

Table.2 - MESSAGES TABLE - (Stores messages sent between users)
        Attributes: Message_id, Sender_Number, Receiver_Number, Message_text, Sent_Timestamp

Table.3 - INTERACTIONS TABLE - (Tracks user interaction with messages)
        Attributes: Interaction_id, Message_id, User_id, Interaction_type, Interaction_Timestamp

Table.4 - SPAM_FEATURES TABLE - (Captures spam detection attributes for messages)
        Attributes: Feature_id, Message_id, Has_URL, Contains_Keywords, Message_Length

Table.5 - BLACKLISTED_NUMBERS TABLE - (Stores spammer phone numbers with reports)
        Attributes: Blacklist_id, Phone_Number, Reason, Date_Added, Reports_Count

Step-by-step Creation of Spam_Detection Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Messages Table + Insert Data  
Step 5: Create Interactions Table + Insert Data  
Step 6: Create Spam_Features Table + Insert Data  
Step 7: Create Blacklisted_Numbers Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Spam_Detection;

-- Step 2: Use the Database
use Spam_Detection;


-- Step 3: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    Phone_Number varchar(10),
    Country varchar(20),
    Signup_Date date,
    is_Active varchar(5)
);

insert into Users values
(1, '9123456780', 'india', '2023-01-15', 'yes'),
(2, '9234567891', 'india', '2023-02-01', 'yes'),
(3, '9345678912', 'usa', '2022-12-10', 'no'),
(4, '9456789123', 'uk', '2023-03-05', 'yes'),
(5, '9567891234', 'canada', '2023-03-22', 'no'),
(6, '9678912345', 'india', '2023-04-01', 'yes'),
(7, '9789123456', 'usa', '2023-01-20', 'yes'),
(8, '9891234567', 'uk', '2023-02-18', 'yes'),
(9, '9001234567', 'australia', '2023-04-10', 'no'),
(10, '9112345678', 'canada', '2023-05-05', 'yes');

-- To view Users data
select * from Users;

-- To clear Users data
truncate table Users;

-- To drop Users table
drop table Users;


-- Step 4: Create Messages Table ----------------------------------------------------------
create table Messages(
    Message_id int primary key,
    Sender_Number varchar(10),
    Receiver_Number varchar(10),
    Message_text text,
    Sent_Timestamp timestamp
);

insert into Messages values
(1, '9123456780', '9234567891', 'hello, how are you?', '2023-04-10 10:15:00'),
(2, '9345678912', '9456789123', 'you have won a prize! click here', '2023-04-11 12:45:00'),
(3, '9567891234', '9789123456', 'meeting at 3pm.', '2023-04-12 09:30:00'),
(4, '9001234567', '9112345678', 'urgent: update your account now!', '2023-04-12 16:00:00'),
(5, '9234567891', '9123456780', 'thanks for the info.', '2023-04-13 14:22:00'),
(6, '9456789123', '9345678912', 'you’ve been selected! claim now!', '2023-04-13 15:00:00'),
(7, '9678912345', '9234567891', 'let’s catch up tomorrow.', '2023-04-14 11:05:00'),
(8, '9789123456', '9678912345', 'limited offer just for you!', '2023-04-15 08:50:00'),
(9, '9891234567', '9567891234', 'hello, are you coming?', '2023-04-15 17:30:00'),
(10, '9112345678', '9001234567', 'click here to claim free cash!', '2023-04-16 10:10:00');

-- To view Messages data
select * from Messages;

-- To clear Messages data
truncate table Messages;

-- To drop Messages table
drop table Messages;


-- Step 5: Create Interactions Table ----------------------------------------------------------
create table Interactions(
    Interaction_id int primary key,
    Message_id int,
    User_id int,
    Interaction_type varchar(50),
    Interaction_Timestamp timestamp,
    foreign key (Message_id) references Messages(Message_id),
    foreign key (User_id) references Users(User_id)
);

insert into Interactions values
(1, 1, 2, 'received', '2023-04-10 10:15:30'),
(2, 2, 4, 'reported_spam', '2023-04-11 12:46:00'),
(3, 3, 7, 'received', '2023-04-12 09:31:00'),
(4, 4, 10, 'reported_spam', '2023-04-12 16:05:00'),
(5, 5, 1, 'received', '2023-04-13 14:23:00'),
(6, 6, 3, 'marked_spam', '2023-04-13 15:05:00'),
(7, 7, 2, 'received', '2023-04-14 11:06:00'),
(8, 8, 6, 'reported_spam', '2023-04-15 08:51:00'),
(9, 9, 5, 'received', '2023-04-15 17:31:00'),
(10, 10, 9, 'blocked_number', '2023-04-16 10:11:00');

-- To view Interactions data
select * from Interactions;

-- To clear Interactions data
truncate table Interactions;

-- To drop Interactions table
drop table Interactions;


-- Step 6: Create Spam_Features Table ----------------------------------------------------------
create table Spam_Features(
    Feature_id int primary key,
    Message_id int,
    Has_URL varchar(30),
    Contains_Keywords varchar(30),
    Message_Length varchar(30),
    foreign key (Message_id) references Messages(Message_id)
);

insert into Spam_Features values
(1, 2, 'yes', 'prize, click', '35'),
(2, 4, 'yes', 'urgent, account', '40'),
(3, 6, 'yes', 'selected, claim', '38'),
(4, 8, 'yes', 'offer, limited', '30'),
(5, 10, 'yes', 'click, cash', '32'),
(6, 1, 'no', 'none', '20'),
(7, 3, 'no', 'none', '18'),
(8, 5, 'no', 'none', '22'),
(9, 7, 'no', 'none', '24'),
(10, 9, 'no', 'none', '26');

-- To view Spam_Features data
select * from Spam_Features;

-- To clear Spam_Features data
truncate table Spam_Features;

-- To drop Spam_Features table
drop table Spam_Features;


-- Step 7: Create Blacklisted_Numbers Table ----------------------------------------------------------
create table Blacklisted_Numbers(
    Blacklist_id int primary key,
    Phone_Number varchar(10),
    Reason text,
    Date_Added date,
    Reports_Count int
);

insert into Blacklisted_Numbers values
(1, '9345678912', 'multiple spam reports', '2023-04-14', 5),
(2, '9001234567', 'reported by users', '2023-04-14', 4),
(3, '9456789123', 'sent suspicious links', '2023-04-15', 6),
(4, '9789123456', 'scam messages', '2023-04-15', 3),
(5, '9112345678', 'clickbait spam', '2023-04-16', 7),
(6, '9678912345', 'promotional spam', '2023-04-16', 2),
(7, '9234567891', 'repeated unsolicited messages', '2023-04-16', 3),
(8, '9567891234', 'phishing attempt', '2023-04-17', 6),
(9, '9123456780', 'user complaints', '2023-04-17', 4),
(10, '9891234567', 'spamming offers', '2023-04-18', 5);

-- To view Blacklisted_Numbers data
select * from Blacklisted_Numbers;

-- To clear Blacklisted_Numbers data
truncate table Blacklisted_Numbers;

-- To drop Blacklisted_Numbers table
drop table Blacklisted_Numbers;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Users;
select * from Messages;
select * from Interactions;
select * from Spam_Features;
select * from Blacklisted_Numbers;