/*
This File consists of a database named LEARNING_INSTITUTE having tables Staff, Teachers, Courses, Students, and Devices.

Table.1 - STAFF TABLE - (Stores details about the staff members)
        Staff table has the following attributes:
            Staff_id, Staff_name, Contact, Join_Date, Salary

Table.2 - TEACHERS TABLE - (Stores details about teachers and their schedules)
        Teachers table has the following attributes:
            Teacher_id, Teacher_name, Subject, Batch, Time

Table.3 - COURSES TABLE - (Stores courses offered by the institute)
        Courses table has the following attributes:
            Course_id, Course_name, Students, Duration, Fees

Table.4 - STUDENTS TABLE - (Stores details of students enrolled)
        Students table has the following attributes:
            Student_id, Student_name, Course_Applied, Qualification, Contact
        Course_Applied is a foreign key referencing Courses(Course_name)

Table.5 - DEVICES TABLE - (Stores inventory details of devices used in the institute)
        Devices table has the following attributes:
            Device_id, Device_name, Status, Installation_Date, Category


Step-by-step Creation of Learning_Institute Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Staff Table + Insert Data into Staff Table
Step 4: Create Teachers Table + Insert Data into Teachers Table
Step 5: Create Courses Table + Insert Data into Courses Table
Step 6: Create Students Table + Insert Data into Students Table
Step 7: Create Devices Table + Insert Data into Devices Table
Step 8: View Data (
    select * from Staff;
    select * from Teachers;
    select * from Courses;
    select * from Students;
    select * from Devices;
)
*/

-- Step 1: Create the Database
create database Learning_Institute;

-- Step 2: Use the database
use Learning_Institute;

-- Step 3: Create Staff Table -----------------------------------------------------------------

create table Staff(
Staff_id int primary key,                      -- Staff member's unique ID
Staff_name varchar(50),                        -- Staff member's name
Contact varchar(10),                           -- Contact number
Join_Date Date,                                -- Date of joining the institute
Salary int                                    -- Staff salary
);

-- Insert records into Staff table
insert into Staff values
(1, 'Ravi Shinde', '9876543210', '2021-06-10', 25000),
(2, 'Priya More', '9876543211', '2020-01-20', 28000),
(3, 'Suresh Yadav', '9876543212', '2019-05-15', 30000),
(4, 'Sneha Patil', '9876543213', '2022-03-05', 22000),
(5, 'Amit Joshi', '9876543214', '2021-12-01', 26000),
(6, 'Meena Rao', '9876543215', '2020-07-22', 24000),
(7, 'Anil Kumar', '9876543216', '2018-11-11', 32000),
(8, 'Kavita Naik', '9876543217', '2021-09-30', 23000),
(9, 'Harish Desai', '9876543218', '2020-04-10', 29000),
(10, 'Divya Shetty', '9876543219', '2022-01-01', 21000);

-- To display table data
select * from Staff;

-- To remove complete records from table
truncate table Staff;

-- To remove complete records and attributes from table
drop table Staff;

-- Step 4: Create Teachers Table --------------------------------------------------------------

create table Teachers(
Teacher_id int primary key,                    -- Teacher's unique ID
Teacher_name varchar(50),                      -- Teacher's name
Subject varchar(20),                           -- Subject taught
Batch varchar(20),                             -- Batch assigned
Time time                                      -- Class timing
);

-- Insert records into Teachers table
insert into Teachers values
(1, 'Manoj Deshmukh', 'Maths', 'A1', '09:00:00'),
(2, 'Sunita Pawar', 'Physics', 'B1', '10:00:00'),
(3, 'Rajesh Gupta', 'Chemistry', 'C1', '11:00:00'),
(4, 'Neha Rane', 'Biology', 'D1', '12:00:00'),
(5, 'Sagar Patil', 'English', 'E1', '13:00:00'),
(6, 'Anita Nair', 'History', 'F1', '14:00:00'),
(7, 'Kiran Shah', 'Geography', 'G1', '15:00:00'),
(8, 'Mehul Jain', 'Computer', 'H1', '16:00:00'),
(9, 'Pooja Verma', 'Accounts', 'I1', '17:00:00'),
(10, 'Rohan Kulkarni', 'Economics', 'J1', '18:00:00');

-- To display table data
select * from Teachers;

-- To remove complete records from table
truncate table Teachers;

-- To remove complete records and attributes from table
drop table Teachers;

-- Step 5: Create Courses Table ---------------------------------------------------------------

create table Courses(
Course_id int not null,                        -- Course unique ID
Course_name varchar(20) primary key,           -- Name of the course
Students int,                                  -- Number of students enrolled
Duration varchar(20),                          -- Course duration
Fees int                                       -- Course fees
);

-- Insert records into Courses table
insert into Courses values
(101, 'Maths', 30, '3 Months', 15000),
(102, 'Physics', 25, '3 Months', 16000),
(103, 'Chemistry', 20, '2 Months', 14000),
(104, 'Biology', 15, '2 Months', 13500),
(105, 'English', 40, '1 Month', 10000),
(106, 'History', 18, '2 Months', 13000),
(107, 'Geography', 22, '3 Months', 14500),
(108, 'Computer', 35, '4 Months', 20000),
(109, 'Accounts', 28, '3 Months', 15500),
(110, 'Economics', 24, '2 Months', 15000);

-- To display table data
select * from Courses;

-- To remove complete records from table
truncate table Courses;

-- To remove complete records and attributes from table
drop table Courses;

-- Step 6: Create Students Table --------------------------------------------------------------

create table Students(
Student_id int primary key,                    -- Student unique ID
Student_name varchar(50),                       -- Student name
Course_Applied varchar(20),                     -- Course applied for
Qualification varchar(20),                      -- Student qualification
Contact varchar(10),                            -- Contact number
foreign key (Course_Applied) references Courses(Course_name)
);

-- Insert records into Students table
insert into Students values
(201, 'Aakash Mehta', 'Maths', 'HSC', '9123456780'),
(202, 'Sneha Singh', 'Physics', 'HSC', '9123456781'),
(203, 'Rohit Sharma', 'Chemistry', 'BSc', '9123456782'),
(204, 'Anjali Nair', 'Biology', 'HSC', '9123456783'),
(205, 'Vikram Rao', 'English', 'SSC', '9123456784'),
(206, 'Divya Jain', 'History', 'HSC', '9123456785'),
(207, 'Kunal Patil', 'Geography', 'BA', '9123456786'),
(208, 'Meena Joshi', 'Computer', 'BCA', '9123456787'),
(209, 'Sagar Desai', 'Accounts', 'BCom', '9123456788'),
(210, 'Pooja Shah', 'Economics', 'BCom', '9123456789');

-- To display table data
select * from Students;

-- To remove complete records from table
truncate table Students;

-- To remove complete records and attributes from table
drop table Students;

-- Step 7: Create Devices Table ---------------------------------------------------------------

create table Devices(
Device_id int primary key,                      -- Device unique ID
Device_name varchar(50),                        -- Name of the device
Status varchar(30),                             -- Status of device (Working/Not Working)
Installation_Date date,                         -- Date of installation
Category varchar(30)                            -- Category/type of device
);

-- Insert records into Devices table
insert into Devices values
(1, 'HP Laser Printer', 'Working', '2023-01-10', 'Printer'),
(2, 'Dell Projector', 'Working', '2022-08-15', 'Projector'),
(3, 'Logitech Mouse', 'Not Working', '2021-07-20', 'Peripheral'),
(4, 'HP Monitor', 'Working', '2023-02-18', 'Monitor'),
(5, 'Keyboard Logitech', 'Working', '2021-05-25', 'Peripheral'),
(6, 'WiFi Router', 'Not Working', '2020-11-30', 'Networking'),
(7, 'Smart Board', 'Working', '2022-10-05', 'Teaching Aid'),
(8, 'Canon Scanner', 'Working', '2023-03-12', 'Scanner'),
(9, 'Lenovo CPU', 'Not Working', '2021-12-25', 'Computer'),
(10, 'Power Backup', 'Working', '2023-04-01', 'Support Device');

-- To display table data
select * from Devices;

-- To remove complete records from table
truncate table Devices;

-- To remove complete records and attributes from table
drop table Devices;

-- Step 8: View Data 
select * from Staff;
select * from Teachers;
select * from Courses;
select * from Students;
select * from Devices;