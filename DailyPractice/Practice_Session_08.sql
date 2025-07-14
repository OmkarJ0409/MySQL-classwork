-- create a database first
create database stock_market;

-- to work on this database, you need to use it first
use stock_market;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : companies(company_id, name, sector, country, ceo, founded_year, listed, market_cap, website, headquarters)
T2  : stocks(stock_id, company_id, symbol, exchange, ipo_date, shares_outstanding, price, dividend_yield, status, updated_on)
T3  : investors(investor_id, full_name, gender, dob, email, phone, pan_number, kyc_status, joined_on, status)
T4  : portfolios(portfolio_id, investor_id, total_investment, total_returns, risk_profile, created_on, last_updated, status, advisor_assigned, remarks)
T5  : users(user_id, full_name, email, phone, gender, dob, kyc_status, joined_on, occupation, status)
T6  : trades(trade_id, user_id, stock_id, trade_type, quantity, trade_date, price, fees, status, remarks)
T7  : brokers(broker_id, name, license_number, registered_on, headquarters, total_clients, active_status, brokerage_fee, contact_email, rating)
T8  : dividends(dividend_id, company_id, declared_on, record_date, payment_date, amount_per_share, type, status, remarks, financial_year)
T9  : indices(index_id, name, exchange_id, base_value, current_value, created_on, updated_on, status, constituents, remarks)
T10 : news_feed(news_id, headline, published_on, source, related_stock_id, category, sentiment, summary, url, status)
*/

-- Table-1 Companies --------------------------------------------------------------------------------------------------------
create table companies (
company_id int primary key,
name varchar(100),
sector varchar(50),
country varchar(50),
ceo varchar(100),
founded_year int,
listed varchar(10),
market_cap bigint,
website varchar(100),
headquarters varchar(100)
);

insert into companies values
(1, 'Tata Consultancy Services', 'IT Services', 'India', 'Rajesh Gopinathan', 1968, 'Yes', 120000000000, 'www.tcs.com', 'Mumbai'),
(2, 'Reliance Industries', 'Conglomerate', 'India', 'Mukesh Ambani', 1960, 'Yes', 230000000000, 'www.ril.com', 'Mumbai'),
(3, 'Infosys', 'IT Services', 'India', 'Salil Parekh', 1981, 'Yes', 70000000000, 'www.infosys.com', 'Bangalore'),
(4, 'Amazon', 'E-commerce', 'USA', 'Andy Jassy', 1994, 'Yes', 1700000000000, 'www.amazon.com', 'Seattle'),
(5, 'Tesla', 'Automobile', 'USA', 'Elon Musk', 2003, 'Yes', 800000000000, 'www.tesla.com', 'Palo Alto'),
(6, 'Wipro', 'IT Services', 'India', 'Thierry Delaporte', 1945, 'Yes', 35000000000, 'www.wipro.com', 'Bangalore'),
(7, 'Google', 'Technology', 'USA', 'Sundar Pichai', 1998, 'Yes', 1800000000000, 'www.abc.xyz', 'Mountain View'),
(8, 'HDFC Bank', 'Banking', 'India', 'Sashidhar Jagdishan', 1994, 'Yes', 120000000000, 'www.hdfcbank.com', 'Mumbai'),
(9, 'ICICI Bank', 'Banking', 'India', 'Sandeep Bakhshi', 1994, 'Yes', 90000000000, 'www.icicibank.com', 'Mumbai'),
(10, 'Apple Inc.', 'Technology', 'USA', 'Tim Cook', 1976, 'Yes', 2900000000000, 'www.apple.com', 'Cupertino');

-- to display table data
select * from companies;
-- to remove complete records from table
truncate table companies;
-- to remove complete records and attributes from table
drop table companies;


-- Table-2 Stocks -----------------------------------------------------------------------------------------------------------
create table stocks (
stock_id int primary key,
company_id int,
symbol varchar(10),
exchange varchar(50),
ipo_date date,
shares_outstanding bigint,
price decimal(10,2),
dividend_yield decimal(5,2),
status varchar(20),
updated_on date,
foreign key (company_id) references companies(company_id)
);

insert into stocks values
(1, 1, 'TCS', 'NSE', '2004-08-25', 3800000000, 3725.60, 1.50, 'Active', '2025-07-11'),
(2, 2, 'RELIANCE', 'BSE', '1977-01-08', 6760000000, 2850.45, 0.90, 'Active', '2025-07-11'),
(3, 3, 'INFY', 'NSE', '1993-06-14', 4300000000, 1540.20, 2.10, 'Active', '2025-07-11'),
(4, 4, 'AMZN', 'NASDAQ', '1997-05-15', 10200000000, 145.50, 0.00, 'Active', '2025-07-11'),
(5, 5, 'TSLA', 'NASDAQ', '2010-06-29', 3200000000, 265.10, 0.00, 'Active', '2025-07-11'),
(6, 6, 'WIPRO', 'BSE', '1946-01-01', 5480000000, 440.85, 1.80, 'Active', '2025-07-11'),
(7, 7, 'GOOGL', 'NASDAQ', '2004-08-19', 13200000000, 2745.75, 0.00, 'Active', '2025-07-11'),
(8, 8, 'HDFCBANK', 'NSE', '1995-05-19', 5550000000, 1610.90, 1.25, 'Active', '2025-07-11'),
(9, 9, 'ICICIBANK', 'BSE', '1998-09-22', 6500000000, 980.30, 1.10, 'Active', '2025-07-11'),
(10, 10, 'AAPL', 'NASDAQ', '1980-12-12', 15900000000, 212.50, 0.60, 'Active', '2025-07-11');

-- to display table data
select * from stocks;
-- to remove complete records from table
truncate table stocks;
-- to remove complete records and attributes from table
drop table stocks;


-- Table-3 Investors --------------------------------------------------------------------------------------------------------
create table investors (
investor_id int primary key,
full_name varchar(100),
gender varchar(10),
dob date,
email varchar(100),
phone varchar(20),
pan_number varchar(15),
kyc_status varchar(20),
joined_on date,
status varchar(20)
);

insert into investors values
(1, 'Rahul Mehta', 'Male', '1985-04-10', 'rahul.m@gmail.com', '9876543210', 'ABCDE1234F', 'Verified', '2020-05-15', 'Active'),
(2, 'Anjali Sharma', 'Female', '1990-07-25', 'anjali.s@gmail.com', '9823456789', 'BCDEF2345G', 'Verified', '2019-08-20', 'Active'),
(3, 'Neeraj Nair', 'Male', '1988-11-05', 'neeraj.n@yahoo.com', '9765432108', 'CDEFG3456H', 'Pending', '2021-01-10', 'Inactive'),
(4, 'Priya Joshi', 'Female', '1992-02-18', 'priya.j@outlook.com', '9756432180', 'DEFGH4567I', 'Verified', '2022-03-30', 'Active'),
(5, 'Amit Kumar', 'Male', '1980-09-12', 'amit.k@gmail.com', '9745123467', 'EFGHI5678J', 'Verified', '2018-06-01', 'Active'),
(6, 'Sneha Kapoor', 'Female', '1995-06-22', 'sneha.k@gmail.com', '9898765432', 'FGHIJ6789K', 'Verified', '2023-01-15', 'Active'),
(7, 'Rohan Desai', 'Male', '1993-12-30', 'rohan.d@gmail.com', '9834567810', 'GHIJK7890L', 'Pending', '2021-11-22', 'Inactive'),
(8, 'Kavita Rao', 'Female', '1986-05-14', 'kavita.r@gmail.com', '9786543210', 'HIJKL8901M', 'Verified', '2020-02-10', 'Active'),
(9, 'Manish Patel', 'Male', '1982-10-03', 'manish.p@gmail.com', '9797654321', 'IJKLM9012N', 'Verified', '2017-12-05', 'Active'),
(10, 'Pooja Verma', 'Female', '1991-08-19', 'pooja.v@gmail.com', '9775432109', 'JKLMN0123O', 'Pending', '2024-01-20', 'Active');

-- to display table data
select * from investors;
-- to remove complete records from table
truncate table investors;
-- to remove complete records and attributes from table
drop table investors;


-- Table-4 Portfolios -------------------------------------------------------------------------------------------------------
create table portfolios (
portfolio_id int primary key,
investor_id int,
total_investment decimal(15,2),
total_returns decimal(15,2),
risk_profile varchar(30),
created_on date,
last_updated date,
status varchar(20),
advisor_assigned varchar(100),
remarks text,
foreign key (investor_id) references investors(investor_id)
);

insert into portfolios values
(1, 1, 500000.00, 650000.00, 'Moderate', '2020-06-01', '2024-07-01', 'Active', 'Ritika Jain', 'Diversified across large-caps'),
(2, 2, 300000.00, 380000.00, 'Low', '2019-09-01', '2024-06-15', 'Active', 'Nilesh Mehra', 'Mostly fixed income instruments'),
(3, 3, 200000.00, 180000.00, 'High', '2021-02-01', '2024-06-01', 'Inactive', 'Karan Shah', 'Focused on tech stocks'),
(4, 4, 450000.00, 500000.00, 'Moderate', '2022-04-05', '2024-07-01', 'Active', 'Ritika Jain', 'Balanced strategy'),
(5, 5, 1000000.00, 1400000.00, 'Low', '2018-07-10', '2024-05-10', 'Active', 'Nilesh Mehra', 'High dividend stocks'),
(6, 6, 250000.00, 270000.00, 'Moderate', '2023-02-20', '2024-07-01', 'Active', 'Ritika Jain', 'Emerging markets exposure'),
(7, 7, 150000.00, 130000.00, 'High', '2021-12-05', '2024-04-15', 'Inactive', 'Karan Shah', 'Crypto and speculative stocks'),
(8, 8, 600000.00, 720000.00, 'Moderate', '2020-03-15', '2024-06-25', 'Active', 'Ritika Jain', 'Mid-cap focused'),
(9, 9, 800000.00, 1000000.00, 'Low', '2017-12-20', '2024-06-05', 'Active', 'Nilesh Mehra', 'Blue-chip only'),
(10, 10, 100000.00, 125000.00, 'High', '2024-02-10', '2024-07-01', 'Active', 'Karan Shah', 'Startups and IPO focus');

-- to display table data
select * from portfolios;
-- to remove complete records from table
truncate table portfolios;
-- to remove complete records and attributes from table
drop table portfolios;


-- Table-6 Users ------------------------------------------------------------------------------------------------------------
create table users (
user_id int primary key,
full_name varchar(100),
email varchar(100),
phone varchar(20),
gender varchar(10),
dob date,
kyc_status varchar(20),
joined_on date,
occupation varchar(50),
status varchar(20)
);

insert into users values
(1, 'Rahul Mehta', 'rahul.m@gmail.com', '9876543210', 'Male', '1985-04-10', 'Verified', '2020-05-15', 'Engineer', 'Active'),
(2, 'Anjali Sharma', 'anjali.s@gmail.com', '9823456789', 'Female', '1990-07-25', 'Verified', '2019-08-20', 'Doctor', 'Active'),
(3, 'Neeraj Nair', 'neeraj.n@yahoo.com', '9765432108', 'Male', '1988-11-05', 'Pending', '2021-01-10', 'Entrepreneur', 'Inactive'),
(4, 'Priya Joshi', 'priya.j@outlook.com', '9756432180', 'Female', '1992-02-18', 'Verified', '2022-03-30', 'Banker', 'Active'),
(5, 'Amit Kumar', 'amit.k@gmail.com', '9745123467', 'Male', '1980-09-12', 'Verified', '2018-06-01', 'Teacher', 'Active'),
(6, 'Sneha Kapoor', 'sneha.k@gmail.com', '9898765432', 'Female', '1995-06-22', 'Verified', '2023-01-15', 'Consultant', 'Active'),
(7, 'Rohan Desai', 'rohan.d@gmail.com', '9834567810', 'Male', '1993-12-30', 'Pending', '2021-11-22', 'Student', 'Inactive'),
(8, 'Kavita Rao', 'kavita.r@gmail.com', '9786543210', 'Female', '1986-05-14', 'Verified', '2020-02-10', 'Accountant', 'Active'),
(9, 'Manish Patel', 'manish.p@gmail.com', '9797654321', 'Male', '1982-10-03', 'Verified', '2017-12-05', 'Lawyer', 'Active'),
(10, 'Pooja Verma', 'pooja.v@gmail.com', '9775432109', 'Female', '1991-08-19', 'Pending', '2024-01-20', 'Designer', 'Active');

-- to display table data
select * from users;
-- to remove complete records from table
truncate table users;
-- to remove complete records and attributes from table
drop table users;


-- Table-6 Trades -----------------------------------------------------------------------------------------------------------
create table trades (
trade_id int primary key,
user_id int,
stock_id int,
trade_type varchar(10), -- Buy/Sell
quantity int,
trade_date datetime,
price decimal(10,2),
fees decimal(8,2),
status varchar(20),
remarks text,
foreign key (user_id) references users(user_id),
foreign key (stock_id) references stocks(stock_id)
);

insert into trades values
(1, 1, 1, 'Buy', 10, '2024-01-10 10:00:00', 1500.00, 15.00, 'Completed', 'Initial investment'),
(2, 2, 2, 'Sell', 5, '2024-01-11 11:30:00', 860.00, 8.60, 'Completed', 'Profit booking'),
(3, 3, 3, 'Buy', 20, '2024-01-12 09:45:00', 625.00, 12.50, 'Completed', 'Mid-cap growth'),
(4, 4, 4, 'Buy', 15, '2024-01-13 10:15:00', 1195.00, 17.93, 'Completed', 'Sectoral bet'),
(5, 5, 5, 'Sell', 12, '2024-01-14 14:20:00', 990.00, 11.88, 'Completed', 'Partial exit'),
(6, 6, 6, 'Buy', 25, '2024-01-15 13:10:00', 415.00, 10.38, 'Completed', 'Retail entry'),
(7, 7, 7, 'Buy', 8, '2024-01-16 11:50:00', 1745.00, 13.96, 'Completed', 'Tech stock'),
(8, 8, 8, 'Sell', 6, '2024-01-17 12:05:00', 745.00, 8.94, 'Completed', 'Quick gain'),
(9, 9, 9, 'Buy', 14, '2024-01-18 10:30:00', 905.00, 12.67, 'Completed', 'Healthcare portfolio'),
(10, 10, 10, 'Buy', 18, '2024-01-19 15:00:00', 1095.00, 19.71, 'Completed', 'Long-term hold');

-- to display table data
select * from trades;
-- to remove complete records from table
truncate table trades;
-- to remove complete records and attributes from table
drop table trades;


-- Table-7 Brokers ----------------------------------------------------------------------------------------------------------
create table brokers (
broker_id int primary key,
name varchar(100),
license_number varchar(50),
registered_on date,
headquarters varchar(100),
total_clients int,
active_status varchar(20),
brokerage_fee decimal(5,2),
contact_email varchar(100),
rating decimal(3,2)
);

insert into brokers values
(1, 'Zerodha', 'LIC2020Z1', '2010-08-01', 'Bangalore', 5000000, 'Active', 0.03, 'support@zerodha.com', 4.8),
(2, 'Upstox', 'LIC2020U2', '2012-05-10', 'Mumbai', 3500000, 'Active', 0.05, 'help@upstox.com', 4.5),
(3, 'Angel One', 'LIC2019A3', '2006-02-18', 'Mumbai', 4200000, 'Active', 0.04, 'contact@angelone.in', 4.4),
(4, 'ICICI Direct', 'LIC2010I4', '2000-11-25', 'Mumbai', 3000000, 'Active', 0.25, 'customercare@icicidirect.com', 4.2),
(5, 'Groww', 'LIC2021G5', '2017-06-13', 'Bangalore', 4800000, 'Active', 0.05, 'support@groww.in', 4.6),
(6, 'HDFC Securities', 'LIC2008H6', '2000-03-07', 'Mumbai', 3100000, 'Active', 0.20, 'support@hdfcsec.com', 4.3),
(7, 'Sharekhan', 'LIC2005S7', '1999-01-15', 'Mumbai', 2200000, 'Active', 0.50, 'info@sharekhan.com', 4.0),
(8, 'Motilal Oswal', 'LIC2010M8', '2001-09-23', 'Mumbai', 2600000, 'Active', 0.30, 'helpdesk@motilaloswal.com', 4.1),
(9, '5Paisa', 'LIC2017F9', '2016-12-09', 'Mumbai', 1900000, 'Active', 0.10, 'support@5paisa.com', 4.4),
(10, 'Axis Direct', 'LIC2009A10', '2005-07-04', 'Mumbai', 2100000, 'Active', 0.15, 'support@axisdirect.in', 4.2);

-- to display table data
select * from brokers;
-- to remove complete records from table
truncate table brokers;
-- to remove complete records and attributes from table
drop table brokers;


-- Table-8 Dividends --------------------------------------------------------------------------------------------------------
create table dividends (
dividend_id int primary key,
company_id int,
declared_on date,
record_date date,
payment_date date,
amount_per_share decimal(6,2),
type varchar(30),
status varchar(20),
remarks text,
financial_year varchar(9)
);

insert into dividends values
(1, 1, '2024-05-10', '2024-05-25', '2024-06-01', 12.50, 'Final', 'Paid', 'Good earnings year', '2023-24'),
(2, 2, '2024-03-15', '2024-03-31', '2024-04-07', 8.75, 'Interim', 'Paid', 'Interim performance payout', '2023-24'),
(3, 3, '2023-12-01', '2023-12-15', '2023-12-22', 15.00, 'Final', 'Paid', 'Annual dividend', '2022-23'),
(4, 4, '2024-06-20', '2024-07-01', '2024-07-08', 10.00, 'Final', 'Pending', 'Pending shareholder approval', '2023-24'),
(5, 5, '2023-11-10', '2023-11-25', '2023-12-01', 6.00, 'Interim', 'Paid', 'Mid-year bonus', '2023-24'),
(6, 6, '2024-01-10', '2024-01-25', '2024-02-01', 4.50, 'Special', 'Paid', 'Special one-time payout', '2023-24'),
(7, 7, '2023-09-20', '2023-10-01', '2023-10-08', 3.25, 'Final', 'Paid', 'Low profit margin', '2022-23'),
(8, 8, '2024-02-15', '2024-02-28', '2024-03-07', 9.80, 'Final', 'Paid', 'Strong quarterly performance', '2023-24'),
(9, 9, '2024-04-01', '2024-04-15', '2024-04-22', 7.50, 'Interim', 'Paid', 'Consistent EPS growth', '2023-24'),
(10, 10, '2024-05-05', '2024-05-20', '2024-05-27', 11.00, 'Final', 'Paid', 'Steady cash flow', '2023-24');

-- to display table data
select * from dividends;
-- to remove complete records from table
truncate table dividends;
-- to remove complete records and attributes from table
drop table dividends;


-- Table-9 Indices ----------------------------------------------------------------------------------------------------------
create table indices (
index_id int primary key,
name varchar(100),
exchange_id int,
base_value decimal(10,2),
current_value decimal(10,2),
created_on date,
updated_on date,
status varchar(20),
constituents int,
remarks text
);

insert into indices values
(1, 'Nifty 50', 1, 1000.00, 18500.75, '1996-01-01', '2025-07-10', 'Active', 50, 'Major Indian large-cap index'),
(2, 'Sensex', 1, 100.00, 62500.45, '1979-04-01', '2025-07-10', 'Active', 30, 'Top 30 BSE companies'),
(3, 'Nasdaq 100', 2, 1000.00, 15300.25, '1985-01-01', '2025-07-10', 'Active', 100, 'Tech-heavy US index'),
(4, 'S&P 500', 2, 100.00, 4700.65, '1957-03-04', '2025-07-10', 'Active', 500, 'US broad-market index'),
(5, 'FTSE 100', 4, 1000.00, 7700.55, '1984-01-03', '2025-07-10', 'Active', 100, 'UK stock market index'),
(6, 'Hang Seng', 5, 1000.00, 21000.20, '1969-11-24', '2025-07-10', 'Active', 50, 'Hong Kong major index'),
(7, 'Nifty Next 50', 1, 1000.00, 4400.10, '2002-01-01', '2025-07-10', 'Active', 50, 'Next 50 after Nifty 50'),
(8, 'Russell 2000', 2, 100.00, 1950.35, '1984-01-01', '2025-07-10', 'Active', 2000, 'US small-cap index'),
(9, 'Dow Jones', 2, 100.00, 38000.50, '1896-05-26', '2025-07-10', 'Active', 30, 'Oldest US index'),
(10, 'Nifty IT', 1, 1000.00, 32000.80, '1996-01-01', '2025-07-10', 'Active', 10, 'Top IT sector companies');

-- to display table data
select * from indices;
-- to remove complete records from table
truncate table indices;
-- to remove complete records and attributes from table
drop table indices;


-- Table-10 News_feed -------------------------------------------------------------------------------------------------------
create table news_feed (
news_id int primary key,
headline varchar(255),
published_on date,
source varchar(100),
related_stock_id int,
category varchar(50),
sentiment varchar(20),
summary text,
url text,
status varchar(20),
foreign key (related_stock_id) references stocks(stock_id)
);

insert into news_feed values
(1, 'Reliance Industries posts 25% rise in quarterly profit', '2025-07-09', 'Reuters', 1, 'Earnings', 'Positive', 'Strong earnings driven by retail and Jio segments.', 'https://reuters.com/reliance-profit', 'Published'),
(2, 'Infosys shares dip 3% amid revenue forecast cut', '2025-07-08', 'Bloomberg', 2, 'Forecast', 'Negative', 'Company revises revenue guidance lower for FY2025.', 'https://bloomberg.com/infosys-forecast', 'Published'),
(3, 'Tata Motors unveils electric SUV', '2025-07-07', 'Economic Times', 3, 'Product Launch', 'Positive', 'New EV model expected to boost sales in Q3.', 'https://economictimes.com/tata-ev', 'Published'),
(4, 'HDFC Bank faces tech outage, services disrupted', '2025-07-06', 'Times of India', 4, 'Operations', 'Negative', 'Online banking down for several hours.', 'https://timesofindia.com/hdfc-outage', 'Published'),
(5, 'Wipro announces $500 million buyback', '2025-07-05', 'Moneycontrol', 5, 'Corporate Action', 'Neutral', 'Buyback to enhance shareholder value.', 'https://moneycontrol.com/wipro-buyback', 'Published'),
(6, 'Asian Paints gains on Q1 revenue growth', '2025-07-04', 'CNBC TV18', 6, 'Earnings', 'Positive', 'Strong domestic demand boosts revenue.', 'https://cnbctv18.com/asianpaints-q1', 'Published'),
(7, 'SBI hit with regulatory fine over compliance issue', '2025-07-03', 'Livemint', 7, 'Regulatory', 'Negative', 'Bank fined ₹10 crore for KYC violations.', 'https://livemint.com/sbi-fine', 'Published'),
(8, 'ITC to demerge hotel business', '2025-07-02', 'ET Now', 8, 'Restructuring', 'Neutral', 'Move aims to unlock value in hospitality.', 'https://etnownews.com/itc-demerger', 'Published'),
(9, 'Bharti Airtel to expand 5G rollout by year-end', '2025-07-01', 'Business Standard', 9, 'Expansion', 'Positive', 'Focus on tier-2 and tier-3 cities.', 'https://business-standard.com/airtel-5g', 'Published'),
(10, 'L&T secures ₹7,000 crore infrastructure contract', '2025-06-30', 'NDTV Profit', 10, 'Deal', 'Positive', 'New order to support Q2 topline growth.', 'https://ndtv.com/lt-contract', 'Published');

-- to display table data
select * from news_feed;
-- to remove complete records from table
truncate table news_feed;
-- to remove complete records and attributes from table
drop table news_feed;