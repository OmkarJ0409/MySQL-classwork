-- ----------------------------------- Database Queries --------------------------------------
-- Create SBI Bank database
CREATE DATABASE SBI_Bank;

-- Select the database for use
USE SBI_Bank;

-- ---------------------------------- Table Queries -----------------------------------------
-- Table-1 : Customers
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    FullName VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    AadharNumber VARCHAR(16),
    PANNumber VARCHAR(12),
    Address TEXT,
    BranchCode VARCHAR(10)
);

INSERT INTO Customers VALUES
(1, 'Rahul Sharma', '1988-06-12', 'Male', 'rahul88@gmail.com', '9876543210', '123412341234', 'ABCDE1234F', 'Delhi, India', 'SBI001'),
(2, 'Anjali Mehta', '1992-03-25', 'Female', 'anjali25@gmail.com', '9856432109', '987698769876', 'GHYTR5678G', 'Mumbai, India', 'SBI002'),
(3, 'Amit Roy', '1985-01-10', 'Male', 'amitroy@gmail.com', '9871122334', '123456781234', 'DFGTR1234E', 'Kolkata, India', 'SBI003'),
(4, 'Pooja Nair', '1990-09-17', 'Female', 'pooja.n@gmail.com', '9934567890', '567812341234', 'POIUY6789H', 'Chennai, India', 'SBI004'),
(5, 'Vikram Sinha', '1982-12-04', 'Male', 'vikram.sinha@gmail.com', '9765432101', '345612341234', 'PLMNB2345J', 'Bangalore, India', 'SBI005'),
(6, 'Riya Sen', '1994-11-30', 'Female', 'riya.sen@gmail.com', '9823456781', '876543218765', 'LKJHG8765K', 'Hyderabad, India', 'SBI006'),
(7, 'Neeraj Das', '1987-07-23', 'Male', 'neeraj.das@gmail.com', '9812345672', '765412349876', 'MNBVC2345L', 'Ahmedabad, India', 'SBI007'),
(8, 'Seema Agarwal', '1993-04-15', 'Female', 'seema.a@gmail.com', '9743124567', '234512347654', 'QWERT1234P', 'Surat, India', 'SBI008'),
(9, 'Anil Kumar', '1989-08-12', 'Male', 'anil.k@gmail.com', '9687654321', '112233445566', 'ZXCVB3456M', 'Jaipur, India', 'SBI009'),
(10, 'Sneha Das', '1991-02-22', 'Female', 'sneha.d@gmail.com', '9765123890', '667788990011', 'ASDFG5678T', 'Bhopal, India', 'SBI010'),
(11, 'Aditya Mehra', '1990-03-11', 'Male', 'aditya.m@gmail.com', '9845000001', '123400000123', 'PQWER6789Z', 'Lucknow, India', 'SBI011'),
(12, 'Divya Thakur', '1995-06-19', 'Female', 'divya.t@gmail.com', '9789456123', '234500000123', 'LKJHG0001A', 'Kanpur, India', 'SBI012'),
(13, 'Manish Tiwari', '1984-05-15', 'Male', 'manish.t@gmail.com', '9876541290', '321654987000', 'ZMXNB7890D', 'Nagpur, India', 'SBI013'),
(14, 'Priya Kaur', '1987-07-21', 'Female', 'priya.k@gmail.com', '9712314567', '654321009876', 'REWQ1234AS', 'Amritsar, India', 'SBI014'),
(15, 'Kunal Ghosh', '1992-10-01', 'Male', 'kunal.g@gmail.com', '9834567890', '223344556677', 'IUYTRE4321Z', 'Guwahati, India', 'SBI015'),
(16, 'Rachna Pathak', '1989-12-12', 'Female', 'rachna.p@gmail.com', '9854123987', '334455667788', 'OIUYT5678B', 'Indore, India', 'SBI016'),
(17, 'Saurabh Jain', '1985-08-08', 'Male', 'saurabh.j@gmail.com', '9723456789', '445566778899', 'XCVBN2345U', 'Kota, India', 'SBI017'),
(18, 'Meera Joshi', '1991-09-09', 'Female', 'meera.j@gmail.com', '9745123467', '556677889900', 'TREWQ3456N', 'Raipur, India', 'SBI018'),
(19, 'Arun Verma', '1993-06-06', 'Male', 'arun.v@gmail.com', '9887654321', '667788990011', 'NBVCX9876P', 'Agra, India', 'SBI019'),
(20, 'Meena Kapoor', '1991-08-09', 'Female', 'meenak@gmail.com', '9945362819', '673498761234', 'FHTRE7865J', 'Pune, India', 'SBI020');

-- Display all customers
SELECT * FROM Customers;
-- Delete all customer records but keep the table structure
TRUNCATE TABLE Customers;
-- Completely remove the Customers table from the database
DROP TABLE Customers;


-- Table-2: Accounts
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerID INT,
    AccountType VARCHAR(20),
    OpenDate DATE,
    Balance DECIMAL(12,2),
    IFSCCode VARCHAR(11),
    BranchCode VARCHAR(10),
    Status VARCHAR(10),
    NomineeName VARCHAR(100),
    Currency VARCHAR(5),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Accounts VALUES
(101, 1, 'Savings', '2020-01-15', 55000.75, 'SBIN000001', 'SBI001', 'Active', 'Reena Sharma', 'INR'),
(102, 2, 'Current', '2019-05-22', 125000.00, 'SBIN000002', 'SBI002', 'Active', 'Vijay Mehta', 'INR'),
(103, 3, 'Savings', '2021-11-10', 67000.00, 'SBIN000003', 'SBI003', 'Active', 'Asha Roy', 'INR'),
(104, 4, 'Savings', '2018-07-09', 89000.00, 'SBIN000004', 'SBI004', 'Active', 'Pritam Nair', 'INR'),
(105, 5, 'Current', '2022-01-01', 32000.00, 'SBIN000005', 'SBI005', 'Active', 'Kiran Sinha', 'INR'),
(106, 6, 'Savings', '2020-06-15', 47000.90, 'SBIN000006', 'SBI006', 'Active', 'Aman Sen', 'INR'),
(107, 7, 'Savings', '2021-02-25', 51000.50, 'SBIN000007', 'SBI007', 'Active', 'Sonal Das', 'INR'),
(108, 8, 'Current', '2017-09-10', 95000.00, 'SBIN000008', 'SBI008', 'Active', 'Vivek Agarwal', 'INR'),
(109, 9, 'Savings', '2023-04-20', 22000.00, 'SBIN000009', 'SBI009', 'Active', 'Rina Kumar', 'INR'),
(110, 10, 'Savings', '2019-12-12', 34000.00, 'SBIN000010', 'SBI010', 'Active', 'Neeraj Das', 'INR'),
(111, 11, 'Savings', '2021-08-12', 78000.45, 'SBIN000011', 'SBI011', 'Active', 'Priya Mehra', 'INR'),
(112, 12, 'Current', '2022-03-19', 125000.00, 'SBIN000012', 'SBI012', 'Active', 'Ajay Thakur', 'INR'),
(113, 13, 'Savings', '2023-01-23', 33000.00, 'SBIN000013', 'SBI013', 'Active', 'Anita Tiwari', 'INR'),
(114, 14, 'Savings', '2020-10-14', 59000.00, 'SBIN000014', 'SBI014', 'Active', 'Karan Kaur', 'INR'),
(115, 15, 'Current', '2021-04-18', 40500.00, 'SBIN000015', 'SBI015', 'Active', 'Deepak Ghosh', 'INR'),
(116, 16, 'Savings', '2019-11-11', 22000.00, 'SBIN000016', 'SBI016', 'Active', 'Nidhi Pathak', 'INR'),
(117, 17, 'Savings', '2020-05-30', 47000.50, 'SBIN000017', 'SBI017', 'Active', 'Tarun Jain', 'INR'),
(118, 18, 'Current', '2022-06-22', 110000.00, 'SBIN000018', 'SBI018', 'Active', 'Ankit Joshi', 'INR'),
(119, 19, 'Savings', '2023-03-03', 56000.00, 'SBIN000019', 'SBI019', 'Active', 'Radhika Verma', 'INR'),
(120, 20, 'Savings', '2023-07-07', 43250.50, 'SBIN000020', 'SBI020', 'Active', 'Amit Kapoor', 'INR');

-- Show all accounts
SELECT * FROM Accounts;
-- Delete all account records but keep the structure
TRUNCATE TABLE Accounts;
-- Completely remove the Accounts table
DROP TABLE Accounts;


--  Table-3: Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    AccountID INT,
    TransactionDate DATE,
    Type VARCHAR(10),
    Amount DECIMAL(10,2),
    Description TEXT,
    Mode VARCHAR(20),
    Status VARCHAR(10),
    BalanceAfter DECIMAL(12,2),
    BranchCode VARCHAR(10),
    FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID)
);

INSERT INTO Transactions VALUES
(1001, 101, '2024-06-10', 'Credit', 5000.00, 'Salary credited', 'NEFT', 'Success', 60000.75, 'SBI001'),
(1002, 101, '2024-06-15', 'Debit', 2000.00, 'Mobile recharge', 'UPI', 'Success', 58000.75, 'SBI001'),
(1003, 102, '2024-05-22', 'Debit', 1500.00, 'Electricity bill', 'Net Banking', 'Success', 123500.00, 'SBI002'),
(1004, 103, '2024-07-01', 'Credit', 20000.00, 'Cheque deposit', 'Cheque', 'Success', 87000.00, 'SBI003'),
(1005, 104, '2024-07-02', 'Debit', 500.00, 'ATM Withdrawal', 'ATM', 'Success', 88500.00, 'SBI004'),
(1006, 105, '2024-06-20', 'Credit', 10000.00, 'UPI received', 'UPI', 'Success', 42000.00, 'SBI005'),
(1007, 106, '2024-05-10', 'Debit', 1500.00, 'Online shopping', 'UPI', 'Success', 45500.90, 'SBI006'),
(1008, 107, '2024-07-15', 'Debit', 2500.00, 'Fuel payment', 'Card', 'Success', 48500.50, 'SBI007'),
(1009, 108, '2024-06-30', 'Credit', 7000.00, 'Client payment', 'IMPS', 'Success', 102000.00, 'SBI008'),
(1010, 109, '2024-05-18', 'Debit', 1000.00, 'Recharge', 'UPI', 'Success', 21000.00, 'SBI009'),
(1011, 110, '2024-07-05', 'Credit', 5000.00, 'Salary', 'NEFT', 'Success', 39000.00, 'SBI010'),
(1012, 111, '2024-06-12', 'Debit', 2000.00, 'Shopping', 'UPI', 'Success', 76000.45, 'SBI011'),
(1013, 112, '2024-05-25', 'Credit', 15000.00, 'Cheque', 'Cheque', 'Success', 140000.00, 'SBI012'),
(1014, 113, '2024-06-07', 'Debit', 2000.00, 'Rent', 'NEFT', 'Success', 31000.00, 'SBI013'),
(1015, 114, '2024-05-29', 'Debit', 1000.00, 'Petrol', 'UPI', 'Success', 58000.00, 'SBI014'),
(1016, 115, '2024-07-18', 'Credit', 10000.00, 'Client Payment', 'IMPS', 'Success', 50500.00, 'SBI015'),
(1017, 116, '2024-06-25', 'Debit', 500.00, 'Bill Payment', 'Net Banking', 'Success', 21500.00, 'SBI016'),
(1018, 117, '2024-07-03', 'Credit', 12000.00, 'Cash Deposit', 'Cash', 'Success', 59000.50, 'SBI017'),
(1019, 118, '2024-06-17', 'Debit', 1000.00, 'Restaurant', 'Card', 'Success', 109000.00, 'SBI018'),
(1020, 119, '2024-07-21', 'Credit', 8000.00, 'Transfer from friend', 'UPI', 'Success', 64000.00, 'SBI019');

-- Show all transactions
SELECT * FROM Transactions;
-- Remove all transaction records (preserves structure)
TRUNCATE TABLE Transactions;
-- Delete the Transactions table permanently
DROP TABLE Transactions;


-- Table-4: Loans
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    LoanType VARCHAR(20),
    Amount DECIMAL(12,2),
    StartDate DATE,
    TenureMonths INT,
    InterestRate FLOAT,
    EMI DECIMAL(10,2),
    Status VARCHAR(10),
    BranchCode VARCHAR(10),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Loans VALUES
(201, 1, 'Home', 2500000.00, '2023-01-01', 240, 7.5, 22345.67, 'Active', 'SBI001'),
(202, 2, 'Car', 800000.00, '2023-05-10', 60, 9.2, 16543.00, 'Active', 'SBI002'),
(203, 3, 'Personal', 200000.00, '2024-01-15', 36, 11.5, 6720.45, 'Active', 'SBI003'),
(204, 4, 'Education', 400000.00, '2022-06-01', 48, 10.0, 10450.30, 'Active', 'SBI004'),
(205, 5, 'Home', 1500000.00, '2023-04-20', 180, 8.0, 15400.00, 'Active', 'SBI005'),
(206, 6, 'Car', 950000.00, '2022-03-01', 60, 9.5, 17250.20, 'Active', 'SBI006'),
(207, 7, 'Business', 1200000.00, '2023-07-10', 84, 8.9, 19300.00, 'Active', 'SBI007'),
(208, 8, 'Education', 350000.00, '2021-08-15', 48, 10.2, 9450.00, 'Active', 'SBI008'),
(209, 9, 'Home', 1800000.00, '2023-09-01', 240, 7.0, 19800.50, 'Active', 'SBI009'),
(210, 10, 'Car', 600000.00, '2022-02-20', 60, 9.1, 13450.00, 'Active', 'SBI010'),
(211, 11, 'Personal', 250000.00, '2023-11-10', 36, 11.2, 7300.00, 'Active', 'SBI011'),
(212, 12, 'Home', 3000000.00, '2022-12-12', 240, 6.9, 24500.00, 'Active', 'SBI012'),
(213, 13, 'Education', 420000.00, '2023-05-01', 60, 10.4, 9900.00, 'Active', 'SBI013'),
(214, 14, 'Car', 700000.00, '2021-10-10', 48, 9.3, 15000.00, 'Active', 'SBI014'),
(215, 15, 'Home', 2200000.00, '2022-01-05', 240, 7.2, 21400.00, 'Active', 'SBI015'),
(216, 16, 'Business', 1000000.00, '2022-06-25', 120, 8.8, 19500.00, 'Active', 'SBI016'),
(217, 17, 'Personal', 300000.00, '2023-04-14', 36, 11.0, 8800.00, 'Active', 'SBI017'),
(218, 18, 'Education', 250000.00, '2022-07-07', 48, 10.5, 7800.00, 'Active', 'SBI018'),
(219, 19, 'Car', 850000.00, '2023-03-03', 60, 9.0, 15800.00, 'Active', 'SBI019'),
(220, 20, 'Personal', 200000.00, '2024-03-20', 36, 11.5, 6720.45, 'Active', 'SBI020');

-- List all home loans above ₹20 lakhs
SELECT * FROM Loans;
-- Clear all loan records
TRUNCATE TABLE Loans;
-- Delete the Loans table from database
DROP TABLE Loans;


--  Table-5: Branches
CREATE TABLE Branches (
    BranchCode VARCHAR(10) PRIMARY KEY,
    BranchName VARCHAR(100),
    IFSCCode VARCHAR(11),
    MICRCode VARCHAR(10),
    Address TEXT,
    City VARCHAR(50),
    State VARCHAR(50),
    Contact VARCHAR(15),
    ManagerName VARCHAR(100),
    WorkingHours VARCHAR(50)
);

INSERT INTO Branches VALUES
('SBI001', 'SBI Delhi Main Branch', 'SBIN000001', '110002001', 'Connaught Place, Delhi', 'Delhi', 'Delhi', '01123456789', 'Rajeev Khanna', '9 AM - 4 PM'),
('SBI002', 'SBI Mumbai West Branch', 'SBIN000002', '400002002', 'Bandra, Mumbai', 'Mumbai', 'Maharashtra', '02245678901', 'Sonal Rane', '9 AM - 4 PM'),
('SBI003', 'SBI Kolkata Branch', 'SBIN000003', '700002003', 'Salt Lake, Kolkata', 'Kolkata', 'West Bengal', '03312345678', 'Rakesh Roy', '9 AM - 4 PM'),
('SBI004', 'SBI Chennai Branch', 'SBIN000004', '600002004', 'T Nagar, Chennai', 'Chennai', 'Tamil Nadu', '04423456789', 'Meena Nair', '9 AM - 4 PM'),
('SBI005', 'SBI Bangalore Branch', 'SBIN000005', '560002005', 'MG Road, Bangalore', 'Bangalore', 'Karnataka', '08034567891', 'Anil Sinha', '9 AM - 4 PM'),
('SBI006', 'SBI Hyderabad Branch', 'SBIN000006', '500002006', 'Banjara Hills, Hyderabad', 'Hyderabad', 'Telangana', '04067891234', 'Preeti Rao', '9 AM - 4 PM'),
('SBI007', 'SBI Ahmedabad Branch', 'SBIN000007', '380002007', 'Navrangpura, Ahmedabad', 'Ahmedabad', 'Gujarat', '07945678912', 'Karan Patel', '9 AM - 4 PM'),
('SBI008', 'SBI Surat Branch', 'SBIN000008', '395002008', 'Ring Road, Surat', 'Surat', 'Gujarat', '02612345678', 'Anjali Desai', '9 AM - 4 PM'),
('SBI009', 'SBI Jaipur Branch', 'SBIN000009', '302002009', 'MI Road, Jaipur', 'Jaipur', 'Rajasthan', '01414567890', 'Ravi Sharma', '9 AM - 4 PM'),
('SBI010', 'SBI Bhopal Branch', 'SBIN000010', '462002010', 'New Market, Bhopal', 'Bhopal', 'Madhya Pradesh', '07552678901', 'Neha Joshi', '9 AM - 4 PM'),
('SBI011', 'SBI Lucknow Branch', 'SBIN000011', '226002011', 'Hazratganj, Lucknow', 'Lucknow', 'Uttar Pradesh', '05221234567', 'Saurabh Pandey', '9 AM - 4 PM'),
('SBI012', 'SBI Kanpur Branch', 'SBIN000012', '208002012', 'Mall Road, Kanpur', 'Kanpur', 'Uttar Pradesh', '05122345678', 'Anita Yadav', '9 AM - 4 PM'),
('SBI013', 'SBI Nagpur Branch', 'SBIN000013', '440002013', 'Sitabuldi, Nagpur', 'Nagpur', 'Maharashtra', '07122456789', 'Manoj Deshmukh', '9 AM - 4 PM'),
('SBI014', 'SBI Amritsar Branch', 'SBIN000014', '143002014', 'GT Road, Amritsar', 'Amritsar', 'Punjab', '01832456789', 'Gurpreet Singh', '9 AM - 4 PM'),
('SBI015', 'SBI Guwahati Branch', 'SBIN000015', '781002015', 'Zoo Road, Guwahati', 'Guwahati', 'Assam', '03612456789', 'Bipin Choudhary', '9 AM - 4 PM'),
('SBI016', 'SBI Indore Branch', 'SBIN000016', '452002016', 'Rajwada, Indore', 'Indore', 'Madhya Pradesh', '07312456789', 'Isha Tripathi', '9 AM - 4 PM'),
('SBI017', 'SBI Kota Branch', 'SBIN000017', '324002017', 'Chambal Road, Kota', 'Kota', 'Rajasthan', '07442456789', 'Deepak Verma', '9 AM - 4 PM'),
('SBI018', 'SBI Raipur Branch', 'SBIN000018', '492002018', 'Pandri, Raipur', 'Raipur', 'Chhattisgarh', '07712456789', 'Shweta Chauhan', '9 AM - 4 PM'),
('SBI019', 'SBI Agra Branch', 'SBIN000019', '282002019', 'Sadar Bazar, Agra', 'Agra', 'Uttar Pradesh', '05622456789', 'Abhay Dixit', '9 AM - 4 PM'),
('SBI020', 'SBI Pune Branch', 'SBIN000020', '411002020', 'Kalyani Nagar, Pune', 'Pune', 'Maharashtra', '02024567890', 'Ajay Pawar', '9 AM - 4 PM');

-- View all branches located in Maharashtra
SELECT * FROM Branches;
-- Remove all records from Branches
TRUNCATE TABLE Branches;
-- Drop the entire Branches table
DROP TABLE Branches;