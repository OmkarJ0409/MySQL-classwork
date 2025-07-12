use viviana_mall; 
 
-- 1. Get all feedback records
select * from feedback;
-- 2. Feedbacks with rating = 5
select * from feedback where rating = 5;
-- 3. Feedbacks with response = 'Pending'
select * from feedback where response = 'Pending';
-- 4. Feedbacks for store 'Zara'
select * from feedback where store_visited = 'Zara';
-- 5. Feedbacks visited after July 5, 2025
select * from feedback where visit_date > '2025-07-05';
-- 6. Feedbacks with comment containing 'Great'
select * from feedback where comment like '%Great%';
-- 7. Feedbacks by 'Ravi Kumar'
select * from feedback where customer_name = 'Ravi Kumar';
-- 8. Count total feedback records
select count(*) as Total_Feedbacks from feedback;
-- 9. Count of feedbacks per store
select store_visited, count(*) as Feedback_Count from feedback group by store_visited;
-- 10. Feedbacks ordered by rating descending
select * from feedback order by rating desc;
-- 11. Feedbacks where rating >= 4 and response is 'Responded'
select * from feedback where rating >= 4 and response = 'Responded';
-- 12. Feedbacks with customer_name ending in 'a'
select * from feedback where customer_name like '%a';
-- 13. Feedbacks with comment length > 15
select * from feedback where length(comment) > 15;
-- 14. Feedbacks for either 'H&M' or 'Croma'
select * from feedback where store_visited in ('H&M', 'Croma');
-- 15. Feedbacks where comment is not null
select * from feedback where comment is not null;
-- 16. Average rating per store
select store_visited, avg(rating) as Avg_Rating from feedback group by store_visited;
-- 17. Min and Max rating across all feedbacks
select min(rating) as Min_Rating, max(rating) as Max_Rating from feedback;
-- 18. Feedbacks grouped by response type
select response, count(*) as Response_Count from feedback group by response;
-- 19. Number of feedbacks per rating
select rating, count(*) as Total from feedback group by rating;
-- 20. Count of distinct customers
select count(distinct(customer_name)) as Unique_Customers from feedback;

-- 21. Join feedback with stores on brand = store_visited
select f.customer_name, f.store_visited, s.store_name, s.floor_no
from feedback f
join stores s
on f.store_visited = s.brand;

-- 22. Get only feedbacks where store is on floor 2
select f.*, s.floor_no from feedback f
join stores s
on f.store_visited = s.brand
where s.floor_no = 2;

-- 23. Join feedback and show only 'Pending' responses with store contact
select f.customer_name, f.response, s.contact_number
from feedback f
join stores s
on f.store_visited = s.brand
where f.response = 'Pending';

-- 24. Feedbacks with rating equal to the max rating
select * from feedback where rating = (
	select max(rating) from feedback
);

-- 25. Get feedbacks for stores that had more than 1 feedback
select * from feedback where store_visited in (
	select store_visited from feedback group by store_visited having count(*) > 1
);

-- 26. Get customer names who visited stores on same floor as 'Zara'
select f.customer_name
from feedback f
where f.store_visited in (
	select brand from stores where floor_no = (
		select floor_no from stores where brand = 'Zara'
	)
);

-- 27. Get feedbacks where comment length equals max length
select * from feedback where length(comment) = (
	select max(length(comment)) from feedback
);

-- 28. Function to get comment by customer
delimiter //
create function Get_Comment_By_Customer(cust varchar(100))
returns text
deterministic
begin
	declare fb text;
	select comment into fb from feedback where customer_name = cust limit 1;
	return fb;
end;
//
delimiter ;

-- Use Function
select Get_Comment_By_Customer('Aarti Sharma');
drop function if exists Get_Comment_By_Customer;

-- 29. Function to count feedback by store
delimiter //
create function Count_Feedbacks_By_Store(store varchar(100))
returns int
deterministic
begin
	declare cnt int;
	select count(*) into cnt from feedback where store_visited = store;
	return cnt;
end;
//
delimiter ;
-- Use Function
select Count_Feedbacks_By_Store('Zara');
drop function if exists Count_Feedbacks_By_Store;

-- 30. Create view of all responded feedbacks
create view Responded_Feedbacks as
select * from feedback where response = 'Responded';

select * from Responded_Feedbacks;
drop view if exists Responded_Feedbacks;

-- 31. Create view joining feedback with store floor info
create view Feedback_Store_Details as
select f.feedback_id, f.customer_name, s.store_name, s.floor_no
from feedback f join stores s
on f.store_visited = s.brand;

select * from Feedback_Store_Details;
drop view if exists Feedback_Store_Details;

-- 32. CTE for high rating feedbacks
with High_Rated as (
	select * from feedback where rating >= 4
)
select * from High_Rated;

-- 33. CTE for feedbacks on '2025-07-10'
with Specific_Date as (
	select * from feedback where visit_date = '2025-07-10'
)
select * from Specific_Date;

-- 34. CTE with join to show feedback with floor info
with Floor_Feedbacks as (
	select f.feedback_id, f.customer_name, s.floor_no
	from feedback f join stores s
	on f.store_visited = s.brand
)
select * from Floor_Feedbacks;

-- 35. Procedure to get feedback by ID
delimiter //
create procedure GetFeedbackByID(in id int)
begin
	select * from feedback where feedback_id = id;
end;
//
delimiter ;

call GetFeedbackByID(5);
drop procedure if exists GetFeedbackByID;

-- 36. Procedure to show feedbacks by response type
delimiter //
create procedure ShowFeedbackByResponse(in resp varchar(50))
begin
	select * from feedback where response = resp;
end;
//
delimiter ;

call ShowFeedbackByResponse('Pending');
drop procedure if exists ShowFeedbackByResponse;

-- 37. Create user for feedback access
create user 'feedback_user'@'localhost' identified by 'feedback123';
grant select on feedback to 'feedback_user'@'localhost';

-- 38. Revoke access and drop user
revoke select on feedback from 'feedback_user'@'localhost';
drop user if exists 'feedback_user'@'localhost';

-- 39. Commit Example
start transaction;
update feedback set response = 'Investigating' where feedback_id = 3;
commit;

-- 40. Rollback Example
start transaction;
update feedback set response = 'Pending' where feedback_id = 4;
rollback;

-- 41. Savepoint Rollback
start transaction;
update feedback set response = 'Pending' where feedback_id = 6;
savepoint sp1;
update feedback set rating = 1 where feedback_id = 6;
rollback to sp1;
commit;

-- 42. Feedbacks for stores on 'Ground Floor'
select f.* from feedback f
join stores s on f.store_visited = s.brand
where s.venue = 'Ground Floor';

-- 43. List of stores with at least one feedback
select distinct store_visited from feedback;

-- 44. Count of 5-star feedbacks by store
select store_visited, count(*) as five_star_count
from feedback where rating = 5 group by store_visited;

-- 45. Update response to 'Responded' for all with rating = 5
update feedback set response = 'Responded' where rating = 5;

-- 46. Add a new column for feedback status
alter table feedback add column status varchar(50) default 'Recorded';

-- 47. Update status based on response
update feedback set status = case
	when response = 'Responded' then 'Closed'
	when response = 'Pending' then 'In Progress'
	else 'Reviewing'
end;

-- 48. Drop column status
alter table feedback drop column status;
-- 49. Rename column response to feedback_response
alter table feedback rename column response to feedback_response;
-- 50. Revert rename
alter table feedback rename column feedback_response to response;