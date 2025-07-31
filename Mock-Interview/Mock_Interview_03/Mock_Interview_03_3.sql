-- 1. select all accounts with balance over 50,000
select * from accounts where balance > 50000;
-- 2. select accounts where accounttype is 'savings'
select * from accounts where accounttype = 'savings';
-- 3. select accounts opened after '2020-01-01'
select * from accounts where opendate > '2020-01-01';
-- 4. select accounts with accountid between 100 and 200
select * from accounts where accountid between 100 and 200;
-- 5. select accounts with balance less than 1,000
select * from accounts where balance < 1000;
-- 6. select accounts with accountstatus = 'active'
select * from accounts where status = 'active';
-- 7. select all unique accounttypes
select distinct accounttype from accounts;
-- 8. select accountid and balance grouped by accounttype
select accounttype, count(*) as total_accounts from accounts group by accounttype;
-- 9. select accountid and balance where accounttype is not 'loan'
select accountid, balance from accounts where accounttype != 'loan';
-- 10. select accounts with balance ending in '000'
select * from accounts where balance like '%000';
-- 11. add column is_joint_account
alter table accounts add column is_joint_account boolean;
-- 12. rename column is_joint_account to joint_status
alter table accounts rename column is_joint_account to joint_status;
-- 13. modify balance column to double
alter table accounts modify column balance double;
-- 14. drop column joint_status
alter table accounts drop column joint_status;
-- 15. add created_at column with default current timestamp
alter table accounts add column created_at timestamp default current_timestamp;
-- 16. drop column created_at
alter table accounts drop column created_at;
-- 17. update balances to 0 for inactive accounts
update accounts set balance = 0 where status = 'inactive';
-- 18. update accountstatus to 'closed' where balance = 0
update accounts set status = 'closed' where balance = 0;
-- 19. set all balances over 1,000,000 to 999999
update accounts set balance = 999999 where balance > 1000000;
-- 20. update accounttype to 'premium_savings' where balance > 500000
update accounts set accounttype = 'premium_savings' where balance > 500000;
-- 21. select accountid and length of accounttype
select accountid, length(accounttype) as type_length from accounts;
-- 22. concat accounttype and accountstatus
select concat(accounttype, ' - ', status) as type_status from accounts;
-- 23. count total active accounts
select count(*) from accounts where status = 'active';
-- 24. alias balance as current_balance
select balance as current_balance from accounts;

-- 25. join accounts and customers
select a.accountid, a.accounttype, c.fullname 
from accounts a 
join customers c on a.customerid = c.customerid;

-- 26. join accounts and transactions
select a.accountid, t.transactionid, t.amount 
from accounts a 
join transactions t on a.accountid = t.accountid;

-- 27. join accounts and loans
select a.accountid, l.loanid, l.amount 
from accounts a 
join loans l on a.accountid = l.accountid;
-- 28. accounts with highest balance
select * from accounts where balance = (select max(balance) from accounts);

-- 29. customers who have more than 2 accounts
select customerid from accounts group by customerid having count(*) > 2;

-- 30. accounts from customers living in 'Mumbai'
select * from accounts 
where customerid in (
    select customerid from customers where address like '%Mumbai%'
);

-- 31. accounts that have at least one transaction above 10,000
select * from accounts where accountid in (
    select accountid from transactions where amount > 10000
);
-- 32. function to get balance by accountid
delimiter //
create function get_balance(acc_id int)
returns decimal(10,2)
deterministic
begin
    declare bal decimal(10,2);
    select balance into bal from accounts where accountid = acc_id limit 1;
    return bal;
end;
// delimiter ;

-- usage
select get_balance(101);
drop function if exists get_balance;

-- 33. function to count accounts by accounttype
delimiter //
create function get_accounts_by_type(acc_type varchar(50))
returns int
deterministic
begin
    declare count_ int;
    select count(*) into count_ from accounts where accounttype = acc_type;
    return count_;
end;
// delimiter ;

-- usage
select get_accounts_by_type('savings');
drop function if exists get_accounts_by_type;

-- 34. view of all savings accounts
create view savings_accounts as 
select accountid, balance from accounts where accounttype = 'savings';
select * from savings_accounts;
drop view if exists savings_accounts;

-- 35. view joining accounts with customers
create view account_customer_view as 
select a.accountid, c.fullname, a.balance 
from accounts a 
join customers c on a.customerid = c.customerid;
select * from account_customer_view;
drop view if exists account_customer_view;

-- 36. accounts with balance > 1 lakh
with rich_accounts as (
    select * from accounts where balance > 100000
) select * from rich_accounts;

-- 37. accounts opened in 2023
with accounts_2023 as (
    select * from accounts where year(opendate) = 2023
) select * from accounts_2023;

-- 38. accounts with type 'loan'
with loan_accounts as (
    select * from accounts where accounttype = 'loan'
) select * from loan_accounts;

-- 39. delete accounts with status 'closed'
with to_delete as (
    select accountid from accounts where status = 'closed'
) delete from accounts where accountid in (select accountid from to_delete);

-- 40. procedure to get account by id
delimiter //
create procedure get_account_by_id(in id int)
begin
    select * from accounts where accountid = id;
end;
// delimiter ;

call get_account_by_id(101);
drop procedure if exists get_account_by_id;

-- 41. procedure to get accounts by type
delimiter //
create procedure get_accounts_by_type(in type_ varchar(50))
begin
    select * from accounts where accounttype = type_;
end;
// delimiter ;

call get_accounts_by_type('savings');
drop procedure if exists get_accounts_by_type;

-- 42. create user and grant select on accounts
create user 'account_viewer'@'localhost' identified by 'viewpass';
grant select on accounts to 'account_viewer'@'localhost';
drop user if exists 'account_viewer'@'localhost';

-- 43. create user, grant/revoke, drop
create user 'account_editor'@'localhost' identified by 'editpass';
grant select, update on accounts to 'account_editor'@'localhost';
revoke update on accounts from 'account_editor'@'localhost';
drop user if exists 'account_editor'@'localhost';

-- 44. create role, assign, revoke, drop
create role 'account_manager';
grant select on accounts to 'account_manager';
create user 'manager1'@'localhost' identified by 'managerpass';
grant 'account_manager' to 'manager1'@'localhost';
revoke 'account_manager' from 'manager1'@'localhost';
drop role if exists 'account_manager';

-- 45. transaction + commit
start transaction;
update accounts set balance = balance - 1000 where accountid = 101;
commit;

-- 46. transaction + rollback
start transaction;
update accounts set balance = balance + 5000 where accountid = 101;
rollback;

-- 47. transaction + savepoint
start transaction;
update accounts set balance = balance - 1000 where accountid = 101;
savepoint sp1;
update accounts set balance = balance - 2000 where accountid = 101;
rollback to sp1;
commit;

-- 48. transaction with multiple updates and rollback
start transaction;
update accounts set status = 'inactive' where balance < 100;
rollback;

-- 49. transaction, savepoint, rollback to savepoint
start transaction;
update accounts set accounttype = 'updated' where accountid = 105;
savepoint sp_change_type;
update accounts set status = 'locked' where accountid = 105;
rollback to sp_change_type;
commit;

-- 50. transaction with account creation, rollback, and commit
start transaction;
insert into accounts (accountid, customerid, accounttype, balance, accountstatus)
values (999, 1, 'savings', 5000, 'active');
savepoint new_account;
delete from accounts where accountid = 999;
rollback to new_account;
commit;