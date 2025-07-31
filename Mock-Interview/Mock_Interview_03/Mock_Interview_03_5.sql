-- 1. select all loans above 1 million
select * from loans where amount > 1000000;
-- 2. select all personal loans
select * from loans where loantype = 'Personal';
-- 3. select all loans started in 2023
select * from loans where year(startdate) = 2023;
-- 4. select loans between '2023-01-01' and '2024-01-01'
select * from loans where startdate between '2023-01-01' and '2024-01-01';
-- 5. select all active loans
select * from loans where status = 'Active';
-- 6. select distinct loan types
select distinct loantype from loans;
-- 7. select all education loans
select * from loans where loantype = 'Education';
-- 8. select all loans ordered by emi desc
select * from loans order by emi desc;
-- 9. count total loans per branch
select branchcode, count(*) as total_loans from loans group by branchcode;
-- 10. find average interest rate for home loans
select avg(interestrate) as avg_home_rate from loans where loantype = 'Home';
-- 11. find total loan amount for customer 1
select sum(amount) from loans where customerid = 1;
-- 12. add column approved_by
alter table loans add column approved_by varchar(50);
-- 13. rename column approved_by to approved_manager
alter table loans rename column approved_by to approved_manager;
-- 14. modify emi column to decimal(12,2)
alter table loans modify column emi decimal(12,2);
-- 15. drop column approved_manager
alter table loans drop column approved_manager;
-- 16. add processing_fee column with default 0
alter table loans add column processing_fee decimal(10,2) default 0;
-- 17. drop processing_fee column
alter table loans drop column processing_fee;
-- 18. update status to 'Closed' for all loans started before 2022
update loans set status = 'Closed' where startdate < '2022-01-01';
-- 19. update loantype 'Business' to 'Commercial'
update loans set loantype = 'Commercial' where loantype = 'Business';
-- 20. set interest rate to 9.5 where emi > 20000
update loans set interestrate = 9.5 where emi > 20000;
-- 21. select loanid and duration in years
select loanid, tenuremonths/12 as tenure_years from loans;
-- 22. concat loan type and branch into single column
select concat(loantype, ' - ', branchcode) as loan_branch from loans;
-- 23. count total home loans
select count(*) from loans where loantype = 'Home';
-- 24. alias emi as monthly_payment
select emi as monthly_payment from loans;

-- 25. join loans with customers to show name
select l.loanid, c.fullname, l.amount 
from loans l
join customers c on l.customerid = c.customerid;

-- 26. loans from customers in 'Mumbai'
select * from loans 
where customerid in (
    select customerid from customers where address like '%Mumbai%'
);

-- 27. highest loan amount
select * from loans where amount = (select max(amount) from loans);

-- 28. branches with more than 3 home loans
select branchcode from loans where loantype = 'Home' group by branchcode having count(*) > 3;

-- 29. customers with more than one loan
select customerid from loans group by customerid having count(*) > 1;

-- 30. function to get emi by loan id
delimiter //
create function get_emi(loan_id int)
returns decimal(10,2)
deterministic
begin
    declare e decimal(10,2);
    select emi into e from loans where loanid = loan_id limit 1;
    return e;
end;//
delimiter ;
select get_emi(201);
drop function if exists get_emi;

-- 31. function to count loans by type
delimiter //
create function count_loans_by_type(ltype varchar(20))
returns int
deterministic
begin
    declare cnt int;
    select count(*) into cnt from loans where loantype = ltype;
    return cnt;
end;//
delimiter ;
select count_loans_by_type('Car');
drop function if exists count_loans_by_type;

-- 32. view of all education loans
create view edu_loans as select * from loans where loantype = 'Education';
select * from edu_loans;
drop view if exists edu_loans;

-- 33. view joining loans and customer names
create view loan_customer_view as
select l.loanid, c.fullname, l.amount from loans l
join customers c on l.customerid = c.customerid;
select * from loan_customer_view;
drop view if exists loan_customer_view;

-- 34. loans over 2 million
with big_loans as (
    select * from loans where amount > 2000000
) select * from big_loans;

-- 35. home loans started in 2023
with home_2023 as (
    select * from loans where loantype = 'Home' and year(startdate) = 2023
) select * from home_2023;

-- 36. closed car loans
with closed_car as (
    select * from loans where loantype = 'Car' and status = 'Closed'
) select * from closed_car;

-- 37. delete loans with amount less than 100000
with to_delete as (
    select loanid from loans where amount < 100000
) delete from loans where loanid in (select loanid from to_delete);

-- 38. procedure to get loan by id
delimiter //
create procedure get_loan_by_id(in id int)
begin
    select * from loans where loanid = id;
end;//
delimiter ;
call get_loan_by_id(205);
drop procedure if exists get_loan_by_id;

-- 39. procedure to get all loans for customer
delimiter //
create procedure get_loans_by_customer(in cust_id int)
begin
    select * from loans where customerid = cust_id;
end;//
delimiter ;
call get_loans_by_customer(2);
drop procedure if exists get_loans_by_customer;

-- 40. create user and grant select on loans
create user 'loan_viewer'@'localhost' identified by 'viewloan';
grant select on loans to 'loan_viewer'@'localhost';
drop user if exists 'loan_viewer'@'localhost';

-- 41. create user, grant/revoke, drop
create user 'loan_editor'@'localhost' identified by 'editloan';
grant select, update on loans to 'loan_editor'@'localhost';
revoke update on loans from 'loan_editor'@'localhost';
drop user if exists 'loan_editor'@'localhost';

-- 42. create role for loan managers
create role 'loan_manager';
grant select on loans to 'loan_manager';
create user 'manager1'@'localhost' identified by 'managerpass';
grant 'loan_manager' to 'manager1'@'localhost';
revoke 'loan_manager' from 'manager1'@'localhost';
drop role if exists 'loan_manager';

-- 43. start transaction and commit
start transaction;
update loans set status = 'Reviewed' where loanid = 202;
commit;

-- 44. start transaction and rollback
start transaction;
update loans set amount = amount + 10000 where loanid = 203;
rollback;

-- 45. use savepoint and rollback to it
start transaction;
update loans set amount = 999999 where loanid = 204;
savepoint before_change;
update loans set interestrate = 5.0 where loanid = 204;
rollback to before_change;
commit;

-- 46. multiple updates with rollback
start transaction;
update loans set status = 'Pending' where amount < 100000;
rollback;

-- 47. update and rollback to savepoint
start transaction;
update loans set status = 'Error' where loanid = 215;
savepoint sp1;
update loans set tenuremonths = 999 where loanid = 215;
rollback to sp1;
commit;

-- 48. insert, savepoint, rollback to savepoint, commit
start transaction;
insert into loans (loanid, customerid, loantype, amount, startdate, tenuremonths, interestrate, emi, status, branchcode)
values (999, 1, 'Test', 12345.67, '2025-07-30', 12, 5.0, 1000.00, 'Pending', 'SBI001');
savepoint insert_loan;
delete from loans where loanid = 999;
rollback to insert_loan;
commit;

-- 49. select top 5 loans by emi
select * from loans order by emi desc limit 5;

-- 50. select average tenure for car loans
select avg(tenuremonths) as avg_car_tenure from loans where loantype = 'Car';