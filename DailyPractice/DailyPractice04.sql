-- ----------------------------------------- Database Queries ------------------------------------------
-- create a database first
create database Airlines;

-- to work on this database, you need to use it first
use Airlines;

-- --------------------------------------- Database Analysis --------------------------------------------
/*
T1  : Airlines(Airline_id, Name, Country, Established_year, Rating)

T2  : Airports(Airport_id, Name, City, Country, Airport_code)

T3  : Aircrafts(Aircraft_id, Model, Manufacturer, Capacity, Airline_id)

T4  : Flights(Flight_id, Airline_id, Aircraft_id, From_Airport, To_Airport, Departure_time, Arrival_time)

T5  : Passengers(Passenger_id, Full_name, Email, Phone, Nationality)

T6  : Bookings(Booking_id, Passenger_id, Flight_id, Booking_date, Seat_no)

T7  : Crew(Crew_id, Name, Role, Experience_years, Airline_id)

T8  : Tickets(Ticket_id, Booking_id, Price, Travel_class, Status)

T9  : Payments(Payment_id, Ticket_id, Payment_date, Amount, Method)

T10 : Reviews(Review_id, Passenger_id, Airline_id, Rating, Comments)
*/
-- --------------------------------------- Table Related Queries ---------------------------------
-- Table-1 Airlines----------------------------------------------------------------------------------
create table Airlines (
    Airline_id int primary key,
    Name varchar(50),
    Country varchar(50),
    Established_year int,
    Rating float
);

insert into Airlines values
(1, 'IndiGo', 'India', 2006, 4.5),
(2, 'Air India', 'India', 1932, 4.0),
(3, 'Emirates', 'UAE', 1985, 4.8),
(4, 'Qatar Airways', 'Qatar', 1993, 4.9),
(5, 'SpiceJet', 'India', 2005, 4.2);

-- to display table data
select * from Airlines;
-- to remove complete records from table
truncate table Airlines;
-- to remove complete records and attributes from table
drop table Airlines;

-- 5 SELECT QERIES
-- 1.select Airlines(id,name,country)
select Airline_id,Name,Country from Airlines; 
-- 2.select Airlines with country 'India'
select * from Airlines where country = 'India';
-- 3.select Airlines with Established_year before 2000
select * from Airlines where Established_year < 2000;
-- 4.select Airlines with name 'Emirates'
select * from Airlines where name = 'Emirates';
-- 5.select Airlines ordered by rating
select * from Airlines order by rating desc;

-- 5 ALTER QUERIES
-- 1.add new column headquarters
alter table Airlines add column headquarters varchar(50);
-- 2.modify country column varchar(50) --> varchar(25)
alter table Airlines modify column country varchar(25);
-- 3.change column Name --> Airline_name
alter table Airlines change column Name Airline_name varchar(50);
-- 4.change the datatype of headquarters from varchar(50) --> text
alter table Airlines modify column headquarters text;
-- 5.drop headquarters column
alter table Airlines drop column headquarters;

-- 5 DELETE QUERIES
-- 1. delete airline with ID 5
delete from airlines where airline_id = 5;
-- 2. delete airline named 'Emirates'
delete from airlines where Airline_name = 'Emirates';
-- 3. delete airlines based in 'India'
delete from airlines where country = 'India';
-- 4. delete airlines established before 2000
delete from airlines where established_year < 2000;
-- 5. delete airlines with rating less than 4.5
delete from airlines where rating < 4.5;



-- Table-2 Airports----------------------------------------------------------------------------------
create table Airports (
    Airport_id int primary key,
    Name varchar(50),
    City varchar(50),
    Country varchar(50),
    Airport_code char(3)
);

insert into Airports values
(1, 'Chhatrapati Shivaji Maharaj Int’l', 'Mumbai', 'India', 'BOM'),
(2, 'Indira Gandhi Int’l', 'Delhi', 'India', 'DEL'),
(3, 'Dubai Int’l', 'Dubai', 'UAE', 'DXB'),
(4, 'Kempegowda Int’l', 'Bangalore', 'India', 'BLR'),
(5, 'Doha Int’l', 'Doha', 'Qatar', 'DOH');

-- to display table data
select * from Airports;
-- to remove complete records from table
truncate table Airports;
-- to remove complete records and attributes from table
drop table Airports;

-- 5 SELECT QERIES
-- 1.select Airports(id,Name,City)
select Airport_id,Name,City from Airports;
-- 2.select Airports with country 'India'
select * from Airports where country = 'India';
-- 3.select Airports name having 'shivaji'
select * from Airports where name like '%shivaji%';
-- 4.select Airports with code 'DOH'
select * from Airports where airport_code = 'DOH';
-- 5.select Airports ordered by country
select * from Airports order by country;

-- 5 ALTER QUERIES
-- 1.add terminals column
alter table Airports add column terminals int;
-- 2.add aircrafts column with defaul value 50
alter table Airports add column Aircrafts int default 50;
-- 3.rename the airport (name) --> (Airport_Name)
alter table Airports change column Name Airport_Name varchar(100);
-- 4.modify the datatype of city along with not null constraint
alter table Airports modify column city varchar(50) not null;
-- 5.drop the terminals column
alter table Airports drop column Terminals;

-- 5 DELETE QUERIES
-- 1. delete airport with ID 3
delete from airports where airport_id = 3;
-- 2. delete airports located in 'Doha'
delete from airports where city = 'Doha';
-- 3. delete Indian airports
delete from airports where country = 'India';
-- 4. delete airports whose name contains 'Int’l'
delete from airports where Airport_Name like '%Int’l%';
-- 5. delete airport with Airport_code 'DEL'
delete from airports where Airport_code = 'DEL';



-- Table-3 Aircrafts----------------------------------------------------------------------------------
create table Aircrafts (
    Aircraft_id int primary key,
    Model varchar(50),
    Manufacturer varchar(50),
    Capacity int,
    Airline_id int,
    foreign key (Airline_id) references Airlines(Airline_id)
);

insert into Aircrafts values
(1, 'A320', 'Airbus', 180, 1),
(2, 'B777', 'Boeing', 350, 3),
(3, 'A350', 'Airbus', 325, 4),
(4, 'B737', 'Boeing', 189, 5),
(5, 'A321', 'Airbus', 236, 2);

-- to display table data
select * from Aircrafts;
-- to remove complete records from table
truncate table Aircrafts;
-- to remove complete records and attributes from table
drop table Aircrafts;

-- 5 SELECT QERIES
-- 1.select Aircrafts(id,model,capacity)
select Aircraft_id,Model,Capacity from Aircrafts;
-- 2.select Aircrafts with 300+ capacity
select * from Aircrafts where capacity > 300;
-- 3.select Aircrafts with manufacturer 'airbus'
select * from Aircrafts where manufacturer = 'Airbus';
-- 4.select Aircrafts ordered by largest capacity
select * from Aircrafts order by capacity desc;
-- 5.select Aircrafts with airline_id 5
select * from Aircrafts where airline_id = 5;

-- 5 ALTER QUERIES
-- 1.add mfg_date column
alter table Aircrafts add column mfg_date date default '2005-01-01';
-- 2.add mfg_date column with defaul date '2005-01-01'
alter table Aircrafts modify column mfg_date datetime;
-- 3.rename the airport (model) --> (Model_Name)
alter table Aircrafts change column model Model_Name varchar(30);
-- 4.modify the datatype of model
alter table Aircrafts modify column model varchar(25);
-- 5.drop the mfg_date column
alter table Aircrafts drop column mfg_date;

-- 5 DELETE QUERIES
-- 1. delete aircraft with ID 4
delete from aircrafts where aircraft_id = 4;
-- 2. delete aircrafts made by 'Airbus'
delete from aircrafts where manufacturer = 'Airbus';
-- 3. delete aircrafts with capacity over 300
delete from aircrafts where capacity > 300;
-- 4. delete aircrafts with model 'B777'
delete from aircrafts where model = 'B777';
-- 5. delete aircrafts operated by airline ID 2
delete from aircrafts where airline_id = 2;


-- Table-4 Flights----------------------------------------------------------------------------------
create table Flights (
    Flight_id int primary key,
    Airline_id int,
    Aircraft_id int,
    From_Airport int,
    To_Airport int,
    Departure_time datetime,
    Arrival_time datetime,
    foreign key (Airline_id) references Airlines(Airline_id),
    foreign key (Aircraft_id) references Aircrafts(Aircraft_id),
    foreign key (From_Airport) references Airports(Airport_id),
    foreign key (To_Airport) references Airports(Airport_id)
);

insert into Flights values
(1, 1, 1, 1, 2, '2025-07-01 06:00:00', '2025-07-01 08:15:00'),
(2, 3, 2, 3, 2, '2025-07-02 10:00:00', '2025-07-02 14:30:00'),
(3, 4, 3, 5, 1, '2025-07-03 20:00:00', '2025-07-03 23:00:00'),
(4, 5, 4, 4, 2, '2025-07-04 12:00:00', '2025-07-04 14:00:00'),
(5, 2, 5, 2, 3, '2025-07-05 09:00:00', '2025-07-05 13:00:00');

-- to display table data
select * from Flights;
-- to remove complete records from table
truncate table Flights;
-- to remove complete records and attributes from table
drop table Flights;

-- 5 SELECT QERIES
-- 1.select Flights(id,departure_time,arrival_time)
select Flight_id,departure_time,arrival_time from Flights;
-- 2.select Flights with departure time before 12:00
select * from Flights where time(departure_time) < '12:00:00';
-- 3.select Flights with destination_airport_id = 2
select * from Flights where to_airport = 2;
-- 4.select Flights with startigLocation_airport_id = 2
select * from Flights where from_airport = 2;
-- 5.select Flights ordered by arrival time
select * from Flights order by arrival_time;

-- 5 ALTER QUERIES
-- 1.add column flight_duration
alter table flights add flight_duration time;
-- 2.add column flight_status
alter table flights add flight_status varchar(30);
-- modify column flight_id --> flight_number
alter table flights change flight_id flight_number int;
-- modify arrival_time time --> datetime
alter table flights modify arrival_time datetime;
-- drop column gate_number
alter table flights drop column gate_number;

-- 5 DELETE QUERIES
-- 1. delete flight with ID 1
delete from flights where flight_number = 1;
-- 2. delete flights departing from airport ID 2
delete from flights where from_airport = 2;
-- 3. delete flights landing at airport ID 1
delete from flights where to_airport = 1;
-- 4. delete flights scheduled after '2025-07-03'
delete from flights where departure_time > '2025-07-03 00:00:00';
-- 5. delete flights by airline ID 5
delete from flights where airline_id = 5;



-- Table-5 Passengers----------------------------------------------------------------------------------
create table Passengers (
    Passenger_id int primary key,
    Full_name varchar(50),
    Email varchar(50),
    Phone varchar(15),
    Nationality varchar(30)
);

insert into Passengers values
(1, 'Ravi Kumar', 'ravi@gmail.com', '9876543210', 'Indian'),
(2, 'Sara Ali', 'sara@gmail.com', '9832456789', 'Indian'),
(3, 'John Smith', 'john@gmail.com', '9812345678', 'British'),
(4, 'Aisha Khan', 'aisha@gmail.com', '9798765432', 'Pakistani'),
(5, 'Li Wei', 'liwei@gmail.com', '9765432109', 'Chinese');

-- to display table data
select * from Passengers;
-- to remove complete records from table
truncate table Passengers;
-- to remove complete records and attributes from table
drop table Passengers;

-- 5 SELECT QERIES
-- 1.select Passengers(id,full_name,phone)
select passenger_id,full_name,phone from Passengers;
-- 2.select Passengers with nationality 'Indian'
select * from Passengers where nationality = 'Indian';
-- 3.select passengers with name length < 7
select * from Passengers where char_length(full_name) < 7 ;
-- 4.select passengers with specific name
select * from Passengers where full_name = 'Ravi Kumar';
-- 5.select passengers with specific id '4'
select * from Passengers where passenger_id = 4;

-- 5 ALTER QUERIES
-- 1.add column date_of _birth
alter table passengers add date_of_birth date;
-- 2.modify name full_name --> passenger_name
alter table passengers change full_name passenger_name varchar(50);
-- 3.modify email varchar(50) -->  varchar(100)
alter table passengers modify email varchar(100);
-- 4.drop column phone
alter table passengers drop column phone;
-- drop column gender
alter table passengers drop column gender;

-- 5 DELETE QUERIES
-- 1. delete passenger with ID 5
delete from passengers where passenger_id = 5;
-- 2. delete passengers with nationality 'Indian'
delete from passengers where nationality = 'Indian';
-- 3. delete passengers using Gmail
delete from passengers where email like '%gmail.com';
-- 4. delete passenger named 'John Smith'
delete from passengers where passenger_name = 'John Smith';
-- 5. delete passenger with phone number '9798765432'
delete from passengers where phone = '9798765432';



-- Table-6 Bookings----------------------------------------------------------------------------------
create table Bookings (
    Booking_id int primary key,
    Passenger_id int,
    Flight_id int,
    Booking_date date,
    Seat_no varchar(5),
    foreign key (Passenger_id) references Passengers(Passenger_id),
    foreign key (Flight_id) references Flights(Flight_id)
);

insert into Bookings values
(1, 1, 1, '2025-06-01', '12A'),
(2, 2, 2, '2025-06-02', '15B'),
(3, 3, 3, '2025-06-03', '10C'),
(4, 4, 4, '2025-06-04', '8D'),
(5, 5, 5, '2025-06-05', '14E');

-- to display table data
select * from Bookings;
-- to remove complete records from table
truncate table Bookings;
-- to remove complete records and attributes from table
drop table Bookings;

-- 5 SELECT QERIES
-- 1.select bookings(id,date)
select booking_id,booking_date from Bookings;
-- 2.select bookings with seatno containing 'C' 
select * from Bookings where seat_no like '%c%';
-- 3.select booking with booking date before 2025-06-03
select * from Bookings where booking_date < '2025-06-03';
-- 4.select bookings where passenger_id '3' and flight_id '4'
select * from Bookings where passenger_id = 3 or flight_id = 4;
-- 5.select bookings ordered by passenger_id
select * from Bookings order by passenger_id;

-- 5 ALTER QUERIES
-- 1.add column travel_insuarance
alter table bookings add travel_insurance boolean;
-- 2.add column booking_status
alter table bookings add booking_status varchar(20);
-- 3.modify seat_no varchar(5) --> varchar(10)
alter table bookings modify seat_no varchar(10);
-- 4. modify seat_no --> seat_number
alter table bookings change seat_no seat_number varchar(10);
-- drop column travel_insuarance
alter table bookings drop column travel_insurance;

-- 5 DELETE QUERIES
-- 1. delete booking with ID 3
delete from bookings where booking_id = 3;
-- 2. delete booking for seat '12A'
delete from bookings where seat_number = '12A';
-- 3. delete bookings made on '2025-06-05'
delete from bookings where booking_date = '2025-06-05';
-- 4. delete bookings for passenger ID 1
delete from bookings where passenger_id = 1;
-- 5. delete bookings for flight ID 4
delete from bookings where flight_id = 4;



-- Table-7 Crew----------------------------------------------------------------------------------
create table Crew (
    Crew_id int primary key,
    Name varchar(50),
    Role varchar(30),
    Experience_years int,
    Airline_id int,
    foreign key (Airline_id) references Airlines(Airline_id)
);

insert into Crew values
(1, 'Captain Raj', 'Pilot', 12, 1),
(2, 'Anita Das', 'Flight Attendant', 6, 3),
(3, 'John Mathew', 'Co-Pilot', 8, 4),
(4, 'Reema Kapoor', 'Flight Attendant', 5, 5),
(5, 'Ali Zafar', 'Pilot', 10, 2);

-- to display table data
select * from Crew;
-- to remove complete records from table
truncate table Crew;
-- to remove complete records and attributes from table
drop table Crew;

-- 5 SELECT QERIES
-- 1.select crew(id,name,role)
select crew_id,name,role from Crew;
-- 2.select crew with role 'pilot'
select * from Crew where role = 'Pilot';
-- 3.select crew with experience > 7
select * from Crew where experience_years > 7;
-- 4.select crew ordered by airline_id
select * from Crew order by airline_id;
-- 5.select  crew with count of roles
select role,count(*) as role_count from Crew group by role;

-- 5 ALTER QUERIES
-- 1.add column license_number
alter table crew add license_number varchar(30);
-- 2.add column nationality
alter table crew add nationality varchar(30);
-- 3.modify crew name --> crew_member_name
alter table crew change name crew_member_name varchar(50);
-- 4.drop column license_number
alter table crew drop column license_number;
-- 5.drop column nationality 
alter table crew drop column nationality;

-- 5 DELETE QUERIES
-- 1. delete crew member with ID 2
delete from crew where crew_id = 2;
-- 2. delete crew with role 'Pilot'
delete from crew where role = 'Pilot';
-- 3. delete crew member named 'Reema Kapoor'
delete from crew where name = 'Reema Kapoor';
-- 4. delete crew with less than 10 years of experience
delete from crew where experience_years < 10;
-- 5. delete crew from airline ID 3
delete from crew where airline_id = 3;



-- Table-8 Tickets----------------------------------------------------------------------------------
create table Tickets (
    Ticket_id int primary key,
    Booking_id int,
    Price int,
    Travel_class varchar(20),
    Status varchar(20),
    foreign key (Booking_id) references Bookings(Booking_id)
);

insert into Tickets values
(1, 1, 6000, 'Economy', 'Confirmed'),
(2, 2, 12000, 'Business', 'Confirmed'),
(3, 3, 10000, 'Economy', 'Cancelled'),
(4, 4, 8000, 'Economy', 'Confirmed'),
(5, 5, 15000, 'First Class', 'Confirmed');

-- to display table data
select * from Tickets;
-- to remove complete records from table
truncate table Tickets;
-- to remove complete records and attributes from table
drop table Tickets;

-- 5 SELECT QERIES
-- 1.select ticket(id,price,travel_class)
select ticket_id,price,travel_class from Tickets;
-- 2.select tickets with price > 10000
select * from Tickets where price > 10000;
-- 3.select tickets with travel_class 'business'
select * from Tickets where travel_class = 'Business';
-- 4.select tickets confirmed and cancelled count
select status,count(status) as ticket from Tickets group by status;
-- 5.select tickets ordered by price
select * from Tickets order by price desc;

-- 5 ALTER QUERIES
-- 1.add column issued_date
alter table tickets add issued_date date;
-- 2.modify travel_class --> class_type
alter table tickets change travel_class class_type varchar(20);
-- 3.add column refundable
alter table tickets add refundable boolean;
-- 4.modify price int --> decimal
alter table tickets modify price decimal(8,2);
-- drop column baggage_allowance
alter table tickets drop column baggage_allowance;

-- 5 DELETE QUERIES
-- 1. delete ticket with ID 4
delete from tickets where ticket_id = 4;
-- 2. delete cancelled tickets
delete from tickets where status = 'Cancelled';
-- 3. delete tickets in Economy class
delete from tickets where class_type = 'Economy';
-- 4. delete tickets costing over 10000
delete from tickets where price > 10000;
-- 5. delete ticket with booking ID 5
delete from tickets where booking_id = 5;



-- Table-9 Payments----------------------------------------------------------------------------------
create table Payments (
    Payment_id int primary key,
    Ticket_id int,
    Payment_date date,
    Amount int,
    Method varchar(20),
    foreign key (Ticket_id) references Tickets(Ticket_id)
);

insert into Payments values
(1, 1, '2025-06-01', 6000, 'UPI'),
(2, 2, '2025-06-02', 12000, 'Credit Card'),
(3, 3, '2025-06-03', 10000, 'Debit Card'),
(4, 4, '2025-06-04', 8000, 'UPI'),
(5, 5, '2025-06-05', 15000, 'Net Banking');

-- to display table data
select * from Payments;
-- to remove complete records from table
truncate table Payments;
-- to remove complete records and attributes from table
drop table Payments;

-- 5 SELECT QERIES
-- 1.select payment(id,date,amount)
select payment_id,payment_date,amount from Payments;
-- 2.select payment with method containing 'card'
select * from Payments where method like '%card';
-- 3.select payments with method 'UPI'
select * from Payments where method = 'UPI';
-- 4.select payments with sum amount of each method
select method,sum(amount) from Payments group by method;
-- 5.select payment ordered by amount
select * from Payments order by amount desc;

-- 5 ALTER QUERIES
-- 1. add column transaction_id
alter table payments add transaction_id varchar(50);
-- 2. modify method varchar(20) --> varchar(30)
alter table payments modify method varchar(30);
-- 3.modify method --> payment_mode
alter table payments change method payment_mode varchar(20);
-- 4.add column currency
alter table payments add currency varchar(10);
-- 5.drop column transaction_id
alter table payments drop column transaction_id;

-- 5 DELETE QUERIES
-- 1. delete payment with ID 1
delete from payments where payment_id = 1;
-- 2. delete UPI payments
delete from payments where payment_mode = 'UPI';
-- 3. delete payments of amount 12000
delete from payments where amount = 12000;
-- 4. delete payments made on '2025-06-03'
delete from payments where payment_date = '2025-06-03';
-- 5. delete payments for ticket ID 4
delete from payments where ticket_id = 4;



-- Table-10 Reviews----------------------------------------------------------------------------------
create table Reviews (
    Review_id int primary key,
    Passenger_id int,
    Airline_id int,
    Rating int,
    Comments varchar(100),
    foreign key (Passenger_id) references Passengers(Passenger_id),
    foreign key (Airline_id) references Airlines(Airline_id)
);

insert into Reviews values
(1, 1, 1, 5, 'Excellent service'),
(2, 2, 3, 4, 'Good overall'),
(3, 3, 4, 5, 'Very comfortable flight'),
(4, 4, 5, 3, 'Average experience'),
(5, 5, 2, 4, 'Nice and smooth journey');

-- to display table data
select * from Reviews;
-- to remove complete records from table
truncate table Reviews;
-- to remove complete records and attributes from table
drop table Reviews;

-- 5 SELECT QERIES
-- 1.select reviews(id,rating,comments)
select review_id,rating,comments from Reviews;
-- 2.select reviews with comments containing 'good'
select * from Reviews where comments like '%good%';
-- 3.select reviews ordered by rating
select * from Reviews order by rating desc;
-- 4.select reviews with comments length > 17
select * from Reviews where char_length(comments) > 17;
-- 5.select reviews with rating 5
select * from Reviews where rating = 5;

-- 5 ALTER QUERIES
-- 1.add column review_date
alter table reviews add review_date date;
-- 2.add column flight_id
alter table reviews add flight_id int;
-- 3.add column is_verified
alter table reviews add is_verified boolean;
-- 4. modify rating  int --> decimal
alter table reviews modify rating decimal(5,2);
-- modify column comment --> feedback
alter table reviews change comments feedback varchar(100);

-- 5 DELETE QUERIES
-- 1. delete review with ID 5
delete from reviews where review_id = 5;
-- 2. delete reviews with rating less than 4
delete from reviews where rating < 4;
-- 3. delete reviews for airline ID 4
delete from reviews where airline_id = 4;
-- 4. delete reviews containing word 'flight'
delete from reviews where feedback like '%flight%';
-- 5. delete reviews by passenger ID 2
delete from reviews where passenger_id = 2;