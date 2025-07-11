-- create a database first
create database company123;

-- to work on this database, you need to use it first
use company123;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : departments(dept_id, name, location, head_id, phone, email, budget, established_year, employee_count, status)
T2  : employees(emp_id, full_name, gender, dob, joining_date, dept_id, designation, phone, email, salary)
T3  : projects(project_id, name, start_date, end_date, budget, dept_id, project_manager, status, client, description)
T4  : assignments(assign_id, emp_id, project_id, assigned_date, role, hours_per_week, deadline, status, remarks, priority)
T5  : clients(client_id, name, industry, country, contact_person, phone, email, joined_date, contract_value, status)
T6  : attendance(att_id, emp_id, date, in_time, out_time, status, working_hours, overtime_hours, location, remarks)
T7  : leaves(leave_id, emp_id, start_date, end_date, type, reason, approved_by, status, applied_date, remarks)
T8  : payroll(pay_id, emp_id, pay_date, basic, hra, allowances, deductions, net_salary, month, year)
T9  : assets(asset_id, name, type, assigned_to, assigned_date, warranty_end, status, cost, location, remarks)
T10 : performance(perf_id, emp_id, review_period, rating, reviewer, comments, review_date, goals_met, improvement_area, status)
*/

-- Table-1 departments ------------------------------------------------------------------------------------------------------
create table departments (
dept_id int primary key,
name varchar(100),
location varchar(100),
head_id int,
phone varchar(20),
email varchar(100),
budget int,
established_year int,
employee_count int,
status varchar(20)
);

insert into departments values
(1, 'Human Resources', 'Mumbai', 101, '022-12345678', 'hr@company.com', 5000000, 2005, 25, 'Active'),
(2, 'IT Services', 'Bangalore', 102, '080-87654321', 'it@company.com', 10000000, 2010, 60, 'Active'),
(3, 'Finance', 'Delhi', 103, '011-23456789', 'finance@company.com', 7000000, 2008, 20, 'Active'),
(4, 'Marketing', 'Mumbai', 104, '022-98765432', 'marketing@company.com', 6000000, 2012, 30, 'Active'),
(5, 'Research and Development', 'Pune', 105, '020-55555555', 'rnd@company.com', 12000000, 2015, 40, 'Active'),
(6, 'Operations', 'Chennai', 106, '044-66778899', 'operations@company.com', 8000000, 2007, 35, 'Active'),
(7, 'Legal', 'Delhi', 107, '011-99887766', 'legal@company.com', 4000000, 2009, 10, 'Active'),
(8, 'Procurement', 'Hyderabad', 108, '040-33221100', 'procurement@company.com', 3000000, 2011, 15, 'Active'),
(9, 'Customer Service', 'Mumbai', 109, '022-44556677', 'support@company.com', 4500000, 2013, 50, 'Active'),
(10, 'Admin', 'Bangalore', 110, '080-12344321', 'admin@company.com', 2500000, 2006, 12, 'Active');

-- to display table data
select * from departments;
-- to remove complete records from table
truncate table departments;
-- to remove complete records and attributes from table
drop table departments;


-- Table-2 employees -------------------------------------------------------------------------------------------------------
create table employees (
emp_id int primary key,
full_name varchar(100),
gender varchar(10),
dob date,
joining_date date,
dept_id int,
designation varchar(50),
phone varchar(20),
email varchar(100),
salary int,
foreign key (dept_id) references departments(dept_id)
);

insert into employees values
(101, 'Amit Verma', 'Male', '1985-05-12', '2010-06-15', 1, 'HR Manager', '9876543210', 'amit.verma@company.com', 85000),
(102, 'Neha Sharma', 'Female', '1990-07-23', '2012-09-01', 2, 'IT Manager', '9876543211', 'neha.sharma@company.com', 95000),
(103, 'Ravi Mehta', 'Male', '1982-04-10', '2009-01-10', 3, 'Finance Head', '9876543212', 'ravi.mehta@company.com', 90000),
(104, 'Pooja Singh', 'Female', '1988-02-28', '2014-03-12', 4, 'Marketing Head', '9876543213', 'pooja.singh@company.com', 87000),
(105, 'Sandeep Joshi', 'Male', '1987-11-05', '2016-05-20', 5, 'R&D Head', '9876543214', 'sandeep.joshi@company.com', 98000),
(106, 'Anita Rao', 'Female', '1991-08-19', '2013-07-25', 6, 'Operations Manager', '9876543215', 'anita.rao@company.com', 89000),
(107, 'Vikram Desai', 'Male', '1983-06-17', '2011-10-30', 7, 'Legal Advisor', '9876543216', 'vikram.desai@company.com', 92000),
(108, 'Sneha Kapoor', 'Female', '1992-09-14', '2015-12-05', 8, 'Procurement Officer', '9876543217', 'sneha.kapoor@company.com', 78000),
(109, 'Rahul Nair', 'Male', '1986-03-25', '2017-08-18', 9, 'Customer Service Head', '9876543218', 'rahul.nair@company.com', 83000),
(110, 'Kavita Menon', 'Female', '1989-10-08', '2018-02-10', 10, 'Admin Officer', '9876543219', 'kavita.menon@company.com', 75000);

-- to display table data
select * from employees;
-- to remove complete records from table
truncate table employees;
-- to remove complete records and attributes from table
drop table employees;


-- Table-3 projects ---------------------------------------------------------------------------------------------------------
create table projects (
project_id int primary key,
name varchar(100),
start_date date,
end_date date,
budget int,
dept_id int,
project_manager int,
status varchar(30),
client varchar(100),
description text,
foreign key (dept_id) references departments(dept_id),
foreign key (project_manager) references employees(emp_id)
);

insert into projects values
(1, 'HRMS Upgrade', '2024-01-10', '2024-12-20', 2000000, 1, 101, 'Ongoing', 'Infosys Ltd', 'Upgrading HR management system'),
(2, 'Cloud Migration', '2023-03-15', '2024-06-30', 4500000, 2, 102, 'Ongoing', 'TCS', 'Migrating infrastructure to AWS cloud'),
(3, 'Budget Automation', '2023-07-01', '2024-05-15', 1500000, 3, 103, 'Completed', 'HDFC Bank', 'Automating financial budgeting processes'),
(4, 'Brand Campaign 2025', '2024-04-01', '2025-03-31', 2500000, 4, 104, 'Ongoing', 'Reliance', 'New nationwide branding strategy'),
(5, 'AI Product Research', '2023-09-10', '2025-01-15', 6000000, 5, 105, 'Ongoing', 'Google', 'Research and development of AI product'),
(6, 'Logistics Optimization', '2023-12-01', '2024-09-30', 2200000, 6, 106, 'Ongoing', 'Amazon', 'Route and delivery optimization'),
(7, 'Compliance Portal', '2024-02-01', '2024-11-30', 1800000, 7, 107, 'Ongoing', 'LIC', 'Online legal compliance tracking portal'),
(8, 'Supplier Tracker', '2024-03-10', '2024-10-20', 1300000, 8, 108, 'Planned', 'Siemens', 'Web portal to manage and track vendors'),
(9, 'Customer Feedback Analysis', '2024-05-05', '2025-02-15', 2100000, 9, 109, 'Ongoing', 'Flipkart', 'Analyze customer feedback data using ML'),
(10, 'Office Automation', '2023-10-01', '2024-07-01', 1600000, 10, 110, 'Completed', 'Capgemini', 'Automating internal admin processes');

-- to display table data
select * from projects;
-- to remove complete records from table
truncate table projects;
-- to remove complete records and attributes from table
drop table projects;


-- Table-4 assignments ------------------------------------------------------------------------------------------------------
create table assignments (
assignment_id int primary key,
emp_id int,
project_id int,
role varchar(50),
assigned_date date,
deadline date,
status varchar(30),
hours_allocated int,
remarks text,
priority varchar(20),
foreign key (emp_id) references employees(emp_id),
foreign key (project_id) references projects(project_id)
);

insert into assignments values
(1, 101, 1, 'Team Lead', '2024-01-10', '2024-12-10', 'Active', 1600, 'Leading HRMS upgrade module', 'High'),
(2, 102, 2, 'Cloud Architect', '2023-03-15', '2024-06-15', 'Active', 1800, 'Architecting AWS resources', 'High'),
(3, 103, 3, 'Finance Analyst', '2023-07-01', '2024-05-01', 'Completed', 1200, 'Budget evaluation and implementation', 'Medium'),
(4, 104, 4, 'Campaign Head', '2024-04-01', '2025-03-25', 'Active', 1500, 'Managing media campaigns', 'High'),
(5, 105, 5, 'Lead Scientist', '2023-09-10', '2025-01-10', 'Active', 2000, 'Supervising AI research modules', 'High'),
(6, 106, 6, 'Logistics Analyst', '2023-12-01', '2024-09-20', 'Active', 1300, 'Analyzing logistics data', 'Medium'),
(7, 107, 7, 'Legal Advisor', '2024-02-01', '2024-11-20', 'Active', 1100, 'Providing compliance consulting', 'Medium'),
(8, 108, 8, 'Procurement Head', '2024-03-10', '2024-10-10', 'Planned', 1000, 'Handling vendor portal design', 'Low'),
(9, 109, 9, 'Data Analyst', '2024-05-05', '2025-02-05', 'Active', 1500, 'ML model training and feedback processing', 'High'),
(10, 110, 10, 'Automation Tester', '2023-10-01', '2024-06-25', 'Completed', 1400, 'Testing and validating automation tasks', 'Medium');

-- to display table data
select * from assignments;
-- to remove complete records from table
truncate table assignments;
-- to remove complete records and attributes from table
drop table assignments;


-- Table-5 clients ----------------------------------------------------------------------------------------------------------
create table clients (
client_id int primary key,
name varchar(100),
industry varchar(50),
contact_person varchar(100),
phone varchar(20),
email varchar(100),
address text,
country varchar(50),
partnership_year int,
status varchar(30)
);

insert into clients values
(1, 'Infosys Ltd', 'IT Services', 'Ravi Kumar', '9123456780', 'ravi@infosys.com', 'Bangalore, India', 'India', 2019, 'Active'),
(2, 'TCS', 'Consulting', 'Neha Desai', '9123456781', 'neha@tcs.com', 'Mumbai, India', 'India', 2018, 'Active'),
(3, 'HDFC Bank', 'Banking', 'Suresh Iyer', '9123456782', 'suresh@hdfc.com', 'Mumbai, India', 'India', 2020, 'Active'),
(4, 'Reliance', 'Retail', 'Vikram Shah', '9123456783', 'vikram@reliance.com', 'Ahmedabad, India', 'India', 2021, 'Active'),
(5, 'Google', 'Technology', 'Elena Gomez', '9123456784', 'elena@google.com', 'Mountain View, USA', 'USA', 2022, 'Active'),
(6, 'Amazon', 'E-commerce', 'Jason Lee', '9123456785', 'jason@amazon.com', 'Seattle, USA', 'USA', 2019, 'Active'),
(7, 'LIC', 'Insurance', 'Rajesh Patil', '9123456786', 'rajesh@lic.com', 'Delhi, India', 'India', 2017, 'Active'),
(8, 'Siemens', 'Manufacturing', 'Klaus Berger', '9123456787', 'klaus@siemens.com', 'Munich, Germany', 'Germany', 2023, 'Planned'),
(9, 'Flipkart', 'E-commerce', 'Ankita Rao', '9123456788', 'ankita@flipkart.com', 'Bangalore, India', 'India', 2020, 'Active'),
(10, 'Capgemini', 'Consulting', 'Jean Pierre', '9123456789', 'jean@capgemini.com', 'Paris, France', 'France', 2016, 'Inactive');

-- to display table data
select * from clients;
-- to remove complete records from table
truncate table clients;
-- to remove complete records and attributes from table
drop table clients;


-- Table-6 attendance -------------------------------------------------------------------------------------------------------
create table attendance (
attendance_id int primary key,
emp_id int,
date date,
check_in time,
check_out time,
status varchar(20),
working_hours decimal(4,2),
shift varchar(20),
location varchar(50),
remarks text,
foreign key (emp_id) references employees(emp_id)
);

insert into attendance values
(1, 101, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.00, 'Morning', 'Head Office', ''),
(2, 102, '2025-07-01', '09:30:00', '18:00:00', 'Present', 8.50, 'Morning', 'Branch Office', ''),
(3, 103, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.00, 'Morning', 'Head Office', ''),
(4, 104, '2025-07-01', '10:00:00', '16:30:00', 'Present', 6.50, 'Morning', 'Remote', 'Half-day approved'),
(5, 105, '2025-07-01', '09:15:00', '17:15:00', 'Present', 8.00, 'Morning', 'Research Center', ''),
(6, 106, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.00, 'Morning', 'Warehouse', ''),
(7, 107, '2025-07-01', '00:00:00', '00:00:00', 'Absent', 0.00, 'Morning', 'Head Office', 'On leave'),
(8, 108, '2025-07-01', '09:45:00', '17:30:00', 'Present', 7.75, 'Morning', 'Branch Office', 'Late arrival'),
(9, 109, '2025-07-01', '08:50:00', '17:10:00', 'Present', 8.33, 'Morning', 'Head Office', ''),
(10, 110, '2025-07-01', '09:00:00', '17:00:00', 'Present', 8.00, 'Morning', 'Head Office', '');

-- to display table data
select * from attendance;
-- to remove complete records from table
truncate table attendance;
-- to remove complete records and attributes from table
drop table attendance;


-- Table-7 leaves -----------------------------------------------------------------------------------------------------------
create table leaves (
leave_id int primary key,
emp_id int,
leave_type varchar(30),
start_date date,
end_date date,
reason text,
status varchar(20),
applied_date date,
approved_by varchar(100),
remarks text,
foreign key (emp_id) references employees(emp_id)
);

insert into leaves values
(1, 101, 'Sick Leave', '2025-06-10', '2025-06-12', 'Fever and cold', 'Approved', '2025-06-09', 'HR Manager', ''),
(2, 102, 'Casual Leave', '2025-06-15', '2025-06-16', 'Personal work', 'Approved', '2025-06-14', 'Project Manager', ''),
(3, 103, 'Maternity Leave', '2025-05-01', '2025-08-01', 'Maternity', 'Approved', '2025-04-25', 'HR Head', ''),
(4, 104, 'Paternity Leave', '2025-06-20', '2025-06-25', 'Newborn care', 'Approved', '2025-06-18', 'Team Lead', ''),
(5, 105, 'Earned Leave', '2025-07-05', '2025-07-10', 'Family vacation', 'Pending', '2025-07-01', 'HR Manager', ''),
(6, 106, 'Sick Leave', '2025-06-08', '2025-06-09', 'Dental issue', 'Approved', '2025-06-07', 'Project Manager', ''),
(7, 107, 'Casual Leave', '2025-06-18', '2025-06-19', 'Bank work', 'Rejected', '2025-06-17', 'Admin Officer', 'Exceeds limit'),
(8, 108, 'Earned Leave', '2025-07-15', '2025-07-20', 'Out of station', 'Pending', '2025-07-10', 'HR Manager', ''),
(9, 109, 'Sick Leave', '2025-06-25', '2025-06-27', 'Back pain', 'Approved', '2025-06-24', 'Project Manager', ''),
(10, 110, 'Casual Leave', '2025-07-03', '2025-07-04', 'Medical appointment', 'Approved', '2025-07-02', 'Team Lead', '');

-- to display table data
select * from leaves;
-- to remove complete records from table
truncate table leaves;
-- to remove complete records and attributes from table
drop table leaves;


-- Table-8 payroll ----------------------------------------------------------------------------------------------------------
create table payroll (
payroll_id int primary key,
emp_id int,
month varchar(15),
year int,
basic_salary int,
hra int,
allowance int,
deductions int,
net_pay int,
status varchar(20),
foreign key (emp_id) references employees(emp_id)
);

insert into payroll values
(1, 101, 'June', 2025, 40000, 10000, 5000, 2000, 53000, 'Paid'),
(2, 102, 'June', 2025, 45000, 12000, 6000, 3000, 60000, 'Paid'),
(3, 103, 'June', 2025, 50000, 15000, 8000, 4000, 69000, 'Paid'),
(4, 104, 'June', 2025, 42000, 11000, 5500, 2500, 56000, 'Paid'),
(5, 105, 'June', 2025, 48000, 13000, 7000, 3500, 64500, 'Paid'),
(6, 106, 'June', 2025, 39000, 9000, 4000, 1000, 52000, 'Paid'),
(7, 107, 'June', 2025, 47000, 12500, 6500, 3000, 63000, 'Unpaid'),
(8, 108, 'June', 2025, 46000, 11500, 6000, 2500, 61000, 'Paid'),
(9, 109, 'June', 2025, 53000, 16000, 8500, 5000, 72500, 'Paid'),
(10, 110, 'June', 2025, 41000, 10500, 4500, 1500, 54500, 'Paid');

-- to display table data
select * from payroll;
-- to remove complete records from table
truncate table payroll;
-- to remove complete records and attributes from table
drop table payroll;


-- Table-9 assets -----------------------------------------------------------------------------------------------------------
create table assets (
asset_id int primary key,
asset_name varchar(100),
category varchar(50),
assigned_to int,
purchase_date date,
cost int,
warranty_years int,
status varchar(20),
location varchar(50),
remarks text,
foreign key (assigned_to) references employees(emp_id)
);

insert into assets values
(1, 'Dell Laptop', 'Electronics', 101, '2023-01-15', 55000, 3, 'In Use', 'Head Office', ''),
(2, 'Office Chair', 'Furniture', 102, '2022-03-10', 8000, 5, 'In Use', 'Branch Office', ''),
(3, 'Projector', 'Electronics', 103, '2021-08-22', 45000, 2, 'Under Maintenance', 'Conference Room', ''),
(4, 'Air Conditioner', 'Appliance', 104, '2020-06-05', 30000, 4, 'In Use', 'Head Office', ''),
(5, 'HP Printer', 'Electronics', 105, '2022-11-11', 15000, 3, 'In Use', 'Admin Dept', ''),
(6, 'Router', 'Networking', 106, '2023-02-18', 10000, 2, 'In Use', 'IT Room', ''),
(7, 'Table', 'Furniture', 107, '2021-09-30', 5000, 6, 'In Use', 'HR Cabin', ''),
(8, 'iMac', 'Electronics', 108, '2023-04-12', 120000, 2, 'In Use', 'Design Studio', ''),
(9, 'Coffee Machine', 'Appliance', 109, '2019-12-25', 9000, 5, 'Out of Service', 'Pantry', 'To be replaced'),
(10, 'Samsung Monitor', 'Electronics', 110, '2023-06-20', 18000, 2, 'In Use', 'Head Office', '');

-- to display table data
select * from assets;
-- to remove complete records from table
truncate table assets;
-- to remove complete records and attributes from table
drop table assets;


-- Table-10 performance -----------------------------------------------------------------------------------------------------
create table performance (
performance_id int primary key,
emp_id int,
review_period varchar(20),
rating int,
reviewer varchar(100),
review_date date,
goals_achieved int,
improvement_areas text,
promotion_recommended varchar(10),
remarks text,
foreign key (emp_id) references employees(emp_id)
);

insert into performance values
(1, 101, 'Jan-Jun 2025', 4, 'Manager A', '2025-06-30', 5, 'Needs to improve punctuality', 'Yes', ''),
(2, 102, 'Jan-Jun 2025', 5, 'Manager B', '2025-06-30', 6, 'Excellent team player', 'Yes', 'Promotion due'),
(3, 103, 'Jan-Jun 2025', 3, 'Manager A', '2025-06-30', 4, 'Improve time management', 'No', ''),
(4, 104, 'Jan-Jun 2025', 4, 'Manager C', '2025-06-30', 5, 'Good communication skills', 'No', ''),
(5, 105, 'Jan-Jun 2025', 5, 'Manager B', '2025-06-30', 6, 'High leadership qualities', 'Yes', ''),
(6, 106, 'Jan-Jun 2025', 4, 'Manager A', '2025-06-30', 5, 'Work on multitasking', 'No', ''),
(7, 107, 'Jan-Jun 2025', 3, 'Manager C', '2025-06-30', 3, 'Inconsistent performance', 'No', 'Counseling recommended'),
(8, 108, 'Jan-Jun 2025', 5, 'Manager B', '2025-06-30', 6, 'Outstanding creativity', 'Yes', ''),
(9, 109, 'Jan-Jun 2025', 4, 'Manager A', '2025-06-30', 5, 'Consistent performer', 'No', ''),
(10, 110, 'Jan-Jun 2025', 4, 'Manager C', '2025-06-30', 5, 'Collaborative and efficient', 'Yes', '');

-- to display table data
select * from performance;
-- to remove complete records from table
truncate table performance;
-- to remove complete records and attributes from table
drop table performance;