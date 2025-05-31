/*
This file consists of a database named REHAB_CENTRE having tables Centre, Staff, Medicines, Rehab, and Patient.

Table.1 - CENTRE TABLE - (Stores details of rehab centers)
        Attributes: Centre_id, Centre_name, Caretaker_name, Contact, Centre_Address

Table.2 - STAFF TABLE - (Stores details of staff members working at centers)
        Attributes: Staff_id, Staff_name, Contact, Patients_under_Staff, Shift_Time

Table.3 - MEDICINES TABLE - (Stores details of medicines prescribed)
        Attributes: Medicine_id, Medicine_name, Staff_name, Patient_name, Duration

Table.4 - REHAB TABLE - (Stores rehab progress details for patients)
        Attributes: Rehab_id, Patient_name, Duration, Medicine_id (FK), Progress_Report

Table.5 - PATIENT TABLE - (Stores patient and guardian details)
        Attributes: Patient_id, Rehab_id (FK), Patient_name, Patient_Guardian_name, Contact

Step-by-step Creation of Rehab_Centre Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Centre Table + Insert Data  
Step 4: Create Staff Table + Insert Data  
Step 5: Create Medicines Table + Insert Data  
Step 6: Create Rehab Table + Insert Data  
Step 7: Create Patient Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Rehab_Centre;

-- Step 2: Use the Database
use Rehab_Centre;

-- Step 3: Create Centre Table ----------------------------------------------------------
create table Centre(
    Centre_id int primary key,
    Centre_name varchar(50),
    Caretaker_name varchar(50),
    Contact varchar(10),
    Centre_Address varchar(50)
);

insert into Centre values
(1, 'Hope Wellness', 'Anjali Mehta', '9876543210', 'Mumbai'),
(2, 'Recovery Path', 'Raj Malhotra', '9876543211', 'Pune'),
(3, 'Healing Hands', 'Simran Kaur', '9876543212', 'Delhi'),
(4, 'New Life', 'Amit Desai', '9876543213', 'Chennai'),
(5, 'Care & Cure', 'Nita Verma', '9876543214', 'Kolkata'),
(6, 'Rise Again', 'Manoj Sinha', '9876543215', 'Nagpur'),
(7, 'Fresh Start', 'Priya Sharma', '9876543216', 'Jaipur'),
(8, 'Udaan Centre', 'Sandeep Roy', '9876543217', 'Bangalore'),
(9, 'Revive Hope', 'Alka Rathi', '9876543218', 'Hyderabad'),
(10, 'Sankalp', 'Deepak Thakur', '9876543219', 'Lucknow');

-- To display table data
select * from Centre;

-- To remove complete records from table
truncate table Centre;

-- To remove complete records and attributes from table
drop table Centre;


-- Step 4: Create Staff Table ----------------------------------------------------------
create table Staff(
    Staff_id int primary key,
    Staff_name varchar(50),
    Contact varchar(10),
    Patients_under_Staff varchar(50),
    Shift_Time varchar(20)
);

insert into Staff values
(1, 'Dr. Rohan', '9000000001', 'A1,A2', 'Morning'),
(2, 'Nurse Priya', '9000000002', 'B1,B2', 'Evening'),
(3, 'Dr. Neha', '9000000003', 'C1,C2', 'Night'),
(4, 'Dr. Sameer', '9000000004', 'D1,D2', 'Morning'),
(5, 'Dr. Alia', '9000000005', 'E1,E2', 'Evening'),
(6, 'Dr. Karan', '9000000006', 'F1,F2', 'Night'),
(7, 'Nurse Anu', '9000000007', 'G1,G2', 'Morning'),
(8, 'Dr. Yusuf', '9000000008', 'H1,H2', 'Evening'),
(9, 'Dr. Sneha', '9000000009', 'I1,I2', 'Night'),
(10, 'Dr. Arjun', '9000000010', 'J1,J2', 'Morning');

-- To display table data
select * from Staff;

-- To remove complete records from table
truncate table Staff;

-- To remove complete records and attributes from table
drop table Staff;


-- Step 5: Create Medicines Table ----------------------------------------------------------
create table Medicines(
    Medicine_id int primary key,
    Medicine_name varchar(50),
    Staff_name varchar(50),
    Patient_name varchar(50),
    Duration varchar(30)
);

insert into Medicines values
(1, 'Medizen-A', 'Dr. Rohan', 'A1', '15 days'),
(2, 'Healpro-B', 'Nurse Priya', 'B1', '10 days'),
(3, 'Reviva-C', 'Dr. Neha', 'C1', '20 days'),
(4, 'Neurodex-D', 'Dr. Sameer', 'D1', '30 days'),
(5, 'Relife-E', 'Dr. Alia', 'E1', '25 days'),
(6, 'Cureall-F', 'Dr. Karan', 'F1', '14 days'),
(7, 'Theramax-G', 'Nurse Anu', 'G1', '21 days'),
(8, 'Tranquil-H', 'Dr. Yusuf', 'H1', '7 days'),
(9, 'Rehabine-I', 'Dr. Sneha', 'I1', '18 days'),
(10, 'Neurocalm-J', 'Dr. Arjun', 'J1', '10 days');

-- To display table data
select * from Medicines;

-- To remove complete records from table
truncate table Medicines;

-- To remove complete records and attributes from table
drop table Medicines;


-- Step 6: Create Rehab Table ----------------------------------------------------------
create table Rehab(
    Rehab_id int primary key,
    Patient_name varchar(50),
    Duration varchar(30),
    Medicine_id int,
    Progress_Report varchar(50),
    foreign key (Medicine_id) references Medicines(Medicine_id)
);

insert into Rehab values
(1, 'A1', '15 days', 1, 'Improving'),
(2, 'B1', '10 days', 2, 'Stable'),
(3, 'C1', '20 days', 3, 'Good Progress'),
(4, 'D1', '30 days', 4, 'Moderate'),
(5, 'E1', '25 days', 5, 'Slight Improvement'),
(6, 'F1', '14 days', 6, 'Stable'),
(7, 'G1', '21 days', 7, 'Recovering'),
(8, 'H1', '7 days', 8, 'New Entry'),
(9, 'I1', '18 days', 9, 'Good Progress'),
(10, 'J1', '10 days', 10, 'Improving');

-- To display table data
select * from Rehab;

-- To remove complete records from table
truncate table Rehab;

-- To remove complete records and attributes from table
drop table Rehab;


-- Step 7: Create Patient Table ----------------------------------------------------------
create table Patient(
    Patient_id int primary key,
    Rehab_id int,
    Patient_name varchar(50),
    Patient_Guardian_name varchar(50),
    Contact varchar(10),
    foreign key (Rehab_id) references Rehab(Rehab_id)
);

insert into Patient values
(1, 1, 'A1', 'Mr. Kumar', '9990000001'),
(2, 2, 'B1', 'Mrs. Desai', '9990000002'),
(3, 3, 'C1', 'Mr. Rao', '9990000003'),
(4, 4, 'D1', 'Mr. Sen', '9990000004'),
(5, 5, 'E1', 'Mrs. Paul', '9990000005'),
(6, 6, 'F1', 'Mr. Tiwari', '9990000006'),
(7, 7, 'G1', 'Mr. Dixit', '9990000007'),
(8, 8, 'H1', 'Mrs. Chawla', '9990000008'),
(9, 9, 'I1', 'Mrs. Kapoor', '9990000009'),
(10, 10, 'J1', 'Mr. Mehra', '9990000010');

-- To display table data
select * from Patient;

-- To remove complete records from table
truncate table Patient;

-- To remove complete records and attributes from table
drop table Patient;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Centre;
select * from Staff;
select * from Medicines;
select * from Rehab;
select * from Patient;
