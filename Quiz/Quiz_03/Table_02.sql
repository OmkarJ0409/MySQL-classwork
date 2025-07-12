use viviana_mall;  

-- 1. Select events happening on '2025-08-01'
select * from events where date = '2025-08-01';
-- 2. Count of all upcoming events
select count(*) as total_events from events;
-- 3. Select events with name starting with 'T'
select * from events where event_name like 'T%';
-- 4. Select all events ordered by date
select * from events order by date;
-- 5. Select events organized by 'Croma'
select * from events where organizer = 'Croma';
-- 6. Select events with target audience as 'Shoppers'
select * from events where target_audience = 'Shoppers';
-- 7. Select event by name 'Book Reading'
select * from events where event_name = 'Book Reading';
-- 8. Select distinct venues from the events
select distinct venue from events;
-- 9. Select target audience with count of events
select target_audience, count(*) as audience_events from events group by target_audience;
-- 10. Select events with time containing '6:00 PM'
select * from events where time like '%6:00 PM%';
-- 11. Add column host_contact varchar
alter table events add column host_contact varchar(20);
-- 12. Update host_contact to a default value
update events set host_contact = '022-99999999' where organizer in ('Zara', 'Croma', 'Hamleys');
-- 13. Add column registered_participants int with default 0
alter table events add column registered_participants int default 0;
-- 14. Drop column host_contact
alter table events drop column host_contact;
-- 15. Add column created_on with current timestamp
alter table events add column created_on timestamp default current_timestamp;
-- 16. Rename column created_on to created_date
alter table events rename column created_on to created_date;
-- 17. Drop column created_date
alter table events drop column created_date;
-- 18. Drop column registered_participants
alter table events drop column registered_participants;
-- 19. Update event_name = 'Monsoon Mega Sale' where event_name = 'Monsoon Sale'
update events set event_name = 'Monsoon Mega Sale' where event_name = 'Monsoon Sale';
-- 20. Update venue = 'Main Hall' where venue = '1nd Floor'
update events set venue = 'Main Hall' where venue = '1nd Floor';
-- 21. Convert event_name to uppercase
select upper(event_name) from events;
-- 22. Get length of each event_name
select event_name, length(event_name) as name_length from events;
-- 23. Select events with alias `event_list`
select * from events as event_list;
-- 24. Select event_name with alias `EventTitle`
select event_name as EventTitle from events;

-- 25. Join events with stores based on organizer name
select e.event_id, e.event_name, s.store_id, s.category
from events e
join stores s on e.organizer = s.store_name;

-- 26. Join events with feedback where feedback is related to event organizer
select e.event_name, f.customer_name, f.comment
from events e
join feedback f on e.organizer = f.store_visited;

-- 27. Join events with employee where department matches organizer
select e.event_name, em.name, em.designation
from events e
join employee em on e.organizer = em.department;

-- 28. Events with same venue as 'Tech Expo'
select * from events where venue = (
    select venue from events where event_name = 'Tech Expo'
);

-- 29. Event with maximum participants (using created column)
select * from events where date = (
    select max(date) from events
);

-- 30. Events by same organizer as 'Toy Parade'
select * from events where organizer = (
    select organizer from events where event_name = 'Toy Parade'
);

-- 31. Event(s) with the latest date
select * from events where date = (
    select max(date) from events
);

-- 32. Get time of an event by name
delimiter //
create function Get_Event_Time(ev_name varchar(100))
returns varchar(100)
deterministic
begin
    declare ev_time varchar(100);
    select time into ev_time from events where event_name = ev_name limit 1;
    return ev_time;
end;
//
delimiter ;

-- 33. Get count of events by audience
delimiter //
create function Count_By_Audience(aud varchar(50))
returns int
deterministic
begin
    declare cnt int;
    select count(*) into cnt from events where target_audience = aud;
    return cnt;
end;
//
delimiter ;

-- 34. Get events by organizer name
delimiter //
create function Events_By_Organizer(org varchar(100))
returns varchar(500)
deterministic
begin
    declare result varchar(500);
    select group_concat(event_name separator ', ') into result from events where organizer = org;
    return result;
end;
//
delimiter ;

-- 35. Create View with selected columns
create view EventsView as
select event_id, event_name, organizer from events;

-- 36. Create/Replace View for events happening in July
create or replace view JulyEvents as
select * from events where month(date) = 7;

-- 37. View with join between events and stores
create view EventDetails as
select e.event_name, e.venue, s.category
from events e
join stores s on e.organizer = s.store_name;

-- 38. CTE: Events in August
with AugEvents as (
    select * from events where month(date) = 8
)
select * from AugEvents;

-- 39. CTE: Events organized by brands starting with 'B'
with BrandEvents as (
    select * from events where organizer like 'B%'
)
select * from BrandEvents;

-- 40. CTE: Ordered events by time
with TimeOrder as (
    select * from events order by time
)
select * from TimeOrder;

-- 41. CTE: Delete event by invalid venue
with InvalidVenue as (
    select event_id from events where venue = '1nd Floor'
)
delete from events where event_id in (select event_id from InvalidVenue);

-- 42. Procedure: Get event by ID
delimiter //
create procedure GetEventById(in eid int)
begin
    select * from events where event_id = eid;
end;
//
delimiter ;

-- 43. Procedure: Get events by audience
delimiter //
create procedure GetEventsByAudience(in aud varchar(50))
begin
    select * from events where target_audience = aud;
end;
//
delimiter ;

-- 44. Modify procedure: Include venue
delimiter //
create procedure GetEventsByAudience(in aud varchar(50))
begin
    select event_name, venue from events where target_audience = aud;
end;
//
delimiter ;


-- 45. Create user and grant select
create user 'EventUser1'@'localhost' identified by 'Event123';
grant select on events to 'EventUser1'@'localhost';
drop user if exists 'EventUser1'@'localhost';

-- 46. Grant, revoke and check permissions
create user 'event_viewer'@'localhost' identified by 'view123';
grant select, update on events to 'event_viewer'@'localhost';
revoke update on events from 'event_viewer'@'localhost';
drop user if exists 'event_viewer'@'localhost';

-- 47. Create role and assign to user
create role 'EventManager';
grant select on events to 'EventManager';
create user 'manager'@'localhost' identified by 'manager123';
grant 'EventManager' to 'manager'@'localhost';
revoke 'EventManager' from 'manager'@'localhost';
drop role if exists 'EventManager';

-- 48. Start transaction and commit
start transaction;
update events set venue = 'Mega Hall' where event_name = 'Fashion Fiesta';
commit;

-- 49. Start transaction and rollback
start transaction;
update events set time = '9:00 AM – 6:00 PM' where event_name = 'Tech Expo';
rollback;

-- 50. Savepoint and rollback to point
start transaction;
update events set venue = 'Old Venue' where event_name = 'Ice Cream Fest';
savepoint before_change;
update events set venue = 'New Hall' where event_name = 'Ice Cream Fest';
rollback to before_change;
