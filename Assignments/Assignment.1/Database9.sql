/*
This file consists of a database named SMART_STORE having tables Stores, Employees, Customers, Inventory, and Return_Items.

Table.1 - STORES TABLE - (Stores details of each store)
        Attributes: Store_id, Store_Address, Store_Manager, Contact, Location

Table.2 - EMPLOYEES TABLE - (Stores details of employees working in stores)
        Attributes: Employee_id, Employee_name, Store_id (FK), Contact, Salary

Table.3 - CUSTOMERS TABLE - (Stores details of customers and their billing)
        Attributes: Customer_id, Customer_Receipt, Customer_Bill, Payment_method, Contact

Table.4 - INVENTORY TABLE - (Stores details about products in inventory)
        Attributes: Inventory_id, Product_name, Current_stock, Reorder_Date, Time_till_next_reorder

Table.5 - RETURN_ITEMS TABLE - (Stores details about returned items by customers)
        Attributes: Return_id, Customer_Bill, Return_Item, Return_Item_Cause, Refund_method

Step-by-step Creation of Smart_store Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Stores Table + Insert Data  
Step 4: Create Employees Table + Insert Data  
Step 5: Create Customers Table + Insert Data  
Step 6: Create Inventory Table + Insert Data  
Step 7: Create Return_Items Table + Insert Data  
Step 8: View Data  
*/

-- Step 1: Create the Database
create database Smart_store;

-- Step 2: Use the Database
use Smart_store;

-- Step 3: Create Stores Table ----------------------------------------------------------
create table Stores(
    Store_id int primary key,
    Store_Address varchar(50),
    Store_Manager varchar(50),
    Contact varchar(10),
    Location varchar(10)
);

insert into Stores values
(1, 'MG Road, Pune', 'Rajesh Kumar', '9876543210', 'Pune'),
(2, 'Sector 17, Chandigarh', 'Priya Mehra', '9876543211', 'Chandigarh'),
(3, 'Park Street, Kolkata', 'Amit Roy', '9876543212', 'Kolkata'),
(4, 'Connaught Place, Delhi', 'Neha Gupta', '9876543213', 'Delhi'),
(5, 'Anna Nagar, Chennai', 'Suresh Reddy', '9876543214', 'Chennai'),
(6, 'Banjara Hills, Hyderabad', 'Rekha Singh', '9876543215', 'Hyderabad'),
(7, 'Andheri West, Mumbai', 'Ravi Sharma', '9876543216', 'Mumbai'),
(8, 'Kothrud, Pune', 'Kiran Joshi', '9876543217', 'Pune'),
(9, 'Gariahat, Kolkata', 'Pooja Das', '9876543218', 'Kolkata'),
(10, 'Vashi, Navi Mumbai', 'Nikhil Patil', '9876543219', 'NaviMumbai');

-- To display table data
select * from Stores;

-- To remove complete records from table
truncate table Stores;

-- To remove complete records and attributes from table
drop table Stores;


-- Step 4: Create Employees Table ----------------------------------------------------------
create table Employees(
    Employee_id int primary key,
    Employee_name varchar(50),
    Store_id int,
    Contact varchar(10),
    Salary int,
    foreign key (Store_id) references Stores(Store_id)
);

insert into Employees values
(101, 'Ankit Verma', 1, '9123456780', 25000),
(102, 'Sneha Iyer', 2, '9123456781', 28000),
(103, 'Mohit Sinha', 3, '9123456782', 30000),
(104, 'Divya Rao', 4, '9123456783', 27000),
(105, 'Tarun Shah', 5, '9123456784', 26000),
(106, 'Meena Jain', 6, '9123456785', 29000),
(107, 'Siddharth Kale', 7, '9123456786', 31000),
(108, 'Aisha Khan', 8, '9123456787', 24000),
(109, 'Karan Mehta', 9, '9123456788', 25500),
(110, 'Reena Paul', 10, '9123456789', 26500);

-- To display table data
select * from Employees;

-- To remove complete records from table
truncate table Employees;

-- To remove complete records and attributes from table
drop table Employees;


-- Step 5: Create Customers Table ----------------------------------------------------------
create table Customers(
    Customer_id int primary key,
    Customer_Receipt text,
    Customer_Bill int,
    Payment_method varchar(50),
    Contact varchar(10)
);

insert into Customers values
(201, 'RECPT001', 1500, 'UPI', '9988776655'),
(202, 'RECPT002', 2300, 'Cash', '9988776654'),
(203, 'RECPT003', 1750, 'Card', '9988776653'),
(204, 'RECPT004', 1900, 'UPI', '9988776652'),
(205, 'RECPT005', 1200, 'Cash', '9988776651'),
(206, 'RECPT006', 2100, 'UPI', '9988776650'),
(207, 'RECPT007', 1850, 'Card', '9988776649'),
(208, 'RECPT008', 3000, 'Cash', '9988776648'),
(209, 'RECPT009', 2700, 'UPI', '9988776647'),
(210, 'RECPT010', 2200, 'Card', '9988776646');

-- To display table data
select * from Customers;

-- To remove complete records from table
truncate table Customers;

-- To remove complete records and attributes from table
drop table Customers;


-- Step 6: Create Inventory Table ----------------------------------------------------------
create table Inventory(
    Inventory_id int primary key,
    Product_name varchar(50),
    Current_stock int,
    Reorder_Date date,
    Time_till_next_reorder date
);

insert into Inventory values
(301, 'Tata Salt', 50, '2025-06-10', '2025-06-25'),
(302, 'Parle-G Biscuits', 120, '2025-06-11', '2025-06-20'),
(303, 'Amul Milk 1L', 30, '2025-06-12', '2025-06-15'),
(304, 'Dettol Soap', 80, '2025-06-14', '2025-06-30'),
(305, 'Colgate Toothpaste', 60, '2025-06-09', '2025-06-23'),
(306, 'Aashirvaad Atta 5kg', 40, '2025-06-10', '2025-06-24'),
(307, 'Surf Excel Detergent', 70, '2025-06-13', '2025-06-22'),
(308, 'Dairy Milk Chocolate', 100, '2025-06-12', '2025-06-18'),
(309, 'Pepsi 2L', 25, '2025-06-11', '2025-06-19'),
(310, 'Maggie Noodles 70g', 200, '2025-06-15', '2025-06-25');

-- To display table data
select * from Inventory;

-- To remove complete records from table
truncate table Inventory;

-- To remove complete records and attributes from table
drop table Inventory;


-- Step 7: Create Return_Items Table ----------------------------------------------------------
create table Return_Items(
    Return_id int primary key,
    Customer_Bill int,
    Return_Item varchar(50),
    Return_Item_Cause varchar(50),
    Refund_method varchar(50)
);

insert into Return_Items values
(201, 1500, 'Parle-G Biscuits', 'Crushed package', 'Cash'),
(202, 2300, 'Dairy Milk Chocolate', 'Expired product', 'UPI'),
(203, 1750, 'Dettol Soap', 'Wrong item delivered', 'Card'),
(204, 1900, 'Maggie Noodles 70g', 'Packaging damaged', 'Cash'),
(205, 1200, 'Pepsi 2L', 'Opened seal', 'UPI'),
(206, 2100, 'Tata Salt', 'Broken pack', 'Cash'),
(207, 1850, 'Colgate Toothpaste', 'Wrong flavour', 'Card'),
(208, 3000, 'Amul Milk 1L', 'Expired', 'UPI'),
(209, 2700, 'Surf Excel Detergent', 'Leaking pack', 'Cash'),
(210, 2200, 'Aashirvaad Atta 5kg', 'Spoiled', 'Card');

-- To display table data
select * from Return_Items;

-- To remove complete records from table
truncate table Return_Items;

-- To remove complete records and attributes from table
drop table Return_Items;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Stores;
select * from Employees;
select * from Customers;
select * from Inventory;
select * from Return_Items;