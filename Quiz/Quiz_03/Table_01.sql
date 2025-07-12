use viviana_mall;  

-- 1. stores with floor_no  = 0
select * from Stores where floor_no = 0;
-- 2. floors count
select floor_no, count(*) floors from stores group by floor_no;
-- 3.select brand starting with H
select * from Stores where brand like 'H%';
-- 4.select stores orderd by floors 
select * from Stores order by floor_no;
-- 5.select stores with category = 'Fashion'
select * from Stores where Category = 'Fashion';
-- 6.count the total records in stores
select count(*) as Records_count from stores;
-- 7.select stores with name 'pantaloons'
select * from stores where store_name = 'Pantaloons';
-- 8.select distinct category of stores
select distinct(Category) from stores;
-- 9.select category with total count
select Category,count(*) as category_count from stores group by Category;
-- 10.select stores with opening_hours contain '10:00 PM'
select * from stores where opening_hours like '%10:00 PM%';
-- 11.add column Owner_name with datatype varchar
alter table Stores add column Owner_name varchar(100);
select * from Stores;
-- 12.update owner_name to 'ME' with specific conditions
update Stores set Owner_name = 'Me' where store_id in (1,2,3,4,5,6,7,8,9,10);
-- 13.add column Established_date with default date
alter table Stores add column Established_date date default ('2025-01-01');
-- 14.drop column Established_date
alter table Stores drop column Established_date;
-- 15.add column Established_date with current_timestamp
alter table Stores add column Established_date timestamp default current_timestamp;
-- 16.rename column Established_date to Establishment_date
alter table Stores rename column Established_date to Establishment_date;
-- 17.drop column Establishment_date
alter table Stores drop column Establishment_date;
-- 18.drop column Owner_name
alter table Stores drop column Owner_name;
-- 19.update stores to set category = 'Fashionsss' with specific condition
select * from stores;
update Stores set Category = 'Fashionsss' where Category = 'Fashion';
-- 20.update contact_nulber to '091-98765432' with specific condition
update Stores set contact_number = '091-98765432' where Category in ('Fashionsss','Electronics');
-- 21.make store_name to uppercase
select upper(store_name) from stores;
-- 22.get the length of store_name
select store_name, length(store_name) as store_name_length from stores;
-- 23.select stores with alias name store_ids
select * from stores as store_ids;
-- 24.select store_name with alias name
select Store_name as name from stores;

-- 25.JOINS ( join table stores and events)
select s.Store_id,s.store_name,e.event_name,e.target_audience from stores s
join Events e
on s.Store_name = e.Organizer;

-- 26.JOINS ( join table stores and Employee)
select s.Store_id,s.store_name,Em.name as Employee_name,Em.Designation from stores s
join Employee Em 
on s.Brand = Em.Department;

-- 27.JOINS ( join table stores and Feedback)
select s.Store_id,s.store_name,F.customer_name,F.Rating,F.Comment,F.Response from stores s
join  Feedback F 
on s.Brand = F.Store_visited;

-- 28.SUBQUERIES (Get stores located on the same floor as 'Zara')
select store_name, floor_no from stores where floor_no = (
    select floor_no
    from stores
    where store_name = 'Zara'
);

-- 29.SUBQUERIES (Show each store with total number of stores on the same floor)
select store_name, floor_no,
       (select count(*) from stores s2 where s2.floor_no = s1.floor_no) as stores_on_same_floor
from stores s1;

-- 30.SUBQUERIES (List all store names that belong to the same category as 'Hamleys')
select store_name, category from stores where category in (
    select category
    from stores
    where store_name = 'Hamleys'
);

-- 31.SUBQUERIES (Get the stores that have the maximum floor number)
select store_name, floor_no from stores where floor_no = (
    select max(floor_no)
    from stores
);

-- 32.User-Defined-Functions(to get Opening_hours of Stores)
-- Create a function
delimiter //
create function Get_Opening_Hours_By_Store(store VARCHAR(100))
returns varchar(50)
deterministic
begin
    declare hrs varchar(50);
    select opening_hours into hrs
    from stores
    where store_name = store
    limit 1;
    return hrs;
end
// delimiter ;

-- Use the Function
select Get_Opening_Hours_By_Store('Zara') as Opening_Hours;
select Get_Opening_Hours_By_Store('Crossword') as Opening_Hours;
-- Drop the Function
drop function if exists Get_Opening_Hours_By_Store;

-- 33.User-Defined-Functions(to get count of Stores by Categories)
-- create a function
delimiter //
create function Get_Store_By_Categories(Category_ varchar(100))
returns int
deterministic
begin
	declare total int;
    select count(*) into total from stores where category = category_ ;
    return total;
end
// delimiter ;
-- Use the Function
select Get_Store_By_Categories('Fashionsss') as Stores;
select Get_Store_By_Categories('Cafe') as Stores;
-- Drop the Function
drop function if exists Get_Store_By_Categories;

-- 34.User-Defined-Functions(to get Stores by Floor_no)
-- Create a Function 
delimiter //
create function Get_Store_By_Floor(floors INT)
returns varchar(500)
deterministic
begin
    declare result varchar(255);
    select group_concat(store_name separator ', ') into result from stores where floor_no = floors;
    return result;
end;
// delimiter ;
-- Use the Function
select Get_Store_By_Floor(0) as Stores_On_Floor0;
select Get_Store_By_Floor(1) as Stores_On_Floor1;
select Get_Store_By_Floor(2) as Stores_On_Floor2;
-- Drop the Function
drop function if exists Get_Store_By_Floor;

-- 35.Create Views(CREATE Views --> SHOW Views --> DROP Views)
-- Create View
create view StoresView 
as select store_id, store_name, Category, Brand from stores;
-- Show View
select * from StoresView;
-- Drop View
drop view if exists StoresView;

-- 36.Create or Replace view with specific conditions (CREATE Views --> SHOW Views --> DROP Views)
-- Create View
create or replace view StoresViews 
as select store_id ,store_name , floor_no from stores where floor_no < 2; 
-- Show View
select * from StoresViews;
-- Drop View
drop view if exists StoresView;

-- 37.Create View with Joins(CREATE Views(Join store & events) --> SHOW Views --> DROP Views)
-- Create View
create view Store_Events as 
select  s.store_id,s.store_name,e.event_name,e.date,e.venue 
from Stores s 
join Events e 
on s.Store_name = e.Organizer;
-- Show View
select * from Store_Events;
-- Drop View
drop view if exists Store_Events;

-- 38.CTE(Use CTE to get Store with specific floors)
with Store_Floors as (
	select store_id, store_name, brand, floor_no from Stores where floor_no in (1,2)
)select * from Store_Floors;

-- 39.CTE(Use CTE to get store_name starting with 'H')
with Specific_Brands as (
	select * from stores where Store_name like ('H%')
)select * from Specific_Brands;

-- 40.CTE(Use CTE to get floors ordered by asc order)
with Ordered_By_floor as (
	select * from stores order by floor_no
)select * from Ordered_By_floor;

-- 41.CTE(Use CTE to delete floor 4th)
with Delete_floor_4 as (
    select store_id from stores where floor_no = 4
)delete from stores where store_id in (select store_id from Delete_floor_4);

-- 42.Store_Procedures (CREATE PROCEDURE --> CALL PROCEDURE --> DROP PROCEDURE)
-- CREATE PROCEDURE
delimiter //
create procedure GetStoresByid(in id int)
begin
    select * from stores where store_id = id;
end 
// delimiter ;
-- CALL PROCEDURE
call GetStoresByid(10);
-- DROP PROCEDURE
drop procedure if exists GetStoresByid;

-- 43.Store_Procedures (CREATE PROCEDURE --> CALL PROCEDURE --> DROP PROCEDURE)
delimiter //
create procedure ModifyStore(in floor_number int)
begin
	select store_name from stores where floor_no = floor_number;
end
// delimiter ;
-- CALL PROCEDURE
call ModifyStore(1);
-- DROP PROCEDURE
drop procedure if exists ModifyStore;

-- 44.Store_Procedures (MODIFY PROCEDURE --> CALL PROCEDURE --> DROP PROCEDURE)
delimiter //
create procedure ModifyStore(in floor_number int)
begin
	select store_name, Category, Brand from stores where floor_no = floor_number;
end
// delimiter ;
-- CALL PROCEDURE
call ModifyStore(1);
-- DROP PROCEDURE
drop procedure if exists ModifyStore;

-- 45.DCL(create User --> grant SELECT permissions --> drop User)
create user 'StoreUser1'@'localhost' identified by 'StoreUSER1';
grant select, update on stores to 'StoreUser1'@'localhost';
drop user if exists 'StoreUser1'@'localhost';

-- 46.DCL(create User --> grant SELECT,UPDATE permissions --> check permissions --> revoke permissions --> drop User)
create user 'Store_user'@'localhost' identified by 'storeuser123';
grant select,update on stores to 'Store_user'@'localhost';
select * from information_schema.user_privileges where grantee = "'Store_user'@'localhost'";
revoke select on Stores from 'Store_user'@'localhost';
select * from information_schema.user_privileges where grantee = "'Store_user'@'localhost'";
drop user if exists 'Store_user'@'localhost';

-- 47.DCL(create ROLE --> grant permissions to ROLE --> create USER --> grant ROLE to USER -- > check ROLE --> revoke ROLE --> drop ROLE)
create role 'Store_Manager';
grant select on Stores to 'Store_Manager';
create user 'StoreManager'@'localhost' identified by 'StoreUSER1';
grant 'Store_Manager' to 'StoreManager'@'localhost';
show grants for 'StoreManager'@'localhost';
revoke 'Store_Manager' from 'StoreManager'@'localhost';
drop role if exists 'Store_Manager';

-- 48. TCL(start transaction --> update --> commit)
select * from stores;
set sql_safe_updates = 0;
start transaction;
update Stores set contact_number = '022-1234567' where store_name = 'H&M';
commit;

-- 49.TCL(start transaction --> update --> rollback)
start transaction;
update Stores set contact_number = '970212345' where store_name = 'Zara';
rollback;

-- 50.TCL(start transaction --> update --> savepoint at 'XYZ' --> update --> rollback to 'XYZ')
start transaction;
update Stores set contact_number = '022-123' where store_name = 'Croma';
savepoint at_croma;
update Stores set contact_number = '123-456' where store_name = 'Croma';
rollback to savepoint at_croma;