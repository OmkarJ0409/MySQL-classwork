-- create a database first
create database drdo;

-- to work on this database, you need to use it first
use drdo;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : laboratories(lab_id, name, location, director, established_year, staff_count, specialization, budget, contact, status)
T2  : scientists(sci_id, full_name, gender, dob, joining_date, lab_id, designation, phone, email, salary)
T3  : projects(project_id, name, start_date, end_date, budget, lab_id, principal_scientist, status, client, description)
T4  : experiments(exp_id, project_id, sci_id, start_date, end_date, objective, result, status, equipment_used, remarks)
T5  : technologies(tech_id, name, field, developed_by, dev_date, status, usage_area, tested_in, cost, remarks)
T6  : collaborations(collab_id, org_name, country, contact_person, email, project_id, start_year, end_year, status, remarks)
T7  : patents(patent_id, tech_id, title, file_date, granted_date, status, inventor, jurisdiction, expiry_date, remarks)
T8  : tests(test_id, lab_id, name, purpose, conducted_by, test_date, result, status, remarks, duration)
T9  : resources(resource_id, name, category, assigned_to, assign_date, status, cost, condition, location, remarks)
T10 : reports(report_id, exp_id, title, submitted_by, submission_date, status, confidentiality_level, remarks, reviewed_by, approval_status)
*/

-- Table-1 laboratories -----------------------------------------------------------------------------------------------------
create table laboratories (
lab_id int primary key,
name varchar(100),
location varchar(100),
director varchar(100),
established_year int,
staff_count int,
specialization varchar(100),
budget int,
contact varchar(50),
status varchar(20)
);

insert into laboratories values
(1, 'DRDL', 'Hyderabad', 'Dr. S. Kumar', 1961, 500, 'Missile Development', 50000000, '040-24545678', 'Active'),
(2, 'DEBEL', 'Bangalore', 'Dr. R. Reddy', 1976, 300, 'Life Support Systems', 30000000, '080-25678900', 'Active'),
(3, 'GTRE', 'Bangalore', 'Dr. M. Rao', 1959, 350, 'Gas Turbine Research', 40000000, '080-26789012', 'Active'),
(4, 'RAC', 'Delhi', 'Dr. A. Mehta', 1984, 150, 'Recruitment & Assessment', 20000000, '011-23456789', 'Active'),
(5, 'DRDE', 'Gwalior', 'Dr. P. Das', 1973, 250, 'Defense Research', 32000000, '0751-2443000', 'Active'),
(6, 'INMAS', 'Delhi', 'Dr. T. Nair', 1961, 280, 'Nuclear Medicine', 27000000, '011-26545678', 'Active'),
(7, 'DFRL', 'Mysore', 'Dr. G. Shetty', 1964, 180, 'Food Research', 15000000, '0821-2486920', 'Active'),
(8, 'LASTEC', 'Delhi', 'Dr. B. Gupta', 1950, 320, 'Laser Technology', 35000000, '011-26898765', 'Inactive'),
(9, 'CAIR', 'Bangalore', 'Dr. S. Iyer', 1986, 290, 'AI & Robotics', 38000000, '080-22968291', 'Active'),
(10, 'DRTC', 'Hyderabad', 'Dr. A. Narayan', 1972, 400, 'Training Centre', 21000000, '040-24548976', 'Active');

-- to display table data
select * from laboratories;
-- to remove complete records from table
truncate table laboratories;
-- to remove complete records and attributes from table
drop table laboratories;


-- Table-2 scientists -------------------------------------------------------------------------------------------------------
create table scientists (
scientist_id int primary key,
full_name varchar(100),
gender varchar(10),
dob date,
joining_date date,
lab_id int,
designation varchar(50),
specialization varchar(100),
email varchar(100),
phone varchar(20),
foreign key (lab_id) references laboratories(lab_id)
);

insert into scientists values
(1, 'Dr. Anil Joshi', 'Male', '1975-06-15', '2001-07-10', 1, 'Senior Scientist', 'Aerodynamics', 'anil.j@drdo.in', '9876543101'),
(2, 'Dr. Neeta Verma', 'Female', '1980-12-20', '2005-03-12', 2, 'Scientist E', 'Biomedical Engineering', 'neeta.v@drdo.in', '9876543102'),
(3, 'Dr. Ramesh Rao', 'Male', '1970-08-10', '1998-11-25', 3, 'Scientist F', 'Propulsion Systems', 'ramesh.r@drdo.in', '9876543103'),
(4, 'Dr. Priya Nair', 'Female', '1985-03-18', '2010-06-18', 4, 'Scientist D', 'Human Resource Analytics', 'priya.n@drdo.in', '9876543104'),
(5, 'Dr. Karan Patel', 'Male', '1978-09-22', '2003-02-01', 5, 'Scientist G', 'Toxicology', 'karan.p@drdo.in', '9876543105'),
(6, 'Dr. Smita Kulkarni', 'Female', '1982-11-30', '2008-09-15', 6, 'Scientist E', 'Radiopharmaceuticals', 'smita.k@drdo.in', '9876543106'),
(7, 'Dr. Sunil Iyer', 'Male', '1974-05-25', '2000-01-20', 7, 'Scientist F', 'Food Chemistry', 'sunil.i@drdo.in', '9876543107'),
(8, 'Dr. Meena Deshmukh', 'Female', '1987-07-19', '2012-08-11', 8, 'Scientist C', 'Laser Engineering', 'meena.d@drdo.in', '9876543108'),
(9, 'Dr. Vikram Saxena', 'Male', '1981-04-05', '2006-04-10', 9, 'Scientist E', 'Artificial Intelligence', 'vikram.s@drdo.in', '9876543109'),
(10, 'Dr. Rajiv Menon', 'Male', '1976-02-14', '2002-05-22', 10, 'Scientist D', 'Training & Development', 'rajiv.m@drdo.in', '9876543110');

-- to display table data
select * from scientists;
-- to remove complete records from table
truncate table scientists;
-- to remove complete records and attributes from table
drop table scientists;


-- Table-3 projects ---------------------------------------------------------------------------------------------------------
create table projects (
project_id int primary key,
title varchar(100),
lab_id int,
start_date date,
end_date date,
budget int,
lead_scientist int,
status varchar(30),
objective text,
outcome text,
foreign key (lab_id) references laboratories(lab_id),
foreign key (lead_scientist) references scientists(scientist_id)
);

insert into projects values
(1, 'Hypersonic Missile System', 1, '2021-01-15', '2024-12-31', 500000000, 1, 'Ongoing', 'Develop hypersonic missile capabilities', 'In final testing phase'),
(2, 'Portable Biomedical Scanner', 2, '2022-03-10', '2025-03-09', 150000000, 2, 'Ongoing', 'Create compact diagnostic tools for field use', 'Prototype under clinical trial'),
(3, 'Advanced Jet Engine', 3, '2020-07-01', '2023-12-31', 300000000, 3, 'Completed', 'Develop indigenous engine for fighter aircraft', 'Tested and approved'),
(4, 'HR Data Analytics System', 4, '2023-04-05', '2025-03-31', 20000000, 4, 'Ongoing', 'Automate HR analytics using AI', 'Beta release functional'),
(5, 'Chemical Agent Detection', 5, '2021-10-15', '2024-06-30', 100000000, 5, 'Ongoing', 'Detect hazardous chemical exposure in field', 'In validation stage'),
(6, 'Radiopharma Drug Delivery', 6, '2022-06-10', '2025-06-09', 180000000, 6, 'Ongoing', 'Deliver targeted radiotherapy drugs', 'In animal testing phase'),
(7, 'High-Calorie Ration Pack', 7, '2020-02-01', '2022-12-15', 50000000, 7, 'Completed', 'Enhance soldier endurance with new nutrition', 'Deployed to armed forces'),
(8, 'Directed Energy Weapons', 8, '2021-09-20', '2025-12-31', 600000000, 8, 'Ongoing', 'Develop laser-based defense systems', 'Phase-II trials started'),
(9, 'Autonomous Recon Drone', 9, '2022-01-10', '2024-10-31', 220000000, 9, 'Ongoing', 'AI-enabled drone for terrain scanning', 'Demo successfully conducted'),
(10, 'Leadership & Strategy Program', 10, '2023-05-01', '2024-05-01', 10000000, 10, 'Ongoing', 'Train leaders for strategic planning', '60% batch completed');

-- to display table data
select * from projects;
-- to remove complete records from table
truncate table projects;
-- to remove complete records and attributes from table
drop table projects;


-- Table-4 experiments ------------------------------------------------------------------------------------------------------
create table experiments (
exp_id int primary key,
project_id int,
sci_id int,
start_date date,
end_date date,
objective text,
result text,
status varchar(30),
equipment_used varchar(100),
remarks text,
foreign key (project_id) references projects(project_id),
foreign key (sci_id) references scientists(scientist_id)
);

insert into experiments values
(1, 1, 1, '2022-01-15', '2022-06-30', 'Test aerodynamics of new missile', 'Successful airflow control', 'Completed', 'Wind Tunnel', 'Stable at Mach 5'),
(2, 2, 2, '2023-02-10', '2023-07-20', 'Scanner resolution validation', 'Acceptable accuracy', 'Completed', 'Phantom Scan Model', 'Minor calibration needed'),
(3, 3, 3, '2021-05-01', '2022-01-15', 'Engine ignition under stress', 'Ignition stable up to 1200°C', 'Completed', 'Thermal Chamber', 'Repetition needed'),
(4, 4, 4, '2023-06-01', '2024-01-10', 'AI model accuracy testing', '83% prediction accuracy', 'Ongoing', 'Server Cluster', 'Upgrade memory'),
(5, 5, 5, '2022-09-05', '2023-03-10', 'Field agent chemical exposure', 'Identified safe exposure limits', 'Completed', 'Toxicity Analyzer', 'Awaiting peer review'),
(6, 6, 6, '2023-04-12', '2023-11-20', 'Radiopharma delivery time', 'Optimal within 4 hrs', 'Ongoing', 'Animal Test Bed', 'Check dose variation'),
(7, 7, 7, '2020-03-01', '2020-09-01', 'Nutrition absorption test', 'Effective absorption observed', 'Completed', 'Calorimeter', 'Documented findings'),
(8, 8, 8, '2022-11-10', '2023-05-05', 'Laser range and power test', 'Stable up to 3 km', 'Completed', 'Optical Laser Unit', 'High voltage safety added'),
(9, 9, 9, '2023-01-15', '2023-07-01', 'Drone pathfinding', 'Autonomous routing functional', 'Ongoing', 'Test Track', 'Improve battery life'),
(10, 10, 10, '2023-06-01', '2023-12-01', 'Leadership model testing', 'Survey shows 70% satisfaction', 'Ongoing', 'Survey Software', 'Batch B yet to be evaluated');

-- to display table data
select * from experiments;
-- to remove complete records from table
truncate table experiments;
-- to remove complete records and attributes from table
drop table experiments;


-- Table-5 technologies -----------------------------------------------------------------------------------------------------
create table technologies (
tech_id int primary key,
name varchar(100),
field varchar(100),
developed_by int,
dev_date date,
status varchar(30),
usage_area varchar(100),
tested_in varchar(100),
cost int,
remarks text,
foreign key (developed_by) references scientists(scientist_id)
);

insert into technologies values
(1, 'Hypersonic Guidance System', 'Missile Tech', 1, '2022-05-15', 'Tested', 'Missile Navigation', 'Field Launches', 12000000, 'Operational prototype ready'),
(2, 'Portable Biomed Scanner', 'Healthcare', 2, '2023-03-20', 'Under Testing', 'Field Diagnosis', 'Army Hospitals', 4000000, 'Clinical phase ongoing'),
(3, 'Indigenous Jet Engine', 'Aerospace', 3, '2021-09-10', 'Approved', 'Fighter Aircraft', 'Wind Tunnel Trials', 20000000, 'Ready for mass production'),
(4, 'HR Analytics Suite', 'AI & HR', 4, '2023-07-01', 'Pilot', 'HR Depts', 'Internal Use', 1500000, 'Need scalability test'),
(5, 'Chemical Detector', 'Toxicology', 5, '2022-01-12', 'Deployed', 'Field Labs', 'Desert Tests', 6000000, 'Sensors stable'),
(6, 'Radio Pharma Capsule', 'Medical', 6, '2023-02-28', 'Prototype', 'Radiotherapy', 'Animal Models', 5500000, 'Awaiting clearance'),
(7, 'Ration Pack X', 'Nutrition', 7, '2020-07-10', 'Released', 'Military Supplies', 'Troop Trials', 2000000, 'Positive feedback'),
(8, 'Laser Weapon System', 'Defense Optics', 8, '2022-12-01', 'Testing', 'Defense Vehicles', 'Day/Night Tests', 18000000, 'High-energy use caution'),
(9, 'AI Recon Drone', 'Surveillance', 9, '2023-04-15', 'Demo Complete', 'Border Patrol', 'Remote Sites', 7000000, 'Upgrade software module'),
(10, 'Leadership Tracker Tool', 'Training', 10, '2023-08-01', 'Pilot', 'Military Training', '2 Training Batches', 1200000, 'Needs broader test cases');

-- to display table data
select * from technologies;
-- to remove complete records from table
truncate table technologies;
-- to remove complete records and attributes from table
drop table technologies;


-- Table-6 collaborations ---------------------------------------------------------------------------------------------------
create table collaborations (
collab_id int primary key,
org_name varchar(100),
country varchar(50),
contact_person varchar(100),
email varchar(100),
project_id int,
start_year year,
end_year year,
status varchar(30),
remarks text,
foreign key (project_id) references projects(project_id)
);

insert into collaborations values
(1, 'ISRO', 'India', 'Dr. G. Radhakrishnan', 'radhakrishnan@isro.gov.in', 1, 2021, 2024, 'Active', 'Joint missile development'),
(2, 'NASA', 'USA', 'Dr. Emily Smith', 'emily.smith@nasa.gov', 2, 2022, 2025, 'Active', 'Biomedical tech for space missions'),
(3, 'Dassault Aviation', 'France', 'Jean Dubois', 'jean@dassault.com', 3, 2020, 2023, 'Completed', 'Jet engine research'),
(4, 'TCS Research', 'India', 'Amit Sharma', 'amit.sharma@tcs.com', 4, 2023, 2025, 'Active', 'AI solutions for HR analytics'),
(5, 'Bhabha Atomic Centre', 'India', 'Dr. M. Iyer', 'iyer@bac.in', 5, 2021, 2024, 'Active', 'Chemical threat research'),
(6, 'GE Healthcare', 'USA', 'Laura Turner', 'laura.t@gehealth.com', 6, 2022, 2025, 'Active', 'Radiopharma drug innovation'),
(7, 'FSSAI', 'India', 'Neha Kulkarni', 'neha.k@fssai.gov.in', 7, 2020, 2022, 'Completed', 'Field food nutrition standards'),
(8, 'Israel Aerospace Ind.', 'Israel', 'David Cohen', 'd.cohen@iai.co.il', 8, 2021, 2025, 'Active', 'Laser optics calibration'),
(9, 'NTT Japan', 'Japan', 'Kenji Tanaka', 'kenji.t@ntt.co.jp', 9, 2022, 2024, 'Active', 'Signal encryption for drones'),
(10, 'IIM Ahmedabad', 'India', 'Dr. R. Bhatt', 'rb@iimahd.in', 10, 2023, 2024, 'Active', 'Leadership strategy consultation');

-- to display table data
select * from collaborations;
-- to remove complete records from table
truncate table collaborations;
-- to remove complete records and attributes from table
drop table collaborations;


-- Table-7 patents ----------------------------------------------------------------------------------------------------------
create table patents (
patent_id int primary key,
tech_id int,
title varchar(150),
file_date date,
granted_date date,
status varchar(30),
inventor varchar(100),
jurisdiction varchar(50),
expiry_date date,
remarks text,
foreign key (tech_id) references technologies(tech_id)
);

insert into patents values
(1, 1, 'Scramjet Propulsion System', '2021-06-01', '2023-01-15', 'Granted', 'Dr. A. Joshi', 'India', '2041-06-01', 'For hypersonic missile'),
(2, 2, 'Compact Health Scanner', '2022-04-12', '2024-03-10', 'Granted', 'Dr. N. Verma', 'USA', '2042-04-12', 'Used in battlefield diagnostics'),
(3, 3, 'Indigenous Jet Turbine Blade', '2020-08-01', '2022-07-30', 'Granted', 'Dr. R. Rao', 'India', '2040-08-01', 'Used in Tejas program'),
(4, 4, 'AI-HR Module', '2023-05-05', NULL, 'Filed', 'Dr. P. Nair', 'India', NULL, 'Under evaluation'),
(5, 5, 'Chemical Agent Sensor Kit', '2021-11-15', '2023-10-01', 'Granted', 'Dr. K. Patel', 'India', '2041-11-15', 'Deployed in field operations'),
(6, 6, 'Nano-targeted Radiodrug', '2022-07-20', NULL, 'Filed', 'Dr. S. Kulkarni', 'India', NULL, 'Animal testing phase'),
(7, 7, 'High Nutrition Food Pack', '2020-03-05', '2021-11-11', 'Granted', 'Dr. S. Iyer', 'India', '2040-03-05', 'Used by Indian Army'),
(8, 8, 'Laser Beam Director', '2021-10-15', NULL, 'Filed', 'Dr. M. Deshmukh', 'Israel', NULL, 'Awaiting trial completion'),
(9, 9, 'AI Drone Surveillance System', '2022-02-02', '2023-09-01', 'Granted', 'Dr. V. Saxena', 'India', '2042-02-02', 'Used in border patrol'),
(10, 10, 'Strategic Learning Module', '2023-06-01', NULL, 'Filed', 'Dr. R. Menon', 'India', NULL, 'Awaiting approval');

-- to display table data
select * from patents;
-- to remove complete records from table
truncate table patents;
-- to remove complete records and attributes from table
drop table patents;


-- Table-8 tests ------------------------------------------------------------------------------------------------------------
create table tests (
test_id int primary key,
lab_id int,
name varchar(100),
purpose varchar(150),
conducted_by varchar(100),
test_date date,
result varchar(100),
status varchar(20),
remarks text,
duration int,
foreign key (lab_id) references laboratories(lab_id)
);

insert into tests values
(1, 1, 'Thermal Stress Test', 'Assess missile shell at high temp', 'Dr. A. Joshi', '2024-01-15', 'Passed', 'Completed', '', 6),
(2, 2, 'Scanner Calibration', 'Adjust sensitivity levels', 'Dr. N. Verma', '2024-02-20', 'Within Range', 'Completed', '', 3),
(3, 3, 'Engine Vibration Test', 'Check tolerance under load', 'Dr. R. Rao', '2023-11-12', 'Passed', 'Completed', '', 5),
(4, 4, 'HR AI Stress Test', 'Simulate large user input', 'Dr. P. Nair', '2024-03-15', 'Optimal', 'Ongoing', '', 2),
(5, 5, 'Chemical Spill Detection', 'Test response time', 'Dr. K. Patel', '2024-04-10', 'Good', 'Completed', '', 4),
(6, 6, 'Radiation Absorption', 'Check dosage delivery', 'Dr. S. Kulkarni', '2024-05-18', 'Safe', 'Completed', '', 3),
(7, 7, 'Nutrition Pack Test', 'Test shelf-life', 'Dr. S. Iyer', '2022-09-30', 'Stable for 12 months', 'Completed', '', 7),
(8, 8, 'Laser Beam Focus Test', 'Check beam spread', 'Dr. M. Deshmukh', '2024-01-10', 'Accurate', 'Ongoing', '', 6),
(9, 9, 'Drone Flight Simulation', 'Test obstacle detection', 'Dr. V. Saxena', '2024-02-15', 'Successful', 'Completed', '', 8),
(10, 10, 'Leadership Feedback Review', 'Evaluate training impact', 'Dr. R. Menon', '2024-06-20', 'Positive Feedback', 'Completed', '', 2);

-- to display table data
select * from tests;
-- to remove complete records from table
truncate table tests;
-- to remove complete records and attributes from table
drop table tests;


-- Table-9 resources --------------------------------------------------------------------------------------------------------
create table resources (
resource_id int primary key,
name varchar(100),
category varchar(50),
assigned_to int,
assign_date date,
status varchar(30),
cost int,
_condition varchar(30),
location varchar(100),
remarks text,
foreign key (assigned_to) references scientists(scientist_id)
);

insert into resources values
(1, 'Spectrometer', 'Instrument', 1, '2022-01-10', 'Operational', 100000, 'Good', 'Hyderabad', ''),
(2, 'Portable Scanner Kit', 'Diagnostic', 2, '2022-03-15', 'Operational', 75000, 'Good', 'Bangalore', ''),
(3, 'Turbo Fan Module', 'Engine Part', 3, '2021-11-25', 'In Use', 200000, 'Excellent', 'Bangalore', ''),
(4, 'AI Processing Unit', 'Software', 4, '2023-04-10', 'Operational', 90000, 'Good', 'Delhi', ''),
(5, 'Toxin Analyzer', 'Lab Equipment', 5, '2021-12-12', 'In Repair', 65000, 'Moderate', 'Gwalior', 'Sensor fault'),
(6, 'Radiotracer Kit', 'Pharma', 6, '2022-07-07', 'Operational', 80000, 'Good', 'Delhi', ''),
(7, 'Food Testing Unit', 'Nutrition', 7, '2020-05-05', 'Operational', 55000, 'Excellent', 'Mysore', ''),
(8, 'Laser Modulator', 'Optics', 8, '2022-09-30', 'Operational', 95000, 'Good', 'Delhi', ''),
(9, 'AI Navigation Chip', 'Drone Component', 9, '2023-01-10', 'Operational', 120000, 'Good', 'Bangalore', ''),
(10, 'Feedback Analysis Tool', 'Training', 10, '2023-05-05', 'Operational', 60000, 'Good', 'Hyderabad', '');

-- to display table data
select * from resources;
-- to remove complete records from table
truncate table resources;
-- to remove complete records and attributes from table
drop table resources;


-- Table-10 reports ---------------------------------------------------------------------------------------------------------
create table reports (
report_id int primary key,
exp_id int,
title varchar(150),
submitted_by varchar(100),
submission_date date,
status varchar(30),
confidentiality_level varchar(30),
remarks text,
reviewed_by varchar(100),
approval_status varchar(30),
foreign key (exp_id) references experiments(exp_id)
);

insert into reports values
(1, 1, 'Heat Resistance Analysis', 'Dr. A. Joshi', '2024-02-01', 'Reviewed', 'High', '', 'Director Missile Lab', 'Approved'),
(2, 2, 'Scanner Efficiency Report', 'Dr. N. Verma', '2024-03-01', 'Submitted', 'Medium', '', 'Head Biomedical', 'Pending'),
(3, 3, 'Engine Integrity Report', 'Dr. R. Rao', '2023-12-15', 'Reviewed', 'High', '', 'Director GTRE', 'Approved'),
(4, 4, 'HR AI Response Time', 'Dr. P. Nair', '2024-04-10', 'Submitted', 'Medium', '', 'HR Committee', 'In Review'),
(5, 5, 'Chemical Reaction Time', 'Dr. K. Patel', '2024-05-12', 'Reviewed', 'High', '', 'Chemical Board', 'Approved'),
(6, 6, 'Radiodrug Delivery Metrics', 'Dr. S. Kulkarni', '2024-06-15', 'Submitted', 'High', '', 'Radiopharma Council', 'Pending'),
(7, 7, 'Nutrition Composition Report', 'Dr. S. Iyer', '2022-10-05', 'Reviewed', 'Low', '', 'Food R&D', 'Approved'),
(8, 8, 'Laser Test Summary', 'Dr. M. Deshmukh', '2024-02-01', 'Submitted', 'Medium', '', 'Laser Team Head', 'In Review'),
(9, 9, 'Drone Obstacle Test Result', 'Dr. V. Saxena', '2024-03-05', 'Reviewed', 'High', '', 'Recon Division Chief', 'Approved'),
(10, 10, 'Leadership Session Feedback', 'Dr. R. Menon', '2024-07-01', 'Submitted', 'Low', '', 'Training Lead', 'Pending');

-- to display table data
select * from reports;
-- to remove complete records from table
truncate table reports;
-- to remove complete records and attributes from table
drop table reports;