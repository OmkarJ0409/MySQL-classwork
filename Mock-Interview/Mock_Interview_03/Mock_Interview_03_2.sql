-- 1. select customers born before "1990-01-01"
select * from customers where dob > "1990-01-01";
-- 2. select customers whose aadharnumber starts with "123
select * from customers where aadharnumber like "123%";
-- 3. select customers having branchcode between "SBI001" and "SBI010"
select * from customers where branchcode between "SBI001" and "SBI010";
-- 4. select customers where gender is male
select * from customers where gender = "Male";
-- 5. select customers and show their fullname in uppercase
select upper(fullname) from customers;
-- 6. select customers and count grouped by gender
select Gender,count(*) as Gender_count from customers group by gender;
-- 7. select customers name and gender born before "1990-10-10"
select fullname, gender from customers where dob > "1990-10-10";
-- 8. select customers with id 9
select * from customers where customerid = 9;
-- 9. select customers that are male and residing in (delhi or mumbai or pune)
select * from customers where gender = "Male" and address in ("Delhi, India","Mumbai, India","Pune, India");
-- 10. select customers where gender is female and their branchcode is between "SBI005" and "SBI012"
select * from customers where gender = "Female" and branchcode between "SBI005" and "SBI012";
-- 11. alter table to add column beneficiary
alter table customers add column beneficiary varchar (100);
-- 12. alter table to rename column from beneficiary to account_type
alter table customers rename column beneficiary to account_type;
-- 13. alter table modify column from varchar t0 int
alter table customers modify column account_type int;
-- 14. alter table to drop column account_type
alter table customers drop column account_type;
-- 15. alter table customers to acc account_created with current timestamp
alter table customers add column Account_created timestamp default current_timestamp;
-- 16. alter table customers to droip column account_created
alter table customers drop column Account_created;
-- 17. update customers to set phone "9898980909" with customerid 1,3,5,7
set sql_safe_updates = 0;
update customers set phone = "9898980909" where customerid in (1,3,5,7);
-- 18. update customers set branchcode = "SBI100" from "SBI001" 
update customers set branchcode = "SBI100" where branchcode = "SBI001";
-- 19. update customers to set their address to navi mumbai where gender is male
update customers set address = "Navi Mumbai, India" where gender = "Male";
-- 20. select customer with name and length
select fullname, length(fullname) as name_length from customers group by fullname;
-- 21. select customers fullname and concat it with their gender
select concat(fullname, ' (', gender,')') as Name_gender from customers;
-- 22. select customers with name containing "Mehra"
select * from customers where fullname like ("%Mehta%");
-- 23. select ci=ustomers with dob between "1990-01-01" and "1998-01-01"
select * from customers where dob between "1990-01-01" and "1998-01-01";
-- 24. select fullname with alias name
select fullname as name from customers;

-- 25. joins (join customers and accounts)
select c.customerid, c.fullname, a.accountid, a.accounttype 
from customers c 
join accounts a 
on c.customerid = a.customerid;

-- 26. joins (join customers and transactions)
select c.customerid, c.fullname, t.transactionid, t.amount 
from customers c 
join transactions t 
on c.customerid = t.customerid;

-- 27. joins (join customers and loans)
select c.customerid, c.fullname, l.loanid, l.amount 
from customers c 
join loans l 
on c.customerid = l.customerid;

-- 28. subqueries (get customers who have the same city as 'Rahul')
select fullname, address from customers 
where address = (
    select address from customers where fullname = 'Rahul Sharma'
);

-- 29. subqueries (get customers who have more than one account)
select fullname from customers 
where customerid in (
    select customerid from accounts 
    group by customerid 
    having count(*) > 1
);

-- 30. subqueries (get customers with highest loan amount)
select fullname from customers 
where customerid in (
    select customerid from loans 
    where amount = (
        select max(amount) from loans
    )
);

-- 31. subqueries (list customers who performed any transaction above 10,000)
select fullname from customers 
where customerid in (
    select customerid from transactions where amount > 10000
);

-- 32. user-defined function (get customer's city by name)
delimiter //
create function get_customer_city(cust_name varchar(100))
returns varchar(100)
deterministic
begin
    declare city_name varchar(100);
    select address into city_name from customers where fullname = cust_name limit 1;
    return city_name;
end;
// delimiter ;

-- use function
select get_customer_city('Rahul Sharma') as city;
select get_customer_city('Anjali Mehta') as city;
-- drop function
drop function if exists get_customer_city;

-- 33. user-defined function (get count of customers from a specific city)
delimiter //
create function get_customers_by_city(cust_city varchar(100))
returns int
deterministic
begin
    declare total int;
    select count(*) into total from customers where address = cust_city;
    return total;
end;
// delimiter ;

-- use function
select get_customers_by_city('Navi Mumbai') as total;
select get_customers_by_city('Delhi') as total;
-- drop function
drop function if exists get_customers_by_city;

-- 34. create view (create view --> show view --> drop view)
create view customer_summary as 
select customerid, fullname, gender, address from customers;
select * from customer_summary;
drop view if exists customer_summary;

-- 35. create view with filter
create or replace view delhi_customers as 
select customerid, fullname from customers where address like '%Delhi%';
select * from delhi_customers;
drop view if exists delhi_customers;

-- 36. create view with join (customers + loans)
create view customerloans as 
select c.customerid, c.fullname, l.amount, l.loantype 
from customers c 
join loans l on c.customerid = l.customerid;
select * from customerloans;
drop view if exists customerloans;

-- 37. cte (customers with name starting with 'A')
with name_starts_a as (
    select * from customers where fullname like 'A%'
) select * from name_starts_a;

-- 38. cte (customers from Mumbai)
with mumbai_customers as (
    select * from customers where address like '%Mumbai%'
) select * from mumbai_customers;

-- 39. cte (customers and their loan amounts)
with customer_loan_cte as (
    select c.customerid, c.fullname, l.amount 
    from customers c 
    join loans l on c.customerid = l.customerid
) select * from customer_loan_cte;

-- 40. cte (delete customers from Pune)
with delete_pune_customers as (
    select customerid from customers where address = 'Pune'
) delete from customers 
where customerid in (select customerid from delete_pune_customers);

-- 41. stored procedure (get customer by id)
delimiter //
create procedure get_customer_by_id(in id int)
begin
    select * from customers where customerid = id;
end;
// delimiter ;

call get_customer_by_id(1);
drop procedure if exists get_customer_by_id;

-- 42. stored procedure (get customers by gender)
delimiter //
create procedure get_customers_by_gender(in g varchar(10))
begin
    select * from customers where gender = g;
end;
// delimiter ;

call get_customers_by_gender('Male');
drop procedure if exists get_customers_by_gender;

-- 43. stored procedure (get customers by city)
delimiter //
create procedure get_customers_by_city(in c varchar(50))
begin
    select * from customers where address = c;
end;
// delimiter ;

call get_customers_by_city('Navi Mumbai');
drop procedure if exists get_customers_by_city;

-- 44. dcl (create user --> grant select --> drop user)
create user 'cust_viewer'@'localhost' identified by 'cust123';
grant select on customers to 'cust_viewer'@'localhost';
drop user if exists 'cust_viewer'@'localhost';

-- 45. dcl (create user --> grant + revoke permissions --> drop user)
create user 'cust_editor'@'localhost' identified by 'custpass';
grant select, update on customers to 'cust_editor'@'localhost';
revoke update on customers from 'cust_editor'@'localhost';
drop user if exists 'cust_editor'@'localhost';

-- 46. dcl (create role --> assign to user --> revoke role --> drop role)
create role 'customer_analyst';
grant select on customers to 'customer_analyst';

create user 'analyst1'@'localhost' identified by 'analystpass';
grant 'customer_analyst' to 'analyst1'@'localhost';
show grants for 'analyst1'@'localhost';
revoke 'customer_analyst' from 'analyst1'@'localhost';
drop role if exists 'customer_analyst';

-- 47. tcl (start transaction --> update --> commit)
set sql_safe_updates = 0;
start transaction;
update customers set address = 'Chennai, India' where fullname = 'Amit';
commit;

-- 48. tcl (start transaction --> update --> rollback)
start transaction;
update customers set address = 'Hyderabad, India' where fullname = 'Amit';
rollback;

-- 49. tcl (start transaction --> savepoint --> rollback to savepoint)
start transaction;
update customers set address = 'Kolkata' where fullname = 'Amit';
savepoint before_kolkata;
update customers set address = 'Jaipur' where fullname = 'Amit';
rollback to savepoint before_kolkata;

-- 50. Use SAVEPOINT, ROLLBACK TO, and COMMIT in a transaction to manage customer updates
start transaction;
update customers
set email = 'updated_email@example.com'
where customerid = 3;
savepoint sp_email_update;
update customers
set phone = '9999999999'
where customerid = 3;
rollback to sp_email_update;
commit;