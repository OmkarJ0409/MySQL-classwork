/*
This File consists of a database named HOSPITAL having tables Doctors, Patients, Appointments, Bills, and Medications.

Table.1 - DOCTORS TABLE - (Stores doctor information)
        Attributes: Doctor_id, Doctor_name, Age, Designation, Contact

Table.2 - PATIENTS TABLE - (Stores patient information)
        Attributes: Patient_id, Patient_name, Age, Gender, Contact

Table.3 - APPOINTMENTS TABLE - (Stores doctor-patient appointment details)
        Attributes: Appointment_id, Patient_id, Doctor_id, Appointment_time

Table.4 - BILLS TABLE - (Stores billing information for treatments)
        Attributes: Bill_id, Patient_id, Doctor_id, Bill_Amount, Payment_method

Table.5 - MEDICATIONS TABLE - (Stores prescribed medications)
        Attributes: Medication_id, Patient_id, Doctor_id, Medicine, Duration

Step-by-step Creation of HOSPITAL Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Doctors Table + Insert Data
Step 4: Create Patients Table + Insert Data
Step 5: Create Appointments Table + Insert Data
Step 6: Create Bills Table + Insert Data
Step 7: Create Medications Table + Insert Data
Step 8: View Data
*/

-- Step 1: Create the Database
create database Hospital;

-- Step 2: Use the database
use Hospital;

-- Step 3: Create Doctors Table ---------------------------------------------------------------------
create table Doctors(
    Doctor_id int primary key,               -- Unique Doctor ID
    Doctor_name varchar(50),                 -- Full name of the doctor
    Age int,                                 -- Age of the doctor
    Designation varchar(50),                 -- Specialization
    Contact varchar(10)                      -- Contact number
);

-- Insert records into Doctors table
insert into Doctors values
(1, 'Dr. Arjun Mehta', 45, 'Cardiologist', '9876543210'),
(2, 'Dr. Sneha Desai', 38, 'Dermatologist', '9876543211'),
(3, 'Dr. Ravi Kumar', 50, 'Neurologist', '9876543212'),
(4, 'Dr. Priya Iyer', 42, 'Pediatrician', '9876543213'),
(5, 'Dr. Karan Joshi', 36, 'Orthopedic', '9876543214'),
(6, 'Dr. Anjali Shah', 41, 'Gynecologist', '9876543215'),
(7, 'Dr. Vikram Rao', 48, 'Urologist', '9876543216'),
(8, 'Dr. Neha Kulkarni', 39, 'ENT Specialist', '9876543217'),
(9, 'Dr. Manoj Nair', 44, 'General Physician', '9876543218'),
(10, 'Dr. Ritu Patel', 33, 'Psychiatrist', '9876543219');

-- To display table data
select * from Doctors;

-- To remove complete records from table
truncate table Doctors;

-- To remove complete records and attributes from table
drop table Doctors;


-- Step 4: Create Patients Table ---------------------------------------------------------------------
create table Patients(
    Patient_id int primary key,              -- Unique Patient ID
    Patient_name varchar(50),                -- Full name of the patient
    Age int,                                 -- Age of the patient
    Gender varchar(10),                      -- Gender of the patient
    Contact varchar(10)                      -- Contact number
);

-- Insert records into Patients table
insert into Patients values
(1, 'Amit Verma', 29, 'Male', '9123456780'),
(2, 'Rita Shah', 35, 'Female', '9123456781'),
(3, 'Raj Malhotra', 42, 'Male', '9123456782'),
(4, 'Meena Iyer', 31, 'Female', '9123456783'),
(5, 'Rakesh Rao', 54, 'Male', '9123456784'),
(6, 'Nisha Jain', 27, 'Female', '9123456785'),
(7, 'Arun Deshpande', 61, 'Male', '9123456786'),
(8, 'Komal Thakur', 38, 'Female', '9123456787'),
(9, 'Siddharth Mehta', 22, 'Male', '9123456788'),
(10, 'Sneha Bhatt', 30, 'Female', '9123456789');

-- To display table data
select * from Patients;

-- To remove complete records from table
truncate table Patients;

-- To remove complete records and attributes from table
drop table Patients;


-- Step 5: Create Appointments Table ------------------------------------------------------------------
create table Appointments(
    Appointment_id int primary key,           -- Unique Appointment ID
    Patient_id int,                           -- Patient linked to appointment
    Doctor_id int,                            -- Doctor linked to appointment
    Appointment_time date,                    -- Date of appointment
    Purpose varchar(100),                     -- Reason for the appointment
    foreign key (Patient_id) references Patients(Patient_id),
    foreign key (Doctor_id) references Doctors(Doctor_id)
);

-- Insert records into Appointments table
insert into Appointments values
(1, 1, 9, '2025-05-01', 'General Checkup'),
(2, 2, 2, '2025-05-02', 'Skin Allergy'),
(3, 3, 1, '2025-05-03', 'Chest Pain'),
(4, 4, 4, '2025-05-04', 'Child Fever'),
(5, 5, 5, '2025-05-05', 'Knee Pain'),
(6, 6, 6, '2025-05-06', 'Routine Checkup'),
(7, 7, 3, '2025-05-07', 'Migraine'),
(8, 8, 8, '2025-05-08', 'Ear Pain'),
(9, 9, 10, '2025-05-09', 'Depression'),
(10, 10, 7, '2025-05-10', 'Kidney Stone');

-- To display table data
select * from Appointments;

-- To remove complete records from table
truncate table Appointments;

-- To remove complete records and attributes from table
drop table Appointments;


-- Step 6: Create Bills Table --------------------------------------------------------------------------
create table Bills(
    Bill_id int primary key,                 -- Unique Bill ID
    Patient_id int,                          -- Patient billed
    Doctor_id int,                           -- Doctor involved in treatment
    Bill_Amount int,                         -- Total amount charged
    Payment_method varchar(50),              -- Mode of payment
    foreign key (Patient_id) references Patients(Patient_id),
    foreign key (Doctor_id) references Doctors(Doctor_id)
);

-- Insert records into Bills table
insert into Bills values
(101, 1, 9, 1200, 'Cash'),
(102, 2, 2, 1500, 'Credit Card'),
(103, 3, 1, 2500, 'UPI'),
(104, 4, 4, 900, 'Cash'),
(105, 5, 5, 1800, 'Net Banking'),
(106, 6, 6, 2000, 'Credit Card'),
(107, 7, 3, 3200, 'Cash'),
(108, 8, 8, 1100, 'Debit Card'),
(109, 9, 10, 1600, 'UPI'),
(110, 10, 7, 2100, 'Credit Card');

-- To display table data
select * from Bills;

-- To remove complete records from table
truncate table Bills;

-- To remove complete records and attributes from table
drop table Bills;


-- Step 7: Create Medications Table ---------------------------------------------------------------------
create table Medications(
    Medication_id int primary key,           -- Unique Medication ID
    Patient_id int,                          -- Patient prescribed
    Doctor_id int,                           -- Doctor who prescribed
    Medicine varchar(100),                   -- Medicine name
    Duration varchar(50),                    -- Duration of prescription
    foreign key (Patient_id) references Patients(Patient_id),
    foreign key (Doctor_id) references Doctors(Doctor_id)
);

-- Insert records into Medications table
insert into Medications values
(201, 1, 9, 'Paracetamol 500mg', '5 days'),
(202, 2, 2, 'Cetirizine 10mg', '7 days'),
(203, 3, 1, 'Aspirin 100mg', '10 days'),
(204, 4, 4, 'Amoxicillin 500mg', '5 days'),
(205, 5, 5, 'Diclofenac 50mg', '3 days'),
(206, 6, 6, 'Folic Acid', '15 days'),
(207, 7, 3, 'Gabapentin 300mg', '10 days'),
(208, 8, 8, 'Levocetirizine 5mg', '7 days'),
(209, 9, 10, 'Sertraline 50mg', '30 days'),
(210, 10, 7, 'Tamsulosin 0.4mg', '14 days');

-- To display table data
select * from Medications;

-- To remove complete records from table
truncate table Medications;

-- To remove complete records and attributes from table
drop table Medications;


-- Step 8: View All Tables --------------------------------------------------------------------------
select * from Doctors;
select * from Patients;
select * from Appointments;
select * from Bills;
select * from Medications;