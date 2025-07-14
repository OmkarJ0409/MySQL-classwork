-- create a database first
create database flipkart;
-- to work on this database, you need to use it first
use flipkart;

-- --------------------------------------- Database Analysis ------------------------------------------------------------------
/*
T1  : users(user_id, full_name, email, password, phone, gender, dob, city, state, status)
T2  : addresses(address_id, user_id, line1, line2, city, state, pincode, country, type, status)
T3  : categories(category_id, name, description, parent_category, created_on, updated_on, image_url, display_order, active, status)
T4  : products(product_id, category_id, name, description, price, stock, brand, rating, image_url, status)
T5  : orders(order_id, user_id, order_date, total_amount, payment_mode, payment_status, shipping_address_id, billing_address_id, status, remarks)
T6  : order_items(order_item_id, order_id, product_id, quantity, unit_price, total_price, discount, gst, status, delivery_date)
T7  : carts(cart_id, user_id, product_id, quantity, added_on, updated_on, price, discount, final_price, status)
T8  : reviews(review_id, product_id, user_id, rating, title, comment, review_date, sentiment, helpful_votes, status)
T9  : payments(payment_id, order_id, payment_date, amount, method, transaction_id, payment_status, tax, discount, status)
T10 : wishlists(wishlist_id, user_id, product_id, added_on, priority, notes, status, last_updated, visibility, source)
*/

-- Table-1 Users ------------------------------------------------------------------------------------------------------------
create table users (
user_id int primary key,
full_name varchar(100),
email varchar(100),
password varchar(100),
phone varchar(15),
gender varchar(10),
dob date,
city varchar(50),
state varchar(50),
status varchar(20)
);

insert into users values
(1, 'Ravi Sharma', 'ravi@gmail.com', 'pass123', '9876543210', 'Male', '1990-04-15', 'Mumbai', 'Maharashtra', 'Active'),
(2, 'Priya Desai', 'priya@gmail.com', 'pass456', '9876543211', 'Female', '1993-06-20', 'Ahmedabad', 'Gujarat', 'Active'),
(3, 'Amit Kumar', 'amitk@gmail.com', 'pass789', '9876543212', 'Male', '1985-12-10', 'Delhi', 'Delhi', 'Inactive'),
(4, 'Sneha Rao', 'sneha@yahoo.com', 'pass234', '9876543213', 'Female', '1995-03-22', 'Bengaluru', 'Karnataka', 'Active'),
(5, 'John Dsouza', 'john.d@gmail.com', 'pass345', '9876543214', 'Male', '1987-01-17', 'Pune', 'Maharashtra', 'Active'),
(6, 'Meera Singh', 'meera@hotmail.com', 'pass678', '9876543215', 'Female', '1991-09-05', 'Lucknow', 'Uttar Pradesh', 'Blocked'),
(7, 'Vikas Verma', 'vikas.v@gmail.com', 'pass890', '9876543216', 'Male', '1994-11-12', 'Chennai', 'Tamil Nadu', 'Active'),
(8, 'Anjali Gupta', 'anjali@outlook.com', 'pass112', '9876543217', 'Female', '1992-07-19', 'Kolkata', 'West Bengal', 'Active'),
(9, 'Rahul Bansal', 'rahul@gmail.com', 'pass223', '9876543218', 'Male', '1989-02-28', 'Jaipur', 'Rajasthan', 'Inactive'),
(10, 'Neha Patil', 'neha.p@gmail.com', 'pass334', '9876543219', 'Female', '1996-08-08', 'Nagpur', 'Maharashtra', 'Active');

-- to display table data
select * from users;
-- to remove complete records from table
truncate table users;
-- to remove complete records and attributes from table
drop table users;


-- Table-2 Addresses --------------------------------------------------------------------------------------------------------
create table addresses (
address_id int primary key,
user_id int,
house_no varchar(20),
street varchar(100),
area varchar(100),
city varchar(50),
state varchar(50),
pincode varchar(10),
address_type varchar(20),
is_default boolean,
foreign key (user_id) references users(user_id)
);

insert into addresses values
(1, 1, 'B-101', 'Linking Road', 'Bandra', 'Mumbai', 'Maharashtra', '400050', 'Home', true),
(2, 2, '23/A', 'CG Road', 'Navrangpura', 'Ahmedabad', 'Gujarat', '380009', 'Work', false),
(3, 3, '12-C', 'Nehru Place', 'South Delhi', 'Delhi', 'Delhi', '110019', 'Home', true),
(4, 4, '5th Floor', 'MG Road', 'Indiranagar', 'Bengaluru', 'Karnataka', '560038', 'Work', true),
(5, 5, 'Flat 302', 'JM Road', 'Shivaji Nagar', 'Pune', 'Maharashtra', '411005', 'Home', true),
(6, 6, 'House 19', 'Hazratganj Road', 'Hazratganj', 'Lucknow', 'Uttar Pradesh', '226001', 'Home', false),
(7, 7, 'Plot 45', 'OMR Road', 'Thoraipakkam', 'Chennai', 'Tamil Nadu', '600097', 'Work', true),
(8, 8, '202-B', 'Park Street', 'New Town', 'Kolkata', 'West Bengal', '700016', 'Home', true),
(9, 9, 'E-9', 'Ajmer Road', 'Vaishali Nagar', 'Jaipur', 'Rajasthan', '302021', 'Work', false),
(10, 10, 'D-401', 'Wardha Road', 'Dhantoli', 'Nagpur', 'Maharashtra', '440012', 'Home', true);

-- to display table data
select * from addresses;
-- to remove complete records from table
truncate table addresses;
-- to remove complete records and attributes from table
drop table addresses;


-- Table-3 Categories -------------------------------------------------------------------------------------------------------
create table categories (
category_id int primary key,
name varchar(100),
description text,
parent_category int,
created_on date,
updated_on date,
image_url varchar(255),
display_order int,
active boolean,
status varchar(20),
foreign key (parent_category) references categories(category_id)
);

insert into categories values
(1, 'Electronics', 'Electronic gadgets and devices.', null, '2023-01-01', '2024-01-01', 'https://img.flipkart.com/electronics.jpg', 1, true, 'Active'),
(2, 'Mobiles', 'Smartphones and accessories.', 1, '2023-01-02', '2024-01-02', 'https://img.flipkart.com/mobiles.jpg', 2, true, 'Active'),
(3, 'Laptops', 'Laptops for work and gaming.', 1, '2023-01-03', '2024-01-03', 'https://img.flipkart.com/laptops.jpg', 3, true, 'Active'),
(4, 'Home Appliances', 'Appliances for daily use.', null, '2023-01-04', '2024-01-04', 'https://img.flipkart.com/appliances.jpg', 4, true, 'Active'),
(5, 'Televisions', 'LED, Smart, and Android TVs.', 4, '2023-01-05', '2024-01-05', 'https://img.flipkart.com/tvs.jpg', 5, true, 'Active'),
(6, 'Fashion', 'Men and Women clothing.', null, '2023-01-06', '2024-01-06', 'https://img.flipkart.com/fashion.jpg', 6, true, 'Active'),
(7, 'Men Clothing', 'T-shirts, Jeans, and more.', 6, '2023-01-07', '2024-01-07', 'https://img.flipkart.com/men.jpg', 7, true, 'Active'),
(8, 'Women Clothing', 'Sarees, Kurtis, and more.', 6, '2023-01-08', '2024-01-08', 'https://img.flipkart.com/women.jpg', 8, true, 'Active'),
(9, 'Books', 'Academic and Non-fiction books.', null, '2023-01-09', '2024-01-09', 'https://img.flipkart.com/books.jpg', 9, true, 'Active'),
(10, 'Footwear', 'Shoes, Sandals, and more.', 6, '2023-01-10', '2024-01-10', 'https://img.flipkart.com/footwear.jpg', 10, true, 'Active');

-- to display table data
select * from categories;
-- to remove complete records from table
truncate table categories;
-- to remove complete records and attributes from table
drop table categories;


-- Table-4 Products ---------------------------------------------------------------------------------------------------------
create table products (
product_id int primary key,
name varchar(150),
description text,
category_id int,
brand varchar(100),
price decimal(10,2),
discount_percent float,
stock_quantity int,
added_on date,
status varchar(20),
foreign key (category_id) references categories(category_id)
);

insert into products values
(1, 'Samsung Galaxy S21', 'Latest Android smartphone with AMOLED display.', 2, 'Samsung', 69999.00, 10.0, 150, '2025-01-01', 'Active'),
(2, 'Apple iPhone 14', 'Flagship iOS smartphone with A15 Bionic chip.', 2, 'Apple', 79999.00, 5.0, 100, '2025-01-03', 'Active'),
(3, 'HP Pavilion 15', '15.6 inch laptop with Intel i5 processor.', 3, 'HP', 54999.00, 15.0, 75, '2025-01-05', 'Active'),
(4, 'LG 55-inch Smart TV', '4K Ultra HD LED Smart TV.', 5, 'LG', 45999.00, 20.0, 60, '2025-01-08', 'Active'),
(5, 'Levi\'s Men Jeans', 'Slim fit stretchable denim.', 7, 'Levi\'s', 2499.00, 30.0, 200, '2025-01-10', 'Active'),
(6, 'Nike Running Shoes', 'Comfortable and durable running shoes.', 10, 'Nike', 3999.00, 25.0, 120, '2025-01-12', 'Active'),
(7, 'Whirlpool Refrigerator', '265L double door fridge.', 4, 'Whirlpool', 28999.00, 18.0, 50, '2025-01-15', 'Active'),
(8, 'Sony Headphones', 'Wireless noise cancelling headphones.', 1, 'Sony', 9999.00, 12.0, 80, '2025-01-18', 'Active'),
(9, 'Kurti Set', 'Cotton printed kurti with leggings.', 8, 'Biba', 1899.00, 35.0, 140, '2025-01-20', 'Active'),
(10, 'Data Structures Book', 'Popular textbook for computer science.', 9, 'McGraw Hill', 599.00, 5.0, 300, '2025-01-22', 'Active');

-- to display table data
select * from products;
-- to remove complete records from table
truncate table products;
-- to remove complete records and attributes from table
drop table products;


-- Table-5 Orders -----------------------------------------------------------------------------------------------------------
create table orders (
order_id int primary key,
user_id int,
order_date date,
total_amount decimal(10,2),
payment_mode varchar(30),
payment_status varchar(20),
shipping_address_id int,
billing_address_id int,
status varchar(20),
remarks text,
foreign key (user_id) references users(user_id),
foreign key (shipping_address_id) references addresses(address_id),
foreign key (billing_address_id) references addresses(address_id)
);

insert into orders values
(1, 1, '2025-07-01', 1350.00, 'Credit Card', 'Paid', 1, 1, 'Shipped', 'Delivery expected in 3 days'),
(2, 2, '2025-07-02', 4999.00, 'UPI', 'Paid', 2, 2, 'Processing', 'Preparing to dispatch'),
(3, 3, '2025-07-03', 799.00, 'Cash on Delivery', 'Pending', 3, 3, 'Confirmed', 'COD order verified'),
(4, 4, '2025-07-04', 28999.00, 'Debit Card', 'Paid', 4, 4, 'Delivered', 'Delivered on 2025-07-06'),
(5, 5, '2025-07-05', 2499.00, 'Net Banking', 'Paid', 5, 5, 'Cancelled', 'Cancelled by user'),
(6, 6, '2025-07-06', 1899.00, 'Credit Card', 'Paid', 6, 6, 'Delivered', 'Received by customer'),
(7, 7, '2025-07-07', 58999.00, 'Credit Card', 'Paid', 7, 7, 'Returned', 'Return initiated due to defect'),
(8, 8, '2025-07-08', 599.00, 'UPI', 'Paid', 8, 8, 'Delivered', 'Delivered successfully'),
(9, 9, '2025-07-09', 3999.00, 'Credit Card', 'Paid', 9, 9, 'Shipped', 'Dispatched from warehouse'),
(10, 10, '2025-07-10', 9999.00, 'Cash on Delivery', 'Pending', 10, 10, 'Confirmed', 'Out for delivery');

-- to display table data
select * from orders;
-- to remove complete records from table
truncate table orders;
-- to remove complete records and attributes from table
drop table orders;


-- Table-6 Order_items ------------------------------------------------------------------------------------------------------
create table order_items (
item_id int primary key,
order_id int,
product_id int,
quantity int,
price decimal(10,2),
tax decimal(10,2),
discount decimal(10,2),
total_amount decimal(10,2),
delivery_status varchar(30),
estimated_delivery date,
foreign key (order_id) references orders(order_id),
foreign key (product_id) references products(product_id)
);

insert into order_items values
(1, 1, 1, 2, 600.00, 60.00, 50.00, 1210.00, 'Shipped', '2025-07-04'),
(2, 2, 2, 1, 4999.00, 0.00, 0.00, 4999.00, 'Processing', '2025-07-06'),
(3, 3, 3, 1, 799.00, 0.00, 0.00, 799.00, 'Confirmed', '2025-07-07'),
(4, 4, 4, 1, 27999.00, 1000.00, 0.00, 28999.00, 'Delivered', '2025-07-06'),
(5, 5, 5, 2, 1200.00, 200.00, 100.00, 2500.00, 'Cancelled', '2025-07-08'),
(6, 6, 6, 3, 600.00, 200.00, 100.00, 1899.00, 'Delivered', '2025-07-09'),
(7, 7, 7, 1, 58000.00, 999.00, 0.00, 58999.00, 'Returned', '2025-07-10'),
(8, 8, 8, 1, 550.00, 49.00, 0.00, 599.00, 'Delivered', '2025-07-11'),
(9, 9, 9, 1, 3900.00, 99.00, 0.00, 3999.00, 'Shipped', '2025-07-12'),
(10, 10, 10, 1, 9700.00, 299.00, 0.00, 9999.00, 'Confirmed', '2025-07-13');

-- to display table data
select * from order_items;
-- to remove complete records from table
truncate table order_items;
-- to remove complete records and attributes from table
drop table order_items;


-- Table-7 Carts ------------------------------------------------------------------------------------------------------------
create table carts (
cart_id int primary key,
user_id int,
product_id int,
quantity int,
added_on date,
updated_on date,
price decimal(10,2),
discount decimal(10,2),
final_price decimal(10,2),
status varchar(20),
foreign key (user_id) references users(user_id),
foreign key (product_id) references products(product_id)
);

insert into carts values
(1, 1, 1, 2, '2025-07-01', '2025-07-02', 1200.00, 100.00, 1100.00, 'Active'),
(2, 2, 2, 1, '2025-07-02', '2025-07-03', 4999.00, 0.00, 4999.00, 'Active'),
(3, 3, 3, 3, '2025-07-03', '2025-07-04', 2397.00, 300.00, 2097.00, 'Active'),
(4, 4, 4, 1, '2025-07-04', '2025-07-04', 27999.00, 2000.00, 25999.00, 'Removed'),
(5, 5, 5, 1, '2025-07-04', '2025-07-05', 1200.00, 200.00, 1000.00, 'Ordered'),
(6, 6, 6, 2, '2025-07-05', '2025-07-06', 1200.00, 100.00, 1100.00, 'Ordered'),
(7, 7, 7, 1, '2025-07-06', '2025-07-07', 58000.00, 500.00, 57500.00, 'Active'),
(8, 8, 8, 2, '2025-07-07', '2025-07-08', 1100.00, 100.00, 1000.00, 'Removed'),
(9, 9, 9, 1, '2025-07-08', '2025-07-08', 3900.00, 200.00, 3700.00, 'Active'),
(10, 10, 10, 1, '2025-07-09', '2025-07-09', 9700.00, 700.00, 9000.00, 'Active');

-- to display table data
select * from carts;
-- to remove complete records from table
truncate table carts;
-- to remove complete records and attributes from table
drop table carts;


-- Table-8 Reviews ----------------------------------------------------------------------------------------------------------
create table reviews (
review_id int primary key,
product_id int,
user_id int,
rating int check (rating between 1 and 5),
title varchar(100),
comment text,
review_date date,
sentiment varchar(20),
helpful_votes int,
status varchar(20),
foreign key (product_id) references products(product_id),
foreign key (user_id) references users(user_id)
);

insert into reviews values
(1, 1, 1, 5, 'Excellent Product', 'Very useful and affordable.', '2025-07-01', 'Positive', 12, 'Published'),
(2, 2, 2, 4, 'Good Quality', 'Works well for the price.', '2025-07-02', 'Positive', 8, 'Published'),
(3, 3, 3, 3, 'Average Item', 'Okay for basic use.', '2025-07-03', 'Neutral', 5, 'Published'),
(4, 4, 4, 5, 'Highly Recommend', 'Top-notch performance.', '2025-07-04', 'Positive', 20, 'Published'),
(5, 5, 5, 2, 'Not Satisfied', 'Stopped working in a week.', '2025-07-05', 'Negative', 3, 'Published'),
(6, 6, 6, 4, 'Decent Buy', 'Met expectations.', '2025-07-06', 'Positive', 7, 'Published'),
(7, 7, 7, 1, 'Bad Experience', 'Did not receive all parts.', '2025-07-07', 'Negative', 2, 'Published'),
(8, 8, 8, 3, 'Just Okay', 'Could be better quality.', '2025-07-08', 'Neutral', 4, 'Published'),
(9, 9, 9, 5, 'Fantastic!', 'Delivered on time and in great condition.', '2025-07-09', 'Positive', 10, 'Published'),
(10, 10, 10, 4, 'Satisfied', 'Product as described.', '2025-07-10', 'Positive', 6, 'Published');

-- to display table data
select * from reviews;
-- to remove complete records from table
truncate table reviews;
-- to remove complete records and attributes from table
drop table reviews;


-- Table-9 Payments ---------------------------------------------------------------------------------------------------------
create table payments (
payment_id int primary key,
order_id int,
payment_date date,
amount decimal(10,2),
payment_mode varchar(50),
transaction_id varchar(100),
payment_status varchar(30),
refunded boolean,
refund_amount decimal(10,2),
status varchar(20),
foreign key (order_id) references orders(order_id)
);

insert into payments values
(1, 1, '2025-07-01', 599.00, 'Credit Card', 'TXN1001', 'Completed', false, 0.00, 'Processed'),
(2, 2, '2025-07-02', 1299.00, 'UPI', 'TXN1002', 'Completed', false, 0.00, 'Processed'),
(3, 3, '2025-07-03', 999.00, 'Cash on Delivery', 'TXN1003', 'Pending', false, 0.00, 'Pending'),
(4, 4, '2025-07-04', 4999.00, 'Debit Card', 'TXN1004', 'Completed', false, 0.00, 'Processed'),
(5, 5, '2025-07-05', 249.00, 'Net Banking', 'TXN1005', 'Failed', false, 0.00, 'Failed'),
(6, 6, '2025-07-06', 899.00, 'UPI', 'TXN1006', 'Completed', false, 0.00, 'Processed'),
(7, 7, '2025-07-07', 1999.00, 'Credit Card', 'TXN1007', 'Completed', false, 0.00, 'Processed'),
(8, 8, '2025-07-08', 149.00, 'Wallet', 'TXN1008', 'Refunded', true, 149.00, 'Refunded'),
(9, 9, '2025-07-09', 749.00, 'Cash on Delivery', 'TXN1009', 'Completed', false, 0.00, 'Processed'),
(10, 10, '2025-07-10', 3299.00, 'Credit Card', 'TXN1010', 'Completed', false, 0.00, 'Processed');

-- to display table data
select * from payments;
-- to remove complete records from table
truncate table payments;
-- to remove complete records and attributes from table
drop table payments;


-- Table-10 Wishlists -------------------------------------------------------------------------------------------------------
create table wishlists (
wishlist_id int primary key,
user_id int,
product_id int,
added_on date,
priority int,
status varchar(20),
remarks text,
category_id int,
notify boolean,
favorite boolean,
foreign key (user_id) references users(user_id),
foreign key (product_id) references products(product_id),
foreign key (category_id) references categories(category_id)
);

insert into wishlists values
(1, 1, 1, '2025-07-01', 1, 'Active', 'Waiting for price drop', 1, true, true),
(2, 2, 2, '2025-07-02', 2, 'Active', 'Birthday gift', 2, true, false),
(3, 3, 3, '2025-07-03', 1, 'Inactive', 'Already purchased elsewhere', 3, false, false),
(4, 4, 4, '2025-07-04', 3, 'Active', 'Gift idea for friend', 4, true, true),
(5, 5, 5, '2025-07-05', 1, 'Active', 'Best seller product', 5, true, true),
(6, 6, 6, '2025-07-06', 2, 'Inactive', 'No longer interested', 6, false, false),
(7, 7, 7, '2025-07-07', 1, 'Active', 'Popular on social media', 7, true, false),
(8, 8, 8, '2025-07-08', 2, 'Active', 'Check reviews before buying', 8, true, true),
(9, 9, 9, '2025-07-09', 3, 'Inactive', 'Out of stock', 9, false, false),
(10, 10, 10, '2025-07-10', 2, 'Active', 'Compare with alternatives', 10, true, true);

-- to display table data
select * from wishlists;
-- to remove complete records from table
truncate table wishlists;
-- to remove complete records and attributes from table
drop table wishlists;