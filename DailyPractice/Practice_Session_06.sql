-- create a database first
create database isro;

-- to work on this database, you need to use it first
use isro;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : centers(center_id, name, location, director, established_year, staff_count, specialization, budget, contact, status)
T2  : scientists(sci_id, full_name, gender, dob, joining_date, center_id, designation, phone, email, salary)
T3  : missions(mission_id, name, launch_date, center_id, spacecraft, status, objective, outcome, lead_scientist, budget)
T4  : experiments(exp_id, mission_id, sci_id, start_date, end_date, objective, result, status, instrument_used, remarks)
T5  : satellites(sat_id, name, mission_id, launch_mass, orbit_type, launch_vehicle, status, launch_site, operator, lifetime_years)
T6  : collaborations(collab_id, org_name, country, contact_person, email, mission_id, start_year, end_year, status, remarks)
T7  : patents(patent_id, sci_id, title, file_date, granted_date, status, jurisdiction, expiry_date, remarks, mission_id)
T8  : launches(launch_id, mission_id, launch_date, launch_vehicle, launch_site, outcome, rocket_serial, crew_count, payload_kg, remarks)
T9  : resources(resource_id, name, category, assigned_to, assign_date, status, cost, condition, location, remarks)
T10 : reports(report_id, exp_id, title, submitted_by, submission_date, status, confidentiality_level, remarks, reviewed_by, approval_status)
*/

-- Table-1 centers ----------------------------------------------------------------------------------------------------------
create table centers (
center_id int primary key,
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

insert into centers values
(1,'VSSC','Thiruvananthapuram','Dr. A. Rao',1963,2500,'Launch Vehicles',200000000,'0471-2501234','Active'),
(2,'ISAC','Bangalore','Dr. B. Nair',1969,1800,'Satellite Communication',150000000,'080-2567890','Active'),
(3,'LPSC','Thiruvananthapuram','Dr. C. Kumar',1983,1200,'Planetary Sciences',90000000,'0471-2505678','Active'),
(4,'SAC','Ahmedabad','Dr. D. Shah',1970,1600,'Earth Observation',110000000,'079-2634567','Active'),
(5,'URSC','Bangalore','Dr. E. Joshi',1973,1700,'Robotics & Spacecraft',130000000,'080-2536789','Active'),
(6,'NGRI','Hyderabad','Dr. F. Reddy',1964,900,'Geo Sciences',70000000,'040-2715034','Active'),
(7,'RISE','Sriharikota','Dr. G. Menon',2000,600,'Rocket Assembly',80000000,'08635-242400','Active'),
(8,'SCL','Ahmedabad','Dr. H. Mehta',1961,1100,'Cryogenics',95000000,'079-2780568','Active'),
(9,'SSL','Bangalore','Dr. I. Patil',1972,1000,'Structures & Payloads',90000000,'080-2371234','Active'),
(10,'LIT','Lucknow','Dr. J. Singh',1990,800,'Image Processing',60000000,'0522-2201234','Active');

-- to display table data
select * from centers;
-- to remove complete records from table
truncate table centers;
-- to remove complete records and attributes from table
drop table centers;


-- Table-2 scientists -------------------------------------------------------------------------------------------------------
create table scientists (
sci_id int primary key,
full_name varchar(100),
gender varchar(10),
dob date,
joining_date date,
center_id int,
designation varchar(50),
phone varchar(20),
email varchar(100),
salary int,
foreign key (center_id) references centers(center_id)
);

insert into scientists values
(1,'Dr. A. Kumar','Male','1970-05-12','1995-06-01',1,'Chief Scientist','9876543201','akumar@isro.gov.in',250000),
(2,'Dr. B. Rao','Female','1972-11-23','1997-08-15',2,'Senior Scientist','9876543202','brao@isro.gov.in',230000),
(3,'Dr. C. Singh','Male','1975-03-18','2000-01-12',3,'Mission Director','9876543203','csingh@isro.gov.in',240000),
(4,'Dr. D. Patel','Female','1978-07-30','2002-05-20',4,'Satellite Engineer','9876543204','dpatel@isro.gov.in',220000),
(5,'Dr. E. Sharma','Male','1980-02-10','2004-09-05',5,'Robotics Expert','9876543205','esharma@isro.gov.in',215000),
(6,'Dr. F. Verma','Female','1976-12-15','2001-03-22',6,'Geosciences Lead','9876543206','fverma@isro.gov.in',200000),
(7,'Dr. G. Desai','Male','1981-08-10','2006-11-11',7,'Assembly Lead','9876543207','gdesai@isro.gov.in',210000),
(8,'Dr. H. Iyer','Female','1974-04-08','1999-07-07',8,'Cryo Engineer','9876543208','hiyer@isro.gov.in',225000),
(9,'Dr. I. Gupta','Male','1977-09-20','2003-10-10',9,'Payload Specialist','9876543209','igupta@isro.gov.in',220000),
(10,'Dr. J. Mehta','Female','1982-06-25','2008-02-14',10,'Imaging Scientist','9876543210','jmehta@isro.gov.in',205000);

-- to display table data
select * from scientists;
-- to remove complete records from table
truncate table scientists;
-- to remove complete records and attributes from table
drop table scientists;


-- Table-3 missions ---------------------------------------------------------------------------------------------------------
create table missions (
mission_id int primary key,
name varchar(100),
launch_date date,
center_id int,
spacecraft varchar(100),
status varchar(20),
objective text,
outcome text,
lead_scientist int,
budget int,
foreign key (center_id) references centers(center_id),
foreign key (lead_scientist) references scientists(sci_id)
);

insert into missions values
(1,'Chandrayaan-3','2023-07-14',1,'Lander+Rover','Completed','Lunar south pole exploration','Success',3,98000000),
(2,'Aditya-L1','2021-09-02',2,'Solar Observatory','Completed','Study solar corona','Success',2,64000000),
(3,'Mars Orbiter Mission','2013-11-05',4,'Orbiter','Completed','Mars atmosphere study','Success',1,42000000),
(4,'RISAT-2B','2019-05-22',5,'Radar Imaging Sat','Completed','Earth surveillance','Success',4,21000000),
(5,'GISAT-1','2021-03-01',4,'Geo Imaging Sat','Failed','Earth imaging','Partial Failure',4,20000000),
(6,'PSLV-C54','2022-11-07',7,'PSLV','Completed','Launch satellites','Success',7,15000000),
(7,'Cartosat-3','2019-11-27',9,'Imaging Sat','Completed','High-res imaging','Success',9,18000000),
(8,'NavIC','2018-04-12',2,'Navigation Sat','Completed','Regional navigation','Success',2,15000000),
(9,'GSAT-11','2018-12-05',2,'Communication Sat','Completed','High throughput data','Success',2,20000000),
(10,'EMISAT','2019-04-01',4,'Electronic Sat','Completed','Emission monitoring','Success',4,12000000);

-- to display table data
select * from missions;
-- to remove complete records from table
truncate table missions;
-- to remove complete records and attributes from table
drop table missions;


-- Table-4 experiments ------------------------------------------------------------------------------------------------------
create table experiments (
exp_id int primary key,
mission_id int,
sci_id int,
start_date date,
end_date date,
objective text,
result text,
status varchar(30),
instrument_used varchar(100),
remarks text,
foreign key (mission_id) references missions(mission_id),
foreign key (sci_id) references scientists(sci_id)
);

insert into experiments values
(1, 1, 3, '2014-09-24', '2015-03-24', 'Study Mars atmosphere', 'Detected methane traces', 'Completed', 'Mass Spectrometer', 'Revealed seasonal methane presence'),
(2, 2, 4, '2019-07-22', '2020-01-15', 'Lunar terrain mapping', 'High-res maps created', 'Completed', 'Chandrayaan Sensor', 'Used for navigation planning'),
(3, 3, 5, '2023-09-02', '2024-09-02', 'Study solar corona', 'Data under analysis', 'Ongoing', 'Solar X-ray Imager', 'Helps forecast solar flares'),
(4, 4, 6, '2021-10-01', '2022-01-01', 'Ocean chlorophyll study', 'Seasonal trends mapped', 'Completed', 'Ocean Color Monitor', 'Supports marine ecosystems'),
(5, 5, 7, '2022-03-15', '2022-07-15', 'Radiation mapping', 'Confirmed belt zones', 'Completed', 'GAGAN Payload', 'Enhances aviation safety'),
(6, 6, 1, '2022-04-01', '2022-09-01', 'Surface roughness study', 'Detailed map created', 'Completed', 'SAR Payload', 'Supports agricultural usage'),
(7, 7, 2, '2020-07-10', '2020-09-10', 'Comms test', 'Latency within limits', 'Completed', 'Ka-Band Transmitter', 'Geo coverage achieved'),
(8, 8, 9, '2004-09-20', '2005-09-20', 'Broadcast education content', 'Reached 500+ schools', 'Completed', 'EduSat Kit', 'Boosted digital literacy'),
(9, 9, 10, '2021-11-11', '2022-05-11', 'Asteroid modeling', 'Validated trajectory', 'Ongoing', 'Tracking Radar', 'Early detection possible'),
(10, 10, 8, '2019-05-01', '2019-09-01', 'Orbit behavior tracking', 'Stable path verified', 'Completed', 'ISRO GPS Receiver', 'Improves satellite navigation');

-- to display table data
select * from experiments;
-- to remove complete records from table
truncate table experiments;
-- to remove complete records and attributes from table
drop table experiments;


-- Table-5 satellites -------------------------------------------------------------------------------------------------------
create table satellites (
sat_id int primary key,
name varchar(100),
launch_date date,
orbit_type varchar(50),
purpose varchar(100),
mission_id int,
operator varchar(100),
status varchar(30),
weight int,
lifespan int,
foreign key (mission_id) references missions(mission_id)
);

insert into satellites values
(1, 'Chandrayaan-2 Orbiter', '2019-07-22', 'Lunar Polar', 'Lunar Imaging', 1, 'ISRO', 'Operational', 1420, 7),
(2, 'Mangalyaan', '2013-11-05', 'Mars Transfer', 'Mars Exploration', 2, 'ISRO', 'Operational', 1337, 5),
(3, 'IRNSS-1A', '2013-07-01', 'GEO', 'Navigation', 6, 'ISRO', 'Operational', 1425, 10),
(4, 'Cartosat-3', '2019-11-27', 'SSO', 'Earth Observation', 5, 'ISRO', 'Operational', 1600, 5),
(5, 'INSAT-3DR', '2016-09-08', 'GEO', 'Weather Forecast', 7, 'ISRO', 'Operational', 2211, 10),
(6, 'EOS-04', '2022-02-14', 'LEO', 'Agricultural Monitoring', 10, 'ISRO', 'Operational', 1710, 8),
(7, 'GSAT-6A', '2018-03-29', 'GEO', 'Mobile Communication', 8, 'ISRO', 'Lost', 2140, 9),
(8, 'Amazonia-1', '2021-02-28', 'SSO', 'Earth Observation', 9, 'INPE Brazil', 'Operational', 637, 4),
(9, 'RISAT-2BR1', '2019-12-11', 'LEO', 'Radar Imaging', 4, 'ISRO', 'Operational', 628, 6),
(10, 'GSAT-29', '2018-11-14', 'GEO', 'Digital Connectivity', 3, 'ISRO', 'Operational', 3423, 12);

-- to display table data
select * from satellites;
-- to remove complete records from table
truncate table satellites;
-- to remove complete records and attributes from table
drop table satellites;


-- Table-6 collaborations ---------------------------------------------------------------------------------------------------
create table collaborations (
collab_id int primary key,
org_name varchar(100),
country varchar(50),
project_title varchar(100),
mission_id int,
start_date date,
end_date date,
status varchar(30),
contact_email varchar(100),
remarks text,
foreign key (mission_id) references missions(mission_id)
);

insert into collaborations values
(1, 'NASA', 'USA', 'MOM Data Sharing', 1, '2015-01-01', '2020-12-31', 'Completed', 'nasa_collab@isro.gov.in', 'Mars climate data exchange'),
(2, 'JAXA', 'Japan', 'Lunar Surface Study', 2, '2019-03-01', '2023-12-31', 'Active', 'jaxa_lunar@isro.gov.in', 'Joint payload analysis'),
(3, 'ESA', 'Europe', 'Solar Data Calibration', 3, '2023-09-01', '2025-09-01', 'Active', 'esa@isro.gov.in', 'Aditya-L1 joint observations'),
(4, 'CNES', 'France', 'Oceansat-3 Collaboration', 4, '2021-10-01', '2024-10-01', 'Active', 'cnes@isro.gov.in', 'Data processing help'),
(5, 'NASA', 'USA', 'GPS Enhancement', 5, '2021-04-01', '2023-12-31', 'Completed', 'gps@isro.gov.in', 'NavIC compatibility tests'),
(6, 'DRDO', 'India', 'Radar Imaging', 6, '2022-05-01', '2025-05-01', 'Active', 'drdo@isro.gov.in', 'RISAT-2 support'),
(7, 'UNICEF', 'UN', 'Education Outreach', 8, '2005-01-01', '2007-01-01', 'Completed', 'edu@isro.gov.in', 'Tele-education in India'),
(8, 'Planet Labs', 'USA', 'Asteroid Data', 9, '2021-10-01', '2024-10-01', 'Active', 'planet@isro.gov.in', 'Asteroid tracking'),
(9, 'IMD', 'India', 'Weather Satellite Usage', 10, '2019-01-01', '2022-12-31', 'Completed', 'imd@isro.gov.in', 'MetSat forecasting'),
(10, 'Roscosmos', 'Russia', 'Training Astronauts', 1, '2019-01-01', '2021-12-31', 'Completed', 'roscosmos@isro.gov.in', 'Gaganyaan prep support');

-- to display table data
select * from collaborations;
-- to remove complete records from table
truncate table collaborations;
-- to remove complete records and attributes from table
drop table collaborations;


-- Table-7 patents ----------------------------------------------------------------------------------------------------------
create table patents (
patent_id int primary key,
sci_id int,
title varchar(200),
file_date date,
granted_date date,
status varchar(30),
jurisdiction varchar(100),
expiry_date date,
remarks text,
mission_id int,
foreign key (sci_id) references scientists(sci_id),
foreign key (mission_id) references missions(mission_id)
);

insert into patents values
(1, 1, 'Thermal Shielding Composite', '2010-05-10', '2012-03-15', 'Granted', 'India', '2032-03-15', 'Used in Mars mission', 1),
(2, 2, 'High Gain Antenna Design', '2011-08-01', '2014-07-30', 'Granted', 'USA', '2034-07-30', 'Enabled deep space comms', 3),
(3, 3, 'Modular Propulsion System', '2015-11-20', '2018-01-05', 'Granted', 'India', '2038-01-05', 'Used in PSLV improvements', 6),
(4, 4, 'Solar Array Deployment Tech', '2017-03-12', '2019-10-18', 'Granted', 'Europe', '2039-10-18', 'Applicable to satellites', 4),
(5, 5, 'Cryogenic Fuel Flow Valve', '2013-06-14', '2016-05-21', 'Granted', 'India', '2036-05-21', 'Enhanced cryo efficiency', 5),
(6, 6, 'Satellite Imaging Algorithm', '2016-01-01', '2018-08-22', 'Granted', 'USA', '2038-08-22', 'Real-time terrain analysis', 7),
(7, 7, 'Lightweight Satellite Frame', '2019-09-18', '2021-11-11', 'Granted', 'India', '2041-11-11', 'Reduced launch cost', 6),
(8, 8, 'Heat Dissipation System', '2020-12-24', '2022-10-12', 'Granted', 'Japan', '2042-10-12', 'For high-temp electronics', 2),
(9, 9, 'Nano-Thruster Controller', '2012-07-30', '2014-09-01', 'Granted', 'India', '2034-09-01', 'Used in micro satellites', 9),
(10, 10, 'Cloud Forecast Model', '2018-04-20', '2020-03-30', 'Granted', 'India', '2040-03-30', 'Weather prediction improvement', 10);

-- to display table data
select * from patents;
-- to remove complete records from table
truncate table patents;
-- to remove complete records and attributes from table
drop table patents;


-- Table-8 launches ---------------------------------------------------------------------------------------------------------
create table launches (
launch_id int primary key,
mission_id int,
launch_date date,
launch_vehicle varchar(100),
launch_site varchar(100),
outcome varchar(50),
rocket_serial varchar(50),
crew_count int,
payload_kg int,
remarks text,
foreign key (mission_id) references missions(mission_id)
);

insert into launches values
(1, 1, '2023-07-14', 'LVM3-M4', 'Sriharikota', 'Success', 'LV-2023-01', 0, 3900, 'Chandrayaan-3 launched'),
(2, 2, '2021-09-02', 'PSLV-C51', 'Sriharikota', 'Success', 'LV-2021-02', 0, 1425, 'Aditya-L1 solar mission'),
(3, 3, '2013-11-05', 'PSLV-C25', 'Sriharikota', 'Success', 'LV-2013-05', 0, 1337, 'Mangalyaan orbiter launch'),
(4, 4, '2019-05-22', 'PSLV-C46', 'Sriharikota', 'Success', 'LV-2019-04', 0, 615, 'RISAT-2B Earth satellite'),
(5, 5, '2021-03-01', 'GSLV-F10', 'Sriharikota', 'Partial Failure', 'LV-2021-01', 0, 2268, 'GISAT-1 loss of contact'),
(6, 6, '2022-11-07', 'PSLV-C54', 'Sriharikota', 'Success', 'LV-2022-06', 0, 1650, 'EOS-06 satellite launch'),
(7, 7, '2019-11-27', 'PSLV-C47', 'Sriharikota', 'Success', 'LV-2019-07', 0, 1625, 'Cartosat-3 imaging satellite'),
(8, 8, '2018-04-12', 'PSLV-C41', 'Sriharikota', 'Success', 'LV-2018-03', 0, 1420, 'NavIC system deployment'),
(9, 9, '2018-12-05', 'Ariane-5', 'French Guiana', 'Success', 'A5-2018-12', 0, 5854, 'GSAT-11 launched by Arianespace'),
(10, 10, '2019-04-01', 'PSLV-C45', 'Sriharikota', 'Success', 'LV-2019-03', 0, 436, 'EMISAT surveillance satellite');

-- to display table data
select * from launches;
-- to remove complete records from table
truncate table launches;
-- to remove complete records and attributes from table
drop table launches;

-- Table-9 resources --------------------------------------------------------------------------------------------------------
create table resources (
resource_id int primary key,
name varchar(100),
category varchar(50),
assigned_to varchar(100),
assign_date date,
status varchar(30),
cost int,
_condition varchar(30),
location varchar(100),
remarks text
);

insert into resources values
(1, 'Cryo Engine Module', 'Hardware', 'Launch Vehicle Division', '2023-01-01', 'In Use', 4500000, 'Good', 'VSSC', 'Used in LVM3'),
(2, 'Solar Panel Array', 'Hardware', 'Satellite Team', '2022-05-15', 'In Use', 1200000, 'Excellent', 'ISAC', 'Mounted on GSAT-31'),
(3, 'Data Analysis Software', 'Software', 'Mission Control', '2021-09-12', 'In Use', 150000, 'Good', 'SAC', 'Satellite telemetry processing'),
(4, '3D Printing Machine', 'Equipment', 'Prototype Lab', '2020-10-20', 'Idle', 2500000, 'Operational', 'URSC', 'Used for custom parts'),
(5, 'Ground Station Antenna', 'Communication', 'Tracking Dept', '2019-06-01', 'Under Maintenance', 5200000, 'Fair', 'ISTRAC', 'Needs alignment'),
(6, 'Rover Chassis', 'Hardware', 'Planetary Team', '2023-03-11', 'Available', 3000000, 'Good', 'ISAC', 'For Chandrayaan mission'),
(7, 'Wind Tunnel', 'Facility', 'Aero Test Lab', '2018-07-25', 'In Use', 8000000, 'Excellent', 'SAC', 'Payload dynamics testing'),
(8, 'Thermal Vacuum Chamber', 'Facility', 'Test Facility', '2017-02-17', 'In Use', 9500000, 'Good', 'VSSC', 'Satellite heat resistance test'),
(9, 'Spectrometer Unit', 'Instrument', 'Remote Sensing Team', '2022-11-10', 'In Use', 550000, 'Excellent', 'NRSC', 'Used in chlorophyll analysis'),
(10, 'ISRO Cloud Server', 'Software', 'IT Department', '2021-01-05', 'In Use', 700000, 'Good', 'HQ-Bangalore', 'Used for simulation data');

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
title varchar(200),
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
(1, 1, 'Mars Atmosphere Analysis', 'Dr. C. Singh', '2015-04-10', 'Reviewed', 'High', 'Methane variation confirmed', 'Dr. A. Kumar', 'Approved'),
(2, 2, 'Lunar Mapping Data', 'Dr. D. Patel', '2020-02-01', 'Reviewed', 'Medium', 'Topography highly detailed', 'Dr. B. Rao', 'Approved'),
(3, 3, 'Corona X-Ray Imaging', 'Dr. E. Sharma', '2024-01-15', 'Pending', 'High', 'Still under analysis', 'Dr. B. Rao', 'In Review'),
(4, 4, 'Chlorophyll Trends Study', 'Dr. F. Verma', '2022-02-01', 'Reviewed', 'Medium', 'Seasonal peaks observed', 'Dr. C. Singh', 'Approved'),
(5, 5, 'Radiation Zones Report', 'Dr. G. Desai', '2022-08-01', 'Reviewed', 'High', 'Geostationary belt marked', 'Dr. A. Kumar', 'Approved'),
(6, 6, 'Roughness Terrain Data', 'Dr. A. Kumar', '2022-10-01', 'Reviewed', 'Low', 'Supports crop planning', 'Dr. C. Singh', 'Approved'),
(7, 7, 'Communication Test Result', 'Dr. B. Rao', '2020-10-01', 'Reviewed', 'Medium', 'Signal stable', 'Dr. C. Singh', 'Approved'),
(8, 8, 'Edu Broadcast Coverage', 'Dr. I. Gupta', '2005-10-01', 'Archived', 'Low', 'Rural outreach measured', 'Dr. H. Iyer', 'Approved'),
(9, 9, 'Asteroid Trajectory Validation', 'Dr. J. Mehta', '2022-06-01', 'Pending', 'High', 'Final validation underway', 'Dr. D. Patel', 'In Review'),
(10, 10, 'Orbit Behavior Study', 'Dr. H. Iyer', '2019-10-01', 'Reviewed', 'Medium', 'Orbit confirmed stable', 'Dr. G. Desai', 'Approved');

-- to display table data
select * from reports;
-- to remove complete records from table
truncate table reports;
-- to remove complete records and attributes from table
drop table reports;