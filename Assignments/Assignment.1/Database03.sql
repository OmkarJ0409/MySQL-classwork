/*
This File consists of a database named LIC_POLICY having tables Policy_Agent, Customers, Policies, Festive_Offers, and Elite_Customers.

Table.1 - POLICY_AGENT TABLE - (Stores details of agents and policy sales)
        Attributes: Agent_id, Agent_name, Policy_name, Policy_sold, Salary

Table.2 - CUSTOMERS TABLE - (Stores customer policy information)
        Attributes: Customer_id, Customer_name, Policy, Duration, Policy_Expiry

Table.3 - POLICIES TABLE - (Stores policy plan details)
        Attributes: Policy_id, Policy_name, Duration, Amount, Return_Amount

Table.4 - FESTIVE_OFFERS TABLE - (Stores festival-based discount offers)
        Attributes: Policy_name, Agent_name, Policy_sold, Discount_offer, Festival

Table.5 - ELITE_CUSTOMERS TABLE - (Stores elite customer data with policies)
        Attributes: Customer_id, Customer_name, Policy_id, Duration, Amount, Return_Amount

Step-by-step Creation of LIC_POLICY Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Policy_Agent Table + Insert Data
Step 4: Create Customers Table + Insert Data
Step 5: Create Policies Table + Insert Data
Step 6: Create Festive_Offers Table + Insert Data
Step 7: Create Elite_Customers Table + Insert Data
Step 8: View Data
*/

-- Step 1: Create the Database
create database Lic_Policy;

-- Step 2: Use the database
use Lic_Policy;

-- Step 3: Create Policy_Agent Table ----------------------------------------------------------
create table Policy_Agent(
    Agent_id int primary key,                -- Unique Agent ID
    Agent_name varchar(50),                  -- Agent's full name
    Policy_name varchar(100),                -- Name of the policy sold
    Policy_sold int,                         -- Number of policies sold
    Salary int                               -- Agent's salary
);

-- Insert records into Policy_Agent table
insert into Policy_Agent values
(1, 'Rajesh Kumar', 'Jeevan Anand', 120, 45000),
(2, 'Sneha Patel', 'Jeevan Umang', 85, 40000),
(3, 'Amit Verma', 'Money Back', 95, 42000),
(4, 'Pooja Shah', 'Endowment Plan', 70, 38000),
(5, 'Nikhil Rathi', 'Child Future Plan', 60, 35000),
(6, 'Anjali Mehta', 'Jeevan Labh', 105, 43000),
(7, 'Suresh Iyer', 'Retirement Plan', 90, 41000),
(8, 'Kavita Joshi', 'Wealth Plus', 80, 39000),
(9, 'Rahul Nair', 'Jeevan Saral', 65, 37000),
(10, 'Priya Desai', 'Jeevan Tarun', 75, 36000);

-- To display table data
select * from Policy_Agent;

-- To remove complete records from table
truncate table Policy_Agent;

-- To remove complete records and attributes from table
drop table Policy_Agent;


-- Step 4: Create Customers Table -------------------------------------------------------------
create table Customers(
    Customer_id int primary key,              -- Unique Customer ID
    Customer_name varchar(50),                -- Full name of customer
    Policy varchar(100),                      -- Policy name
    Duration varchar(50),                     -- Policy duration
    Policy_Expiry date                        -- Policy expiry date
);

-- Insert records into Customers table
insert into Customers values
(101, 'Akash Sharma', 'Jeevan Anand', '20 years', '2045-06-15'),
(102, 'Nisha Gupta', 'Money Back', '15 years', '2040-01-10'),
(103, 'Varun Mehta', 'Jeevan Umang', '25 years', '2050-09-25'),
(104, 'Priti Singh', 'Endowment Plan', '10 years', '2035-12-01'),
(105, 'Rahul Jain', 'Child Future Plan', '18 years', '2043-03-12'),
(106, 'Neha Verma', 'Jeevan Labh', '20 years', '2045-05-08'),
(107, 'Aman Joshi', 'Retirement Plan', '22 years', '2047-11-20'),
(108, 'Sonal Patel', 'Wealth Plus', '15 years', '2040-07-19'),
(109, 'Ravi Iyer', 'Jeevan Saral', '12 years', '2037-04-14'),
(110, 'Meena Nair', 'Jeevan Tarun', '20 years', '2045-08-30');

-- To display table data
select * from Customers;

-- To remove complete records from table
truncate table Customers;

-- To remove complete records and attributes from table
drop table Customers;


-- Step 5: Create Policies Table -----------------------------------------------------------------
create table Policies(
    Policy_id int primary key,                -- Unique Policy ID
    Policy_name varchar(100),                 -- Policy name
    Duration varchar(50),                     -- Duration of policy
    Amount varchar(10),                       -- Investment amount
    Return_Amount varchar(10)                 -- Return amount after maturity
);

-- Insert records into Policies table
insert into Policies values
(201, 'Jeevan Anand', '20 years', '50000', '80000'),
(202, 'Money Back', '15 years', '40000', '60000'),
(203, 'Jeevan Umang', '25 years', '60000', '90000'),
(204, 'Endowment Plan', '10 years', '30000', '45000'),
(205, 'Child Future Plan', '18 years', '35000', '55000'),
(206, 'Jeevan Labh', '20 years', '52000', '82000'),
(207, 'Retirement Plan', '22 years', '45000', '70000'),
(208, 'Wealth Plus', '15 years', '38000', '57000'),
(209, 'Jeevan Saral', '12 years', '36000', '52000'),
(210, 'Jeevan Tarun', '20 years', '50000', '78000');

-- To display table data
select * from Policies;

-- To remove complete records from table
truncate table Policies;

-- To remove complete records and attributes from table
drop table Policies;


-- Step 6: Create Festive_Offers Table -------------------------------------------------------------
create table Festive_offers(
    Policy_name varchar(100) primary key,     -- Policy name (must be unique here)
    Agent_name varchar(50),                   -- Agent offering the discount
    Policy_sold int,                          -- Number of policies sold during offer
    Discount_offer varchar(10),               -- Discount offer (e.g., '10%')
    Festival varchar(50)                      -- Name of festival
);

-- Insert records into Festive_Offers table
insert into Festive_offers values
('Jeevan Anand', 'Rajesh Kumar', 120, '10%', 'Diwali'),
('Jeevan Umang', 'Sneha Patel', 85, '8%', 'Holi'),
('Money Back', 'Amit Verma', 95, '7%', 'Navratri'),
('Endowment Plan', 'Pooja Shah', 70, '9%', 'Eid'),
('Child Future Plan', 'Nikhil Rathi', 60, '5%', 'Christmas'),
('Jeevan Labh', 'Anjali Mehta', 105, '11%', 'New Year'),
('Retirement Plan', 'Suresh Iyer', 90, '6%', 'Makar Sankranti'),
('Wealth Plus', 'Kavita Joshi', 80, '7%', 'Pongal'),
('Jeevan Saral', 'Rahul Nair', 65, '6%', 'Republic Day'),
('Jeevan Tarun', 'Priya Desai', 75, '8%', 'Independence Day');

-- To display table data
select * from Festive_offers;

-- To remove complete records from table
truncate table Festive_offers;

-- To remove complete records and attributes from table
drop table Festive_offers;


-- Step 7: Create Elite_Customers Table --------------------------------------------------------------
create table Elite_customers(
    Customer_id int primary key,              -- Unique Customer ID
    Customer_name varchar(50),                -- Name of the elite customer
    Policy_id int,                            -- Policy ID availed
    Duration varchar(50),                     -- Duration of the policy
    Amount varchar(10),                       -- Policy investment amount
    Return_Amount varchar(10),                -- Return on policy
    foreign key (Customer_id) references Customers(Customer_id)
);

-- Insert records into Elite_Customers table
insert into Elite_customers values
(101, 'Akash Sharma', 201, '20 years', '50000', '80000'),
(102, 'Nisha Gupta', 202, '15 years', '40000', '60000'),
(103, 'Varun Mehta', 203, '25 years', '60000', '90000'),
(104, 'Priti Singh', 204, '10 years', '30000', '45000'),
(105, 'Rahul Jain', 205, '18 years', '35000', '55000'),
(106, 'Neha Verma', 206, '20 years', '52000', '82000'),
(107, 'Aman Joshi', 207, '22 years', '45000', '70000'),
(108, 'Sonal Patel', 208, '15 years', '38000', '57000'),
(109, 'Ravi Iyer', 209, '12 years', '36000', '52000'),
(110, 'Meena Nair', 210, '20 years', '50000', '78000');

-- To display table data
select * from Elite_customers;

-- To remove complete records from table
truncate table Elite_customers;

-- To remove complete records and attributes from table
drop table Elite_customers;


-- Step 8: View All Tables ------------------------------------------------------------------------
select * from Policy_Agent;
select * from Customers;
select * from Policies;
select * from Festive_offers;
select * from Elite_customers;