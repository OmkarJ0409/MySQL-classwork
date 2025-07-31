-- 1. select all branches in 'Delhi'
select * from branches where city = 'Delhi';
-- 2. select branches in 'Uttar Pradesh'
select * from branches where state = 'Uttar Pradesh';
-- 3. select all branches where manager name starts with 'A'
select * from branches where managername like 'A%';
-- 4. select branches with contact number starting with '022'
select * from branches where contact like '022%';
-- 5. select unique cities
select distinct city from branches;
-- 6. select unique states
select distinct state from branches;
-- 7. select branches ordered by branchname
select * from branches order by branchname;
-- 8. select all branches where workinghours = '9 AM - 4 PM'
select * from branches where workinghours = '9 AM - 4 PM';
-- 9. count branches in each state
select state, count(*) as total_branches from branches group by state;
-- 10. count total branches in india
select count(*) as total_branches from branches;
-- 11. find branches managed by 'Ajay Pawar'
select * from branches where managername = 'Ajay Pawar';
-- 12. add column established_year
alter table branches add column established_year int;
-- 13. rename column contact to contact_number
alter table branches rename column contact to contact_number;
-- 14. modify city column to varchar(100)
alter table branches modify column city varchar(100);
-- 15. drop column established_year
alter table branches drop column established_year;
-- 16. add column is_metro with default true
alter table branches add column is_metro boolean default true;
-- 17. drop column is_metro
alter table branches drop column is_metro;
-- 18. update city to 'Delhi NCR' where city = 'Delhi'
update branches set city = 'Delhi NCR' where city = 'Delhi';
-- 19. update manager names to uppercase
update branches set managername = upper(managername);
-- 20. update working hours to '10 AM - 5 PM' for Mumbai branch
update branches set workinghours = '10 AM - 5 PM' where city = 'Mumbai';
-- 21. select branchcode and length of branchname
select branchcode, length(branchname) as name_length from branches;
-- 22. concat city and state into full_location
select concat(city, ', ', state) as full_location from branches;
-- 23. count branches with name containing 'SBI'
select count(*) from branches where branchname like '%SBI%';
-- 24. alias managername as branch_manager
select managername as branch_manager from branches;

-- 25. join branches with loans on branchcode
select b.branchname, l.loanid, l.amount
from branches b
join loans l on b.branchcode = l.branchcode;

-- 26. select branches with active home loans
select distinct b.*
from branches b
join loans l on b.branchcode = l.branchcode
where l.loantype = 'Home' and l.status = 'Active';

-- 27. select total loan amount per branch
select b.branchname, sum(l.amount) as total_loan
from branches b
join loans l on b.branchcode = l.branchcode
group by b.branchname;

-- 28. find branch with longest manager name
select * from branches where length(managername) = (
    select max(length(managername)) from branches
);

-- 29. find cities with more than 1 branch
select city from branches group by city having count(*) > 1;

-- 30. select branches from states starting with 'M'
select * from branches where state like 'M%';

-- 31. select branches managed by people with last name 'Singh'
select * from branches where managername like '%Singh';

-- 32. function to get branch name by code
delimiter //
create function get_branch_name(bcode varchar(10))
returns varchar(100)
deterministic
begin
    declare bname varchar(100);
    select branchname into bname from branches where branchcode = bcode limit 1;
    return bname;
end;
// delimiter ;

select get_branch_name('SBI001');
drop function if exists get_branch_name;

-- 33. function to count branches in a state
delimiter //
create function count_branches_state(statename varchar(50))
returns int
deterministic
begin
    declare cnt int;
    select count(*) into cnt from branches where state = statename;
    return cnt;
end;
// delimiter ;

select count_branches_state('Maharashtra');
drop function if exists count_branches_state;

-- 34. view of all metro city branches
create view metro_branches as
select * from branches where city in ('Delhi', 'Mumbai', 'Chennai', 'Kolkata', 'Bangalore');
select * from metro_branches;
drop view if exists metro_branches;

-- 35. view joining branches and total loans
create view branch_loan_summary as
select b.branchcode, b.branchname, sum(l.amount) as total_loans
from branches b
join loans l on b.branchcode = l.branchcode
group by b.branchcode, b.branchname;
select * from branch_loan_summary;
drop view if exists branch_loan_summary;

-- 36. branches in cities ending with 'pur'
with pur_branches as (
    select * from branches where city like '%pur'
) select * from pur_branches;

-- 37. branches in states containing 'Pradesh'
with pradesh_states as (
    select * from branches where state like '%Pradesh%'
) select * from pradesh_states;

-- 38. branches with manager name less than 10 chars
with short_names as (
    select * from branches where length(managername) < 10
) select * from short_names;

-- 39. delete branches in 'Agra'
delete from branches where city = 'Agra';

-- 40. procedure to get branch by branchcode
delimiter //
create procedure get_branch(in bcode varchar(10))
begin
    select * from branches where branchcode = bcode;
end;
// delimiter ;

call get_branch('SBI001');
drop procedure if exists get_branch;

-- 41. procedure to list branches in a state
delimiter //
create procedure list_branches_by_state(in sname varchar(50))
begin
    select * from branches where state = sname;
end;
// delimiter ;

call list_branches_by_state('Rajasthan');
drop procedure if exists list_branches_by_state;

-- 42. create user and grant select on branches
create user 'branch_viewer'@'localhost' identified by 'viewbranch';
grant select on branches to 'branch_viewer'@'localhost';
drop user if exists 'branch_viewer'@'localhost';

-- 43. create user, grant/revoke, drop
create user 'branch_editor'@'localhost' identified by 'editbranch';
grant select, update on branches to 'branch_editor'@'localhost';
revoke update on branches from 'branch_editor'@'localhost';
drop user if exists 'branch_editor'@'localhost';

-- 44. create role for branch admins
create role 'branch_admin';
grant select on branches to 'branch_admin';
create user 'admin2'@'localhost' identified by 'adminpass';
grant 'branch_admin' to 'admin2'@'localhost';
revoke 'branch_admin' from 'admin2'@'localhost';
drop role if exists 'branch_admin';

-- 45. start transaction and commit branch update
start transaction;
update branches set managername = 'New Manager' where branchcode = 'SBI005';
commit;

-- 46. start transaction and rollback manager change
start transaction;
update branches set managername = 'Temp Name' where branchcode = 'SBI006';
rollback;

-- 47. update with savepoint and rollback to it
start transaction;
update branches set workinghours = '8 AM - 3 PM' where branchcode = 'SBI007';
savepoint sp_update;
update branches set managername = 'Wrong Name' where branchcode = 'SBI007';
rollback to sp_update;
commit;

-- 48. multiple updates with rollback
start transaction;
update branches set city = 'TestCity' where branchcode like 'SBI0%';
rollback;

-- 49. update and rollback to savepoint
start transaction;
update branches set city = 'TestState' where branchcode = 'SBI010';
savepoint city_change;
update branches set managername = 'Test Manager' where branchcode = 'SBI010';
rollback to city_change;
commit;

-- 50. insert, savepoint, rollback to savepoint, commit
start transaction;
insert into branches (branchcode, branchname, ifsccode, micrcode, address, city, state, contact_number, managername, workinghours)
values ('SBI999', 'Test Branch', 'SBIN999999', '999999999', 'Test Address', 'Test City', 'Test State', '01100000000', 'Test Manager', '10 AM - 4 PM');
savepoint insert_branch;
delete from branches where branchcode = 'SBI999';
rollback to insert_branch;
commit;