-- create a database first
create database cryptocurrency;

-- to work on this database, you need to use it first
use cryptocurrency;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : users(user_id, full_name, email, phone, country, kyc_status, join_date, wallet_id, user_type, status)
T2  : wallets(wallet_id, user_id, balance_usd, wallet_type, created_on, last_used, is_active, backup_enabled, security_level, remarks)
T3  : coins(coin_id, name, symbol, launch_year, market_cap, supply, consensus, founder, website, status)
T4  : transactions(txn_id, wallet_id, coin_id, txn_type, txn_date, amount, price_usd, fee, status, remarks)
T5  : exchanges(exchange_id, name, country, established_year, regulation_status, volume_24h, website, active_users, status, rating)
T6  : listings(listing_id, coin_id, exchange_id, listed_on, price_usd, volume, pairs_available, status, updated_on, remarks)
T7  : miners(miner_id, full_name, country, hash_rate, mining_pool, coins_mined, rewards_usd, join_date, status, email)
T8  : mining_pools(pool_id, name, created_on, total_hash_rate, members, payout_method, status, pool_fee, supported_coins, website)
T9  : alerts(alert_id, user_id, coin_id, condition, target_price, triggered, created_on, expiry_date, status, remarks)
T10 : support_tickets(ticket_id, user_id, created_on, issue_type, priority, description, status, assigned_to, resolved_on, remarks)
*/

-- Table-1 users ------------------------------------------------------------------------------------------------------------
create table users (
user_id int primary key,
full_name varchar(100),
email varchar(100),
phone varchar(20),
country varchar(50),
kyc_status varchar(20),
join_date date,
wallet_id int,
user_type varchar(30),
status varchar(20)
);

insert into users values
(1, 'Alice Johnson', 'alice.j@example.com', '9876543210', 'USA', 'Verified', '2021-01-15', 101, 'Retail', 'Active'),
(2, 'Bob Smith', 'bob.smith@example.com', '9876543211', 'UK', 'Pending', '2021-03-10', 102, 'Retail', 'Active'),
(3, 'Charlie Green', 'charlie.g@example.com', '9876543212', 'India', 'Verified', '2021-06-20', 103, 'Retail', 'Inactive'),
(4, 'Diana Prince', 'diana.p@example.com', '9876543213', 'Germany', 'Verified', '2021-08-05', 104, 'Institutional', 'Active'),
(5, 'Evan Wright', 'evan.w@example.com', '9876543214', 'Japan', 'Verified', '2022-01-11', 105, 'Retail', 'Active'),
(6, 'Fiona Zhao', 'fiona.z@example.com', '9876543215', 'China', 'Pending', '2022-03-25', 106, 'Retail', 'Inactive'),
(7, 'George Kim', 'george.k@example.com', '9876543216', 'South Korea', 'Verified', '2022-06-15', 107, 'Retail', 'Active'),
(8, 'Hannah Singh', 'hannah.s@example.com', '9876543217', 'India', 'Verified', '2022-09-01', 108, 'Retail', 'Active'),
(9, 'Ivan Petro', 'ivan.p@example.com', '9876543218', 'Russia', 'Verified', '2023-01-10', 109, 'Institutional', 'Active'),
(10, 'Julia Marks', 'julia.m@example.com', '9876543219', 'USA', 'Pending', '2023-05-20', 110, 'Retail', 'Inactive');

-- to display table data
select * from users;
-- to remove complete records from table
truncate table users;
-- to remove complete records and attributes from table
drop table users;


-- Table-2 wallets -----------------------------------------------------------------------------------------------------------
create table wallets (
wallet_id int primary key,
user_id int,
balance_usd decimal(18,2),
wallet_type varchar(30),
created_on date,
last_used date,
is_active boolean,
backup_enabled boolean,
security_level varchar(30),
remarks text,
foreign key (user_id) references users(user_id)
);

insert into wallets values
(101, 1, 15230.45, 'Hot', '2021-01-15', '2023-07-10', true, true, 'High', ''),
(102, 2, 1030.00, 'Cold', '2021-03-10', '2022-11-20', true, false, 'Medium', ''),
(103, 3, 0.00, 'Hot', '2021-06-20', '2022-01-01', false, false, 'Low', 'Dormant wallet'),
(104, 4, 200000.00, 'Institutional', '2021-08-05', '2023-08-20', true, true, 'Very High', ''),
(105, 5, 5023.10, 'Hot', '2022-01-11', '2023-06-10', true, false, 'High', ''),
(106, 6, 420.55, 'Hot', '2022-03-25', '2022-12-30', false, false, 'Low', 'Access revoked'),
(107, 7, 7850.75, 'Cold', '2022-06-15', '2023-05-15', true, true, 'Medium', ''),
(108, 8, 1580.25, 'Hot', '2022-09-01', '2023-06-25', true, false, 'High', ''),
(109, 9, 350000.00, 'Institutional', '2023-01-10', '2023-07-05', true, true, 'Very High', ''),
(110, 10, 0.00, 'Hot', '2023-05-20', '2023-06-01', false, false, 'Low', 'Suspended due to KYC');

-- to display table data
select * from wallets;
-- to remove complete records from table
truncate table wallets;
-- to remove complete records and attributes from table
drop table wallets;


-- Table-3 coins -------------------------------------------------------------------------------------------------------------
create table coins (
coin_id int primary key,
name varchar(50),
symbol varchar(10),
launch_year int,
market_cap bigint,
supply bigint,
consensus varchar(30),
founder varchar(100),
website varchar(100),
status varchar(20)
);

insert into coins values
(1, 'Bitcoin', 'BTC', 2009, 850000000000, 21000000, 'PoW', 'Satoshi Nakamoto', 'https://bitcoin.org', 'Active'),
(2, 'Ethereum', 'ETH', 2015, 400000000000, 120000000, 'PoS', 'Vitalik Buterin', 'https://ethereum.org', 'Active'),
(3, 'Binance Coin', 'BNB', 2017, 70000000000, 170000000, 'PoSA', 'Changpeng Zhao', 'https://binance.com', 'Active'),
(4, 'Cardano', 'ADA', 2017, 50000000000, 45000000000, 'PoS', 'Charles Hoskinson', 'https://cardano.org', 'Active'),
(5, 'Dogecoin', 'DOGE', 2013, 15000000000, 132000000000, 'PoW', 'Billy Markus', 'https://dogecoin.com', 'Active'),
(6, 'Ripple', 'XRP', 2012, 30000000000, 100000000000, 'Consensus', 'Chris Larsen', 'https://ripple.com', 'Active'),
(7, 'Polkadot', 'DOT', 2020, 18000000000, 1000000000, 'PoS', 'Gavin Wood', 'https://polkadot.network', 'Active'),
(8, 'Solana', 'SOL', 2020, 25000000000, 500000000, 'PoH', 'Anatoly Yakovenko', 'https://solana.com', 'Active'),
(9, 'Litecoin', 'LTC', 2011, 10000000000, 84000000, 'PoW', 'Charlie Lee', 'https://litecoin.org', 'Active'),
(10, 'Shiba Inu', 'SHIB', 2020, 8000000000, 1000000000000, 'ERC-20', 'Ryoshi', 'https://shibatoken.com', 'Active');

-- to display table data
select * from coins;
-- to remove complete records from table
truncate table coins;
-- to remove complete records and attributes from table
drop table coins;


-- Table-4 transactions ----------------------------------------------------------------------------------------------------
create table transactions (
txn_id int primary key,
wallet_id int,
coin_id int,
txn_type varchar(20),
txn_date date,
amount float,
price_usd float,
fee float,
status varchar(20),
remarks text,
foreign key (coin_id) references coins(coin_id)
);

insert into transactions values
(1, 1, 1, 'Buy', '2024-01-10', 0.5, 30000, 10, 'Completed', 'Initial investment'),
(2, 2, 2, 'Sell', '2024-01-15', 2.0, 2500, 5, 'Completed', 'Profit booking'),
(3, 3, 3, 'Buy', '2024-02-01', 1000, 1.5, 1, 'Completed', 'New project support'),
(4, 4, 4, 'Buy', '2024-02-10', 200, 150, 2, 'Completed', 'Speculative purchase'),
(5, 5, 5, 'Sell', '2024-02-15', 500, 2.5, 1.5, 'Completed', 'Short-term gain'),
(6, 6, 6, 'Buy', '2024-03-01', 3000, 0.1, 0.3, 'Completed', 'Long-term holding'),
(7, 7, 7, 'Sell', '2024-03-05', 10, 400, 0.5, 'Completed', 'Profit realized'),
(8, 8, 8, 'Buy', '2024-03-10', 100, 50, 1, 'Completed', 'Community token buy'),
(9, 9, 9, 'Sell', '2024-03-20', 1, 2000, 0.2, 'Completed', 'Portfolio rebalance'),
(10, 10, 10, 'Buy', '2024-03-25', 5, 500, 0.5, 'Completed', 'Token diversification');

-- to display table data
select * from transactions;
-- to remove complete records from table
truncate table transactions;
-- to remove complete records and attributes from table
drop table transactions;


-- Table-5 exchanges --------------------------------------------------------------------------------------------------------
create table exchanges (
exchange_id int primary key,
name varchar(100),
country varchar(50),
established_year int,
regulation_status varchar(50),
volume_24h float,
website varchar(100),
active_users int,
status varchar(20),
rating float
);

insert into exchanges values
(1, 'Binance', 'Cayman Islands', 2017, 'Regulated', 32000000000, 'https://www.binance.com', 20000000, 'Active', 4.8),
(2, 'Coinbase', 'USA', 2012, 'Regulated', 5000000000, 'https://www.coinbase.com', 10000000, 'Active', 4.5),
(3, 'Kraken', 'USA', 2011, 'Regulated', 2000000000, 'https://www.kraken.com', 8000000, 'Active', 4.3),
(4, 'KuCoin', 'Seychelles', 2017, 'Unregulated', 1800000000, 'https://www.kucoin.com', 7000000, 'Active', 4.2),
(5, 'Bitfinex', 'British Virgin Islands', 2012, 'Unregulated', 1500000000, 'https://www.bitfinex.com', 4000000, 'Active', 4.1),
(6, 'Huobi', 'Seychelles', 2013, 'Unregulated', 1300000000, 'https://www.huobi.com', 5000000, 'Active', 4.0),
(7, 'OKX', 'Malta', 2017, 'Unregulated', 1700000000, 'https://www.okx.com', 6000000, 'Active', 4.2),
(8, 'Bitstamp', 'Luxembourg', 2011, 'Regulated', 800000000, 'https://www.bitstamp.net', 2000000, 'Active', 4.0),
(9, 'Gemini', 'USA', 2014, 'Regulated', 600000000, 'https://www.gemini.com', 3000000, 'Active', 4.1),
(10, 'Gate.io', 'Cayman Islands', 2013, 'Unregulated', 1000000000, 'https://www.gate.io', 3500000, 'Active', 4.0);

-- to display table data
select * from exchanges;
-- to remove complete records from table
truncate table exchanges;
-- to remove complete records and attributes from table
drop table exchanges;


-- Table-6 listings -----------------------------------------------------------------------------------------------------------
create table listings (
listing_id int primary key,
coin_id int,
exchange_id int,
listed_on date,
price_usd float,
volume float,
pairs_available int,
status varchar(20),
updated_on date,
remarks text,
foreign key (coin_id) references coins(coin_id),
foreign key (exchange_id) references exchanges(exchange_id)
);

insert into listings values
(1, 1, 1, '2021-01-10', 30000, 5000000, 120, 'Active', '2024-06-01', 'High liquidity'),
(2, 2, 2, '2020-05-15', 2500, 2000000, 80, 'Active', '2024-06-01', 'Stable market'),
(3, 3, 3, '2022-03-01', 1.5, 10000000, 150, 'Active', '2024-06-01', 'Emerging token'),
(4, 4, 4, '2021-07-20', 150, 3000000, 95, 'Active', '2024-06-01', 'Strong project backing'),
(5, 5, 5, '2021-09-10', 2.5, 2500000, 70, 'Active', '2024-06-01', 'Low volatility'),
(6, 6, 6, '2020-11-30', 0.1, 8000000, 60, 'Active', '2024-06-01', 'Popular in DeFi'),
(7, 7, 7, '2023-01-25', 400, 1000000, 40, 'Active', '2024-06-01', 'NFT-related'),
(8, 8, 8, '2022-06-05', 50, 1200000, 50, 'Active', '2024-06-01', 'Community-driven'),
(9, 9, 9, '2021-04-12', 2000, 1500000, 65, 'Active', '2024-06-01', 'Institutional interest'),
(10, 10, 10, '2023-08-01', 500, 900000, 30, 'Active', '2024-06-01', 'Utility token');

-- to display table data
select * from listings;
-- to remove complete records from table
truncate table listings;
-- to remove complete records and attributes from table
drop table listings;


-- Table-7 miners -----------------------------------------------------------------------------------------------------------
create table miners (
miner_id int primary key,
full_name varchar(100),
country varchar(50),
hash_rate float,
mining_pool varchar(100),
coins_mined int,
rewards_usd float,
join_date date,
status varchar(20),
email varchar(100)
);

insert into miners values
(1, 'Alice Johnson', 'USA', 120.5, 'Pool A', 50, 15000, '2021-01-10', 'Active', 'alice@crypto.com'),
(2, 'Bob Lee', 'Canada', 95.3, 'Pool B', 40, 12000, '2021-03-22', 'Active', 'bob@crypto.com'),
(3, 'Carlos Wang', 'China', 140.8, 'Pool C', 70, 20000, '2020-11-05', 'Active', 'carlos@crypto.com'),
(4, 'Diana Smith', 'UK', 110.2, 'Pool A', 45, 13500, '2021-06-18', 'Active', 'diana@crypto.com'),
(5, 'Ethan Brown', 'Australia', 100.7, 'Pool B', 55, 16000, '2022-02-14', 'Active', 'ethan@crypto.com'),
(6, 'Fiona Davis', 'Germany', 90.5, 'Pool C', 48, 14500, '2021-08-30', 'Active', 'fiona@crypto.com'),
(7, 'George Patel', 'India', 105.1, 'Pool A', 52, 15500, '2022-04-20', 'Active', 'george@crypto.com'),
(8, 'Hannah Kim', 'South Korea', 98.4, 'Pool B', 43, 13800, '2020-12-01', 'Active', 'hannah@crypto.com'),
(9, 'Ivan Novak', 'Russia', 130.6, 'Pool C', 60, 17000, '2022-06-10', 'Active', 'ivan@crypto.com'),
(10, 'Julia Lin', 'Singapore', 115.3, 'Pool A', 49, 14900, '2021-09-15', 'Active', 'julia@crypto.com');

-- to display table data
select * from miners;
-- to remove complete records from table
truncate table miners;
-- to remove complete records and attributes from table
drop table miners;


-- Table-8 mining_pools -----------------------------------------------------------------------------------------------------
create table mining_pools (
pool_id int primary key,
name varchar(100),
created_on date,
total_hash_rate float,
members int,
payout_method varchar(50),
status varchar(20),
pool_fee float,
supported_coins varchar(200),
website varchar(100)
);

insert into mining_pools values
(1, 'AntPool', '2013-01-01', 350000.5, 12000, 'PPS', 'Active', 1.5, 'Bitcoin,Bitcoin Cash', 'https://www.antpool.com'),
(2, 'F2Pool', '2013-05-05', 420000.2, 15000, 'PPLNS', 'Active', 2.0, 'Ethereum,Litecoin,Dogecoin', 'https://www.f2pool.com'),
(3, 'SlushPool', '2010-12-27', 180000.0, 8000, 'PPLNS', 'Active', 2.5, 'Bitcoin,Zcash', 'https://slushpool.com'),
(4, 'BTC.com', '2016-04-18', 290000.8, 11000, 'FPPS', 'Active', 1.0, 'Bitcoin', 'https://btc.com'),
(5, 'ViaBTC', '2016-06-05', 250000.6, 9000, 'PPS+', 'Active', 1.8, 'Bitcoin,Bitcoin Cash,Litecoin', 'https://www.viabtc.com'),
(6, 'Hiveon', '2018-11-12', 160000.4, 7000, 'PPS', 'Active', 1.0, 'Ethereum,ETC', 'https://hiveon.net'),
(7, 'Ethermine', '2015-03-25', 300000.7, 14000, 'PPLNS', 'Active', 1.0, 'Ethereum', 'https://ethermine.org'),
(8, 'NanoPool', '2016-07-14', 150000.0, 6000, 'PPLNS', 'Active', 1.0, 'Ethereum,Zcash,ETC', 'https://nanopool.org'),
(9, 'MiningPoolHub', '2014-02-02', 200000.3, 7500, 'PPLNS', 'Active', 0.9, 'Bitcoin,Litecoin,Monero', 'https://miningpoolhub.com'),
(10, 'Luxor', '2018-08-08', 130000.1, 5000, 'PPS', 'Active', 1.2, 'Dash,Zcash,Bitcoin', 'https://luxor.tech');

-- to display table data
select * from mining_pools;
-- to remove complete records from table
truncate table mining_pools;
-- to remove complete records and attributes from table
drop table mining_pools;


-- Table-9 alerts -----------------------------------------------------------------------------------------------------------
create table alerts (
alert_id int primary key,
user_id int,
coin_id int,
_condition varchar(50),
target_price float,
triggered boolean,
created_on date,
expiry_date date,
status varchar(20),
remarks text,
foreign key (user_id) references users(user_id),
foreign key (coin_id) references coins(coin_id)
);

insert into alerts values
(1, 1, 1, 'Above', 35000.0, false, '2025-06-01', '2025-12-01', 'Active', 'Alert for BTC surge'),
(2, 2, 2, 'Below', 2000.0, false, '2025-06-02', '2025-12-02', 'Active', 'ETH dip watch'),
(3, 3, 3, 'Above', 0.1, true, '2025-06-03', '2025-12-03', 'Triggered', 'DOGE hit high'),
(4, 4, 4, 'Below', 0.3, false, '2025-06-04', '2025-12-04', 'Active', 'ADA target drop'),
(5, 5, 5, 'Above', 250.0, false, '2025-06-05', '2025-12-05', 'Active', 'BNB target price'),
(6, 6, 6, 'Below', 90.0, false, '2025-06-06', '2025-12-06', 'Active', 'XRP watch alert'),
(7, 7, 7, 'Above', 500.0, false, '2025-06-07', '2025-12-07', 'Active', 'LTC target'),
(8, 8, 8, 'Below', 200.0, false, '2025-06-08', '2025-12-08', 'Active', 'BCH drop alert'),
(9, 9, 9, 'Above', 180.0, false, '2025-06-09', '2025-12-09', 'Active', 'LINK surge alert'),
(10, 10, 10, 'Below', 70.0, false, '2025-06-10', '2025-12-10', 'Active', 'DOT dip alert');

-- to display table data
select * from alerts;
-- to remove complete records from table
truncate table alerts;
-- to remove complete records and attributes from table
drop table alerts;


-- Table-10 support_tickets -------------------------------------------------------------------------------------------------
create table support_tickets (
ticket_id int primary key,
user_id int,
created_on date,
issue_type varchar(50),
priority varchar(20),
description text,
status varchar(20),
assigned_to varchar(100),
resolved_on date,
remarks text,
foreign key (user_id) references users(user_id)
);

insert into support_tickets values
(1, 1, '2025-06-01', 'Login Issue', 'High', 'Cannot log into account.', 'Open', 'Tech Support A', NULL, 'User reset pending'),
(2, 2, '2025-06-02', 'Transaction Error', 'Medium', 'Incorrect coin transaction recorded.', 'In Progress', 'Tech Support B', NULL, 'Investigating wallet ID'),
(3, 3, '2025-06-03', 'Price Alert Bug', 'Low', 'Alert not triggering.', 'Resolved', 'Dev Team C', '2025-06-05', 'Patched alert module'),
(4, 4, '2025-06-04', 'Wallet Sync', 'Medium', 'Wallet not syncing with app.', 'In Progress', 'Tech Support D', NULL, 'Review blockchain node'),
(5, 5, '2025-06-05', 'Exchange Listing', 'Low', 'Missing exchange listing info.', 'Resolved', 'Support E', '2025-06-07', 'Updated listings'),
(6, 6, '2025-06-06', '2FA Issue', 'High', '2FA not working on login.', 'Open', 'Security F', NULL, 'Waiting for user logs'),
(7, 7, '2025-06-07', 'Account Locked', 'High', 'Account locked after failed attempts.', 'Resolved', 'Support G', '2025-06-09', 'Unlocked with ID verification'),
(8, 8, '2025-06-08', 'Withdrawal Delay', 'Medium', 'Funds not withdrawn in 24h.', 'In Progress', 'Finance H', NULL, 'Escalated to banking team'),
(9, 9, '2025-06-09', 'Mining Stats Error', 'Low', 'Incorrect miner stats showing.', 'Resolved', 'Dev Team I', '2025-06-11', 'Stats recalculated'),
(10, 10, '2025-06-10', 'UI Bug', 'Low', 'Dropdown not working on mobile.', 'In Progress', 'UI Team J', NULL, 'Fix under testing');

-- to display table data
select * from support_tickets;
-- to remove complete records from table
truncate table support_tickets;
-- to remove complete records and attributes from table
drop table support_tickets;