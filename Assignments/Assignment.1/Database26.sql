/*
This file consists of a database named FASHION_EVENT, which stores data related to global fashion events, models, designers, collections, and sponsors.

Table.1 - FASHION_EVENTS TABLE - (Stores details about each fashion event)
        Attributes: Event_id, Event_name, Location, Start_Date, End_Date, Organizer

Table.2 - MODELS TABLE - (Stores personal and agency details of fashion models)
        Attributes: Model_id, Model_Name, Age, Country, Agency

Table.3 - DESIGNERS TABLE - (Stores fashion designers and their specialization)
        Attributes: Designer_id, Name, Country, Style_Focus, Experience

Table.4 - COLLECTIONS TABLE - (Stores collection info launched by designers at events)
        Attributes: Collection_id, Designer_id, Event_id, Season, Theme, Number_of_Outfit

Table.5 - SPONSORS TABLE - (Stores sponsorship and contact details)
        Attributes: Sponsor_id, Sponsor_name, Industry, Sponsorship_Amount, Contact_Person

Step-by-step Creation of FASHION_EVENT Database:
Step 1: Create the Database  
Step 2: Use the Database  
Step 3: Create Fashion_Events Table + Insert Data  
Step 4: Create Models Table + Insert Data  
Step 5: Create Designers Table + Insert Data  
Step 6: Create Collections Table + Insert Data  
Step 7: Create Sponsors Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Fashion_Event;

-- Step 2: Use the Database
use Fashion_Event;


-- Step 3: Create Fashion_Events Table ---------------------------------------------------
create table Fashion_Events(
    Event_id int primary key,
    Event_name varchar(100),
    Location varchar(20),
    Start_Date date,
    End_Date date,
    Organizer text
);

insert into Fashion_Events values
(1, 'paris fashion week', 'paris', '2024-03-01', '2024-03-07', 'cfda'),
(2, 'new york fashion week', 'new york', '2024-09-05', '2024-09-12', 'cfda'),
(3, 'milan fashion week', 'milan', '2024-02-20', '2024-02-26', 'camera moda'),
(4, 'london fashion week', 'london', '2024-06-10', '2024-06-16', 'british council'),
(5, 'tokyo fashion week', 'tokyo', '2024-04-01', '2024-04-06', 'japan fashion week org'),
(6, 'berlin fashion week', 'berlin', '2024-07-01', '2024-07-05', 'fashion council germany'),
(7, 'dubai fashion show', 'dubai', '2024-11-15', '2024-11-20', 'dubai designs'),
(8, 'mumbai fashion week', 'mumbai', '2024-12-01', '2024-12-06', 'fdi india'),
(9, 'sydney fashion fest', 'sydney', '2024-08-10', '2024-08-15', 'australian fashion council'),
(10, 'lagos fashion week', 'lagos', '2024-10-05', '2024-10-10', 'nigerian style org');

-- To view Fashion_Events data
select * from Fashion_Events;

-- To clear Fashion_Events data
truncate table Fashion_Events;

-- To drop Fashion_Events table
drop table Fashion_Events;


-- Step 4: Create Models Table ----------------------------------------------------------
create table Models(
    Model_id int primary key,
    Model_Name varchar(50),
    Age int,
    Country varchar(20),
    Agency varchar(40)
);

insert into Models values
(1, 'bella hadid', 27, 'usa', 'img models'),
(2, 'gigi hadid', 29, 'usa', 'img models'),
(3, 'kendall jenner', 28, 'usa', 'the society'),
(4, 'adut akech', 25, 'south sudan', 'elite model mgmt'),
(5, 'liu wen', 32, 'china', 'model management'),
(6, 'winnie harlow', 30, 'canada', 'caa fashion'),
(7, 'vittoria ceretti', 26, 'italy', 'viva model'),
(8, 'jon kortajarena', 39, 'spain', 'img models'),
(9, 'lucky blue smith', 27, 'usa', 'next model mgmt'),
(10, 'naomi campbell', 54, 'uk', 'dna models');

-- To view Models data
select * from Models;

-- To clear Models data
truncate table Models;

-- To drop Models table
drop table Models;


-- Step 5: Create Designers Table -------------------------------------------------------
create table Designers(
    Designer_id int primary key,
    Name varchar(50),
    Country varchar(20),
    Style_Focus varchar(20),
    Experience int
);

insert into Designers values
(1, 'giorgio armani', 'italy', 'classic', 45),
(2, 'virgil abloh', 'usa', 'streetwear', 15),
(3, 'donatella versace', 'italy', 'luxury', 30),
(4, 'manish malhotra', 'india', 'ethnic', 28),
(5, 'ralph lauren', 'usa', 'preppy', 50),
(6, 'reina komai', 'japan', 'minimalist', 10),
(7, 'oscar de la renta', 'dominican rep.', 'formal', 40),
(8, 'alexander mcqueen', 'uk', 'avant-garde', 20),
(9, 'elie saab', 'lebanon', 'couture', 35),
(10, 'stella mccartney', 'uk', 'eco-fashion', 18);

-- To view Designers data
select * from Designers;

-- To clear Designers data
truncate table Designers;

-- To drop Designers table
drop table Designers;


-- Step 6: Create Collections Table ------------------------------------------------------
create table Collections(
    Collection_id int primary key,
    Designer_id int,
    Event_id int,
    Season varchar(20),
    Theme varchar(20),
    Number_of_Outfit int,
    foreign key (Designer_id) references Designers(Designer_id),
    foreign key (Event_id) references Fashion_Events(Event_id)
);

insert into Collections values
(1, 1, 1, 'spring', 'elegance', 25),
(2, 2, 2, 'fall', 'urban vibes', 30),
(3, 3, 3, 'summer', 'mediterranean', 28),
(4, 4, 8, 'bridal', 'royal india', 35),
(5, 5, 2, 'winter', 'vintage prep', 20),
(6, 6, 5, 'autumn', 'serenity', 15),
(7, 7, 4, 'evening', 'enchanted', 32),
(8, 8, 3, 'haute', 'gothic glam', 40),
(9, 9, 7, 'evening', 'midnight muse', 22),
(10, 10, 6, 'resort', 'green luxe', 18);

-- To view Collections data
select * from Collections;

-- To clear Collections data
truncate table Collections;

-- To drop Collections table
drop table Collections;


-- Step 7: Create Sponsors Table ---------------------------------------------------------
create table Sponsors(
    Sponsor_id int primary key,
    Sponsor_name varchar(50),
    Industry varchar(50),
    Sponsorship_Amount int,
    Contact_Person varchar(50)
);

insert into Sponsors values
(1, 'loreal', 'cosmetics', 200000, 'emma thompson'),
(2, 'vogue', 'fashion magazine', 150000, 'anna wintour'),
(3, 'mercedes benz', 'automobile', 250000, 'karl schmidt'),
(4, 'zara', 'fashion retail', 100000, 'paula garcia'),
(5, 'estee lauder', 'cosmetics', 180000, 'susan lee'),
(6, 'unilever', 'consumer goods', 130000, 'rajat kapoor'),
(7, 'nike', 'sportswear', 160000, 'john smith'),
(8, 'coca-cola', 'beverages', 175000, 'lucy mendez'),
(9, 'h&m', 'fashion retail', 120000, 'karla andersen'),
(10, 'mac cosmetics', 'makeup', 190000, 'nina gold');

-- To view Sponsors data
select * from Sponsors;

-- To clear Sponsors data
truncate table Sponsors;

-- To drop Sponsors table
drop table Sponsors;


-- Step 8: View All Tables ----------------------------------------------------------------
select * from Fashion_Events;
select * from Models;
select * from Designers;
select * from Collections;
select * from Sponsors;