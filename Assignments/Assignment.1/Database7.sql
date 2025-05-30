create database Vehicle_Service_Centre;
use Vehicle_Service_Centre;

create table Service_Centres(
Centre_id int primary key,
Centre_name varchar(50),
Centre_representative varchar(50),
Address text,
Contact varchar(10)
);

insert into Service_Centres values
(1, 'SpeedAuto Works', 'Rahul Mehta', 'Andheri West, Mumbai', '9876543210'),
(2, 'DriveFix Garage', 'Neha Kapoor', 'Sector 21, Noida', '9876543211'),
(3, 'MotorCare Hub', 'Suresh Raina', 'Anna Nagar, Chennai', '9876543212'),
(4, 'Elite Auto Centre', 'Preeti Nair', 'Hinjewadi, Pune', '9876543213'),
(5, 'Rapid Repair', 'Amit Khanna', 'Salt Lake, Kolkata', '9876543214'),
(6, 'QuickFix Centre', 'Manoj Sharma', 'Banjara Hills, Hyderabad', '9876543215'),
(7, 'Metro Motors', 'Divya Iyer', 'MG Road, Bengaluru', '9876543216'),
(8, 'Torque Garage', 'Ravi Desai', 'Satellite, Ahmedabad', '9876543217'),
(9, 'AutoWorks Pro', 'Karan Malhotra', 'Lal Kothi, Jaipur', '9876543218'),
(10, 'City Wheelz', 'Shreya Ghosh', 'Hazratganj, Lucknow', '9876543219');


create table Service_types(
Type_id int primary key,
Type_name varchar(50),
Charges int,
Mechanic_name varchar(50),
Time date
);

insert into Service_types values
(1, 'Oil Change', 500, 'Ramesh Kumar', '2024-06-01'),
(2, 'Brake Inspection', 800, 'Amit Rathi', '2024-06-02'),
(3, 'Engine Tuning', 1200, 'Vikram Joshi', '2024-06-03'),
(4, 'AC Servicing', 1000, 'Neeraj Pandey', '2024-06-04'),
(5, 'Tyre Alignment', 700, 'Meena Rao', '2024-06-05'),
(6, 'Battery Check', 400, 'Karan Patel', '2024-06-06'),
(7, 'Suspension Service', 1500, 'Arvind Sinha', '2024-06-07'),
(8, 'Car Wash', 300, 'Sanjay Kumar', '2024-06-08'),
(9, 'Clutch Repair', 1800, 'Priya Shah', '2024-06-09'),
(10, 'Paint Touch-up', 900, 'Dilip Singh', '2024-06-10');


create table Centre_Mechanic(
Mechanic_id int primary key,
Mechanic_name varchar(50),
Vehicle_service_type varchar(50),
Vehicle_type varchar(50),
Total_Services int
);

insert into Centre_Mechanic values
(1, 'Ramesh Kumar', 'Oil Change', 'Car', 250),
(2, 'Amit Rathi', 'Brake Inspection', 'Car', 180),
(3, 'Vikram Joshi', 'Engine Tuning', 'Bike', 300),
(4, 'Neeraj Pandey', 'AC Servicing', 'SUV', 150),
(5, 'Meena Rao', 'Tyre Alignment', 'Car', 210),
(6, 'Karan Patel', 'Battery Check', 'Car', 130),
(7, 'Arvind Sinha', 'Suspension Service', 'SUV', 100),
(8, 'Sanjay Kumar', 'Car Wash', 'Bike', 500),
(9, 'Priya Shah', 'Clutch Repair', 'Car', 170),
(10, 'Dilip Singh', 'Paint Touch-up', 'SUV', 90);


create table Vehicles(
Vehicle_id int primary key,
vehicle_type varchar(50),
Vehicle_owner varchar(50),
Contact varchar(10),
Next_Service date
);

insert into Vehicles values
(101, 'Car', 'Rajesh Khanna', '9876000001', '2024-12-01'),
(102, 'Bike', 'Amit Trivedi', '9876000002', '2024-11-20'),
(103, 'SUV', 'Kavita Sharma', '9876000003', '2024-09-15'),
(104, 'Car', 'Sunil Grover', '9876000004', '2024-08-10'),
(105, 'Bike', 'Ritu Mehra', '9876000005', '2024-10-05'),
(106, 'Car', 'Karan Singh', '9876000006', '2024-11-11'),
(107, 'SUV', 'Neha Pandey', '9876000007', '2024-12-20'),
(108, 'Car', 'Manish Tiwari', '9876000008', '2024-07-07'),
(109, 'Bike', 'Deepak Chauhan', '9876000009', '2024-08-25'),
(110, 'SUV', 'Simran Kaur', '9876000010', '2024-10-30');


create table Centre_Report(
Centre_name varchar(50) primary key,
Centre_id int,
Centre_representative varchar(50),
Customer_Review_Feedback varchar(50),
Ratings decimal(5,2),
foreign key (Centre_id) references Service_Centres(Centre_id)
);

insert into Centre_Report values
('SpeedAuto Works', 1, 'Rahul Mehta', 'Excellent service', 4.7),
('DriveFix Garage', 2, 'Neha Kapoor', 'Very good staff', 4.5),
('MotorCare Hub', 3, 'Suresh Raina', 'Quick turnaround', 4.6),
('Elite Auto Centre', 4, 'Preeti Nair', 'Friendly experience', 4.3),
('Rapid Repair', 5, 'Amit Khanna', 'Affordable rates', 4.4),
('QuickFix Centre', 6, 'Manoj Sharma', 'Neat and clean', 4.2),
('Metro Motors', 7, 'Divya Iyer', 'Professional staff', 4.8),
('Torque Garage', 8, 'Ravi Desai', 'Satisfied overall', 4.1),
('AutoWorks Pro', 9, 'Karan Malhotra', 'Quick and cheap', 4.0),
('City Wheelz', 10, 'Shreya Ghosh', 'Highly recommended', 4.9);
