-- Create the Database
create database Wedding_Planner;

-- Use the Database
use Wedding_Planner;

-- 	--------------------------------------Table-1.Clients Table ----------------------------------------------------------
create table Clients(
    Client_id int primary key,
    Name varchar(50),
    Email varchar(50),
    Phone varchar(15),
    Wedding_Date date
);

insert into Clients values
(1, 'Rahul Sharma', 'rahul@gmail.com', '9876543210', '2025-12-10'),
(2, 'Sneha Verma', 'sneha@gmail.com', '9823456789', '2025-11-15'),
(3, 'Amit Patel', 'amit@gmail.com', '9812345678', '2025-10-25'),
(4, 'Priya Singh', 'priya@gmail.com', '9798765432', '2025-09-05'),
(5, 'Karan Mehta', 'karan@gmail.com', '9765432109', '2025-12-31');

select * from Clients;
drop table Clients;
truncate table Clients;
-- 1.select clients(name and wedding dates) 
select Name,Wedding_Date from Clients ;
-- 2.select clients where wedding month is december(12) 
select * from Clients where month(Wedding_Date) = '12';
-- 3.select clients where wedding month is between 5 and 10 
select * from Clients where month(Wedding_Date) between 5 and 10;
-- 4.select clients order by wedding date 
select * from Clients order by Wedding_Date;
-- 5.select clients where the wedding is at end of the year 
select * from Clients order by Wedding_Date desc limit 1;


-- 	------------------------------------------------------Table-2.Guests Table ----------------------------------------------------------
create table Guests (
    Guest_id int primary key,
    Client_id int,
    Name varchar(50),
    Email varchar(50),
    Attended_status varchar(20),
    foreign key (Client_id) references Clients(Client_id)
);

insert into Guests values
(1, 1, 'Anjali Kapoor', 'anjali@gmail.com', 'Confirmed'),
(2, 1, 'Rohit Joshi', 'rohitj@gmail.com', 'Pending'),
(3, 2, 'Meena Sharma', 'meena@gmail.com', 'Confirmed'),
(4, 3, 'Suresh Rathi', 'suresh@gmail.com', 'Declined'),
(5, 4, 'Naina Desai', 'naina@gmail.com', 'Confirmed');

select * from Guests;
drop table Guests;
truncate table Guests;
-- 1.select Guests(name,guest_id and client_id) 
select Name,Guest_id,Client_id from Guests;
-- 2.select Guests whos attended the wedding 
select * from Guests where Attended_status = 'Confirmed';
-- 3.select clients whos not-attended the wedding 
select * from Guests where Attended_status = 'Declined';
-- 4.select clients count attending the wedding
select Attended_status,count(*) as Attendance_Count from Guests group by Attended_status;
-- 5.select guests(name,Attended_status) 
select Name,Attended_status from Guests;


-- -----------------------------------------------Table-3.Vendors Table ----------------------------------------------------------
create table Vendors(
    Vendor_id int primary key,
    Name varchar(50),
    Service_Type varchar(30),
    Contact varchar(15),
    Rating float
);

insert into Vendors values
(1, 'Floral Bliss', 'Decor', '9811111111', 4.5),
(2, 'Moments Captured', 'Photography', '9822222222', 4.8),
(3, 'Catering King', 'Catering', '9833333333', 4.6),
(4, 'DJ Beats', 'Entertainment', '9844444444', 4.4),
(5, 'The Dress House', 'Attire', '9855555555', 4.7);

select * from Vendors;
drop table Vendors;
truncate table Vendors;
-- 1.select Vendors(id,name,service_type) 
select Vendor_id,Name,Service_Type from Vendors;
-- 2.select Vendor(name) having contact no 
select * from Vendors where Name = 'DJ Beats';
-- 3.select Vendors with rating low to high
select * from Vendors order by Rating;
-- 4.Select Vendors with rating > 4.5
select * from Vendors where Rating > 4.5;
-- 5.select Vendors having service type Catering 
select * from Vendors where Service_Type = 'Catering';

-- -----------------------------------------------Table-4.Services Table ----------------------------------------------------------
create table Services (
    Service_id int primary key,
    Vendor_id int,
    Service_Name varchar(50),
    Description varchar(100),
    Price int,
    foreign key (Vendor_id) references Vendors(Vendor_id)
);

insert into Services values
(1, 1, 'Stage Decoration', 'Theme-based floral stage decoration', 70000),
(2, 2, 'Candid Photography', 'Pre-wedding and wedding day shoots', 50000),
(3, 3, 'Buffet Catering', 'Veg/Non-veg 5-course buffet', 90000),
(4, 4, 'DJ Night', '5-hour DJ with lights and smoke', 40000),
(5, 5, 'Bridal Lehenga', 'Designer bridal lehengas for rent/purchase', 60000);

select * from Services;
drop table Services;
truncate table Services;
-- 1. select Services(service ID, name, and description)
select Service_id, Service_Name, Description from Services;
-- 2. Select services priced > 60,000
select * from Services where Price > 60000;
-- 3. Select services offered by vendor with id '3'
select * from Services where Vendor_id = 3;
-- 4. Select services by price descending
select * from Services order by Price desc;
-- 5. select services by each vendor
select Vendor_id, COUNT(*) AS Total_Services from Services group by Vendor_id;


-- ---------------------------------------------------------Table-5.Venues Table -----------------------------------------------------------
create table Venues(
    Venue_id int primary key,
    Name varchar(50),
    Location varchar(50),
    Capacity int,
    Price_Per_Day int
);

insert into Venues values
(1, 'The Grand Hall', 'Mumbai', 500, 150000),
(2, 'Royal Palace', 'Delhi', 400, 120000),
(3, 'Sunset Garden', 'Goa', 300, 100000),
(4, 'Lakeview Resort', 'Udaipur', 600, 180000),
(5, 'Heaven Banquets', 'Bangalore', 450, 130000);

select * from Venues;
drop table Venues;
truncate table Venues;
-- 1. select venue name, location, and capacity
select Name, Location, Capacity FROM Venues;
-- 2. select venues located in Mumbai
select * from Venues where Location = 'Mumbai';
-- 3. select venues with capacity > 400
select * from Venues where Capacity > 400;
-- 4. select venues by price per day
select * from Venues order by Price_Per_Day desc;
-- 5. select average capacity of all venues
select avg(Capacity) as Average_Capacity from Venues;


-- -------------------------------------------------------------------Table-6.Events Table -----------------------------------------------------------
create table Events(
    Event_id int primary key,
    Client_id int,
    Venue_id int,
    Event_Type varchar(30),
    Event_Date date,
    foreign key (Client_id) references Clients(Client_id),
    foreign key (Venue_id) references Venues(Venue_id)
);

insert into Events values
(1, 1, 1, 'Reception', '2025-12-10'),
(2, 2, 2, 'Wedding', '2025-11-15'),
(3, 3, 3, 'Engagement', '2025-10-25'),
(4, 4, 4, 'Mehendi', '2025-09-05'),
(5, 5, 5, 'Sangeet', '2025-12-30');

select * from Events;
drop table Events;
truncate table Events;
-- 1. select event type and date
select Event_Type, Event_Date from Events;
-- 2. select events for client with ID 1
select * from Events where Client_id = 1;
-- 3. select events at 'Royal Palace'
select * from Events where Venue_id = 2;
-- 4. select events by date
select * from Events order by Event_Date;
-- 5.select Count number of events per type
select Event_Type, count(*) as Event_Count from Events group by Event_Type;


-- -------------------------------------------------------------------Table-7.Vendor_Bookings Table -----------------------------------------------------------
create table Vendor_Bookings (
    Booking_id int primary key,
    Event_id int,
    Vendor_id int,
    Service_Date date,
    Amount int,
    foreign key (Event_id) references Events(Event_id),
    foreign key (Vendor_id) references Vendors(Vendor_id)
);

insert into Vendor_Bookings values
(1, 1, 1, '2025-12-09', 100000),
(2, 1, 2, '2025-12-10', 80000),
(3, 2, 3, '2025-11-14', 90000),
(4, 3, 4, '2025-10-24', 50000),
(5, 5, 5, '2025-12-29', 60000);

select * from Vendor_Bookings;
drop table Vendor_Bookings;
truncate table Vendor_Bookings;
-- 1. select booking ID, event ID, vendor ID and amount
select Booking_id, Event_id, Vendor_id, Amount from Vendor_Bookings;
-- 2. select amount paid to each vendor
select Vendor_id, sum(Amount) as Total_Amount from Vendor_Bookings group by Vendor_id;
-- 3. select bookings on or after '2025-12-01'
select * from Vendor_Bookings where Service_Date >= '2025-12-01';
-- 4. select bookings related to Event ID 1
select * from Vendor_Bookings where Event_id = 1;
-- 5. select bookings by service date
select * from Vendor_Bookings order by Service_Date;

-- ----------------------------------------------Table-8.Budgets Table ----------------------------------------------------------
create table Budgets(
    Budget_id int primary key,
    Event_id int,
    Estimated_Cost int,
    Actual_Cost int,
    Notes text,
    foreign key (Event_id) references Events(Event_id)
);

insert into Budgets values
(1, 1, 500000, 480000, 'Stayed within budget, good vendor deals'),
(2, 2, 450000, 470000, 'Slight overspend on decor'),
(3, 3, 300000, 290000, 'Everything went smoothly'),
(4, 4, 200000, 195000, 'Entertainment was top-notch'),
(5, 5, 350000, 355000, 'Minor overspend on catering');

select * from Budgets;
drop table Budgets;
truncate table Budgets;
-- 1. Show event ID with estimated vs actual cost
select Event_id, Estimated_Cost, Actual_Cost from Budgets;
-- 2. Find events where actual cost exceeded estimate
select * from Budgets where Actual_Cost > Estimated_Cost;
-- 3. List budgets within ₹350000
select * from Budgets where Estimated_Cost <= 350000;
-- 4. Find difference between estimated and actual cost
select Event_id, (Estimated_Cost - Actual_Cost) as Cost_Difference from Budgets;
-- 5. select Count budgets with exact estimate match
select count(*) as Exact_Matches from Budgets where Estimated_Cost = Actual_Cost;


-- ----------------------------------------------Table-9.Payments Table ----------------------------------------------------------
create table Payments (
    Payment_id int primary key,
    Event_id int,
    Payment_Date date,
    Amount int,
    Payment_Method varchar(20),
    foreign key (Event_id) references Events(Event_id)
);

insert into Payments values
(1, 1, '2025-12-01', 150000, 'Credit Card'),
(2, 2, '2025-11-10', 120000, 'Bank Transfer'),
(3, 3, '2025-10-20', 90000, 'Cash'),
(4, 4, '2025-09-01', 70000, 'UPI'),
(5, 5, '2025-12-28', 110000, 'Debit Card');

select * from Payments;
drop table Payments;
truncate table Payments;
-- 1. select payments with method and amount
select Payment_Method, Amount from Payments;
-- 2. select payments made using 'Credit Card'
select * from Payments where Payment_Method = 'Credit Card';
-- 3. select sum of payments made for each event
select Event_id, sum(Amount) as Total_Paid from Payments group by Event_id;
-- 4. select payments before December 2025
select * from Payments where Payment_Date < '2025-12-01';
-- 5.select  Order payments by date
select * from Payments order by Payment_Date;


-- ----------------------------------------------Table-10.Feedback Table ----------------------------------------------------------
create table Feedback (
    Feedback_id int primary key,
    Client_id int,
    Vendor_id int,
    Rating int,
    Comments varchar(100),
    foreign key (Client_id) references Clients(Client_id),
    foreign key (Vendor_id) references Vendors(Vendor_id)
);

insert into Feedback values
(1, 1, 1, 5, 'Amazing decor service'),
(2, 2, 3, 4, 'Tasty food but slightly delayed'),
(3, 3, 4, 5, 'Excellent DJ performance'),
(4, 4, 2, 5, 'Great photography'),
(5, 5, 5, 4, 'Good outfit collection');

select * from Feedback;
drop table Feedback;
truncate table Feedback;
-- 1. select client ID, vendor ID, and rating
select Client_id, Vendor_id, Rating from Feedback;
-- 2. select all 5-star feedback
select * from Feedback where Rating = 5;
-- 3. select Count of feedback per vendor
select Vendor_id, count(*) as Feedback_Count from Feedback group by Vendor_id;
-- 4.select  Average rating per vendor
select Vendor_id, avg(Rating) as Avg_Rating from Feedback group by Vendor_id;
-- 5. select comments containing 'great'
select * from Feedback where Comments like '%great%';