/*
This file consists of a database named IPPB(India Post Payments Bank) having tables Post_Branch, Services, Employees, Customers, and Post_Box.

Table.1 - POST_BRANCH TABLE - (Stores branch details)
        Attributes: Branch_id, Branch_name, Branch_Manager, Address, Contact

Table.2 - SERVICES TABLE - (Lists services provided by IPPB)
        Attributes: Service_id, Service_name, Service_Type, Details, Documents_Required

Table.3 - EMPLOYEES TABLE - (Stores employees working in different branches)
        Attributes: Employee_id, Employee_name, Employee_designation, Employee_Branch, Contact

Table.4 - CUSTOMERS TABLE - (Stores customers using IPPB services)
        Attributes: Customer_id, Customer_name, Customer_Account_Type, Contact, Services

Table.5 - POST_BOX TABLE - (Stores parcel/postbox information and its relation to branches)
        Attributes: Box_id, Box_Branch (FK), Installation_Date, Senders_Address, Receivers_Address

Step-by-step Creation of IPPB Database:
Step 1: Create the Database
Step 2: Select the Database
Step 3: Create Post_Branch Table + Insert Data
Step 4: Create Services Table + Insert Data
Step 5: Create Employees Table + Insert Data
Step 6: Create Customers Table + Insert Data
Step 7: Create Post_Box Table + Insert Data (Foreign Key: Box_Branch → Branch_id)
Step 8: View Data
*/

-- Step 1: Create the Database
create database IPPB;

-- Step 2: Use the Database
use IPPB;

-- Step 3: Create Post_Branch Table ----------------------------------------------------------
create table Post_Branch(
    Branch_id int primary key,
    Branch_name varchar(50),
    Branch_Manager varchar(50),
    Address text,
    Contact varchar(50)
);

insert into Post_Branch values
(1, 'Mumbai Central', 'Amit Joshi', 'Mumbai, MH', '022-12345678'),
(2, 'Delhi GPO', 'Pooja Sharma', 'Connaught Place, Delhi', '011-23456789'),
(3, 'Kolkata North', 'Raj Sen', 'Kolkata, WB', '033-34567890'),
(4, 'Chennai South', 'Meena Iyer', 'Chennai, TN', '044-45678901'),
(5, 'Pune Camp', 'Nikhil Patil', 'Pune, MH', '020-56789012'),
(6, 'Bengaluru East', 'Divya Rao', 'Bangalore, KA', '080-67890123'),
(7, 'Hyderabad GPO', 'Suresh Reddy', 'Hyderabad, TS', '040-78901234'),
(8, 'Ahmedabad Main', 'Komal Shah', 'Ahmedabad, GJ', '079-89012345'),
(9, 'Jaipur HQ', 'Harshit Gupta', 'Jaipur, RJ', '0141-90123456'),
(10, 'Lucknow Cantt', 'Preeti Verma', 'Lucknow, UP', '0522-11223344');

select * from Post_Branch;


-- Step 4: Create Services Table ----------------------------------------------------------
create table Services(
    Service_id int primary key,
    Service_name varchar(50),
    Service_Type varchar(50),
    Details text,
    Documents_Required text
);

insert into Services values
(1, 'Savings Account', 'Banking', 'Zero balance savings account', 'ID proof, Address proof'),
(2, 'Current Account', 'Banking', 'For businesses and shops', 'PAN, Address proof, GST'),
(3, 'Money Transfer', 'Remittance', 'Transfer money across India', 'ID proof'),
(4, 'Bill Payment', 'Utility', 'Pay electricity, water, DTH bills', 'Account number, Bill copy'),
(5, 'Insurance', 'Financial', 'Life and accident insurance plans', 'ID proof, Age proof'),
(6, 'Aadhaar Update', 'UIDAI', 'Update Aadhaar details', 'Aadhaar card, relevant document'),
(7, 'Mobile Recharge', 'Utility', 'Prepaid and postpaid recharge', 'Mobile number'),
(8, 'Digital Savings Account', 'Banking', 'Online account with OTP verification', 'Aadhaar, Mobile number'),
(9, 'Cash Withdrawal', 'Banking', 'Withdraw from account at branch', 'Passbook or Aadhaar'),
(10, 'Fixed Deposit', 'Banking', 'Long-term savings with interest', 'KYC documents');

select * from Services;


-- Step 5: Create Employees Table ----------------------------------------------------------
create table Employees(
    Employee_id int primary key,
    Employee_name varchar(50),
    Employee_designation varchar(50),
    Employee_Branch varchar(50),
    Contact varchar(10)
);

insert into Employees values
(1, 'Ravi Kumar', 'Branch Manager', 'Mumbai Central', '9988776655'),
(2, 'Anita Singh', 'Clerk', 'Delhi GPO', '9988776656'),
(3, 'Sanjay Mehra', 'Cashier', 'Kolkata North', '9988776657'),
(4, 'Deepa Joshi', 'Customer Executive', 'Chennai South', '9988776658'),
(5, 'Manoj Das', 'Branch Manager', 'Pune Camp', '9988776659'),
(6, 'Sneha Roy', 'Executive', 'Bengaluru East', '9988776660'),
(7, 'Ajay Sharma', 'Clerk', 'Hyderabad GPO', '9988776661'),
(8, 'Mehul Shah', 'Cashier', 'Ahmedabad Main', '9988776662'),
(9, 'Tanya Jain', 'Executive', 'Jaipur HQ', '9988776663'),
(10, 'Varun Tripathi', 'Branch Manager', 'Lucknow Cantt', '9988776664');

select * from Employees;


-- Step 6: Create Customers Table ----------------------------------------------------------
create table Customers(
    Customer_id int primary key,
    Customer_name varchar(50),
    Customer_Account_Type varchar(50),
    Contact varchar(10),
    Services varchar(50)
);

insert into Customers values
(1, 'Nikhil Agarwal', 'Savings', '9876543210', 'Savings Account'),
(2, 'Pooja Mehta', 'Current', '9876543211', 'Current Account'),
(3, 'Aarti Deshmukh', 'Savings', '9876543212', 'Bill Payment'),
(4, 'Ramesh Yadav', 'Savings', '9876543213', 'Money Transfer'),
(5, 'Snehal Patil', 'Current', '9876543214', 'Fixed Deposit'),
(6, 'Sunil Joshi', 'Savings', '9876543215', 'Insurance'),
(7, 'Swati Kaur', 'Savings', '9876543216', 'Mobile Recharge'),
(8, 'Arun Reddy', 'Savings', '9876543217', 'Cash Withdrawal'),
(9, 'Preeti Sharma', 'Savings', '9876543218', 'Aadhaar Update'),
(10, 'Ravi Nair', 'Current', '9876543219', 'Digital Savings Account');

select * from Customers;


-- Step 7: Create Post_Box Table ----------------------------------------------------------
create table Post_Box(
    Box_id int primary key,
    Box_Branch int,
    Installation_Date date,
    Senders_Address text,
    Receivers_Address text,
    foreign key (Box_Branch) references Post_Branch(Branch_id)
);

insert into Post_Box values
(1, 1, '2023-01-10', 'Amit Shah, Mumbai', 'Ramesh Yadav, Pune'),
(2, 2, '2023-02-14', 'Pooja Mehta, Delhi', 'Swati Kaur, Chennai'),
(3, 3, '2023-03-05', 'Arun Reddy, Kolkata', 'Ravi Nair, Hyderabad'),
(4, 4, '2023-04-22', 'Sneha Joshi, Chennai', 'Preeti Sharma, Lucknow'),
(5, 5, '2023-05-10', 'Ramesh Yadav, Pune', 'Aarti Deshmukh, Mumbai'),
(6, 6, '2023-06-08', 'Swati Kaur, Bangalore', 'Sunil Joshi, Jaipur'),
(7, 7, '2023-07-19', 'Arun Reddy, Hyderabad', 'Nikhil Agarwal, Ahmedabad'),
(8, 8, '2023-08-25', 'Ravi Nair, Ahmedabad', 'Manoj Das, Delhi'),
(9, 9, '2023-09-12', 'Tanya Jain, Jaipur', 'Amit Shah, Mumbai'),
(10, 10, '2023-10-01', 'Varun Tripathi, Lucknow', 'Anita Singh, Delhi');

select * from Post_Box;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Post_Branch;
select * from Services;
select * from Employees;
select * from Customers;
select * from Post_Box;
