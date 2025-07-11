-- create a database first
create database Airline;

-- to work on this database, you need to use it first
use Airline;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : Airlines(Airline_id, Name, Country, Established_year, Fleet_size, CEO, Email, Phone, Headquarters, Rating)
T2  : Airports(Airport_id, Name, City, Country, Airport_code, Timezone, Latitude, Longitude, Terminals, Opened_Year)
T3  : Aircrafts(Aircraft_id, Model, Manufacturer, Capacity, Range_km, Airline_id, Engine_Type, Built_Year, Status, Last_Service)
T4  : Flights(Flight_id, Airline_id, Aircraft_id, From_Airport, To_Airport, Departure_time, Arrival_time, Duration, Price, Status)
T5  : Passengers(Passenger_id, Full_name, Email, Phone, Gender, DOB, Nationality, Passport_Number, Address, FrequentFlyer_No)
T6  : Bookings(Booking_id, Passenger_id, Flight_id, Booking_date, Seat_no, Class, Luggage_Weight, Meal_Preference, Status, Special_Request)
T7  : Crew(Crew_id, Name, Role, Gender, DOB, Airline_id, Email, Phone, Experience_years, License_No)
T8  : Tickets(Ticket_id, Booking_id, Issue_Date, Valid_Till, Price, Travel_class, Discount, Total_Amount, Ticket_Type, Status)
T9  : Payments(Payment_id, Ticket_id, Payment_date, Amount, Method, Card_Number, Card_Holder, Expiry_Month, Expiry_Year, Status)
T10 : Reviews(Review_id, Passenger_id, Airline_id, Rating, Comments, Date, Flight_id, Class, Review_Type, Status)
*/

-- Table-1 Airlines ---------------------------------------------------------------------------------------------------------
create table airlines (
airline_id int primary key,
name varchar(100),
country varchar(50),
established_year int,
fleet_size int,
ceo varchar(100),
email varchar(100),
phone varchar(20),
headquarters varchar(100),
rating float
);


insert into Airlines values
(1, 'IndiGo', 'India', 2006, 300, 'Pieter Elbers', 'contact@goindigo.in', '18001023456', 'Gurgaon, India', 4.5),
(2, 'Air India', 'India', 1932, 120, 'Campbell Wilson', 'info@airindia.in', '18602331407', 'New Delhi, India', 4.0),
(3, 'Emirates', 'UAE', 1985, 260, 'Tim Clark', 'support@emirates.com', '+971600555555', 'Dubai, UAE', 4.8),
(4, 'Qatar Airways', 'Qatar', 1993, 230, 'Akbar Al Baker', 'qrsupport@qatarairways.com', '+97440230000', 'Doha, Qatar', 4.9),
(5, 'SpiceJet', 'India', 2005, 100, 'Ajay Singh', 'care@spicejet.com', '0124-4983410', 'Gurgaon, India', 4.2),
(6, 'Vistara', 'India', 2013, 60, 'Vinod Kannan', 'hello@airvistara.com', '9289228888', 'Gurgaon, India', 4.3),
(7, 'Lufthansa', 'Germany', 1953, 300, 'Carsten Spohr', 'info@lufthansa.com', '+49696900', 'Cologne, Germany', 4.6),
(8, 'British Airways', 'UK', 1974, 280, 'Sean Doyle', 'contact@ba.com', '+443442493078', 'London, UK', 4.4),
(9, 'Delta Air Lines', 'USA', 1924, 750, 'Ed Bastian', 'support@delta.com', '+18002211212', 'Atlanta, USA', 4.7),
(10, 'Singapore Airlines', 'Singapore', 1947, 130, 'Goh Choon Phong', 'customer@singaporeair.com', '+6562223888', 'Singapore', 4.9);

-- to display table data
select * from Airlines;
-- to remove complete records from table
truncate table Airlines;
-- to remove complete records and attributes from table
drop table Airlines;


-- Table-2 Airports ---------------------------------------------------------------------------------------------------------
create table airports (
airport_id int primary key,
name varchar(100),
city varchar(50),
country varchar(50),
airport_code char(3),
timezone varchar(50),
latitude decimal(8,4),
longitude decimal(8,4),
terminals int,
opened_year int
);

insert into Airports values
(1, 'Chhatrapati Shivaji Maharaj Int’l', 'Mumbai', 'India', 'BOM', 'Asia/Kolkata', 19.0896, 72.8656, 2, 1942),
(2, 'Indira Gandhi Int’l', 'Delhi', 'India', 'DEL', 'Asia/Kolkata', 28.5562, 77.1000, 3, 1935),
(3, 'Dubai Int’l', 'Dubai', 'UAE', 'DXB', 'Asia/Dubai', 25.2532, 55.3657, 3, 1960),
(4, 'Kempegowda Int’l', 'Bangalore', 'India', 'BLR', 'Asia/Kolkata', 13.1986, 77.7066, 1, 2008),
(5, 'Doha Int’l', 'Doha', 'Qatar', 'DOH', 'Asia/Qatar', 25.2611, 51.5650, 2, 2014),
(6, 'Heathrow', 'London', 'UK', 'LHR', 'Europe/London', 51.4700, -0.4543, 5, 1946),
(7, 'Frankfurt', 'Frankfurt', 'Germany', 'FRA', 'Europe/Berlin', 50.1109, 8.6821, 2, 1936),
(8, 'John F. Kennedy Int’l', 'New York', 'USA', 'JFK', 'America/New_York', 40.6413, -73.7781, 6, 1948),
(9, 'Changi', 'Singapore', 'Singapore', 'SIN', 'Asia/Singapore', 1.3644, 103.9915, 4, 1981),
(10, 'Los Angeles Int’l', 'Los Angeles', 'USA', 'LAX', 'America/Los_Angeles', 33.9416, -118.4085, 9, 1930);

-- to display table data
select * from Airports;
-- to remove complete records from table
truncate table Airports;
-- to remove complete records and attributes from table
drop table Airports;


-- table-3 Aircrafts --------------------------------------------------------------------------------------------------------
create table aircrafts (
aircraft_id int primary key,
model varchar(50),
manufacturer varchar(50),
capacity int,
range_km int,
airline_id int,
engine_type varchar(50),
built_year int,
status varchar(30),
last_service date
);

insert into aircrafts values
(1, 'A320', 'Airbus', 180, 6100, 1, 'Turbofan', 2019, 'Active', '2024-05-20'),
(2, 'B777', 'Boeing', 350, 9700, 3, 'Turbofan', 2018, 'Active', '2024-03-10'),
(3, 'A350', 'Airbus', 325, 15000, 4, 'Turbofan', 2020, 'Active', '2024-06-11'),
(4, 'B737', 'Boeing', 189, 5600, 5, 'Turbofan', 2017, 'In Maintenance', '2024-02-22'),
(5, 'A321', 'Airbus', 236, 5950, 2, 'Turbofan', 2016, 'Active', '2024-01-30'),
(6, 'A330', 'Airbus', 277, 13450, 6, 'Turbofan', 2021, 'Active', '2024-04-17'),
(7, 'B787', 'Boeing', 296, 14100, 7, 'Turbofan', 2022, 'Active', '2024-03-12'),
(8, 'A310', 'Airbus', 280, 11200, 8, 'Turbofan', 2015, 'Inactive', '2023-11-01'),
(9, 'B747', 'Boeing', 410, 13850, 9, 'Turbofan', 2014, 'Retired', '2022-09-18'),
(10, 'A380', 'Airbus', 555, 15700, 10, 'Turbofan', 2018, 'Active', '2024-06-01');

-- to display table data
select * from aircrafts;
-- to remove complete records from table
truncate table aircrafts;
-- to remove complete records and attributes from table
drop table aircrafts;


-- table-4 Flights ----------------------------------------------------------------------------------------------------------
create table flights (
flight_id int primary key,
airline_id int,
aircraft_id int,
from_airport int,
to_airport int,
departure_time datetime,
arrival_time datetime,
duration int,
price int,
status varchar(30)
);

insert into flights values
(1, 1, 1, 1, 2, '2025-07-01 06:00:00', '2025-07-01 08:15:00', 135, 6000, 'On Time'),
(2, 3, 2, 3, 2, '2025-07-02 10:00:00', '2025-07-02 14:30:00', 270, 12000, 'On Time'),
(3, 4, 3, 5, 1, '2025-07-03 20:00:00', '2025-07-03 23:00:00', 180, 10000, 'Delayed'),
(4, 5, 4, 4, 2, '2025-07-04 12:00:00', '2025-07-04 14:00:00', 120, 8000, 'On Time'),
(5, 2, 5, 2, 3, '2025-07-05 09:00:00', '2025-07-05 13:00:00', 240, 15000, 'Cancelled'),
(6, 6, 6, 2, 4, '2025-07-06 06:30:00', '2025-07-06 09:30:00', 180, 9500, 'On Time'),
(7, 7, 7, 7, 6, '2025-07-07 07:00:00', '2025-07-07 11:00:00', 240, 11000, 'On Time'),
(8, 8, 8, 6, 8, '2025-07-08 17:30:00', '2025-07-08 23:45:00', 375, 13500, 'On Time'),
(9, 9, 9, 8, 10, '2025-07-09 15:00:00', '2025-07-09 20:30:00', 330, 14500, 'Delayed'),
(10, 10, 10, 9, 1, '2025-07-10 21:00:00', '2025-07-11 02:00:00', 300, 16000, 'On Time');

-- to display table data
select * from flights;
-- to remove complete records from table
truncate table flights;
-- to remove complete records and attributes from table
drop table flights;


-- table-5 Passengers -------------------------------------------------------------------------------------------------------
create table passengers (
passenger_id int primary key,
full_name varchar(100),
email varchar(100),
phone varchar(20),
gender varchar(10),
dob date,
nationality varchar(50),
passport_number varchar(20),
address text,
frequentflyer_no varchar(30)
);

insert into passengers values
(1, 'Ravi Kumar', 'ravi@gmail.com', '9876543210', 'Male', '1990-01-15', 'Indian', 'M1234567', 'Pune, India', 'FF123456'),
(2, 'Sara Ali', 'sara@gmail.com', '9832456789', 'Female', '1992-03-22', 'Indian', 'P2345678', 'Delhi, India', 'FF234567'),
(3, 'John Smith', 'john@gmail.com', '9812345678', 'Male', '1985-11-10', 'British', 'B3456789', 'London, UK', 'FF345678'),
(4, 'Aisha Khan', 'aisha@gmail.com', '9798765432', 'Female', '1995-07-18', 'Pakistani', 'C4567890', 'Karachi, Pakistan', 'FF456789'),
(5, 'Li Wei', 'liwei@gmail.com', '9765432109', 'Male', '1988-12-25', 'Chinese', 'D5678901', 'Beijing, China', 'FF567890'),
(6, 'Maria Lopez', 'maria@gmail.com', '9723456781', 'Female', '1991-08-05', 'Spanish', 'E6789012', 'Madrid, Spain', 'FF678901'),
(7, 'David Lee', 'david@gmail.com', '9701234567', 'Male', '1982-04-30', 'Korean', 'F7890123', 'Seoul, Korea', 'FF789012'),
(8, 'Fatima Noor', 'fatima@gmail.com', '9687654321', 'Female', '1996-09-09', 'Bangladeshi', 'G8901234', 'Dhaka, Bangladesh', 'FF890123'),
(9, 'George Brown', 'george@gmail.com', '9654321098', 'Male', '1980-06-12', 'American', 'H9012345', 'New York, USA', 'FF901234'),
(10, 'Nina Patel', 'nina@gmail.com', '9632109876', 'Female', '1993-02-28', 'Indian', 'I0123456', 'Mumbai, India', 'FF012345');

-- to display table data
select * from passengers;
-- to remove complete records from table
truncate table passengers;
-- to remove complete records and attributes from table
drop table passengers;


-- Table-6 Bookings ---------------------------------------------------------------------------------------------------------
create table bookings (
booking_id int primary key,
passenger_id int,
flight_id int,
booking_date date,
seat_no varchar(5),
class varchar(20),
luggage_weight int,
meal_preference varchar(30),
status varchar(20),
special_request text,
foreign key (passenger_id) references passengers(passenger_id),
foreign key (flight_id) references flights(flight_id)
);

insert into bookings values
(1, 1, 1, '2025-06-01', '12A', 'Economy', 15, 'Veg', 'Confirmed', ''),
(2, 2, 2, '2025-06-02', '15B', 'Business', 20, 'Non-Veg', 'Confirmed', ''),
(3, 3, 3, '2025-06-03', '10C', 'Economy', 10, 'Veg', 'Cancelled', 'Window seat'),
(4, 4, 4, '2025-06-04', '8D', 'Economy', 18, 'Jain', 'Confirmed', ''),
(5, 5, 5, '2025-06-05', '14E', 'First', 25, 'Non-Veg', 'Confirmed', 'Wheelchair'),
(6, 6, 6, '2025-06-06', '16F', 'Economy', 15, 'Veg', 'Confirmed', ''),
(7, 7, 7, '2025-06-07', '9G', 'Business', 20, 'Non-Veg', 'Confirmed', 'Extra legroom'),
(8, 8, 8, '2025-06-08', '5H', 'First', 30, 'Veg', 'Confirmed', ''),
(9, 9, 9, '2025-06-09', '11I', 'Economy', 12, 'Jain', 'Confirmed', ''),
(10, 10, 10, '2025-06-10', '6J', 'Business', 20, 'Veg', 'Confirmed', '');

-- to display table data
select * from Bookings;
-- to remove complete records from table
truncate table Bookings;
-- to remove complete records and attributes from table
drop table Bookings;


-- Table-7 Crew -------------------------------------------------------------------------------------------------------------
create table crew (
crew_id int primary key,
name varchar(100),
role varchar(30),
gender varchar(10),
dob date,
airline_id int,
email varchar(100),
phone varchar(20),
experience_years int,
license_no varchar(20),
foreign key (airline_id) references airlines(airline_id)
);

insert into crew values
(1, 'Captain Raj', 'Pilot', 'Male', '1975-03-15', 1, 'raj@airline.com', '9999990001', 12, 'LIC123'),
(2, 'Anita Das', 'Flight Attendant', 'Female', '1988-05-20', 2, 'anita@airline.com', '9999990002', 6, 'LIC234'),
(3, 'John Mathew', 'Co-Pilot', 'Male', '1985-07-11', 3, 'john@airline.com', '9999990003', 8, 'LIC345'),
(4, 'Reema Kapoor', 'Flight Attendant', 'Female', '1990-10-01', 4, 'reema@airline.com', '9999990004', 5, 'LIC456'),
(5, 'Ali Zafar', 'Pilot', 'Male', '1978-12-22', 5, 'ali@airline.com', '9999990005', 10, 'LIC567'),
(6, 'Linda Smith', 'Flight Attendant', 'Female', '1989-09-12', 6, 'linda@airline.com', '9999990006', 4, 'LIC678'),
(7, 'Amar Singh', 'Pilot', 'Male', '1980-02-28', 7, 'amar@airline.com', '9999990007', 15, 'LIC789'),
(8, 'Sunita Rao', 'Flight Attendant', 'Female', '1991-06-25', 8, 'sunita@airline.com', '9999990008', 7, 'LIC890'),
(9, 'Robert Lee', 'Co-Pilot', 'Male', '1983-01-05', 9, 'robert@airline.com', '9999990009', 9, 'LIC901'),
(10, 'Meena Iyer', 'Flight Attendant', 'Female', '1992-11-11', 10, 'meena@airline.com', '9999990010', 3, 'LIC012');

-- to display table data
select * from Crew;
-- to remove complete records from table
truncate table Crew;
-- to remove complete records and attributes from table
drop table Crew;


-- Table-8 Tickets ----------------------------------------------------------------------------------------------------------
create table tickets (
ticket_id int primary key,
booking_id int,
issue_date date,
valid_till date,
price int,
travel_class varchar(20),
discount int,
total_amount int,
ticket_type varchar(20),
status varchar(20),
foreign key (booking_id) references bookings(booking_id)
);

insert into tickets values
(1, 1, '2025-06-01', '2025-07-01', 6000, 'Economy', 0, 6000, 'One Way', 'Confirmed'),
(2, 2, '2025-06-02', '2025-07-02', 12000, 'Business', 500, 11500, 'Round Trip', 'Confirmed'),
(3, 3, '2025-06-03', '2025-07-03', 10000, 'Economy', 1000, 9000, 'One Way', 'Cancelled'),
(4, 4, '2025-06-04', '2025-07-04', 8000, 'Economy', 0, 8000, 'One Way', 'Confirmed'),
(5, 5, '2025-06-05', '2025-07-05', 15000, 'First', 1000, 14000, 'Round Trip', 'Confirmed'),
(6, 6, '2025-06-06', '2025-07-06', 9500, 'Economy', 500, 9000, 'One Way', 'Confirmed'),
(7, 7, '2025-06-07', '2025-07-07', 11000, 'Business', 0, 11000, 'Round Trip', 'Confirmed'),
(8, 8, '2025-06-08', '2025-07-08', 13500, 'First', 0, 13500, 'One Way', 'Confirmed'),
(9, 9, '2025-06-09', '2025-07-09', 14500, 'Economy', 1000, 13500, 'One Way', 'Confirmed'),
(10, 10, '2025-06-10', '2025-07-10', 16000, 'Business', 500, 15500, 'Round Trip', 'Confirmed');

-- to display table data
select * from Tickets;
-- to remove complete records from table
truncate table Tickets;
-- to remove complete records and attributes from table
drop table Tickets;


-- Table-9 Payments ---------------------------------------------------------------------------------------------------------
create table payments (
payment_id int primary key,
ticket_id int,
payment_date date,
amount int,
method varchar(20),
card_number varchar(20),
card_holder varchar(50),
expiry_month int,
expiry_year int,
status varchar(20),
foreign key (ticket_id) references tickets(ticket_id)
);

insert into payments values
(1, 1, '2025-06-01', 6000, 'UPI', 'NA', 'Ravi Kumar', 0, 0, 'Paid'),
(2, 2, '2025-06-02', 11500, 'Credit Card', '1234123412341234', 'Sara Ali', 5, 2027, 'Paid'),
(3, 3, '2025-06-03', 9000, 'Debit Card', '5678567856785678', 'John Smith', 12, 2026, 'Refunded'),
(4, 4, '2025-06-04', 8000, 'Net Banking', 'NA', 'Aisha Khan', 0, 0, 'Paid'),
(5, 5, '2025-06-05', 14000, 'Credit Card', '8765876587658765', 'Li Wei', 3, 2028, 'Paid'),
(6, 6, '2025-06-06', 9000, 'UPI', 'NA', 'Maria Lopez', 0, 0, 'Paid'),
(7, 7, '2025-06-07', 11000, 'Debit Card', '1111222233334444', 'David Lee', 11, 2029, 'Paid'),
(8, 8, '2025-06-08', 13500, 'Net Banking', 'NA', 'Fatima Noor', 0, 0, 'Paid'),
(9, 9, '2025-06-09', 13500, 'Credit Card', '9999888877776666', 'George Brown', 7, 2026, 'Paid'),
(10, 10, '2025-06-10', 15500, 'UPI', 'NA', 'Nina Patel', 0, 0, 'Paid');

-- to display table data
select * from Payments;
-- to remove complete records from table
truncate table Payments;
-- to remove complete records and attributes from table
drop table Payments;


-- Table-10 Reviews ---------------------------------------------------------------------------------------------------------
create table reviews (
review_id int primary key,
passenger_id int,
airline_id int,
rating int,
comments varchar(200),
date date,
flight_id int,
class varchar(20),
review_type varchar(30),
status varchar(20),
foreign key (passenger_id) references passengers(passenger_id),
foreign key (airline_id) references airlines(airline_id),
foreign key (flight_id) references flights(flight_id)
);

insert into reviews values
(1, 1, 1, 5, 'Excellent service and friendly crew.', '2025-07-01', 1, 'Economy', 'Service', 'Published'),
(2, 2, 2, 4, 'Comfortable seats but delay in boarding.', '2025-07-02', 2, 'Business', 'Comfort', 'Published'),
(3, 3, 3, 3, 'Clean aircraft and good food.', '2025-07-03', 3, 'Economy', 'Food', 'Published'),
(4, 4, 4, 4, 'Helpful crew and smooth flight.', '2025-07-04', 4, 'Economy', 'Service', 'Published'),
(5, 5, 5, 5, 'Luxury experience in First Class.', '2025-07-05', 5, 'First', 'Overall', 'Published'),
(6, 6, 6, 4, 'Good experience overall.', '2025-07-06', 6, 'Economy', 'Comfort', 'Published'),
(7, 7, 7, 5, 'Excellent entertainment system.', '2025-07-07', 7, 'Business', 'Entertainment', 'Published'),
(8, 8, 8, 5, 'Great service and spacious seats.', '2025-07-08', 8, 'First', 'Service', 'Published'),
(9, 9, 9, 4, 'Delayed flight but courteous staff.', '2025-07-09', 9, 'Economy', 'Timeliness', 'Published'),
(10, 10, 10, 5, 'Amazing crew and smooth journey.', '2025-07-10', 10, 'Business', 'Overall', 'Published');

-- to display table data
select * from Reviews;
-- to remove complete records from table
truncate table Reviews;
-- to remove complete records and attributes from table
drop table Reviews;