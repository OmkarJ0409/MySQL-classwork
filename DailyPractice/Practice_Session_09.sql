-- create a database first
create database taj_hotel;

-- to work on this database, you need to use it first
use taj_hotel;

-- --------------------------------------- Database Analysis ------------------------------------------------------------------
/*
T1  : hotels(hotel_id, name, location, rating, contact_email, contact_phone, established_year, total_rooms, manager_name, status)
T2  : rooms(room_id, hotel_id, room_number, type, price_per_night, floor, occupancy, amenities, availability, status)
T3  : guests(guest_id, full_name, gender, dob, phone, email, nationality, id_proof, address, status)
T4  : bookings(booking_id, guest_id, room_id, check_in_date, check_out_date, num_guests, booking_date, status, payment_mode, remarks)
T5  : staff(staff_id, hotel_id, full_name, role, department, gender, contact_number, email, joining_date, status)
T6  : services(service_id, service_name, category, price, available, description, duration_minutes, staff_required, tax_percent, status)
T7  : service_usage(usage_id, guest_id, service_id, used_on, quantity, total_cost, feedback, staff_id, status, remarks)
T8  : payments(payment_id, booking_id, amount, payment_date, method, transaction_id, received_by, tax_amount, discount, status)
T9  : events(event_id, hotel_id, event_name, event_date, organizer_name, contact, num_guests, venue, status, remarks)
T10 : reviews(review_id, guest_id, hotel_id, rating, review_date, title, comments, sentiment, visibility, status)
*/

-- Table-1 Hotels -----------------------------------------------------------------------------------------------------------
create table hotels (
hotel_id int primary key,
name varchar(100),
location varchar(100),
rating decimal(3,2),
contact_email varchar(100),
contact_phone varchar(20),
established_year int,
total_rooms int,
manager_name varchar(100),
status varchar(20)
);

insert into hotels values
(1, 'Taj Mahal Palace', 'Mumbai', 4.9, 'contact@tajmumbai.com', '022-12345678', 1903, 560, 'Rakesh Verma', 'Operational'),
(2, 'Taj Lake Palace', 'Udaipur', 4.8, 'contact@tajudaipur.com', '0294-2345678', 1746, 250, 'Meera Shah', 'Operational'),
(3, 'Taj Falaknuma Palace', 'Hyderabad', 4.7, 'contact@tajhyd.com', '040-3456789', 1894, 60, 'Sanjay Rao', 'Operational'),
(4, 'Taj Exotica', 'Goa', 4.8, 'contact@tajgoa.com', '0832-4567890', 1999, 140, 'Neha Kapoor', 'Operational'),
(5, 'Taj West End', 'Bangalore', 4.6, 'contact@tajblr.com', '080-5678901', 1887, 117, 'Manoj Nair', 'Operational'),
(6, 'Taj Bengal', 'Kolkata', 4.7, 'contact@tajkol.com', '033-6789012', 1989, 229, 'Isha Banerjee', 'Operational'),
(7, 'Taj Lands End', 'Mumbai', 4.6, 'contact@tajlands.com', '022-7890123', 2002, 493, 'Rajiv Khanna', 'Operational'),
(8, 'Taj Fort Aguada', 'Goa', 4.5, 'contact@fortaguada.com', '0832-8901234', 1974, 145, 'Sneha Joshi', 'Operational'),
(9, 'Taj Green Cove', 'Kovalam', 4.6, 'contact@tajkovalam.com', '0471-9012345', 2004, 59, 'Anupama Pillai', 'Operational'),
(10, 'Taj Aravali', 'Udaipur', 4.7, 'contact@aravali.com', '0294-0123456', 2018, 176, 'Kunal Menon', 'Operational');

-- to display table data
select * from hotels;
-- to remove complete records from table
truncate table hotels;
-- to remove complete records and attributes from table
drop table hotels;

-- Table-2 Rooms ------------------------------------------------------------------------------------------------------------
create table rooms (
room_id int primary key,
hotel_id int,
room_number varchar(10),
type varchar(50),
capacity int,
rate_per_night decimal(10,2),
availability_status varchar(20),
floor int,
view_type varchar(50),
description text,
foreign key (hotel_id) references hotels(hotel_id)
);

insert into rooms values
(1, 1, '101', 'Deluxe Suite', 2, 25000.00, 'Available', 1, 'Sea View', 'Luxurious suite with sea view'),
(2, 1, '102', 'Luxury Room', 2, 22000.00, 'Occupied', 1, 'City View', 'Elegant room with cityscape'),
(3, 2, '201', 'Royal Suite', 3, 40000.00, 'Available', 2, 'Lake View', 'Palatial room overlooking lake'),
(4, 2, '202', 'Deluxe Room', 2, 18000.00, 'Available', 2, 'Garden View', 'Comfortable room with garden view'),
(5, 3, '301', 'Presidential Suite', 4, 60000.00, 'Occupied', 3, 'Palace View', 'Top-tier suite with royal ambiance'),
(6, 3, '302', 'Standard Room', 2, 15000.00, 'Available', 3, 'Courtyard View', 'Simple and elegant room'),
(7, 4, '401', 'Luxury Villa', 4, 30000.00, 'Available', 1, 'Beach View', 'Private villa with beach access'),
(8, 5, '501', 'Deluxe Twin', 2, 17000.00, 'Occupied', 5, 'Park View', 'Twin-bed room with park view'),
(9, 6, '601', 'Executive Room', 2, 20000.00, 'Available', 6, 'Garden View', 'Corporate-style executive room'),
(10, 7, '701', 'Luxury Suite', 2, 28000.00, 'Available', 7, 'City View', 'Modern suite in the heart of city');

-- to display table data
select * from rooms;
-- to remove complete records from table
truncate table rooms;
-- to remove complete records and attributes from table
drop table rooms;


-- Table-3 Guests -----------------------------------------------------------------------------------------------------------
create table guests (
guest_id int primary key,
full_name varchar(100),
gender varchar(10),
dob date,
email varchar(100),
phone varchar(20),
address text,
city varchar(50),
id_proof varchar(50),
nationality varchar(50)
);

insert into guests values
(1, 'Rohit Sharma', 'Male', '1987-04-30', 'rohit.sharma@gmail.com', '9876543210', 'Carter Road, Bandra', 'Mumbai', 'Aadhar Card', 'Indian'),
(2, 'Ananya Singh', 'Female', '1992-08-12', 'ananya.singh@gmail.com', '9823456789', 'Connaught Place', 'New Delhi', 'Passport', 'Indian'),
(3, 'David Miller', 'Male', '1989-06-10', 'david.miller@yahoo.com', '9765432187', 'Downtown Cape Town', 'Cape Town', 'Driving License', 'South African'),
(4, 'Aishwarya Rao', 'Female', '1990-01-20', 'aish.rao@outlook.com', '9756412345', 'Anna Nagar', 'Chennai', 'Aadhar Card', 'Indian'),
(5, 'John Doe', 'Male', '1980-10-05', 'john.doe@gmail.com', '9745123789', 'Fifth Avenue', 'New York', 'Passport', 'American'),
(6, 'Meera Kapoor', 'Female', '1995-05-25', 'meera.kapoor@gmail.com', '9898765432', 'MG Road', 'Pune', 'Aadhar Card', 'Indian'),
(7, 'Ali Khan', 'Male', '1984-09-18', 'ali.khan@gmail.com', '9834567810', 'Jumeirah Street', 'Dubai', 'Driving License', 'UAE'),
(8, 'Sara Dsouza', 'Female', '1993-12-01', 'sara.dsouza@gmail.com', '9786543210', 'Vasai Road', 'Mumbai', 'Passport', 'Indian'),
(9, 'William Smith', 'Male', '1985-03-14', 'will.smith@gmail.com', '9797654321', 'Baker Street', 'London', 'Passport', 'British'),
(10, 'Priya Deshmukh', 'Female', '1991-07-22', 'priya.d@gmail.com', '9775432109', 'Koregaon Park', 'Pune', 'Aadhar Card', 'Indian');

-- to display table data
select * from guests;
-- to remove complete records from table
truncate table guests;
-- to remove complete records and attributes from table
drop table guests;


-- Table-4 bookings ---------------------------------------------------------------------------------------------------------
create table bookings (
booking_id int primary key,
guest_id int,
room_id int,
check_in date,
check_out date,
booking_date date,
status varchar(20),
payment_method varchar(30),
total_amount decimal(10,2),
remarks text,
foreign key (guest_id) references guests(guest_id),
foreign key (room_id) references rooms(room_id)
);

insert into bookings values
(1, 1, 1, '2025-06-10', '2025-06-15', '2025-05-20', 'Confirmed', 'Credit Card', 125000.00, 'Anniversary stay'),
(2, 2, 2, '2025-07-01', '2025-07-04', '2025-06-15', 'Checked-In', 'UPI', 66000.00, 'Business trip'),
(3, 3, 3, '2025-08-05', '2025-08-10', '2025-07-10', 'Confirmed', 'Bank Transfer', 200000.00, 'Vacation'),
(4, 4, 4, '2025-09-01', '2025-09-05', '2025-08-01', 'Cancelled', 'Credit Card', 0.00, 'Cancelled due to personal reasons'),
(5, 5, 5, '2025-06-25', '2025-06-30', '2025-06-10', 'Confirmed', 'Debit Card', 300000.00, 'VIP guest'),
(6, 6, 6, '2025-07-15', '2025-07-20', '2025-07-01', 'Checked-Out', 'Cash', 75000.00, 'Regular guest'),
(7, 7, 7, '2025-10-01', '2025-10-05', '2025-09-01', 'Confirmed', 'Credit Card', 120000.00, 'Festival visit'),
(8, 8, 8, '2025-08-20', '2025-08-22', '2025-08-10', 'No-Show', 'Credit Card', 0.00, 'Did not arrive'),
(9, 9, 9, '2025-12-01', '2025-12-05', '2025-11-01', 'Confirmed', 'Bank Transfer', 80000.00, 'Christmas holiday'),
(10, 10, 10, '2025-11-10', '2025-11-15', '2025-10-25', 'Checked-In', 'UPI', 140000.00, 'Family trip');

-- to display table data
select * from bookings;
-- to remove complete records from table
truncate table bookings;
-- to remove complete records and attributes from table
drop table bookings;


-- Table-5 Staff ------------------------------------------------------------------------------------------------------------
create table staff (
staff_id int primary key,
hotel_id int,
full_name varchar(100),
role varchar(50),
department varchar(50),
gender varchar(10),
contact_number varchar(20),
email varchar(100),
joining_date date,
status varchar(20),
foreign key (hotel_id) references hotels(hotel_id)
);

insert into staff values
(1, 1, 'Rajesh Kumar', 'Manager', 'Front Office', 'Male', '9876543210', 'rajesh.k@taj.com', '2015-06-01', 'Active'),
(2, 1, 'Priya Mehta', 'Chef', 'Kitchen', 'Female', '9876543211', 'priya.m@taj.com', '2017-08-10', 'Active'),
(3, 2, 'Anil Sharma', 'Receptionist', 'Front Office', 'Male', '9876543212', 'anil.s@taj.com', '2019-03-15', 'Active'),
(4, 2, 'Neha Joshi', 'Housekeeper', 'Housekeeping', 'Female', '9876543213', 'neha.j@taj.com', '2020-01-10', 'Active'),
(5, 3, 'Vikas Gupta', 'Security Officer', 'Security', 'Male', '9876543214', 'vikas.g@taj.com', '2018-07-12', 'Active'),
(6, 3, 'Sneha Rane', 'Spa Therapist', 'Spa', 'Female', '9876543215', 'sneha.r@taj.com', '2021-02-20', 'Active'),
(7, 4, 'Amit Bhosale', 'Bell Boy', 'Front Office', 'Male', '9876543216', 'amit.b@taj.com', '2016-09-25', 'Active'),
(8, 4, 'Ritika Shah', 'Waitress', 'Restaurant', 'Female', '9876543217', 'ritika.s@taj.com', '2022-04-17', 'Active'),
(9, 5, 'Manoj Nair', 'Electrician', 'Maintenance', 'Male', '9876543218', 'manoj.n@taj.com', '2014-11-05', 'Active'),
(10, 5, 'Deepa Iyer', 'Concierge', 'Guest Services', 'Female', '9876543219', 'deepa.i@taj.com', '2013-12-01', 'Active');

-- to display table data
select * from staff;
-- to remove complete records from table
truncate table staff;
-- to remove complete records and attributes from table
drop table staff;


-- Table-6 Services ---------------------------------------------------------------------------------------------------------
create table services (
service_id int primary key,
service_name varchar(100),
category varchar(50),
price decimal(10,2),
available boolean,
description text,
duration_minutes int,
staff_required int,
tax_percent float,
status varchar(20)
);

insert into services values
(1, 'Swedish Massage', 'Spa', 3500.00, true, 'Relaxing full-body massage using Swedish techniques.', 60, 1, 18.0, 'Available'),
(2, 'Airport Pickup', 'Transport', 1200.00, true, 'Chauffeur-driven car pickup from the airport.', 45, 1, 5.0, 'Available'),
(3, 'Buffet Lunch', 'Dining', 1500.00, true, 'Lunch buffet with multiple cuisines.', 90, 3, 12.0, 'Available'),
(4, 'Laundry Service', 'Housekeeping', 500.00, true, 'Washing and ironing of clothes.', 1440, 1, 5.0, 'Available'),
(5, 'Yoga Session', 'Wellness', 800.00, true, 'One-hour guided yoga session.', 60, 1, 12.0, 'Available'),
(6, 'City Tour', 'Tourism', 2500.00, true, 'Guided city tour covering top attractions.', 240, 1, 18.0, 'Available'),
(7, 'Candlelight Dinner', 'Dining', 3000.00, true, 'Romantic dinner setup for couples.', 120, 2, 12.0, 'Available'),
(8, 'Haircut & Styling', 'Salon', 1000.00, true, 'Professional haircut and hairstyling.', 45, 1, 18.0, 'Available'),
(9, 'Wi-Fi Premium', 'Technology', 300.00, true, 'High-speed internet access for 24 hours.', 1440, 0, 18.0, 'Available'),
(10, 'Car Rental', 'Transport', 2000.00, true, 'Self-drive car rental for a day.', 1440, 0, 5.0, 'Available');

-- to display table data
select * from services;
-- to remove complete records from table
truncate table services;
-- to remove complete records and attributes from table
drop table services;


-- Table-7 Service_usage ----------------------------------------------------------------------------------------------------
create table service_usage (
usage_id int primary key,
guest_id int,
service_id int,
used_on date,
quantity int,
total_cost decimal(10,2),
feedback text,
staff_id int,
status varchar(20),
remarks text,
foreign key (guest_id) references guests(guest_id),
foreign key (service_id) references services(service_id),
foreign key (staff_id) references staff(staff_id)
);

insert into service_usage values
(1, 1, 1, '2025-07-01', 1, 4130.00, 'Very relaxing experience.', 3, 'Completed', 'Customer was happy'),
(2, 2, 2, '2025-07-02', 1, 1260.00, 'Smooth pickup service.', 5, 'Completed', 'Flight was on time'),
(3, 3, 3, '2025-07-02', 2, 3360.00, 'Great food variety!', 7, 'Completed', 'Requested extra desserts'),
(4, 4, 4, '2025-07-03', 3, 1770.00, 'Quick and efficient.', 2, 'Completed', 'Returned same day'),
(5, 5, 5, '2025-07-03', 1, 944.00, 'Felt refreshed and calm.', 6, 'Completed', 'Requested more sessions'),
(6, 6, 6, '2025-07-04', 1, 2950.00, 'Loved the sightseeing.', 8, 'Completed', 'Tour guide was informative'),
(7, 7, 7, '2025-07-04', 1, 3360.00, 'Perfect romantic evening.', 4, 'Completed', 'Special decorations requested'),
(8, 8, 8, '2025-07-05', 1, 1180.00, 'Styling was modern.', 3, 'Completed', 'Asked for new style'),
(9, 9, 9, '2025-07-05', 1, 354.00, 'Good speed.', null, 'Completed', 'Used for work calls'),
(10, 10, 10, '2025-07-06', 1, 2100.00, 'Clean and well-maintained car.', null, 'Completed', 'Extended rental by 2 hours');

-- to display table data
select * from service_usage;
-- to remove complete records from table
truncate table service_usage;
-- to remove complete records and attributes from table
drop table service_usage;


-- Table-8 Payments ---------------------------------------------------------------------------------------------------------
create table payments (
payment_id int primary key,
booking_id int,
amount float,
payment_date date,
method varchar(50),
transaction_id varchar(100),
received_by varchar(100),
tax_amount float,
discount float,
status varchar(20),
foreign key (booking_id) references bookings(booking_id)
);

insert into payments values
(1, 1, 10500.00, '2025-07-10', 'Credit Card', 'TXN1001', 'Ravi Sharma', 500.00, 0.00, 'Completed'),
(2, 2, 15000.00, '2025-07-11', 'UPI', 'TXN1002', 'Neeta Desai', 700.00, 200.00, 'Completed'),
(3, 3, 12000.00, '2025-07-12', 'Cash', 'TXN1003', 'Sanjay Rao', 600.00, 100.00, 'Completed'),
(4, 4, 18500.00, '2025-07-12', 'Debit Card', 'TXN1004', 'Anita Mehra', 800.00, 500.00, 'Completed'),
(5, 5, 14000.00, '2025-07-13', 'Net Banking', 'TXN1005', 'Dev Patel', 650.00, 150.00, 'Completed'),
(6, 6, 10000.00, '2025-07-14', 'Credit Card', 'TXN1006', 'Priya Singh', 400.00, 0.00, 'Completed'),
(7, 7, 9500.00, '2025-07-14', 'UPI', 'TXN1007', 'Ajay Kumar', 350.00, 100.00, 'Completed'),
(8, 8, 13200.00, '2025-07-15', 'Cash', 'TXN1008', 'Neha Joshi', 600.00, 200.00, 'Completed'),
(9, 9, 11500.00, '2025-07-15', 'Credit Card', 'TXN1009', 'Sunil Pawar', 500.00, 100.00, 'Completed'),
(10, 10, 14500.00, '2025-07-16', 'Net Banking', 'TXN1010', 'Rakesh Kapoor', 700.00, 300.00, 'Completed');

-- to display table data
select * from payments;
-- to remove complete records from table
truncate table payments;
-- to remove complete records and attributes from table
drop table payments;


-- Table-9 Events -----------------------------------------------------------------------------------------------------------
create table events (
event_id int primary key,
hotel_id int,
event_name varchar(100),
event_date date,
organizer_name varchar(100),
contact varchar(15),
num_guests int,
venue varchar(100),
status varchar(20),
remarks text,
foreign key (hotel_id) references hotels(hotel_id)
);

insert into events values
(1, 1, 'Royal Wedding', '2025-07-15', 'Amit Kapoor', '9876543210', 200, 'Ballroom A', 'Confirmed', 'Theme: Royal Rajput'),
(2, 2, 'Corporate Summit', '2025-07-20', 'Infosys Ltd.', '9823012345', 150, 'Conference Hall 1', 'Confirmed', 'Annual review meet'),
(3, 3, 'Product Launch', '2025-07-18', 'Tata Motors', '9988776655', 100, 'Banquet Hall', 'Confirmed', 'Showcase new EV'),
(4, 4, 'Fashion Show', '2025-07-22', 'Lakme', '9123456789', 120, 'Poolside', 'Confirmed', 'Evening ramp event'),
(5, 5, 'Engagement Party', '2025-07-14', 'Neha & Raj', '9087654321', 80, 'Terrace Lounge', 'Confirmed', 'Live music included'),
(6, 1, 'Medical Conference', '2025-07-21', 'Apollo Hospitals', '9988112233', 130, 'Conference Hall 2', 'Confirmed', 'Multi-specialty panel'),
(7, 2, 'Art Exhibition', '2025-07-25', 'Kala Sangam', '9776655443', 60, 'Gallery Room', 'Confirmed', 'Modern art showcase'),
(8, 3, 'Birthday Bash', '2025-07-19', 'Riya Sen', '9090909090', 40, 'Lawn Area', 'Confirmed', 'DJ + Cake cutting'),
(9, 4, 'Book Launch', '2025-07-24', 'Penguin India', '9998887776', 70, 'Library Lounge', 'Confirmed', 'Author meet & greet'),
(10, 5, 'Charity Gala', '2025-07-28', 'Hope Foundation', '9811122233', 90, 'Grand Hall', 'Confirmed', 'Auction for a cause');

-- to display table data
select * from events;
-- to remove complete records from table
truncate table events;
-- to remove complete records and attributes from table
drop table events;


-- Table-10 Reviews ---------------------------------------------------------------------------------------------------------
create table reviews (
review_id int primary key,
guest_id int,
hotel_id int,
rating int check(rating between 1 and 5),
review_date date,
title varchar(100),
comments text,
sentiment varchar(20),
visibility varchar(20),
status varchar(20),
foreign key (guest_id) references guests(guest_id),
foreign key (hotel_id) references hotels(hotel_id)
);

insert into reviews values
(1, 1, 1, 5, '2025-07-12', 'Outstanding Stay', 'The hospitality and room service were exceptional.', 'Positive', 'Public', 'Published'),
(2, 2, 1, 4, '2025-07-11', 'Very Good', 'Great ambiance and food quality.', 'Positive', 'Public', 'Published'),
(3, 3, 1, 3, '2025-07-10', 'Average Experience', 'Room was fine but AC was not working properly.', 'Neutral', 'Public', 'Published'),
(4, 4, 1, 5, '2025-07-09', 'Perfect Getaway', 'Loved the spa and pool area.', 'Positive', 'Public', 'Published'),
(5, 5, 1, 2, '2025-07-08', 'Needs Improvement', 'Check-in process was slow and staff seemed inattentive.', 'Negative', 'Public', 'Published'),
(6, 6, 1, 4, '2025-07-08', 'Good Service', 'Staff were helpful and polite.', 'Positive', 'Public', 'Published'),
(7, 7, 1, 5, '2025-07-07', 'Excellent Stay', 'Everything was top-notch and luxurious.', 'Positive', 'Public', 'Published'),
(8, 8, 1, 1, '2025-07-06', 'Disappointing', 'The room was not clean and had a bad odor.', 'Negative', 'Public', 'Published'),
(9, 9, 1, 3, '2025-07-05', 'Okayish', 'Nice hotel but overpriced for the services.', 'Neutral', 'Public', 'Published'),
(10, 10, 1, 4, '2025-07-04', 'Great Food', 'The dining experience was memorable.', 'Positive', 'Public', 'Published');

-- to display table data
select * from reviews;
-- to remove complete records from table
truncate table reviews;
-- to remove complete records and attributes from table
drop table reviews;