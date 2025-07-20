-- ------------------------------------------ HealthCare System Database ----------------------------------------------------
-- Create a Database first
create database HealthCare_System;

-- To work on this database, you need to use it first
use HealthCare_System;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : Patients(patient_id, name, age, gender, contact, address)

T2  : Doctors(doctor_id, name, specialty, phone_number, email)

T3  : Appointments(appointment_id, patient_id, doctor_id, date, time, status)

T4  : Medical_History(history_id, patient_id, diagnosis, treatment, notes)

T5  : Medications(medication_id, name, type, price, description)

T6  : Prescriptions(prescription_id, patient_id, medication_id, date_provided, dosage)

T7  : Bills(bill_id, patient_id, total_amount, payment_status, date)

T8  : Staff(staff_id, name, role, contact, shift)

T9  : Departments(department_id, name, location, phone, head)

T10 : Facilities(facility_id, name, type, cost, availability_status)
*/

-- --------------------------------------------------------------------------------------------------------------------------
-- Table-1 Patients
-- --------------------------------------------------------------------------------------------------------------------------
create table patients (
    patient_id int primary key,
    name varchar(100) not null,
    age int check(age > 0),
    gender enum('Male', 'Female', 'Other') not null,
    contact varchar(15),
    address varchar(200)
);

-- Data for Patients
insert into patients values
(1, 'Amit Sharma', 32, 'Male', '9876543210', 'Mumbai, India'),
(2, 'Priya Verma', 28, 'Female', '9898989898', 'Delhi, India'),
(3, 'Rahul Desai', 40, 'Male', '9123456780', 'Pune, India'),
(4, 'Sneha Kulkarni', 35, 'Female', '9811111111', 'Bangalore, India'),
(5, 'Ravi Mehta', 50, 'Male', '9000000001', 'Ahmedabad, India'),
(6, 'Neha Singh', 23, 'Female', '9801234567', 'Lucknow, India'),
(7, 'Kunal Patil', 45, 'Male', '9777777777', 'Nagpur, India'),
(8, 'Rohini Joshi', 29, 'Female', '9666666666', 'Hyderabad, India'),
(9, 'Aditya Menon', 37, 'Male', '9555555555', 'Kochi, India'),
(10, 'Pooja Reddy', 31, 'Female', '9444444444', 'Chennai, India');

-- to display table data
select * from patients;
-- to remove complete records from table
truncate table patients;
-- to remove complete records and attributes from table
drop table if exists patients;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-2 Doctors
-- --------------------------------------------------------------------------------------------------------------------------
create table doctors (
    doctor_id int primary key,
    name varchar(100) not null,
    specialty varchar(100),
    phone varchar(15),
    email varchar(100)
);

-- Data for Doctors
insert into doctors values
(1, 'Dr. Arjun Kapoor', 'Cardiologist', '9823456789', 'arjun.kapoor@hospital.com'),
(2, 'Dr. Meera Nair', 'Neurologist', '9812345678', 'meera.nair@hospital.com'),
(3, 'Dr. Karan Deshmukh', 'Orthopedic', '9809876543', 'karan.deshmukh@hospital.com'),
(4, 'Dr. Sanya Shah', 'Dermatologist', '9798765432', 'sanya.shah@hospital.com'),
(5, 'Dr. Rohit Iyer', 'Pediatrician', '9787654321', 'rohit.iyer@hospital.com'),
(6, 'Dr. Ritu Agarwal', 'Gynecologist', '9776543210', 'ritu.agarwal@hospital.com'),
(7, 'Dr. Anil Kumar', 'General Physician', '9765432109', 'anil.kumar@hospital.com'),
(8, 'Dr. Smita Patil', 'ENT Specialist', '9754321098', 'smita.patil@hospital.com'),
(9, 'Dr. Ajay Gupta', 'Oncologist', '9743210987', 'ajay.gupta@hospital.com'),
(10, 'Dr. Sunita Das', 'Psychiatrist', '9732109876', 'sunita.das@hospital.com');

-- to display table data
select * from doctors;
-- to remove complete records from table
truncate table doctors;
-- to remove complete records and attributes from table
drop table if exists doctors;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-3 Appointments
-- --------------------------------------------------------------------------------------------------------------------------
create table appointments (
    appointment_id int primary key,
    patient_id int,
    doctor_id int,
    date date,
    time time,
    status enum('Scheduled', 'Completed', 'Cancelled'),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id)
);

-- Data for Appointments
insert into appointments values
(1, 1, 1, '2025-07-01', '10:00:00', 'Scheduled'),
(2, 2, 2, '2025-07-02', '11:00:00', 'Completed'),
(3, 3, 3, '2025-07-03', '12:00:00', 'Scheduled'),
(4, 4, 4, '2025-07-04', '13:00:00', 'Completed'),
(5, 5, 5, '2025-07-05', '14:00:00', 'Cancelled'),
(6, 6, 6, '2025-07-06', '15:00:00', 'Scheduled'),
(7, 7, 7, '2025-07-07', '16:00:00', 'Completed'),
(8, 8, 8, '2025-07-08', '17:00:00', 'Scheduled'),
(9, 9, 9, '2025-07-09', '18:00:00', 'Completed'),
(10, 10, 10, '2025-07-10', '19:00:00', 'Cancelled');

-- to display table data
select * from appointments;
-- to remove complete records from table
truncate table appointments;
-- to remove complete records and attributes from table
drop table if exists appointments;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-4 Medical_history
-- --------------------------------------------------------------------------------------------------------------------------
create table medical_history (
    history_id int primary key,
    patient_id int,
    diagnosis varchar(200),
    treatment varchar(200),
    notes text,
    foreign key (patient_id) references patients(patient_id)
);

-- Data for Medical_history
insert into medical_history values
(1, 1, 'Hypertension', 'Medication', 'Monitor blood pressure daily'),
(2, 2, 'Migraine', 'Painkillers', 'Avoid stress'),
(3, 3, 'Fracture', 'Plaster', 'Follow up in 6 weeks'),
(4, 4, 'Skin Allergy', 'Ointment', 'Avoid dust'),
(5, 5, 'Asthma', 'Inhaler', 'Use inhaler twice daily'),
(6, 6, 'Anemia', 'Iron Supplements', 'Include iron-rich diet'),
(7, 7, 'Diabetes', 'Insulin', 'Check sugar level daily'),
(8, 8, 'Thyroid', 'Tablets', 'Monitor TSH levels'),
(9, 9, 'Cancer Screening', 'Tests', 'Regular follow-up'),
(10, 10, 'Depression', 'Therapy', 'Weekly counseling');

-- to display table data
select * from medical_history;
-- to remove complete records from table
truncate table medical_history;
-- to remove complete records and attributes from table
drop table if exists medical_history;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-5 Medications
-- --------------------------------------------------------------------------------------------------------------------------
create table medications (
    medication_id int primary key,
    name varchar(100) not null,
    type varchar(50),
    price decimal(10,2) check(price > 0),
    description text
);

-- Data for Medications
insert into medications values
(1, 'Paracetamol', 'Tablet', 20.00, 'Pain reliever'),
(2, 'Amoxicillin', 'Capsule', 50.00, 'Antibiotic'),
(3, 'Ibuprofen', 'Tablet', 30.00, 'Anti-inflammatory'),
(4, 'Cough Syrup', 'Syrup', 100.00, 'Relieves cough'),
(5, 'Insulin', 'Injection', 200.00, 'Diabetes control'),
(6, 'Vitamin C', 'Tablet', 15.00, 'Immunity booster'),
(7, 'Iron Syrup', 'Syrup', 80.00, 'Iron supplement'),
(8, 'Calcium Tablet', 'Tablet', 25.00, 'Bone strength'),
(9, 'Ointment A', 'Cream', 60.00, 'Skin allergy relief'),
(10, 'Antacid', 'Tablet', 10.00, 'Acidity relief');

-- to display table data
select * from medications;
-- to remove complete records from table
truncate table medications;
-- to remove complete records and attributes from table
drop table if exists medications;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-6 Prescriptions
-- --------------------------------------------------------------------------------------------------------------------------
create table prescriptions (
    prescription_id int primary key,
    patient_id int,
    medication_id int,
    date_provided date,
    dosage varchar(50),
    foreign key (patient_id) references patients(patient_id),
    foreign key (medication_id) references medications(medication_id)
);

-- Data for Prescriptions
insert into prescriptions values
(1, 1, 1, '2025-07-01', '1 tablet twice daily'),
(2, 2, 2, '2025-07-02', '1 capsule thrice daily'),
(3, 3, 3, '2025-07-03', '2 tablets daily'),
(4, 4, 4, '2025-07-04', '10ml syrup twice daily'),
(5, 5, 5, '2025-07-05', '1 injection daily'),
(6, 6, 6, '2025-07-06', '1 tablet daily'),
(7, 7, 7, '2025-07-07', '5ml syrup twice daily'),
(8, 8, 8, '2025-07-08', '1 tablet daily'),
(9, 9, 9, '2025-07-09', 'Apply twice daily'),
(10, 10, 10, '2025-07-10', '1 tablet after meal');

-- to display table data
select * from prescriptions;
-- to remove complete records from table
truncate table prescriptions;
-- to remove complete records and attributes from table
drop table if exists prescriptions;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-7 Bills
-- --------------------------------------------------------------------------------------------------------------------------
create table bills (
    bill_id int primary key,
    patient_id int,
    total_amount decimal(10,2) check (total_amount > 0),
    payment_status enum('Paid', 'Pending', 'Cancelled'),
    date date,
    foreign key (patient_id) references patients(patient_id)
);

-- Data for Bills
insert into bills values
(1, 1, 500.00, 'Paid', '2025-07-01'),
(2, 2, 800.00, 'Paid', '2025-07-02'),
(3, 3, 1200.00, 'Pending', '2025-07-03'),
(4, 4, 300.00, 'Paid', '2025-07-04'),
(5, 5, 1500.00, 'Paid', '2025-07-05'),
(6, 6, 400.00, 'Pending', '2025-07-06'),
(7, 7, 250.00, 'Paid', '2025-07-07'),
(8, 8, 900.00, 'Cancelled', '2025-07-08'),
(9, 9, 700.00, 'Paid', '2025-07-09'),
(10, 10, 600.00, 'Paid', '2025-07-10');

-- to display table data
select * from bills;
-- to remove complete records from table
truncate table bills;
-- to remove complete records and attributes from table
drop table if exists bills;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-8 Staff
-- --------------------------------------------------------------------------------------------------------------------------
create table staff (
    staff_id int primary key,
    name varchar(100) not null,
    role varchar(100) not null,
    contact varchar(15),
    shift enum('Morning', 'Evening', 'Night')
);

-- Data for Staff
insert into staff values
(1, 'Manish Rao', 'Nurse', '9877000001', 'Morning'),
(2, 'Rekha Das', 'Receptionist', '9877000002', 'Evening'),
(3, 'Suresh Singh', 'Technician', '9877000003', 'Night'),
(4, 'Anita Roy', 'Pharmacist', '9877000004', 'Morning'),
(5, 'Vikas Patel', 'Lab Assistant', '9877000005', 'Evening'),
(6, 'Poonam Jain', 'Ward Boy', '9877000006', 'Morning'),
(7, 'Rajesh Yadav', 'Driver', '9877000007', 'Night'),
(8, 'Anjali Sen', 'HR', '9877000008', 'Evening'),
(9, 'Deepak Rana', 'Cleaner', '9877000009', 'Morning'),
(10, 'Kiran Malhotra', 'Manager', '9877000010', 'Night');

-- to display table data
select * from staff;
-- to remove complete records from table
truncate table staff;
-- to remove complete records and attributes from table
drop table if exists staff;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-9 Departments
-- --------------------------------------------------------------------------------------------------------------------------
create table departments (
    department_id int primary key,
    name varchar(100),
    location varchar(100),
    phone varchar(15),
    head varchar(100)
);

-- Data for Departments
insert into departments values
(1, 'Cardiology', 'Block A', '0221234567', 'Dr. Arjun Kapoor'),
(2, 'Neurology', 'Block B', '0222345678', 'Dr. Meera Nair'),
(3, 'Orthopedics', 'Block C', '0223456789', 'Dr. Karan Deshmukh'),
(4, 'Dermatology', 'Block D', '0224567890', 'Dr. Sanya Shah'),
(5, 'Pediatrics', 'Block E', '0225678901', 'Dr. Rohit Iyer'),
(6, 'Gynecology', 'Block F', '0226789012', 'Dr. Ritu Agarwal'),
(7, 'General Medicine', 'Block G', '0227890123', 'Dr. Anil Kumar'),
(8, 'ENT', 'Block H', '0228901234', 'Dr. Smita Patil'),
(9, 'Oncology', 'Block I', '0229012345', 'Dr. Ajay Gupta'),
(10, 'Psychiatry', 'Block J', '0220123456', 'Dr. Sunita Das');

-- to display table data
select * from departments;
-- to remove complete records from table
truncate table departments;
-- to remove complete records and attributes from table
drop table if exists departments;


-- --------------------------------------------------------------------------------------------------------------------------
-- Table-10 Facilities
-- --------------------------------------------------------------------------------------------------------------------------
create table facilities (
    facility_id int primary key,
    name varchar(100),
    type varchar(50),
    cost decimal(10,2) check (cost > 0),
    availability_status enum('Available', 'Not Available')
);

-- Data for Facilities
insert into facilities values
(1, 'MRI Scan', 'Diagnostic', 3000.00, 'Available'),
(2, 'CT Scan', 'Diagnostic', 2500.00, 'Available'),
(3, 'X-Ray', 'Diagnostic', 500.00, 'Available'),
(4, 'ICU Bed', 'Treatment', 5000.00, 'Not Available'),
(5, 'Private Room', 'Accommodation', 2000.00, 'Available'),
(6, 'General Ward', 'Accommodation', 1000.00, 'Available'),
(7, 'Ambulance', 'Transport', 1500.00, 'Available'),
(8, 'Physiotherapy', 'Rehabilitation', 700.00, 'Available'),
(9, 'Dialysis', 'Treatment', 2500.00, 'Not Available'),
(10, 'Blood Bank', 'Support', 1000.00, 'Available');

-- to display table data
select * from facilities;
-- to remove complete records from table
truncate table facilities;
-- to remove complete records and attributes from table
drop table if exists facilities;


-- --------------------------------------------------------------------------------------------------------------------------
--  QUERIES :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. SELECT Queries
-- ------------------------------------------------------
-- Retrieve all patients older than 30
select * from patients where age > 30;

-- Get all appointments scheduled with doctor_id = 1
select * from appointments where doctor_id = 1 and status = 'Scheduled';

-- List all medications with price greater than 50
select * from medications where price > 50;

-- Retrieve name and contact of all staff working in Morning shift
select name, contact from staff where shift = 'Morning';

-- Get the total amount of all 'Paid' bills
select sum(total_amount) as total_paid_amount from bills where payment_status = 'Paid';

-- ------------------------------------------------------
-- 2. RENAME Queries
-- ------------------------------------------------------
-- Rename a table: Rename 'patients' table to 'patient_info'
rename table patients to patient_info;
select * from patients;
select * from patient_info;

-- Rename a column: Change 'contact' column in doctors table to 'phone_number'
alter table doctors change contact phone_number varchar(15);

-- ------------------------------------------------------
-- 3. UPDATE Queries
-- ------------------------------------------------------
/*
What is SQL_SAFE_UPDATES?
In MySQL, SQL_SAFE_UPDATES prevents UPDATE or DELETE statements that don't use a WHERE clause or a LIMIT clause, 
reducing the risk of accidental mass data modification.
*/
-- Enable SQL_SAFE_UPDATES
set sql_safe_updates = 0;

-- Update the address of patient_id = 1 in patient_info table
update patients set address = 'Thane, India' where patient_id = 1;
select * from patients;

-- Update the payment_status of bill_id = 3 to 'Paid'
update bills set payment_status = 'Paid' where bill_id = 3;

-- ------------------------------------------------------
-- 4. ALTER Queries
-- ------------------------------------------------------
-- Add a column 'emergency_contact' to staff table
alter table staff add emergency_contact varchar(15);
select * from staff;

-- Modify the 'age' column in patient_info to allow only values up to 3 digits
alter table patient_info modify age int(3);

-- Drop a column 'notes' from medical_history
alter table medical_history drop column notes;

-- ------------------------------------------------------
-- 5. DELETE Queries
-- ------------------------------------------------------
-- Delete a record where bill_id = 10 from bills
delete from bills where bill_id = 10;
select * from bills;

-- Delete all appointments that have status 'Cancelled'
delete from appointments where status = 'Cancelled';


-- --------------------------------------------------------------------------------------------------------------------------
-- BUILT-IN FUNCTIONS :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. STRING Functions
-- ------------------------------------------------------
-- Convert doctor names to uppercase
select upper(name) as doctor_name_upper from doctors;

-- Extract first 5 characters from patient names
select left(name, 5) as short_name from patients;

-- Concatenate name and contact for staff
select concat(name, ' - ', contact) as staff_details from staff;

-- ------------------------------------------------------
-- 2. NUMERIC Functions
-- ------------------------------------------------------
-- Round the price of medications
select name, round(price, 0) as rounded_price from medications;

-- Get maximum bill amount
select max(total_amount) as max_bill from bills;

-- Get average bill amount
select avg(total_amount) as avg_bill_amount from bills;

-- ------------------------------------------------------
-- 3. DATE & TIME Functions
-- ------------------------------------------------------
-- Current date
select curdate() as today_date;

-- Extract year from appointment date
select appointment_id, year(date) as appointment_year from appointments;

-- Calculate days passed since a specific bill date
select bill_id, datediff(curdate(), date) as days_since_bill from bills;

-- ------------------------------------------------------
-- 4. Aggregate Functions with GROUP-BY
-- ------------------------------------------------------
-- Count total appointments per doctor
select doctor_id, count(*) as total_appointments from appointments group by doctor_id;

-- Sum of bills for each payment status
select payment_status, sum(total_amount) as total_amount
from bills
group by payment_status;

-- ------------------------------------------------------
-- 5. CONDITIONAL Functions (IF & CASE)
-- ------------------------------------------------------
-- Mark patients as 'Senior' if age > 40 else 'Adult'
select name, age, if(age > 40, 'Senior', 'Adult') as category from patients;

-- Show custom payment status message
select bill_id, total_amount,
    case 
        when payment_status = 'Paid' then 'Payment Complete'
        when payment_status = 'Pending' then 'Awaiting Payment'
        else 'Cancelled Bill'
    end as payment_message
from bills;


-- --------------------------------------------------------------------------------------------------------------------------
-- OPERATORS & ALIAS Concepts :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. COMPARISON Operators
-- ------------------------------------------------------

-- Get patients older than 30
select * from patients where age > 30;

-- Get bills where total_amount equals 500
select * from bills where total_amount = 500.00;

-- ------------------------------------------------------
-- 2. LOGICAL Operators
-- ------------------------------------------------------

-- Get patients who are female and above 25
select * from patients where gender = 'Female' and age > 25;

-- Get doctors who are either Cardiologist or Neurologist
select * from doctors where specialty = 'Cardiologist' or specialty = 'Neurologist';

-- ------------------------------------------------------
-- 3. ARITHMETIC Operators
-- ------------------------------------------------------

-- Increase the price of each medication by 10%
select name, price, (price * 1.10) as increased_price from medications;

-- Get the total bill amount including 5% tax
select bill_id, total_amount, (total_amount * 1.05) as total_with_tax from bills;

-- ------------------------------------------------------
-- 4. STRING Operators
-- ------------------------------------------------------

-- Find patients whose name starts with 'P'
select * from patients where name like 'P%';

-- Find doctors whose email contains 'hospital'
select * from doctors where email like '%hospital%';

-- ------------------------------------------------------
-- 5. ALIAS USAGE
-- ------------------------------------------------------

-- Use alias for columns
select name as patient_name, age as patient_age from patients;

-- Use alias for table
select p.name, b.total_amount
from patients p
join bills b on p.patient_id = b.patient_id;


-- --------------------------------------------------------------------------------------------------------------------------
-- REAL-WORLD USE CASES:
-- --------------------------------------------------------------------------------------------------------------------------
/*
1. Patient Management:
	--> Keep track of patient details, medical history, and prescriptions.
	--> Quickly retrieve patient contact and past treatment data.

2. Doctor & Department Coordination:
	--> Assign doctors to patients based on specialty and department.
	--> Maintain a record of all doctors and their availability.

3. Appointment Scheduling & Follow-Ups:
	--> Manage appointment scheduling and status (Scheduled, Completed, Cancelled).
	--> Generate automated reminders for upcoming visits.

4. Medical History & Prescription Tracking:
	--> Access a patient’s diagnosis and treatments during consultations.
	--> Track prescribed medications and dosage history.

5. Billing & Payments:
	--> Generate patient bills including consultations, tests, and medications.
	--> Track payment status (Paid, Pending, Cancelled) and generate reports.

6. Facility & Staff Management:
	--> Track the availability of diagnostic and treatment facilities.
	--> Manage hospital staff roles, shifts, and emergency contacts.
*/


-- --------------------------------------------------------------------------------------------------------------------------
-- REAL-LIFE ANALYSIS QUERIES :
-- --------------------------------------------------------------------------------------------------------------------------
-- 1. Schedule next appointment (Example for patient_id = 2 with doctor_id = 3)
insert into appointments (appointment_id, patient_id, doctor_id, date, time, status)
values (11, 2, 3, '2025-07-25', '11:30:00', 'Scheduled');
-- Verify the upcoming appointment
select * from appointments 
where patient_id = 2 
order by date desc, time desc limit 1;

-- 2. Which doctor treated the most patients?
select d.name as doctor_name, count(a.patient_id) as total_patients
from appointments a
join doctors d on a.doctor_id = d.doctor_id
group by d.name
order by total_patients desc
limit 1;

-- 3. Patients with total bill > 1000
select p.name as patient_name, sum(b.total_amount) as total_bill
from bills b
join patients p on b.patient_id = p.patient_id
group by p.name
having total_bill > 1000;

-- 4. List all patients treated by 'Dr. Arjun Kapoor'
select distinct p.name as patient_name, a.date as appointment_date
from appointments a
join patients p on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id
where d.name = 'Dr. Arjun Kapoor';

-- 5. Find the most prescribed medication
select m.name as medication_name, count(pr.medication_id) as total_prescribed
from prescriptions pr
join medications m on pr.medication_id = m.medication_id
group by m.name
order by total_prescribed desc
limit 1;

-- 6. List patients who had an appointment but no bill generated
select p.name as patient_name, a.appointment_id
from appointments a
join patients p on a.patient_id = p.patient_id
where a.patient_id not in (select patient_id from bills);

-- 7. Generate monthly billing summary
select month(date) as month_number, sum(total_amount) as total_revenue
from bills
where payment_status = 'Paid'
group by month(date)
order by month_number;

-- 8. Find doctors who have more than 2 appointments scheduled
select d.name as doctor_name, count(a.appointment_id) as total_appointments
from appointments a
join doctors d on a.doctor_id = d.doctor_id
where a.status = 'Scheduled'
group by d.name
having count(a.appointment_id) > 2;

-- 9. Find the most expensive medication prescribed
select p.name as patient_name, m.name as medication_name, m.price
from prescriptions pr
join patients p on pr.patient_id = p.patient_id
join medications m on pr.medication_id = m.medication_id
where m.price = (select max(price) from medications);

-- 10. List doctors and the departments they lead
select d.name as doctor_name, dep.name as department_name
from doctors d
join departments dep on dep.head = d.name;

-- 11. Get patients with pending bills along with total due
select p.name as patient_name, sum(b.total_amount) as pending_amount
from bills b
join patients p on b.patient_id = p.patient_id
where b.payment_status = 'Pending'
group by p.name
order by pending_amount desc;

-- 12. Find doctors who have not treated any patients
select d.name as doctor_name
from doctors d
where d.doctor_id not in (select doctor_id from appointments);

-- 13. List patients with multiple appointments (more than 1)
select p.name as patient_name, count(a.appointment_id) as total_appointments
from appointments a
join patients p on a.patient_id = p.patient_id
group by p.name
having count(a.appointment_id) > 1;

-- 14. Fetch complete medical history for patient_id = 3
select p.name as patient_name, m.diagnosis, m.treatment, m.notes
from medical_history m
join patients p on p.patient_id = m.patient_id
where m.patient_id = 3;

-- 15. List doctors in 'Cardiology' department
select d.doctor_id, d.name as doctor_name, d.specialty, dep.name as department_name
from doctors d
join departments dep on dep.head = d.name
where dep.name = 'Cardiology';

-- 16. Generate billing report for patient_id = 5
select p.name as patient_name, b.bill_id, b.total_amount, b.payment_status, b.date
from bills b
join patients p on p.patient_id = b.patient_id
where b.patient_id = 5
order by b.date desc;