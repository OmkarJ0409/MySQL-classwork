-- create a database first
create database indian_army;

-- to work on this database, you need to use it first
use indian_army;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : regiments(regiment_id, name, type, formation_year, headquarters, commanding_officer, location, strength, motto, active_status)
T2  : soldiers(soldier_id, full_name, rank, dob, gender, joining_date, regiment_id, blood_group, contact, address)
T3  : officers(officer_id, full_name, rank, dob, gender, commission_date, unit_id, specialization, phone, email)
T4  : units(unit_id, name, type, regiment_id, formation_date, base_location, commanding_officer, strength, status, region)
T5  : operations(operation_id, name, start_date, end_date, location, objective, unit_id, outcome, casualties, remarks)
T6  : training_centers(center_id, name, location, type, established_year, capacity, contact, incharge, status, remarks)
T7  : trainings(training_id, soldier_id, center_id, start_date, end_date, course_name, result, grade, instructor, remarks)
T8  : equipment(equipment_id, name, type, manufacturer, acquisition_date, unit_id, condition, quantity, last_inspection, status)
T9  : missions(mission_id, title, unit_id, mission_type, location, start_date, end_date, success, leader, summary)
T10 : medical_records(record_id, soldier_id, checkup_date, doctor_name, diagnosis, treatment, remarks, next_checkup, status, hospital_name)
*/

-- Table-1 regiments --------------------------------------------------------------------------------------------------------
create table regiments (
regiment_id int primary key,
name varchar(100),
type varchar(50),
formation_year int,
headquarters varchar(100),
commanding_officer varchar(100),
location varchar(100),
strength int,
motto varchar(100),
active_status varchar(20)
);

insert into regiments values
(1, 'Punjab Regiment', 'Infantry', 1761, 'Ramgarh Cantonment', 'Col. Arjun Singh', 'Jharkhand', 1500, 'Sahasa Vijayate', 'Active'),
(2, 'Sikh Regiment', 'Infantry', 1846, 'Ramgarh Cantonment', 'Col. Rajveer Singh', 'Jharkhand', 1600, 'Nischay Kar Apni Jeet Karon', 'Active'),
(3, 'Gorkha Rifles', 'Infantry', 1815, 'Subathu', 'Col. D.B. Gurung', 'Himachal Pradesh', 1400, 'Kayar Hunu Bhanda Marnu Ramro', 'Active'),
(4, 'Parachute Regiment', 'Airborne', 1945, 'Bangalore', 'Col. A.K. Sinha', 'Karnataka', 1300, 'Shatrujeet', 'Active'),
(5, 'Armoured Corps', 'Armoured', 1947, 'Ahmednagar', 'Col. V.K. Chauhan', 'Maharashtra', 1700, 'Vrattr Shaktir Astra', 'Active'),
(6, 'Assam Regiment', 'Infantry', 1941, 'Shillong', 'Col. T. Das', 'Meghalaya', 1200, 'Tagra Raho', 'Active'),
(7, 'Dogra Regiment', 'Infantry', 1877, 'Faizabad', 'Col. H. Rawat', 'Uttar Pradesh', 1350, 'Kartavyam Anvatma', 'Active'),
(8, 'Grenadiers', 'Infantry', 1778, 'Jabalpur', 'Col. B. Yadav', 'Madhya Pradesh', 1450, 'Sarvada Shaktishali', 'Active'),
(9, 'Rajput Regiment', 'Infantry', 1778, 'Fatehgarh', 'Col. P. Rathore', 'Uttar Pradesh', 1550, 'Sarvatra Vijay', 'Active'),
(10, 'Bihar Regiment', 'Infantry', 1941, 'Danapur', 'Col. R. Sinha', 'Bihar', 1250, 'Karam Hi Dharam Hai', 'Active');

-- to display table data
select * from regiments;
-- to remove complete records from table
truncate table regiments;
-- to remove complete records and attributes from table
drop table regiments;


-- Table-2 soldiers ---------------------------------------------------------------------------------------------------------
create table soldiers (
soldier_id int primary key,
full_name varchar(100),
Soldier_rank varchar(50),
dob date,
gender varchar(10),
joining_date date,
regiment_id int,
blood_group varchar(5),
contact varchar(15),
address text,
foreign key (regiment_id) references regiments(regiment_id)
);

insert into soldiers values
(1, 'Ravi Kumar', 'Havildar', '1985-02-15', 'Male', '2005-03-01', 1, 'B+', '9876543210', 'Patiala, Punjab'),
(2, 'Anil Mehta', 'Naik', '1990-04-22', 'Male', '2010-06-10', 2, 'O+', '9876543211', 'Amritsar, Punjab'),
(3, 'Dinesh Thapa', 'Rifleman', '1992-08-17', 'Male', '2013-09-15', 3, 'A+', '9876543212', 'Pokhara, Nepal'),
(4, 'Arjun Singh', 'Lance Naik', '1987-12-10', 'Male', '2007-11-01', 4, 'B-', '9876543213', 'Bangalore, Karnataka'),
(5, 'Vikram Chauhan', 'Havildar', '1989-07-05', 'Male', '2009-01-15', 5, 'O-', '9876543214', 'Pune, Maharashtra'),
(6, 'Rakesh Das', 'Sepoy', '1995-01-25', 'Male', '2016-02-01', 6, 'AB+', '9876543215', 'Guwahati, Assam'),
(7, 'Harish Rawat', 'Naik', '1991-03-14', 'Male', '2011-07-20', 7, 'A-', '9876543216', 'Nainital, Uttarakhand'),
(8, 'Bhupender Yadav', 'Rifleman', '1993-10-30', 'Male', '2014-05-10', 8, 'B+', '9876543217', 'Gwalior, Madhya Pradesh'),
(9, 'Pratap Singh', 'Havildar', '1988-06-09', 'Male', '2008-04-05', 9, 'O+', '9876543218', 'Jaipur, Rajasthan'),
(10, 'Rajesh Sinha', 'Sepoy', '1994-09-12', 'Male', '2015-12-20', 10, 'AB-', '9876543219', 'Patna, Bihar');

-- to display table data
select * from soldiers;
-- to remove complete records from table
truncate table soldiers;
-- to remove complete records and attributes from table
drop table soldiers;


-- Table-3 officers ---------------------------------------------------------------------------------------------------------
create table officers (
officer_id int primary key,
full_name varchar(100),
Officer_rank varchar(50),
dob date,
gender varchar(10),
commission_date date,
unit_id int,
specialization varchar(50),
phone varchar(15),
email varchar(100)
);

insert into officers values
(1, 'Col. Arvind Menon', 'Colonel', '1975-03-20', 'Male', '1997-06-15', 1, 'Infantry Operations', '9000000001', 'arvind.menon@army.in'),
(2, 'Lt. Col. Sneha Sharma', 'Lieutenant Colonel', '1978-11-10', 'Female', '2000-08-20', 2, 'Logistics', '9000000002', 'sneha.sharma@army.in'),
(3, 'Major Rajat Kapoor', 'Major', '1982-07-05', 'Male', '2005-01-18', 3, 'Strategy', '9000000003', 'rajat.kapoor@army.in'),
(4, 'Captain Rahul Joshi', 'Captain', '1987-02-12', 'Male', '2010-03-12', 4, 'Armour Warfare', '9000000004', 'rahul.joshi@army.in'),
(5, 'Brig. Anita Desai', 'Brigadier', '1970-06-08', 'Female', '1993-09-25', 5, 'Planning & Ops', '9000000005', 'anita.desai@army.in'),
(6, 'Major Pradeep Rana', 'Major', '1983-10-14', 'Male', '2006-11-09', 6, 'Weapons', '9000000006', 'pradeep.rana@army.in'),
(7, 'Lt. Rohit Mehra', 'Lieutenant', '1990-04-22', 'Male', '2015-07-01', 7, 'Signals', '9000000007', 'rohit.mehra@army.in'),
(8, 'Capt. Niharika Shah', 'Captain', '1986-12-18', 'Female', '2009-02-20', 8, 'Medical', '9000000008', 'niharika.shah@army.in'),
(9, 'Lt. Col. Vikrant Das', 'Lieutenant Colonel', '1979-08-11', 'Male', '2001-10-05', 9, 'Combat Ops', '9000000009', 'vikrant.das@army.in'),
(10, 'Major Tara Sen', 'Major', '1985-01-30', 'Female', '2008-04-15', 10, 'Engineering', '9000000010', 'tara.sen@army.in');

-- to display table data
select * from officers;
-- to remove complete records from table
truncate table officers;
-- to remove complete records and attributes from table
drop table officers;


-- Table-4 units ------------------------------------------------------------------------------------------------------------
create table units (
unit_id int primary key,
name varchar(100),
location varchar(100),
formation_date date,
type varchar(50),
commanding_officer varchar(100),
strength int,
regiment_id int,
mission_ready_status varchar(20),
remarks text,
foreign key (regiment_id) references regiments(regiment_id)
);

insert into units values
(1, 'Alpha Company', 'Siachen Base', '2000-01-15', 'Infantry', 'Col. Arvind Menon', 200, 1, 'Ready', 'Deployed at high altitude'),
(2, 'Bravo Company', 'Uri Sector', '2003-05-10', 'Infantry', 'Lt. Col. Sneha Sharma', 180, 2, 'Ready', 'Along LoC deployment'),
(3, 'Charlie Unit', 'Ladakh Region', '2005-07-22', 'Mountain Warfare', 'Major Rajat Kapoor', 150, 3, 'Ready', 'Cold weather operations'),
(4, 'Delta Company', 'Nagrota Base', '2006-03-18', 'Mechanized Infantry', 'Captain Rahul Joshi', 175, 4, 'Ready', 'Training on BMP-2'),
(5, 'Echo Unit', 'Ahmednagar', '2002-10-12', 'Armoured', 'Brig. Anita Desai', 220, 5, 'Ready', 'Tank warfare specialist'),
(6, 'Foxtrot Company', 'Shillong HQ', '2008-12-09', 'Infantry', 'Major Pradeep Rana', 165, 6, 'Ready', 'NE operations'),
(7, 'Golf Company', 'Faizabad', '2009-09-27', 'Infantry', 'Lt. Rohit Mehra', 160, 7, 'Ready', 'Border patrol'),
(8, 'Hotel Unit', 'Jabalpur', '2011-11-14', 'Infantry', 'Capt. Niharika Shah', 190, 8, 'Ready', 'Drill training unit'),
(9, 'India Unit', 'Fatehgarh', '2010-08-03', 'Infantry', 'Lt. Col. Vikrant Das', 185, 9, 'Ready', 'Rapid response'),
(10, 'Juliet Unit', 'Danapur', '2012-06-30', 'Infantry', 'Major Tara Sen', 175, 10, 'Ready', 'War game exercises');

-- to display table data
select * from units;
-- to remove complete records from table
truncate table units;
-- to remove complete records and attributes from table
drop table units;


-- Table-5 operations -------------------------------------------------------------------------------------------------------
create table operations (
operation_id int primary key,
name varchar(100),
type varchar(50),
location varchar(100),
start_date date,
end_date date,
commanding_unit int,
objective text,
status varchar(20),
remarks text,
foreign key (commanding_unit) references units(unit_id)
);

insert into operations values
(1, 'Operation Snowstorm', 'Combat', 'Siachen Glacier', '2020-01-01', '2020-06-30', 1, 'Secure strategic high points', 'Completed', 'High altitude success'),
(2, 'Operation Trident', 'Reconnaissance', 'Uri Sector', '2021-03-10', '2021-05-25', 2, 'Collect intelligence near LoC', 'Completed', 'No casualties'),
(3, 'Operation Himalayan Shield', 'Defense', 'Ladakh', '2022-06-01', '2022-12-31', 3, 'Enhance surveillance and border patrol', 'Ongoing', 'Winter phase started'),
(4, 'Operation Ironclad', 'Training', 'Nagrota', '2023-02-15', '2023-04-15', 4, 'Train troops in mechanized combat', 'Completed', 'Tank drills successful'),
(5, 'Operation Steel Fist', 'Combat', 'Rajasthan Desert', '2019-11-01', '2020-03-01', 5, 'Desert warfare drill with tanks', 'Completed', 'Joint drill with Air Force'),
(6, 'Operation East Wind', 'Counter-Insurgency', 'Manipur', '2023-07-01', '2024-01-15', 6, 'Neutralize insurgent threats', 'Ongoing', 'Progressive gains'),
(7, 'Operation Silent Watch', 'Patrol', 'UP Border', '2024-02-01', '2024-03-31', 7, 'Night surveillance patrols', 'Completed', 'Enhanced vigilance'),
(8, 'Operation MedShield', 'Medical', 'Jabalpur', '2023-05-10', '2023-07-10', 8, 'Setup medical camps for civilians', 'Completed', 'Reached 5,000+ people'),
(9, 'Operation Flashpoint', 'Drill', 'Fatehgarh', '2024-01-01', '2024-02-28', 9, 'High-speed response drill', 'Completed', 'All objectives met'),
(10, 'Operation Sentinel', 'Exercise', 'Danapur', '2024-06-01', '2024-07-01', 10, 'War simulation exercise', 'Ongoing', 'Phase 2 in progress');

-- to display table data
select * from operations;
-- to remove complete records from table
truncate table operations;
-- to remove complete records and attributes from table
drop table operations;


-- Table-6 training_centers -------------------------------------------------------------------------------------------------
create table training_centers (
center_id int primary key,
name varchar(100),
location varchar(100),
established_year int,
center_type varchar(50),
capacity int,
commanding_officer varchar(100),
contact varchar(20),
email varchar(100),
accreditation_status varchar(20)
);

insert into training_centers values
(1, 'Infantry School', 'Mhow, MP', 1947, 'Infantry', 1200, 'Brig. R. Verma', '0752422001', 'infantry@mhow.army.in', 'Accredited'),
(2, 'Artillery School', 'Deolali, Maharashtra', 1911, 'Artillery', 1000, 'Maj. Gen. A. Naik', '0256222111', 'artillery@deolali.army.in', 'Accredited'),
(3, 'Armoured Corps Centre', 'Ahmednagar, Maharashtra', 1924, 'Armoured', 950, 'Brig. N. Bedi', '0241122022', 'armour@ahmednagar.army.in', 'Accredited'),
(4, 'Counter Insurgency School', 'Vairengte, Mizoram', 1970, 'Counter-Insurgency', 800, 'Col. D. Singh', '0389322033', 'cis@vairengte.army.in', 'Accredited'),
(5, 'Signal Training School', 'Jabalpur, MP', 1955, 'Signals', 700, 'Col. M. Iyer', '0761222044', 'signals@jabalpur.army.in', 'Provisional'),
(6, 'Medical Training Centre', 'Lucknow, UP', 1965, 'Medical', 600, 'Lt. Col. S. Kaur', '0522222055', 'medical@lucknow.army.in', 'Accredited'),
(7, 'Engineering School', 'Roorkee, Uttarakhand', 1871, 'Engineering', 1100, 'Brig. H. Nair', '0133222066', 'engineering@roorkee.army.in', 'Accredited'),
(8, 'Airborne Training School', 'Agra, UP', 1963, 'Airborne', 500, 'Col. T. Prasad', '0562222077', 'airborne@agra.army.in', 'Provisional'),
(9, 'Weapons Training Centre', 'Gwalior, MP', 1980, 'Weapons', 900, 'Maj. Gen. K. Saxena', '0751222088', 'weapons@gwalior.army.in', 'Accredited'),
(10, 'Combat School', 'Bhopal, MP', 1995, 'Combat', 850, 'Brig. R. Tripathi', '0755222099', 'combat@bhopal.army.in', 'Provisional');

-- to display table data
select * from training_centers;
-- to remove complete records from table
truncate table training_centers;
-- to remove complete records and attributes from table
drop table training_centers;


-- Table-7 trainings --------------------------------------------------------------------------------------------------------
create table trainings (
training_id int primary key,
name varchar(100),
type varchar(50),
duration_days int,
start_date date,
end_date date,
center_id int,
conducted_by varchar(100),
status varchar(20),
remarks text,
foreign key (center_id) references training_centers(center_id)
);

insert into trainings values
(1, 'Basic Infantry Tactics', 'Infantry', 30, '2025-01-01', '2025-01-30', 1, 'Col. Rajeev Mehta', 'Completed', 'Trainees excelled in field drills'),
(2, 'Field Artillery Handling', 'Artillery', 45, '2025-02-01', '2025-03-17', 2, 'Lt. Col. Alok Rana', 'Completed', 'Accuracy in firing improved'),
(3, 'Tank Maneuver Drill', 'Armoured', 25, '2025-03-05', '2025-03-30', 3, 'Major Sneha Rathi', 'Completed', 'Simulated war games completed'),
(4, 'Jungle Warfare', 'Counter-Insurgency', 60, '2025-04-01', '2025-05-30', 4, 'Col. Dev Prakash', 'Ongoing', 'Phase 2 under progress'),
(5, 'Signal Equipment Operation', 'Signals', 20, '2025-05-01', '2025-05-20', 5, 'Capt. Neha Dixit', 'Completed', 'Radio comms enhanced'),
(6, 'Combat First Aid', 'Medical', 15, '2025-06-01', '2025-06-15', 6, 'Lt. Col. Priya Malhotra', 'Ongoing', 'Life-saving drill in progress'),
(7, 'Bridge Construction Drill', 'Engineering', 40, '2025-06-10', '2025-07-20', 7, 'Brig. Amar Deshmukh', 'Ongoing', 'Final assessment pending'),
(8, 'Paratrooper Jump Training', 'Airborne', 21, '2025-07-01', '2025-07-21', 8, 'Maj. Kunal Mehta', 'Scheduled', 'Weather dependent'),
(9, 'Small Arms Accuracy', 'Weapons', 18, '2025-07-10', '2025-07-28', 9, 'Col. Piyush Rawal', 'Scheduled', 'Range prep ongoing'),
(10, 'Advanced Combat Skills', 'Combat', 35, '2025-07-15', '2025-08-19', 10, 'Brig. Ramesh Joshi', 'Scheduled', 'Unit training merged');

-- to display table data
select * from trainings;
-- to remove complete records from table
truncate table trainings;
-- to remove complete records and attributes from table
drop table trainings;


-- Table-8 equipment --------------------------------------------------------------------------------------------------------
create table equipment (
equipment_id int primary key,
name varchar(100),
category varchar(50),
manufacturer varchar(100),
acquisition_year int,
quantity int,
condition_status varchar(20),
assigned_unit int,
last_serviced date,
remarks text,
foreign key (assigned_unit) references units(unit_id)
);

insert into equipment values
(1, 'INSAS Rifle', 'Weapon', 'Ordnance Factory Board', 2010, 500, 'Good', 1, '2024-06-01', 'Standard infantry rifle'),
(2, 'BMP-2 Infantry Vehicle', 'Vehicle', 'Avadi Heavy Vehicles Factory', 2015, 50, 'Excellent', 2, '2024-05-15', 'Used for mechanized infantry'),
(3, 'Dhanush Howitzer', 'Artillery', 'Advanced Weapons Factory, Jabalpur', 2020, 20, 'Good', 3, '2024-04-10', 'Modern artillery gun'),
(4, 'T-90 Tank', 'Vehicle', 'Heavy Vehicles Factory, Avadi', 2012, 40, 'Service Due', 4, '2023-11-25', 'Main battle tank'),
(5, 'AK-203', 'Weapon', 'Indo-Russia Rifles Pvt Ltd', 2023, 100, 'New', 5, '2025-06-10', 'Recently inducted'),
(6, 'Radar Unit Rajendra', 'Electronics', 'BEL', 2014, 10, 'Operational', 6, '2024-02-20', 'For surveillance'),
(7, 'Medical Van Type-2', 'Medical', 'Tata Defence', 2018, 5, 'Excellent', 7, '2024-05-01', 'Equipped with emergency supplies'),
(8, 'Communication Set HF/VHF', 'Electronics', 'BEL', 2016, 200, 'Good', 8, '2024-03-22', 'Used in field signals'),
(9, 'Mine Protection Vehicle', 'Vehicle', 'Ashok Leyland Defence', 2019, 12, 'Operational', 9, '2024-06-18', 'Deployed in high-risk areas'),
(10, 'Night Vision Goggles', 'Gear', 'Tonbo Imaging', 2021, 300, 'Good', 10, '2024-05-11', 'For night operations');

-- to display table data
select * from equipment;
-- to remove complete records from table
truncate table equipment;
-- to remove complete records and attributes from table
drop table equipment;


-- Table-9 missions ---------------------------------------------------------------------------------------------------------
create table missions (
mission_id int primary key,
title varchar(100),
unit_id int,
mission_type varchar(50),
location varchar(100),
start_date date,
end_date date,
success varchar(10),
leader varchar(100),
summary text,
foreign key (unit_id) references units(unit_id)
);

insert into missions values
(1, 'Operation Vijay', 1, 'Combat', 'Kargil, J&K', '1999-05-08', '1999-07-26', 'Yes', 'Gen. V. P. Malik', 'Eviction of intruders from Indian territory'),
(2, 'Operation Rakshak', 3, 'Counter-Insurgency', 'Jammu & Kashmir', '1990-01-01', null, 'Ongoing', 'Lt. Gen. R. Joshi', 'Continual counter-insurgency patrols'),
(3, 'Operation Surya Hope', 7, 'Rescue', 'Uttarakhand', '2013-06-18', '2013-07-15', 'Yes', 'Maj. Gen. N. S. Ghei', 'Flood relief operation'),
(4, 'Operation Meghdoot', 1, 'Combat', 'Siachen Glacier', '1984-04-13', null, 'Ongoing', 'Lt. Gen. Prem Nath Hoon', 'Control over strategic glacier zone'),
(5, 'Operation Rhino', 6, 'Counter-Insurgency', 'Assam', '1991-09-15', null, 'Ongoing', 'Col. S. Barua', 'Neutralization of insurgent groups'),
(6, 'Operation Maitri', 9, 'Rescue', 'Nepal', '2015-04-26', '2015-05-15', 'Yes', 'Col. R. Vyas', 'Earthquake relief mission'),
(7, 'Operation Parakram', 2, 'Strategic', 'India-Pakistan Border', '2001-12-20', '2003-10-16', 'Yes', 'Gen. S. Padmanabhan', 'Show of strength post Parliament attack'),
(8, 'Operation Sahayata', 7, 'Rescue', 'Bihar', '2020-08-01', '2020-08-20', 'Yes', 'Maj. Gen. K. Tyagi', 'Flood rescue and aid delivery'),
(9, 'Operation Trident', 1, 'Training', 'Rajasthan', '2025-01-10', '2025-02-05', 'Yes', 'Lt. Gen. A. Singh', 'Field-level exercise'),
(10, 'Operation Shield', 6, 'Border Security', 'Punjab', '2024-09-01', null, 'Ongoing', 'Brig. R. Kapoor', 'Preventive operations on border');

-- to display table data
select * from missions;
-- to remove complete records from table
truncate table missions;
-- to remove complete records and attributes from table
drop table missions;


-- Table-10 medical_records -------------------------------------------------------------------------------------------------
create table medical_records (
record_id int primary key,
soldier_id int,
checkup_date date,
doctor_name varchar(100),
diagnosis varchar(100),
treatment text,
remarks text,
next_checkup date,
status varchar(30),
hospital_name varchar(100),
foreign key (soldier_id) references soldiers(soldier_id)
);

insert into medical_records values
(1, 1, '2025-01-10', 'Dr. R. Mehra', 'Sprained Ankle', 'Physiotherapy for 2 weeks', 'Minor drill injury', '2025-01-24', 'Active Duty', 'Military Hospital Pune'),
(2, 2, '2025-02-15', 'Dr. S. Banerjee', 'Malaria', 'Antimalarial course', 'Stable', null, 'Recovered', 'Base Hospital Delhi Cantt'),
(3, 3, '2025-03-05', 'Dr. K. Rao', 'High BP', 'Medication and monitoring', 'Under observation', '2025-04-05', 'Active Duty', 'MH Secunderabad'),
(4, 4, '2025-04-18', 'Dr. A. Sharma', 'Minor Fracture', 'Plaster, rest', 'Training injury', '2025-06-01', 'Medical Leave', 'Army Hospital R&R'),
(5, 5, '2025-05-10', 'Dr. R. Nayak', 'Seasonal Flu', 'Rest and meds', 'Fit for duty', null, 'Recovered', 'MH Jammu'),
(6, 6, '2025-06-20', 'Dr. V. Pillai', 'Heat Stroke', 'Hydration and rest', 'Field issue', '2025-07-01', 'Observation', 'MH Lucknow'),
(7, 7, '2025-01-30', 'Dr. I. Thomas', 'Back Pain', 'Physio sessions', 'Chronic condition', '2025-02-20', 'Restricted Duty', 'MH Jalandhar'),
(8, 8, '2025-02-28', 'Dr. D. Kapoor', 'Allergic Reaction', 'Antihistamines', 'Food-related', null, 'Recovered', 'MH Bhopal'),
(9, 9, '2025-03-15', 'Dr. P. Kumar', 'Vision Issues', 'Eye test, glasses', 'Visual fatigue', '2025-04-10', 'Active Duty', 'MH Jaipur'),
(10, 10, '2025-04-05', 'Dr. M. Raut', 'Fractured Wrist', 'Cast and rest', 'Obstacle course injury', '2025-05-10', 'Medical Leave', 'MH Bengaluru');

-- to display table data
select * from medical_records;
-- to remove complete records from table
truncate table medical_records;
-- to remove complete records and attributes from table
drop table medical_records;