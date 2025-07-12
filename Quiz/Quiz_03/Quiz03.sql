-- create a database first
create database viviana_mall;

-- to work on this database, you need to use it first
use viviana_mall;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*

T1  : stores(store_id, store_name, category, floor_no, contact_number, brand, opening_hours)
T2  : events(event_id, event_name, date, time, venue, organizer, target_audience)
T3  : parking(parking_id, vehicle_type, entry_time, exit_time, charges, parking_level)
T4  : employee(employee_id, store_id, name, designation, department)
T5  : feedback(feedback_id, customer_name, store_visited, rating, visit_date, comment, response)

*/

-- Table-1 Stores -----------------------------------------------------------------------------------------------------------
create table Stores(
Store_id int auto_increment primary key,
Store_name varchar(100) not null,
Category varchar(100) not null,
Floor_no int not null,
Contact_number varchar(20) not null,
Brand varchar(100) not null,
Opening_Hours varchar(100) not null
);

insert into stores (store_name, category, floor_no, contact_number, brand, opening_hours) values
('Zara', 'Fashion', 1, '022-12345678', 'Zara', '11:00 AM – 10:00 PM'),
('Croma', 'Electronics', 2, '022-87654321', 'Croma', '11:00 AM – 10:00 PM'),
('Starbucks', 'Cafe', 0, '022-11223344', 'Starbucks', '10:00 AM – 11:00 PM'),
('Pantaloons', 'Fashion', 1, '022-33445566', 'Pantaloons', '11:00 AM – 10:00 PM'),
('Hamleys', 'Toys', 2, '022-22334455', 'Hamleys', '11:00 AM – 10:00 PM'),
('Reliance Digital', 'Electronics', 2, '022-77889900', 'Reliance Digital', '11:00 AM – 9:00 PM'),
('H&M', 'Fashion', 1, '022-99887766', 'H&M', '11:00 AM – 10:00 PM'),
('Crossword', 'Books', 2, '022-11225577', 'Crossword', '11:00 AM – 9:00 PM'),
('Baskin Robbins', 'Ice Cream', 0, '022-55667788', 'Baskin Robbins', '10:00 AM – 11:00 PM'),
('Marks & Spencer', 'Fashion', 1, '022-44332211', 'Marks & Spencer', '11:00 AM – 9:30 PM');

-- to display table data
select * from Stores;
-- to remove complete records from table
truncate table Stores;
-- to remove complete records and attributes from table
drop table Stores;


-- Table-2 Events -----------------------------------------------------------------------------------------------------------
create table Events(
Event_id int auto_increment primary key,
Event_name varchar(100) not null,
Date date,
Time varchar(100) not null,
Venue varchar(100) not null,
Organizer varchar(100) not null,
Target_audience varchar(50) not null
);

insert into events (event_name, date, time, venue, organizer, target_audience) values
('Fashion Fiesta', '2025-07-20', '5:00 PM – 9:00 PM', 'Ground Floor', 'Zara', 'Shoppers'),
('Tech Expo', '2025-07-22', '11:00 AM – 7:00 PM', '2nd Floor', 'Croma', 'Tech Enthusiasts'),
('Coffee Workshop', '2025-07-18', '3:00 PM – 5:00 PM', 'Starbucks', 'Starbucks', 'Adults'),
('Festive Sale', '2025-08-01', 'All Day', 'Main Lobby', 'Pantaloons', 'All Visitors'),
('Kids Carnival', '2025-07-15', '12:00 PM – 6:00 PM', 'Central Atrium', 'Hamleys', 'Families'),
('Gadget Launch', '2025-08-02', '2:00 PM – 6:00 PM', 'Croma', 'Reliance Digital', 'Shoppers'),
('Toy Parade', '2025-08-03', '1:00 PM – 5:00 PM', '1nd Floor', 'H&M', 'Children'),
('Book Reading', '2025-08-05', '3:00 PM – 4:30 PM', 'Crossword', 'Crossword', 'Readers'),
('Ice Cream Fest', '2025-08-04', '2:00 PM – 6:00 PM', 'Ground Floor', 'Baskin Robbins', 'Youth'),
('Monsoon Sale', '2025-08-06', 'All Day', '1st Floor', 'Marks & Spencer', 'Shoppers');

-- to display table data
select * from Events;
-- to remove complete records from table
truncate table Events;
-- to remove complete records and attributes from table
drop table Events;


-- Table-3 Parking ----------------------------------------------------------------------------------------------------------
create table Parking(
Parking_id int auto_increment primary key,
Vehicle_type varchar(100) check(Vehicle_type in('Bike','Car')),
Entry_time datetime,
Exit_time datetime,
Charges int not null,
Parking_Level varchar(10) not null
);

insert into parking (vehicle_type, entry_time, exit_time, charges, parking_level) values
('Car',  '2025-07-10 12:30:00', '2025-07-10 14:00:00', 60, 'B1'),
('Bike', '2025-07-10 13:00:00', '2025-07-10 14:30:00', 30, 'B2'),
('Car',  '2025-07-11 11:00:00', '2025-07-11 13:15:00', 80, 'B1'),
('Bike', '2025-07-11 16:15:00', '2025-07-11 18:00:00', 35, 'B2'),
('Car',  '2025-07-12 14:00:00', '2025-07-12 16:00:00', 70, 'B1'),
('Car',  '2025-07-12 15:00:00', '2025-07-12 16:45:00', 65, 'B1'),
('Bike', '2025-07-12 10:30:00', '2025-07-12 11:45:00', 25, 'B2'),
('Car',  '2025-07-12 17:00:00', '2025-07-12 19:00:00', 75, 'B1'),
('Bike', '2025-07-12 12:00:00', '2025-07-12 13:30:00', 30, 'B2'),
('Car',  '2025-07-12 11:00:00', '2025-07-12 13:00:00', 60, 'B1');

-- to display table data
select * from Parking;
-- to remove complete records from table
truncate table Parking;
-- to remove complete records and attributes from table
drop table Parking;


-- Table-4 Employee ---------------------------------------------------------------------------------------------------------
create table Employee(
Employee_id int auto_increment primary key,
Store_id int not null, 
Name varchar(100) not null,
Designation varchar(100) not null,
Department varchar(100) not null,
foreign key (Store_id) references Stores(Store_id)
);

insert into employee (store_id, name, designation, department) values
(1, 'Rohan Desai', 'Store Manager', 'Zara'),
(2, 'Neha Kulkarni', 'Sales Associate', 'Croma'),
(3, 'Amit Tiwari', 'Barista', 'Starbucks'),
(4, 'Meena Patil', 'Cashier', 'Pantaloons'),
(5, 'Sahil Khan', 'Floor Manager', 'Hamleys'),
(6, 'Ravi Gupta', 'Tech Executive', 'Reliance Digital'),
(7, 'Pooja Rao', 'Fashion Advisor', 'H&M'),
(8, 'Lata Sharma', 'Books Consultant', 'Crossword'),
(9, 'Dev Mehta', 'Ice Cream Attendant', 'Baskin Robbins'),
(10, 'Sneha Nair', 'Sales Associate', 'Marks & Spencer');

-- to display table data
select * from Employee;
-- to remove complete records from table
truncate table Employee;
-- to remove complete records and attributes from table
drop table Employee;


-- Table-5 Feedback ---------------------------------------------------------------------------------------------------------
create table Feedback(
Feedback_id int auto_increment primary key,
Customer_name varchar(100) not null,
Store_visited varchar(100) not null,
Rating int check(Rating between 1 and 5),
Visit_date date,
Comment text,
Response varchar(100) check(Response in ('Responded','Pending','Investigating'))
);

insert into feedback (customer_name, store_visited, rating, visit_date, comment, response) values
('Aarti Sharma', 'Zara', 4, '2025-07-01', 'Great collection!', 'Responded'),
('Raj Verma', 'Starbucks', 5, '2025-07-03', 'Loved the coffee.', 'Responded'),
('Sneha Iyer', 'Croma', 3, '2025-07-05', 'Limited stock.', 'Pending'),
('Arjun Mehta', 'Hamleys', 5, '2025-07-09', 'Great for kids.', 'Responded'),
('Kavita Rao', 'Pantaloons', 2, '2025-07-10', 'Billing delay.', 'Investigating'),
('Dev Sharma', 'H&M', 4, '2025-07-06', 'Trendy options.', 'Responded'),
('Lata Joshi', 'Crossword', 5, '2025-07-08', 'Peaceful store.', 'Responded'),
('Ravi Kumar', 'Reliance Digital', 3, '2025-07-07', 'Helpful staff.', 'Pending'),
('Anjali Mehra', 'Baskin Robbins', 5, '2025-07-11', 'Delicious!', 'Responded'),
('Vikram Singh', 'Marks & Spencer', 4, '2025-07-10', 'Premium wear.', 'Responded');

-- to display table data
select * from Feedback;
-- to remove complete records from table
truncate table Feedback;
-- to remove complete records and attributes from table
drop table Feedback;