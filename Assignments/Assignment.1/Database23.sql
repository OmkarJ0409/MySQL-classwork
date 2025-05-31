/*
This file consists of a database named WATER_POLLUTION_MONITOR_SYSTEM, which stores data related to water quality monitoring stations, quality parameters, pollution sources, incident reports, and environmental regulations to track and manage water pollution.

Table.1 - MONITORING_STATIONS TABLE - (Stores details about various river monitoring stations)
        Attributes: Station_id, Station_name, Location, Latitude, Longitude

Table.2 - WATER_QUALITY TABLE - (Stores water quality measurements for specific parameters at stations)
        Attributes: Record_id, Station_id, Date, Parameter, Measurement_value

Table.3 - POLLUTION_SOURCES TABLE - (Stores sources of pollution reported at different locations)
        Attributes: Source_id, Source_type, Location, Estimated_Impact, Reported_Date

Table.4 - INCIDENTS_REPORTS TABLE - (Stores environmental incidents reported at stations)
        Attributes: Incident_id, Station_id, Incident_type, Date_Reported, Resolution

Table.5 - REGULATIONS TABLE - (Stores environmental laws and regulations enforced for water pollution control)
        Attributes: Regulation_id, Regulation_name, Description, Enforced_By, Effective_Date

Step-by-step Creation of WATER_POLLUTION_MONITOR Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Monitoring_Stations Table + Insert Data  
Step 4: Create Water_Quality Table + Insert Data  
Step 5: Create Pollution_Sources Table + Insert Data  
Step 6: Create Incidents_Reports Table + Insert Data  
Step 7: Create Regulations Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Water_Pollution_Monitor;

-- Step 2: Use the Database
use Water_Pollution_Monitor;


-- Step 3: Create Monitoring_Stations Table ----------------------------------------------------------
create table Monitoring_Stations(
    Station_id int primary key,
    Station_name varchar(50),
    Location varchar(50),
    Latitude varchar(10),
    Longitude varchar(10)
);

insert into Monitoring_Stations values
(1, 'ganga watch', 'varanasi', '25.30', '82.97'),
(2, 'yamuna survey', 'delhi', '28.61', '77.20'),
(3, 'godavari monitor', 'nashik', '19.99', '73.78'),
(4, 'krishna check', 'vijayawada', '16.51', '80.63'),
(5, 'cauvery point', 'tiruchirapalli', '10.79', '78.70'),
(6, 'brahmaputra guard', 'guwahati', '26.14', '91.73'),
(7, 'narmada record', 'jabalpur', '23.18', '79.93'),
(8, 'sabarmati watch', 'ahmedabad', '23.02', '72.57'),
(9, 'tapti check', 'surat', '21.17', '72.83'),
(10, 'mahanadi monitor', 'cuttack', '20.46', '85.88');

-- To view Monitoring_Stations data
select * from Monitoring_Stations;

-- To clear Monitoring_Stations data
truncate table Monitoring_Stations;

-- To drop Monitoring_Stations table
drop table Monitoring_Stations;


-- Step 4: Create Water_Quality Table ----------------------------------------------------------
create table Water_Quality(
    Record_id int primary key,
    Station_id int,
    Date date,
    Parameter varchar(50),
    Measurement_value int,
    foreign key (Station_id) references Monitoring_Stations(Station_id)
);

insert into Water_Quality values
(1, 1, '2023-03-01', 'ph level', 7),
(2, 1, '2023-03-01', 'dissolved oxygen', 6),
(3, 2, '2023-03-02', 'ph level', 6),
(4, 2, '2023-03-02', 'turbidity', 80),
(5, 3, '2023-03-03', 'nitrate', 10),
(6, 4, '2023-03-04', 'ph level', 8),
(7, 5, '2023-03-05', 'bacteria count', 500),
(8, 6, '2023-03-06', 'dissolved oxygen', 5),
(9, 7, '2023-03-07', 'ph level', 7),
(10, 8, '2023-03-08', 'chemical oxygen demand', 120);

-- To view Water_Quality data
select * from Water_Quality;

-- To clear Water_Quality data
truncate table Water_Quality;

-- To drop Water_Quality table
drop table Water_Quality;


-- Step 5: Create Pollution_Sources Table ----------------------------------------------------------
create table Pollution_Sources(
    Source_id int primary key,
    Source_type varchar(50),
    Location varchar(50),
    Estimated_Impact text,
    Reported_Date date
);

insert into Pollution_Sources values
(1, 'industrial', 'kanpur', 'discharge of chemicals into river', '2023-03-10'),
(2, 'sewage', 'delhi', 'untreated domestic sewage', '2023-03-11'),
(3, 'agriculture', 'punjab', 'fertilizer runoff during rain', '2023-03-12'),
(4, 'construction', 'mumbai', 'sediment wash-off', '2023-03-13'),
(5, 'landfill', 'kolkata', 'leachate seepage', '2023-03-14'),
(6, 'plastic waste', 'chennai', 'floating non-biodegradable waste', '2023-03-15'),
(7, 'mining', 'odisha', 'metal contamination', '2023-03-16'),
(8, 'oil spill', 'gujarat', 'accidental spill during transport', '2023-03-17'),
(9, 'slaughterhouse', 'lucknow', 'organic discharge', '2023-03-18'),
(10, 'textile dyeing', 'tirupur', 'colored effluent release', '2023-03-19');

-- To view Pollution_Sources data
select * from Pollution_Sources;

-- To clear Pollution_Sources data
truncate table Pollution_Sources;

-- To drop Pollution_Sources table
drop table Pollution_Sources;


-- Step 6: Create Incidents_Reports Table ----------------------------------------------------------
create table Incidents_Reports(
    Incident_id int primary key,
    Station_id int,
    Incident_type varchar(50),
    Date_Reported date,
    Resolution varchar(50),
    foreign key (Station_id) references Monitoring_Stations(Station_id)
);

insert into Incidents_Reports values
(1, 1, 'chemical spill', '2023-03-20', 'cleaned'),
(2, 2, 'sewage overflow', '2023-03-21', 'in progress'),
(3, 3, 'fertilizer leak', '2023-03-22', 'investigation'),
(4, 4, 'oil slick', '2023-03-23', 'cleaned'),
(5, 5, 'dead fish sighting', '2023-03-24', 'reported'),
(6, 6, 'plastic accumulation', '2023-03-25', 'awareness campaign'),
(7, 7, 'illegal discharge', '2023-03-26', 'fined'),
(8, 8, 'foam formation', '2023-03-27', 'under review'),
(9, 9, 'fish kill', '2023-03-28', 'investigation'),
(10, 10, 'algal bloom', '2023-03-29', 'monitored');

-- To view Incidents_Reports data
select * from Incidents_Reports;

-- To clear Incidents_Reports data
truncate table Incidents_Reports;

-- To drop Incidents_Reports table
drop table Incidents_Reports;


-- Step 7: Create Regulations Table ----------------------------------------------------------
create table Regulations(
    Regulation_id int primary key,
    Regulation_name varchar(50),
    Description text,
    Enforced_By varchar(50),
    Effective_Date date
);

insert into Regulations values
(1, 'clean rivers act', 'aims to reduce water pollution in rivers', 'central government', '2020-01-01'),
(2, 'safe water law', 'sets standards for drinking water sources', 'ministry of water resources', '2019-05-01'),
(3, 'sewage control policy', 'regulates urban sewage treatment', 'state governments', '2021-04-10'),
(4, 'plastic ban directive', 'bans single-use plastic near water bodies', 'moefcc', '2022-06-05'),
(5, 'eia notification', 'requires environmental assessment before projects', 'moefcc', '2006-09-14'),
(6, 'groundwater act', 'monitors and limits groundwater contamination', 'central water board', '2018-02-01'),
(7, 'polluter pays policy', 'polluters bear cost of damage', 'supreme court directive', '2010-03-25'),
(8, 'river basin regulation', 'manages river basin pollution sources', 'national water commission', '2017-11-15'),
(9, 'industrial effluent norm', 'limits discharge of pollutants', 'cpcb', '2015-07-20'),
(10, 'wetland protection rule', 'protects wetland ecosystems from pollution', 'environment ministry', '2021-08-12');

-- To view Regulations data
select * from Regulations;

-- To clear Regulations data
truncate table Regulations;

-- To drop Regulations table
drop table Regulations;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Monitoring_Stations;
select * from Water_Quality;
select * from Pollution_Sources;
select * from Incidents_Reports;
select * from Regulations;