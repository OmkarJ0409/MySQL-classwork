-- 1. select all transactions with amount greater than 5000
select * from transactions where amount > 5000;
-- 2. select all debit transactions
select * from transactions where type = 'debit';
-- 3. select transactions from june 2024
select * from transactions where month(transactiondate) = 6 and year(transactiondate) = 2024;
-- 4. select transactions between '2024-06-01' and '2024-07-01'
select * from transactions where transactiondate between '2024-06-01' and '2024-07-01';
-- 5. select transactions where status is 'success'
select * from transactions where status = 'success';
-- 6. select unique transaction types
select distinct type from transactions;
-- 7. select all upi transactions
select * from transactions where mode = 'upi';
-- 8. select all transactions ordered by amount desc
select * from transactions order by amount desc;
-- 9. count total transactions per account
select accountid, count(*) as total_transactions from transactions group by accountid;
-- 10. find average transaction amount
select avg(amount) as avg_transaction from transactions;
-- 11. find total credit amount for account 101
select sum(amount) from transactions where accountid = 101 and type = 'credit';
-- 12. add column is_refunded
alter table transactions add column is_refunded boolean;
-- 13. rename column is_refunded to refunded_flag
alter table transactions rename column is_refunded to refunded_flag;
-- 14. modify amount column to decimal(12,2)
alter table transactions modify column amount decimal(12,2);
-- 15. drop column refunded_flag
alter table transactions drop column refunded_flag;
-- 16. add transaction_fee column with default 0
alter table transactions add column transaction_fee decimal(10,2) default 0;
-- 17. drop transaction_fee column
alter table transactions drop column transaction_fee;
-- 18. update mode to 'netbanking' where mode = 'net banking'
update transactions set mode = 'netbanking' where mode = 'net banking';
-- 19. update description to uppercase for all transactions
update transactions set description = upper(description);
-- 20. set status to 'failed' where amount < 0
update transactions set status = 'failed' where amount < 0;
-- 21. select transactionid and length of description
select transactionid, length(description) as desc_length from transactions;
-- 22. concat type and mode into a single column
select concat(type, ' - ', mode) as type_mode from transactions;
-- 23. count total credit transactions
select count(*) from transactions where type = 'credit';
-- 24. alias balanceafter as final_balance
select balanceafter as final_balance from transactions;

-- 25. join transactions with accounts table
select t.transactionid, t.amount, a.accounttype 
from transactions t 
join accounts a on t.accountid = a.accountid;

-- 26. join transactions with customers through accounts
select t.transactionid, c.fullname, t.amount 
from transactions t 
join accounts a on t.accountid = a.accountid
join customers c on a.customerid = c.customerid;

-- 27. join transactions with branches using branchcode
select t.transactionid, t.branchcode, a.branchcode 
from transactions t 
join accounts a on t.accountid = a.accountid 
where t.branchcode = a.branchcode;

-- 28. transaction with the highest amount
select * from transactions where amount = (select max(amount) from transactions);

-- 29. accounts with more than 2 credit transactions
select accountid from transactions where type = 'credit' group by accountid having count(*) > 2;

-- 30. transactions from customers in 'Delhi'
select * from transactions 
where accountid in (
    select accountid from accounts 
    where customerid in (select customerid from customers where address like '%Delhi%')
);

-- 31. accounts that had at least one failed transaction
select distinct accountid from transactions where status = 'failed';

-- 32. function to get transaction amount by id
delimiter //
create function get_transaction_amount(txn_id int)
returns decimal(10,2)
deterministic
begin
    declare amt decimal(10,2);
    select amount into amt from transactions where transactionid = txn_id limit 1;
    return amt;
end;
// delimiter ;

select get_transaction_amount(1001);
drop function if exists get_transaction_amount;

-- 33. function to count transactions by mode
delimiter //
create function count_by_mode(txn_mode varchar(20))
returns int
deterministic
begin
    declare cnt int;
    select count(*) into cnt from transactions where mode = txn_mode;
    return cnt;
end;
// delimiter ;

select count_by_mode('upi');
drop function if exists count_by_mode;

-- 34. view of all credit transactions
create view credit_txns as 
select transactionid, amount from transactions where type = 'credit';
select * from credit_txns;
drop view if exists credit_txns;

-- 35. view joining transactions and customer names
create view transaction_customer_view as
select t.transactionid, c.fullname, t.amount
from transactions t 
join accounts a on t.accountid = a.accountid
join customers c on a.customerid = c.customerid;
select * from transaction_customer_view;
drop view if exists transaction_customer_view;

-- 36. all upi transactions over 5000
with big_upi as (
    select * from transactions where mode = 'upi' and amount > 5000
) select * from big_upi;

-- 37. transactions in july 2024
with july_txns as (
    select * from transactions where month(transactiondate) = 7 and year(transactiondate) = 2024
) select * from july_txns;

-- 38. debit transactions below 2000
with small_debit as (
    select * from transactions where type = 'debit' and amount < 2000
) select * from small_debit;

-- 39. delete failed transactions
with to_delete as (
    select transactionid from transactions where status = 'failed'
) delete from transactions where transactionid in (select transactionid from to_delete);

-- 40. procedure to get transaction by id
delimiter //
create procedure get_transaction_by_id(in id int)
begin
    select * from transactions where transactionid = id;
end;
// delimiter ;

call get_transaction_by_id(1001);
drop procedure if exists get_transaction_by_id;

-- 41. procedure to get all transactions by account
delimiter //
create procedure get_txns_by_account(in acc_id int)
begin
    select * from transactions where accountid = acc_id;
end;
// delimiter ;

call get_txns_by_account(101);
drop procedure if exists get_txns_by_account;

-- 42. create user and grant select on transactions
create user 'txn_viewer'@'localhost' identified by 'viewtxn';
grant select on transactions to 'txn_viewer'@'localhost';
drop user if exists 'txn_viewer'@'localhost';

-- 43. create user, grant/revoke, drop
create user 'txn_editor'@'localhost' identified by 'edittxn';
grant select, update on transactions to 'txn_editor'@'localhost';
revoke update on transactions from 'txn_editor'@'localhost';
drop user if exists 'txn_editor'@'localhost';

-- 44. create role for transaction managers
create role 'txn_manager';
grant select on transactions to 'txn_manager';
create user 'manager2'@'localhost' identified by 'managerpass';
grant 'txn_manager' to 'manager2'@'localhost';
revoke 'txn_manager' from 'manager2'@'localhost';
drop role if exists 'txn_manager';

-- 45. start transaction and commit
start transaction;
update transactions set mode = 'netbanking' where mode = 'net banking';
commit;

-- 46. start transaction and rollback
start transaction;
update transactions set amount = amount + 100 where transactionid = 1002;
rollback;

-- 47. use savepoint and rollback to it
start transaction;
update transactions set amount = 9999 where transactionid = 1003;
savepoint before_change;
update transactions set mode = 'cash' where transactionid = 1003;
rollback to before_change;
commit;

-- 48. multiple updates with rollback
start transaction;
update transactions set type = 'adjustment' where amount < 0;
rollback;

-- 49. update and rollback to savepoint
start transaction;
update transactions set status = 'error' where transactionid = 1015;
savepoint sp1;
update transactions set description = 'invalid update' where transactionid = 1015;
rollback to sp1;
commit;

-- 50. insert, savepoint, rollback to savepoint, commit
start transaction;
insert into transactions (transactionid, accountid, transactiondate, type, amount, description, mode, status, balanceafter, branchcode)
values (9999, 101, '2024-07-30', 'credit', 2000.00, 'test insert', 'upi', 'success', 60000.00, 'SBI001');
savepoint insert_txn;
delete from transactions where transactionid = 9999;
rollback to insert_txn;
commit;