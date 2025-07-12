use viviana_mall;  

-- 1. Select all records where vehicle type is 'Car'
select * from parking where vehicle_type = 'Car';
-- 2. Count of all vehicles parked
select count(*) as total_vehicles from parking;
-- 3. Select vehicles parked at level 'B2'
select * from parking where parking_level = 'B2';
-- 4. Select all parking records ordered by entry time
select * from parking order by entry_time;
-- 5. Select parking details with charges more than 50
select * from parking where charges > 50;
-- 6. Select all parking on a specific date
select * from parking where date(entry_time) = '2025-07-12';
-- 7. Select record by parking ID = 5
select * from parking where parking_id = 5;
-- 8. Select distinct parking levels
select distinct(parking_level) from parking;
-- 9. Count of vehicles by type
select vehicle_type, count(*) as total from parking group by vehicle_type;
-- 10. Select vehicles parked between 2 PM and 4 PM
select * from parking where time(entry_time) between '14:00:00' and '16:00:00';
-- 11. Add column slot_number varchar(10)
alter table parking add column slot_number varchar(10);
-- 12. Update slot_number to 'S1' for parking_id 1 to 5
update parking set slot_number = 'S1' where parking_id between 1 and 5;
-- 13. Add column payment_mode varchar(20) with default 'Cash'
alter table parking add column payment_mode varchar(20) default 'Cash';
-- 14. Drop column slot_number
alter table parking drop column slot_number;
-- 15. Add column created_at with default current timestamp
alter table parking add column created_at timestamp default current_timestamp;
-- 16. Rename column created_at to created_on
alter table parking rename column created_at to created_on;
-- 17. Drop column created_on
alter table parking drop column created_on;
-- 18. Drop column payment_mode
alter table parking drop column payment_mode;
-- 19. Update charges to 100 where parking_id = 10
update parking set charges = 100 where parking_id = 10;
-- 20. Update all charges +10 where level is B1
update parking set charges = charges + 10 where parking_level = 'B1';
-- 21. Convert parking_level to lowercase
select lower(parking_level) from parking;
-- 22. Get length of parking_level strings
select parking_id, length(parking_level) as level_length from parking;
-- 23. Select parking with alias p_data
select * from parking as p_data;
-- 24. Select vehicle_type with alias name
select vehicle_type as Vehicle from parking;

-- 25. Get vehicles with same charges as parking_id 2
select * from parking where charges = (
    select charges from parking where parking_id = 2
);

-- 26. Get records with maximum charges
select * from parking where charges = (
    select max(charges) from parking
);

-- 27. Get vehicle types parked on '2025-07-10'
select vehicle_type from parking where date(entry_time) = '2025-07-10';

-- 28. Count of vehicles parked after 3 PM
select count(*) from parking where time(entry_time) > '15:00:00';

-- 29. Get charges for parking ID
delimiter //
create function Get_Charges_By_Id(pid int)
returns int
deterministic
begin
    declare amount int;
    select charges into amount from parking where parking_id = pid;
    return amount;
end;
//
delimiter ;

-- 30. Get total cars parked
delimiter //
create function Count_Cars()
returns int
deterministic
begin
    declare total int;
    select count(*) into total from parking where vehicle_type = 'Car';
    return total;
end;
//
delimiter ;

-- 31. Get vehicles by level
delimiter //
create function Vehicles_By_Level(level_ varchar(10))
returns varchar(200)
deterministic
begin
    declare result varchar(200);
    select group_concat(vehicle_type separator ', ') into result from parking where parking_level = level_;
    return result;
end;
//
delimiter ;

-- 32. View with charges above 60
create view HighCharges as
select * from parking where charges > 60;

-- 33. Create or replace view for bike parking only
create or replace view BikeParking as
select * from parking where vehicle_type = 'Bike';

-- 34. View with selected columns only
create view ParkingSummary as
select parking_id, vehicle_type, charges from parking;

-- 35. CTE: Cars parked after 2 PM
with CarsAfter2 as (
    select * from parking where vehicle_type = 'Car' and time(entry_time) > '14:00:00'
)
select * from CarsAfter2;

-- 36. CTE: Bike parking summary
with BikesOnly as (
    select * from parking where vehicle_type = 'Bike'
)
select * from BikesOnly;

-- 37. CTE: Ordered charges
with OrderedCharges as (
    select * from parking order by charges desc
)
select * from OrderedCharges;

-- 38. CTE: Delete car parked before 12 PM
with CarMorning as (
    select parking_id from parking where vehicle_type = 'Car' and time(entry_time) < '12:00:00'
)
delete from parking where parking_id in (select parking_id from CarMorning);

-- 39. Procedure to get parking by ID
delimiter //
create procedure GetParkingById(in pid int)
begin
    select * from parking where parking_id = pid;
end;
//
delimiter ;

-- 40. Procedure to list vehicles by type
delimiter //
create procedure GetParkingByType(in type varchar(50))
begin
    select * from parking where vehicle_type = type;
end;
//
delimiter ;

-- 41. Modified procedure to show ID, type, and charges
delimiter //
create procedure ParkingSummaryByType(in type varchar(50))
begin
    select parking_id, vehicle_type, charges from parking where vehicle_type = type;
end;
//
delimiter ;

-- 42. Create user and grant select
create user 'ParkingUser'@'localhost' identified by 'park123';
grant select on parking to 'ParkingUser'@'localhost';
drop user if exists 'ParkingUser'@'localhost';

-- 43. Grant/revoke privileges
create user 'park_operator'@'localhost' identified by 'parkop123';
grant select, update on parking to 'park_operator'@'localhost';
revoke update on parking from 'park_operator'@'localhost';
drop user if exists 'park_operator'@'localhost';

-- 44. Create role and assign
create role 'ParkingManager';
grant select on parking to 'ParkingManager';
create user 'manager'@'localhost' identified by 'manager123';
grant 'ParkingManager' to 'manager'@'localhost';
revoke 'ParkingManager' from 'manager'@'localhost';
drop role if exists 'ParkingManager';

-- 45. Update charges with commit
start transaction;
update parking set charges = 90 where parking_id = 1;
commit;

-- 46. Update and rollback
start transaction;
update parking set charges = 150 where parking_id = 2;
rollback;

-- 47. Savepoint before update, rollback to it
start transaction;
update parking set charges = 200 where parking_id = 3;
savepoint before_update;
update parking set charges = 210 where parking_id = 3;
rollback to before_update;

-- 48. Calculate parking duration in minutes
select parking_id, timediff(exit_time, entry_time) as duration from parking;

-- 49. Get average charges per vehicle type
select vehicle_type, avg(charges) as avg_charges from parking group by vehicle_type;

-- 50. Vehicles with duration more than 2 hours
select *, timestampdiff(minute, entry_time, exit_time) as duration_mins
from parking
where timestampdiff(minute, entry_time, exit_time) > 120;