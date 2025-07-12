use viviana_mall;  

-- 1. Select all employees in the department 'Zara'
select * from employee where department = 'Zara';
-- 2. Count total number of employees
select count(*) as total_employees from employee;
-- 3. Select employees with designation starting with 'S'
select * from employee where designation like 'S%';
-- 4. Select all employees ordered by store_id
select * from employee order by store_id;
-- 5. Select employees with designation = 'Sales Associate'
select * from employee where designation = 'Sales Associate';
-- 6. Select employees who work in store_id = 3
select * from employee where store_id = 3;
-- 7. Select employee by name 'Amit Tiwari'
select * from employee where name = 'Amit Tiwari';
-- 8. Select distinct departments
select distinct department from employee;
-- 9. Count of employees by department
select department, count(*) as total from employee group by department;
-- 10. Select employees with names containing 'a'
select * from employee where name like '%a%';
-- 11. Add column Email varchar
alter table employee add column Email varchar(100);
-- 12. Update email with dummy values
update employee set Email = concat(lower(replace(name, ' ', '')), '@mall.com');
-- 13. Add column Salary int default 25000
alter table employee add column Salary int default 25000;
-- 14. Drop column Email
alter table employee drop column Email;
-- 15. Add column joined_on with default current timestamp
alter table employee add column joined_on timestamp default current_timestamp;
-- 16. Rename column joined_on to date_joined
alter table employee rename column joined_on to date_joined;
-- 17. Drop column date_joined
alter table employee drop column date_joined;
-- 18. Drop column Salary
alter table employee drop column Salary;
-- 19. Update designation = 'Senior Sales Associate' where name = 'Sneha Nair'
update employee set designation = 'Senior Sales Associate' where name = 'Sneha Nair';
-- 20. Update department = 'BaskinR' where store_id = 9
update employee set department = 'BaskinR' where store_id = 9;
-- 21. Convert names to uppercase
select upper(name) from employee;
-- 22. Get length of each employee name
select name, length(name) as name_length from employee;
-- 23. Select employees with alias `emp_data`
select * from employee as emp_data;
-- 24. Select department with alias `Dept`
select department as Dept from employee;

-- 25. Get employees from same department as 'Amit Tiwari'
select * from employee where department = (
    select department from employee where name = 'Amit Tiwari'
);

-- 26. Get employee(s) from department with max employees
select * from employee where department = (
    select department from (
        select department from employee group by department order by count(*) desc limit 1
    ) as sub
);

-- 27. Get names of employees working in store_id > 5
select name from employee where store_id > 5;

-- 28. Count employees with designation containing 'Manager'
select count(*) from employee where designation like '%Manager%';

-- 29. Get designation by employee name
delimiter //
create function Get_Designation_By_Name(empname varchar(100))
returns varchar(100)
deterministic
begin
    declare desig varchar(100);
    select designation into desig from employee where name = empname limit 1;
    return desig;
end;
//
delimiter ;

-- 30. Get count of employees by department
delimiter //
create function Count_Employees_By_Dept(dept varchar(100))
returns int
deterministic
begin
    declare total int;
    select count(*) into total from employee where department = dept;
    return total;
end;
//
delimiter ;

-- 31. Get employee names by department
delimiter //
create function Emp_By_Dept(dept varchar(100))
returns varchar(500)
deterministic
begin
    declare result varchar(500);
    select group_concat(name separator ', ') into result from employee where department = dept;
    return result;
end;
//
delimiter ;

-- 32. Create view for only Store Managers
create view StoreManagers as
select * from employee where designation like '%Manager%';

-- 33. Create or replace view for employees in store_id <= 5
create or replace view EarlyEmployees as
select * from employee where store_id <= 5;

-- 34. View with selected columns only
create view EmployeeBrief as
select employee_id, name, department from employee;

-- 35. CTE: Employees from department 'Croma'
with CromaEmployees as (
    select * from employee where department = 'Croma'
)
select * from CromaEmployees;

-- 36. CTE: Employees with 'Associate' in designation
with Associates as (
    select * from employee where designation like '%Associate%'
)
select * from Associates;

-- 37. CTE: Ordered by name length
with OrderedLength as (
    select * from employee order by length(name) desc
)
select * from OrderedLength;

-- 38. CTE: Delete employees in department 'BaskinR'
with ToDelete as (
    select employee_id from employee where department = 'BaskinR'
)
delete from employee where employee_id in (select employee_id from ToDelete);

-- 39. Procedure: Get employee by ID
delimiter //
create procedure GetEmployeeById(in eid int)
begin
    select * from employee where employee_id = eid;
end;
//
delimiter ;

-- 40. Procedure: Get employees by department
delimiter //
create procedure GetEmployeesByDept(in dept varchar(100))
begin
    select * from employee where department = dept;
end;
//
delimiter ;

-- 41. Modified procedure: Get name and designation by department
delimiter //
create procedure EmployeeInfoByDept(in dept varchar(100))
begin
    select name, designation from employee where department = dept;
end;
//
delimiter ;

-- 42. Create user and grant select
create user 'EmpViewer'@'localhost' identified by 'emp123';
grant select on employee to 'EmpViewer'@'localhost';
drop user if exists 'EmpViewer'@'localhost';

-- 43. Grant/revoke privileges
create user 'emp_admin'@'localhost' identified by 'admin123';
grant select, update on employee to 'emp_admin'@'localhost';
revoke update on employee from 'emp_admin'@'localhost';
drop user if exists 'emp_admin'@'localhost';

-- 44. Create role and assign
create role 'HRManager';
grant select on employee to 'HRManager';
create user 'hruser'@'localhost' identified by 'hr123';
grant 'HRManager' to 'hruser'@'localhost';
revoke 'HRManager' from 'hruser'@'localhost';
drop role if exists 'HRManager';

-- 45. Update department and commit
start transaction;
update employee set department = 'Books' where name = 'Lata Sharma';
commit;

-- 46. Update and rollback
start transaction;
update employee set designation = 'Intern' where name = 'Dev Mehta';
rollback;

-- 47. Savepoint before designation update, rollback to it
start transaction;
update employee set designation = 'Executive' where name = 'Neha Kulkarni';
savepoint before_exec;
update employee set designation = 'Senior Executive' where name = 'Neha Kulkarni';
rollback to before_exec;

-- 48. JOINS (Inner Join with Basic Info)
select e.employee_id, e.name, e.designation, e.department, s.store_id, s.store_name, s.brand
from employee e
inner join stores s
on e.department = s.brand;

-- 49. JOINS (Employees with Floor Number of Their Store)
select e.name as employee_name, e.designation, s.store_name, s.floor_no
from employee e
join stores s
on e.department = s.brand;

-- 50. JOINS (Count of Employees Per Brand (Grouped Result))
select s.brand, count(e.employee_id) as total_employees
from employee e
join stores s
on e.department = s.brand
group by s.brand;