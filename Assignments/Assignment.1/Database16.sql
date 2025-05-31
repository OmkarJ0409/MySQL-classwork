/*
This file consists of a database named PERSONAL_FINANCE_TRACKER having tables Users, Income, Expenses, Saving_Goals, and Transfers.

Table.1 - USERS TABLE - (Stores user information)
        Attributes: User_id, User_name, Email, Join_date, Country

Table.2 - INCOME TABLE - (Stores details of user's income)
        Attributes: Income_id, User_id, Source, Amount, Date_Received

Table.3 - EXPENSES TABLE - (Stores user's expenses)
        Attributes: Expense_id, User_id, Category, Amount, Date_spent

Table.4 - SAVING_GOALS TABLE - (Stores user's savings goals)
        Attributes: Goal_id, User_id, Goal_name, Target_amount, Target_date

Table.5 - TRANSFERS TABLE - (Stores transfers between accounts)
        Attributes: Transfer_id, From_account, To_account, Amount, Transfer_date

Step-by-step Creation of Personal_Finance_Tracker Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Users Table + Insert Data  
Step 4: Create Income Table + Insert Data  
Step 5: Create Expenses Table + Insert Data  
Step 6: Create Saving_Goals Table + Insert Data  
Step 7: Create Transfers Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Personal_Finance_Tracker;

-- Step 2: Use the Database
use Personal_Finance_Tracker;


-- Step 3: Create Users Table ----------------------------------------------------------
create table Users(
    User_id int primary key,
    User_name varchar(50),
    Email varchar(30),
    Join_date date,
    Country varchar(20)
);

insert into Users values
(1, 'Alice', 'alice@mail.com', '2023-01-15', 'USA'),
(2, 'Bob', 'bob@mail.com', '2023-02-20', 'UK'),
(3, 'Charlie', 'charlie@mail.com', '2023-03-10', 'Canada'),
(4, 'Diana', 'diana@mail.com', '2023-04-05', 'India'),
(5, 'Ethan', 'ethan@mail.com', '2023-05-12', 'Germany'),
(6, 'Fiona', 'fiona@mail.com', '2023-06-01', 'Australia'),
(7, 'George', 'george@mail.com', '2023-06-15', 'France'),
(8, 'Hannah', 'hannah@mail.com', '2023-07-10', 'Italy'),
(9, 'Ian', 'ian@mail.com', '2023-07-25', 'Japan'),
(10, 'Julia', 'julia@mail.com', '2023-08-01', 'Brazil');

-- To view Users data
select * from Users;

-- To clear table data
truncate table Users;

-- To drop the table
drop table Users;


-- Step 4: Create Income Table ----------------------------------------------------------
create table Income(
    Income_id int primary key,
    User_id int,
    Source varchar(50),
    Amount int,
    Date_Received date,
    foreign key (User_id) references Users(User_id)
);

insert into Income values
(1, 1, 'Salary', 5000, '2023-01-30'),
(2, 2, 'Freelancing', 3000, '2023-02-28'),
(3, 3, 'Investments', 1200, '2023-03-25'),
(4, 4, 'Salary', 4500, '2023-04-30'),
(5, 5, 'Dividends', 800, '2023-05-15'),
(6, 6, 'Rent', 2000, '2023-06-10'),
(7, 7, 'Salary', 4000, '2023-06-30'),
(8, 8, 'Consulting', 1500, '2023-07-20'),
(9, 9, 'Freelancing', 2200, '2023-07-31'),
(10, 10, 'Salary', 4800, '2023-08-01');

-- To view Income data
select * from Income;

-- To clear table data
truncate table Income;

-- To drop the table
drop table Income;


-- Step 5: Create Expenses Table ----------------------------------------------------------
create table Expenses(
    Expense_id int primary key,
    User_id int,
    Category varchar(50),
    Amount int,
    Date_spent date,
    foreign key (User_id) references Users(User_id)
);

insert into Expenses values
(1, 1, 'Groceries', 300, '2023-01-20'),
(2, 2, 'Rent', 1200, '2023-02-05'),
(3, 3, 'Utilities', 150, '2023-03-12'),
(4, 4, 'Travel', 800, '2023-04-18'),
(5, 5, 'Dining Out', 200, '2023-05-10'),
(6, 6, 'Shopping', 450, '2023-06-11'),
(7, 7, 'Internet', 80, '2023-06-28'),
(8, 8, 'Fuel', 120, '2023-07-16'),
(9, 9, 'Medical', 300, '2023-07-29'),
(10, 10, 'Groceries', 350, '2023-08-02');

-- To view Expenses data
select * from Expenses;

-- To clear table data
truncate table Expenses;

-- To drop the table
drop table Expenses;


-- Step 6: Create Saving_Goals Table ----------------------------------------------------------
create table Saving_Goals(
    Goal_id int primary key,
    User_id int,
    Goal_name varchar(50),
    Target_amount int,
    Target_date date,
    foreign key (User_id) references Users(User_id)
);

insert into Saving_Goals values
(1, 1, 'Vacation', 3000, '2023-12-01'),
(2, 2, 'Emergency Fund', 5000, '2023-10-15'),
(3, 3, 'Car Purchase', 8000, '2024-06-30'),
(4, 4, 'House Downpayment', 20000, '2025-01-01'),
(5, 5, 'Education', 10000, '2024-03-01'),
(6, 6, 'Wedding', 15000, '2024-12-25'),
(7, 7, 'Laptop Upgrade', 2000, '2023-11-20'),
(8, 8, 'Health Insurance', 4000, '2023-09-01'),
(9, 9, 'Debt Payoff', 7000, '2024-04-15'),
(10, 10, 'Business Investment', 10000, '2025-07-01');

-- To view Saving_Goals data
select * from Saving_Goals;

-- To clear table data
truncate table Saving_Goals;

-- To drop the table
drop table Saving_Goals;


-- Step 7: Create Transfers Table ----------------------------------------------------------
create table Transfers(
    Transfer_id int primary key,
    From_account varchar(50),
    To_account varchar(50),
    Amount int,
    Transfer_date date
);

insert into Transfers values
(1, 'Savings', 'Checking', 500, '2023-01-10'),
(2, 'Checking', 'Investment', 1000, '2023-02-20'),
(3, 'Salary', 'Savings', 2000, '2023-03-15'),
(4, 'Emergency Fund', 'Medical', 300, '2023-04-18'),
(5, 'Business', 'Checking', 1500, '2023-05-25'),
(6, 'Freelance', 'Savings', 600, '2023-06-08'),
(7, 'Wallet', 'Fuel', 120, '2023-07-10'),
(8, 'Rent', 'Bank', 1000, '2023-07-30'),
(9, 'Salary', 'Vacation', 800, '2023-08-02'),
(10, 'Bonus', 'Shopping', 400, '2023-08-15');

-- To view Transfers data
select * from Transfers;

-- To clear table data
truncate table Transfers;

-- To drop the table
drop table Transfers;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Users;
select * from Income;
select * from Expenses;
select * from Saving_Goals;
select * from Transfers;