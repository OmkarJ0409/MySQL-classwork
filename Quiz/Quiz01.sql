/*
1.Create a Database - University
2.Do proper Analysis to organize data properly
3.There must be 5 tables within minimum 5 attributes,insert 5 records.
4.Do Proper Documentations.
5.Analyse table data & write Situation based Condition queries :-
	1.create,insert,select,truncate,drop
	2.select queries(20)
    3.alter queries(20)
    4.update queries(20)
    5.delete queries(20)
*/

-- create a database name University
create database University;

-- Select the database to use it
use University;

-- -------------------------------------------Database Analysis---------------------------------------
/*

T1.Department_Head(Department_id,Department_name,Department_head_name,Qualification,Experience)

T2.Professors(Professor_id,Department_id,Professor_name,Subject,Qualification,Experience) 

T3.Classes(Class_id,Class_name,Department_id,Professor_id,Students,Date)

T4.Students(Students_id,Department_id,Class_id,Student_name,Year,Classes_attending)  

T5.Labs(Lab_id,Lab_name,Lab_incharge,Lab_Professor,Students)

*/
-- Table.1-Department_Head------------------------------------------------------------------------
create table Department_Head(
Department_id int primary key,
Department_name varchar(50),
Department_Head_name varchar(50),
Qualification varchar(50),
Experience int
);

-- Insert records into the table 
insert into Department_Head()
values
(1,'Computer Science','Dr. sharad kantute','PHD in Computer Science',15),
(2,'Chemical','Dr. Seema Nehate','Double PHD in Chemical Engineering',20),
(3,'Information Technology','Dr. Yash Bhosale','PHD in Information Technology',12),
(4,'Civil','Dr. Kishor Gawade','PHD in Civil Constructions',7),
(5,'Instrumentation Technology','Dr. Raj Kadam','PHD in Instrumentation',4),
(6, 'Mechanical', 'Dr. Ramesh Patil', 'PHD in Mechanical Engineering', 18),
(7, 'Electrical', 'Dr. Neeta Deshmukh', 'PHD in Electrical Systems', 10),
(8, 'Electronics & Telecommunication', 'Dr. Swati Kulkarni', 'PHD in Communication Systems', 14),
(9, 'Biomedical', 'Dr. Pranav Joshi', 'PHD in Biomedical Engineering', 9),
(10, 'Artificial Intelligence', 'Dr. Meenal Shah', 'PHD in Artificial Intelligence', 6);

-- To view all the records
select * from Department_Head;

-- To delete the records from the table
truncate table Department_Head;

-- To delete the records and the table
drop table Department_Head;

-- SELECT QUERIES(20)
-- 1.select Department_Head specific columns from Table
select Department_id,Department_name,Department_Head_name from Department_Head;
-- 2.select Department_Head where experience is > 10
select * from Department_Head where experience > 10;
-- 3.select Department_Head ordered by experience
select * from Department_Head order by experience desc;
-- 4.select Department_Head where id = 3
select * from Department_Head where Department_id = 3;
-- 5.select Department_Head where Department_Head contains 'technology'
select * from Department_Head where department_name  like '%Technology%';
-- 6.select Department_Head where department head name is 'Dr. seema nehate'
select * from Department_Head where Department_Head_name = 'Dr. Seema Nehate';
-- 7.select Department_Head where Department_Head is 'civil'
select * from Department_Head where department_name = 'Civil';
-- 8.select Department_Head ordered by id desc
select * from Department_Head order by Department_id desc;
-- 9.select Department_Head ordered by qualification char_length desc
select * from Department_Head order by char_length(Qualification) desc;
-- 10.select Department_Head according to their character length using group by
select Qualification,(char_length(Qualification)) as char_count from Department_Head  group by Qualification;
-- 11.select Department_Head where experience is 12
select * from Department_Head where experience = 12;
-- 12.select Department_Head where id = 5
select * from Department_Head where department_id = 5;
-- 13.select Department_Head where experience <= 10
select * from Department_Head where experience <= 10;
-- 14.select Department_Head where Qualification contains 'PHD'
select * from Department_Head where Qualification like '%PHD%';
-- 15.select Department_Head ordered my max char_length of Department_name
select Department_name, char_length(Department_name) as char_count from Department_Head group by Department_name order by char_count desc;
-- 16.select Department_Head where department_name is 'mechanical'
select * from Department_Head where department_name = 'Mechanical';
-- 17.select Department_Head where departnemt_head_name contains 'kishor'
select * from Department_Head where Department_Head_name like '%Kishor%';
-- 18.select Department_Head where department_name is 'chemical'
select * from Department_Head where Department_name = 'Chemical';
-- 19.select Department_Head where department_name comtains '%cal%'
select * from Department_Head where department_name like '%cal%';
-- 20.select Department_Head where qualification contains 'Engineering'
select * from Department_Head where Qualification like '%Engineering%';

-- ALTER QUERIES(20)
-- 1.alter Department_Head to add department_creation date
alter table Department_Head add column department_creation date; 
-- 2.rename column department_creation ---> created_on
alter table Department_Head rename column department_creation  to created_on;
-- 3.drop the created_on column
alter table Department_Head drop column created_on;
-- 4.add column with default timestamp
alter table Department_Head add column created_on datetime  default current_timestamp;
-- 5.add column with created_by with default naem 'mumbai university'
alter table Department_Head add column created_by varchar(50) default 'Mumbai University'; 
-- 6.modify the created_by datatype varchar(50) ----> varchar(100)
alter table Department_Head modify column created_by varchar(100);
-- 7.rename department_head_name  -----> department_incharge
alter table Department_Head rename column Department_Head_name to  Department_incharge;
-- 8.rename column department_id -----> id
alter table Department_Head rename column Department_id to id;
-- 9.drop column created_by
alter table Department_head drop created_by;
-- 10.drop column created_on
alter table Department_Head drop created_on;
-- 11.rename table Experiences to Experience_Years
alter table Department_Head rename column Experience to Experience_Years;
-- 12.modify table Experience_years int -----> varchar(10)
alter table Department_Head modify column Experience_Years varchar(10);
-- 13.add column Professors
alter table Department_Head add column Professors int;
-- 14.drop column professors
alter table Department_Head drop professors;
-- 15.re-add column professors with default value of 5
alter table Department_Head add column Professors int default 5;
-- 16.rename the department_name -----> name
alter table Department_Head rename column Department_name to name;
-- 17.drop the professors column
alter table Department_Head drop column Professors;
-- 18.add column section
alter table Department_Head add column Section varchar(50);
-- 19.add column department_floor
alter table Department_Head add column department_floor int;
-- 20. drop column Section
alter table Department_Head drop column Section;

-- UPDATE QUERIES(20)
set sql_safe_updates = 0;

-- 1.update the Department_floor to 1 of 'Computer Science'
update Department_Head set department_floor = 1 where name = 'Computer Science';
-- 2.update the Department_floor to 2 of 'Chemical'
update Department_Head set department_floor = 2 where name = 'Chemical';
-- 3.update the Department_floor to 3 of 'Information Technology'
update Department_Head set department_floor = 3 where name = 'Information Technology';
-- 4.update the Department_floor to 4 of 'Civil'
update Department_Head set department_floor = 4 where name = 'Civil';
-- 5.update the Department_floor to 5 of 'Instrumentation Technology'
update Department_Head set department_floor = 5 where name = 'Instrumentation Technology';
-- 6.update the Department_floor to 6 of 'Mechanical'
update Department_Head set department_floor = 6 where name = 'Mechanical';
-- 7.update the Department_floor to 7 of 'Electrical'
update Department_Head set department_floor = 7 where name = 'Electrical';
-- 8.update the Department_floor to 8 of 'Electronics & Telecommunication'
update Department_Head set department_floor = 8 where name = 'Electronics & Telecommunication';
-- 9.update the Department_floor to 9 of 'Biomedical'
update Department_Head set department_floor = 9 where name = 'Biomedical';
-- 10.update the Department_floor to 10 of 'Artificial Intelligence'
update Department_Head set department_floor = 10 where name = 'Artificial Intelligence';
-- 11.update the name 'Chemical' -----> 'Chemical Engineering' where id is 2
update Department_Head set name = 'Chemical Engineering' where id = 2;
-- 12.update qualifiaction where name is 'Mechanical'
update Department_Head set Qualification = 'Triple PHD in Mechanical Engineering' where name = 'Mechanical';
-- 13.update qualification where department_incharge is 'Dr. Swati Kulkarni'
update Department_Head set Qualification = 'PostDoctorate in Communication Systems' where department_incharge = 'Dr. Swati Kulkarni';
-- 14.update experience_years where id = 5
update Department_Head set Experience_Years = 8 where id = 5;
-- 15.update department_floor = 5 where name is 'civil' and 'mechanical'
update Department_Head set department_floor = 5 where name in ('Civil','Mechanical');
-- 16.update department_incharge where id = 3
update Department_Head set Department_incharge = 'Dr. Yash Tanaji Bhosale' where id = 3;
-- 17.update department_incharge where experience_year = 7
update Department_Head set Department_incharge = 'Dr. Kishor Rajendra Gawade' where Experience_Years = 7;
-- 18.update department_incharge where qualification = 'PostDoctorate in Communication Systems'
update Department_Head set Department_incharge = 'Associate Dr. Swati Kulkarni' where Qualification = 'PostDoctorate in Communication Systems';
-- 19.update department_incharge where department_floor = 10
update Department_Head set Department_incharge = 'Associate Dr. Meenal Dhaval Shah' where department_floor = 10;
-- 20.update Department_Head where id = 5
update Department_Head set Department_incharge = 'Dr. Raj Mangesh Kadam' where id = 5;

-- DELETE QUERIES(20)
-- 1.delete Department_Head with floor 1
delete from Department_Head where department_floor = 1;
-- 2.delete Department_Head with floor 3
delete from Department_Head where department_floor = 3;
-- 3.delete Department_Head with floor 5
delete from Department_Head where department_floor = 5;
-- 4.delete Department_Head with floor 7
delete from Department_Head where department_floor = 7;
-- 5.delete Department_Head with floor 9
delete from Department_Head where department_floor = 9;
-- 6.delete Department_Head with id 2
delete from Department_Head where id = 2;
-- 7.delete Department_Head with id 10
delete from Department_Head where id = 10;
-- 8.delete Department_Head with id 8
delete from Department_Head where id = 8;
-- 9.delete Department_Head where experience years > 10
delete from Department_Head where Experience_Years > 10;
-- 10.delete Department_Head where department_floor < 5
delete from Department_Head where department_floor < 5;
-- 11.delete Department_Head with specific department_incharge or name 
delete from Department_Head where department_incharge = 'Dr. Raj Kadam' or name = 'Biomedical'; 
-- 12.delete Department_Head with specific Qualification
delete from Department_Head where qualification = 'PHD in Electrical Systems';
-- 13.delete Department_Head with experience_years = 6
delete from Department_Head where experience_Years = 6;
-- 14.delete Department_Head where experience_between (8-16)
delete from Department_Head where experience_years between 8 and 16;
-- 15.delete Department_Head where id = 2
delete from Department_Head where id = 2;
-- 16.delete Department_Head where id = 4
delete from Department_Head where id = 4;
-- 17.delete Department_Head where id = 6
delete from Department_Head where id = 6;
-- 18.delete Department_Head where id = 10
delete from Department_Head where id = 10;
-- 19.delete Department_Head where department_floor = 5
delete from Department_Head where department_floor = 5;
-- 20.delete Department_Head where Experience_Year = 20
delete from Department_Head where Experience_Years = 20;


-- Table.2-Professors------------------------------------------------------------------------
create table Professors(
Professor_id int primary key,
Department_id int,
Professor_name varchar(50),
Subject varchar(50),
Qualification varchar(50),
Experience int
);

-- insert the records into the table
insert into Professors
values
(1,1,'Mr. Nilesh Kamble','Web Development','Masters in Computer Science',5),
(2,2,'Mrs. Smita Pawar','Fundamentals of Elements','MBA in Chemical Engineering',7),
(3,3,'Mr.  Dilip Patil','Blockchain','Masters in Blockchain Technology',4),
(4,4,'Mrs. Vaibhavi Salvi','Concrete Technology','Masters in Civil',3),
(5,5,'Mr.  Omkar Jagtap','Digital Electronics','Masters in Digital Electronics',2),
(6, 6, 'Dr. Rakesh Pawar', 'Thermodynamics', 'Masters in Mechanical Engineering', 11),
(7, 7, 'Mrs. Anjali Kamat', 'Electrical Machines', 'Masters in Electrical Engineering', 8),
(8, 8, 'Mr. Sandeep Rao', 'Digital Communication', 'Masters in E&TC', 6),
(9, 9, 'Dr. Reena Shah', 'Biomedical Instrumentation', 'PhD in Biomedical Engineering', 10),
(10, 10, 'Ms. Priya Khedekar', 'Neural Networks', 'Masters in AI and ML', 5);

-- To view all the records
select * from Professors;

-- To delete the records from the table
truncate table Professors;

-- To delete the records and the table
drop table Professors;

-- SELECT QUERIES(20)
-- 1. select professor name and subject only
select Professor_name, Subject from Professors;
-- 2. select all professors having more than 6 years of experience
select * from Professors where Experience > 6;
-- 3. select professors sorted by experience in ascending order
select * from Professors order by Experience asc;
-- 4. fetch professor with Professor_id = 4
select * from Professors where Professor_id = 4;
-- 5. get all professors where subject contains the word 'Tech'
select * from Professors where Subject like '%Tech%';
-- 6. select professor whose name is exactly 'Mr. Nilesh Kamble'
select * from Professors where Professor_name = 'Mr. Nilesh Kamble';
-- 7. get professor record for subject = 'Neural Networks'
select * from Professors where Subject = 'Neural Networks';
-- 8. get all professors in descending order of their ID
select * from Professors order by Professor_id desc;
-- 9. order professors by qualification length ascending
select * from Professors order by char_length(Qualification);
-- 10. group qualifications and count their character length
select Qualification, char_length(Qualification) as length from Professors group by Qualification;
-- 11. select professor with exactly 10 years experience
select * from Professors where Experience = 10;
-- 12. get record where professor_id is 2
select * from Professors where Professor_id = 2;
-- 13. list professors who have experience less than or equal to 5
select * from Professors where Experience <= 5;
-- 14. filter professors with 'PhD' mentioned in their qualification
select * from Professors where Qualification like '%PhD%';
-- 15. list subjects ordered by length of their name (longest first)
select Subject, char_length(Subject) as subject_length from Professors group by Subject order by subject_length desc;
-- 16. fetch professors from department 7 (Electrical)
select * from Professors where Department_id = 7;
-- 17. search for professor whose name includes 'Omkar'
select * from Professors where Professor_name like '%Omkar%';
-- 18. fetch records where subject is 'Digital Electronics'
select * from Professors where Subject = 'Digital Electronics';
-- 19. select professors whose qualification includes 'Communication'
select * from Professors where Qualification like '%Communication%';
-- 20. get professors teaching subjects with 'Network' in name
select * from Professors where Subject like '%Network%';

-- ALTER QUERIES(20)
-- 1. add column professor_joining date
alter table Professors add column professor_joining date;
-- 2. rename column professor_joining → joining_date
alter table Professors rename column professor_joining to joining_date;
-- 3. drop the joining_date column
alter table Professors drop column joining_date;
-- 4. add joining_date column with default current timestamp
alter table Professors add column joining_date datetime default current_timestamp;
-- 5. add created_by column with default 'Admin Office'
alter table Professors add column created_by varchar(50) default 'Admin Office';
-- 6. modify created_by column size from varchar(50) → varchar(100)
alter table Professors modify column created_by varchar(100);
-- 7. rename column Professor_name → Full_Name
alter table Professors rename column Professor_name to Full_Name;
-- 8. rename Professor_id → id
alter table Professors rename column Professor_id to id;
-- 9. drop column created_by
alter table Professors drop column created_by;
-- 10. drop column joining_date
alter table Professors drop column joining_date;
-- 11. rename column Experience → Experience_Years
alter table Professors rename column Experience to Experience_Years;
-- 12. change datatype of Experience_Years from int → varchar(10)
alter table Professors modify column Experience_Years varchar(10);
-- 13. add column Age
alter table Professors add column Age int;
-- 14. drop column Age
alter table Professors drop column Age;
-- 15. re-add Age column with default 30
alter table Professors add column Age int default 30;
-- 16. rename Subject column → Teaching_Subject
alter table Professors rename column Subject to Teaching_Subject;
-- 17. drop column Age again
alter table Professors drop column Age;
-- 18. add column Email
alter table Professors add column Email varchar(100);
-- 19. add column is_permanent with default value true
alter table Professors add column is_permanent boolean default true;
-- 20. drop column Email
alter table Professors drop column Email;

-- UPDATE QUERIES(20)
set sql_safe_updates = 0;

-- 1. update the Experience_Years to 6 for 'Mr. Nilesh Kamble'
update Professors set Experience_Years = 6 where Full_Name = 'Mr. Nilesh Kamble';
-- 2. update the Experience_Years to 8 for 'Mrs. Smita Pawar'
update Professors set Experience_Years = 8 where Full_Name = 'Mrs. Smita Pawar';
-- 3. update the Experience_Years to 5 for 'Mr.  Dilip Patil'
update Professors set Experience_Years = 5 where Full_Name = 'Mr.  Dilip Patil';
-- 4. update the Experience_Years to 4 for 'Mrs. Vaibhavi Salvi'
update Professors set Experience_Years = 4 where Full_Name = 'Mrs. Vaibhavi Salvi';
-- 5. update the Experience_Years to 3 for 'Mr.  Omkar Jagtap'
update Professors set Experience_Years = 3 where Full_Name = 'Mr.  Omkar Jagtap';
-- 6. update the Teaching_Subject to 'Data Structures' where id = 1
update Professors set Teaching_Subject = 'Data Structures' where id = 1;
-- 7. update the Qualification where id = 6
update Professors set Qualification = 'PHD in Thermal Engineering' where id = 6;
-- 8. update Full_Name where Teaching_Subject = 'Electrical Machines'
update Professors set Full_Name = 'Dr. Anjali S. Kamat' where Teaching_Subject = 'Electrical Machines';
-- 9. update Teaching_Subject to 'Wireless Communication' where id = 8
update Professors set Teaching_Subject = 'Wireless Communication' where id = 8;
-- 10. update Qualification where Full_Name = 'Dr. Reena Shah'
update Professors set Qualification = 'PHD in Advanced Biomedical Engineering' where Full_Name = 'Dr. Reena Shah';
-- 11. update Full_Name where id = 3
update Professors set Full_Name = 'Dr. Dilip R. Patil' where id = 3;
-- 12. update Experience_Years to 12 where id = 6
update Professors set Experience_Years = 12 where id = 6;
-- 13. update Qualification where Full_Name = 'Ms. Priya Khedekar'
update Professors set Qualification = 'PHD in Artificial Intelligence' where Full_Name = 'Ms. Priya Khedekar';
-- 14. update Teaching_Subject to 'AI & Neural Systems' where id = 10
update Professors set Teaching_Subject = 'AI & Neural Systems' where id = 10;
-- 15. update Experience_Years to 10 where id in (4,5)
update Professors set Experience_Years = 10 where id in (4,5);
-- 16. update Teaching_Subject to 'Advanced Concrete Tech' where Full_Name = 'Mrs. Vaibhavi Salvi'
update Professors set Teaching_Subject = 'Advanced Concrete Tech' where Full_Name = 'Mrs. Vaibhavi Salvi';
-- 17. update Qualification to 'Masters in Embedded Systems' where id = 5
update Professors set Qualification = 'Masters in Embedded Systems' where id = 5;
-- 18. update Full_Name where Teaching_Subject = 'Blockchain'
update Professors set Full_Name = 'Mr. Dilip Bhanudas Jagtap' where Teaching_Subject = 'Blockchain';
-- 19. update Qualification to 'PhD in Next-Gen Communication' where id = 8
update Professors set Qualification = 'PhD in Next-Gen Communication' where id = 8;
-- 20. update Full_Name to 'Dr. Raj Kadam' where id = 5
update Professors set Full_Name = 'Dr. Raj Kadam' where id = 5;

-- DELETE QUERIES(20)
-- 1. Delete professor with id = 1
delete from Professors where id = 1;
-- 2. Delete professor with id = 5
delete from Professors where id = 5;
-- 3. Delete professor with id = 10
delete from Professors where id = 10;
-- 4. Delete professors who teach 'Blockchain'
delete from Professors where Teaching_Subject = 'Blockchain';
-- 5. Delete professors with experience less than 4
delete from Professors where Experience_Years < 4;
-- 6. Delete professors with experience greater than or equal to 10
delete from Professors where Experience_Years >= 10;
-- 7. Delete professor with the name 'Mr. Sandeep Rao'
delete from Professors where Full_name = 'Mr. Sandeep Rao';
-- 8. Delete professors who teach 'Web Development'
delete from Professors where Teaching_Subject = 'Web Development';
-- 9. Delete professor where qualification is 'Masters in E&TC'
delete from Professors where Qualification = 'Masters in E&TC';
-- 10. Delete professors who teach 'Electrical Machines' or 'Thermodynamics'
delete from Professors where Teaching_Subject in ('Electrical Machines', 'Thermodynamics');
-- 11. Delete professors with experience = 5
delete from Professors where Experience_Years = 5;
-- 12. Delete professor with id = 6
delete from Professors where id = 6;
-- 13. Delete professor with the name 'Mrs. Smita Pawar'
delete from Professors where Full_name = 'Mrs. Smita Pawar';
-- 14. Delete professors from Department_id = 3
delete from Professors where id = 3;
-- 15. Delete professor with subject containing 'Neural'
delete from Professors where Teaching_Subject like '%Neural%';
-- 16. Delete professors with qualification like '%Chemical%'
delete from Professors where Qualification like '%Chemical%';
-- 17. Delete professors with experience between 6 and 9
delete from Professors where Experience_Years between 6 and 9;
-- 18. Delete professor with the name 'Dr. Reena Shah'
delete from Professors where Full_name = 'Dr. Reena Shah';
-- 19. Delete professors with subject like '%Digital%'
delete from Professors where Teaching_Subject like '%Digital%';
-- 20. Delete professor where qualification = 'Masters in Civil'
delete from Professors where Qualification = 'Masters in Civil';


-- Table.3-Classes------------------------------------------------------------------------
create table Classes(
Class_id int primary key,
Class_name varchar(50),
Department_id int,
Professor_id int,
Students int,
Date date 
);

-- insert the records into the table
insert into Classes
values
(1,'Web Development',1,1,60,'2025-06-07'),
(2,'Fundamentals of Elements',2,2,45,'2025-06-08'),
(3,'Blockchain',3,3,55,'2025-06-09'),
(4,'Concrete Technology',4,4,43,'2025-06-10'),
(5,'Digital Electronics',5,5,25,'2025-06-11'),
(6, 'Web Development', 1, 1, 58, '2025-06-12'),
(7, 'Thermodynamics', 6, 6, 50, '2025-06-13'),
(8, 'Digital Electronics', 5, 5, 28, '2025-06-14'),
(9, 'Electrical Machines', 7, 7, 40, '2025-06-15'),
(10, 'Neural Networks', 10, 10, 30, '2025-06-16');

-- To view all the records
select * from Classes;

-- To delete the records from the table
truncate table Classes;

-- To delete the records and the table
drop table Classes;

-- SELECT QUERIES(20)
-- 1. Select class name and date only
select Class_name, Date from Classes;
-- 2. Select all classes with more than 50 students
select * from Classes where Students > 50;
-- 3. Select all classes sorted by student count in ascending order
select * from Classes order by Students asc;
-- 4. Fetch class with Class_id = 4
select * from Classes where Class_id = 4;
-- 5. Get all classes where name contains the word 'Digital'
select * from Classes where Class_name like '%Digital%';
-- 6. Select class where class name is exactly 'Blockchain'
select * from Classes where Class_name = 'Blockchain';
-- 7. Get class record for subject = 'Neural Networks'
select * from Classes where Class_name = 'Neural Networks';
-- 8. Get all classes in descending order of Class_id
select * from Classes order by Class_id desc;
-- 9. Order classes by class name length (ascending)
select * from Classes order by char_length(Class_name) asc;
-- 10. Group by class name and count the number of students
select Class_name, count(*) as total_classes from Classes group by Class_name;
-- 11. Select class with exactly 60 students
select * from Classes where Students = 60;
-- 12. Get record where Professor_id is 2
select * from Classes where Professor_id = 2;
-- 13. List all classes where student count is less than or equal to 30
select * from Classes where Students <= 30;
-- 14. Filter classes conducted on or after '2025-06-12'
select * from Classes where Date >= '2025-06-12';
-- 15. List class names ordered by longest name first
select Class_name, char_length(Class_name) as length from Classes order by length desc;
-- 16. Fetch classes from department 5
select * from Classes where Department_id = 5;
-- 17. Search for class names that include the word 'Technology'
select * from Classes where Class_name like '%Technology%';
-- 18. Fetch records where class name is 'Web Development'
select * from Classes where Class_name = 'Web Development';
-- 19. Select classes where date is between '2025-06-10' and '2025-06-14'
select * from Classes where Date between '2025-06-10' and '2025-06-14';
-- 20. Get classes with number of students between 25 and 45
select * from Classes where Students between 25 and 45;

-- ALTER QUERIES(20)
-- 1. add column class_time of type time
alter table classes add column class_time time;
-- 2. rename column class_time → timing
alter table classes rename column class_time to timing;
-- 3. drop the timing column
alter table classes drop column timing;
-- 4. add class_created column with default current timestamp
alter table classes add column class_created datetime default current_timestamp;
-- 5. add created_by column with default 'academic dept.'
alter table classes add column created_by varchar(50) default 'academic dept.';
-- 6. modify created_by column size from varchar(50) → varchar(100)
alter table classes modify column created_by varchar(100);
-- 7. rename column class_name → subject
alter table classes rename column class_name to subject;
-- 8. rename column class_id → id
alter table classes rename column class_id to id;
-- 9. drop column created_by
alter table classes drop column created_by;
-- 10. drop column class_created
alter table classes drop column class_created;
-- 11. rename column date → class_date
alter table classes rename column date to class_date;
-- 12. change datatype of students from int → varchar(10)
alter table classes modify column students varchar(10);
-- 13. add column mode with default 'offline'
alter table classes add column mode varchar(20) default 'offline';
-- 14. drop column mode
alter table classes drop column mode;
-- 15. re-add column mode with default 'online'
alter table classes add column mode varchar(20) default 'online';
-- 16. rename column department_id → dept_id
alter table classes rename column department_id to dept_id;
-- 17. rename column professor_id → faculty_id
alter table classes rename column professor_id to faculty_id;
-- 18. add column room_number
alter table classes add column room_number varchar(10);
-- 19. modify column room_number to be int instead of varchar
alter table classes modify column room_number int;
-- 20. drop column room_number
alter table classes drop column room_number;

-- UPDATE QUERIES(20)
set sql_safe_updates = 0;

-- 1. update students to 65 for class_id = 1
update classes set students = 65 where id = 1;
-- 2. update date to '2025-06-20' for class_id = 2
update classes set class_date = '2025-06-20' where id = 2;
-- 3. update professor_id to 3 for class_id = 3
update classes set faculty_id = 3 where id = 3;
-- 4. update students to 50 where class_name = 'Concrete Technology'
update classes set students = 50 where subject = 'Concrete Technology';
-- 5. update department_id to 8 where class_name = 'Digital Electronics'
update classes set dept_id = 8 where subject = 'Digital Electronics';
-- 6. update professor_id to 7 where students < 30
update classes set faculty_id = 7 where students < 30;
-- 7. update date to '2025-06-18' where professor_id = 1
update classes set class_date = '2025-06-18' where faculty_id = 1;
-- 8. update class_name to 'Advanced Web Development' where class_id = 6
update classes set subject = 'Advanced Web Development' where id = 6;
-- 9. update students to 45 where department_id = 5
update classes set students = 45 where dept_id = 5;
-- 10. update date to current_date where class_id = 10
update classes set class_date = current_date where id = 10;
-- 11. update professor_id to 9 where class_name like '%Machines%'
update classes set faculty_id = 9 where subject like '%Machines%';
-- 12. update department_id to 3 where class_id in (3,4)
update classes set dept_id = 3 where id in (3,4);
-- 13. update students to 35 where date > '2025-06-12'
update classes set students = 35 where class_date > '2025-06-12';
-- 14. update professor_id to 5 where class_name = 'Digital Electronics'
update classes set faculty_id = 5 where subject = 'Digital Electronics';
-- 15. update date to '2025-06-22' where students >= 50
update classes set class_date = '2025-06-22' where students >= 50;
-- 16. update class_name to 'Intro to Neural Networks' where id = 10
update classes set subject = 'Intro to Neural Networks' where id = 10;
-- 17. update department_id to 2 where professor_id = 2
update classes set dept_id = 2 where faculty_id = 2;
-- 18. update students to 20 where class_name = 'Thermodynamics'
update classes set students = 20 where subject = 'Thermodynamics';
-- 19. update professor_id to 4 where class_name = 'Concrete Technology'
update classes set faculty_id = 4 where subject = 'Concrete Technology';
-- 20. update date to '2025-06-25' where department_id = 1
update classes set class_date = '2025-06-25' where dept_id = 1;

-- DELETE QUERIES(20)
-- 1. delete class with class_id = 1
delete from classes where id = 1;
-- 2. delete class with class_id = 5
delete from classes where id = 5;
-- 3. delete class with class_id = 10
delete from classes where id = 10;
-- 4. delete classes where class_name = 'Blockchain'
delete from classes where subject = 'Blockchain';
-- 5. delete classes where students less than 30
delete from classes where students < 30;
-- 6. delete classes where students greater than or equal to 50
delete from classes where students >= 50;
-- 7. delete classes held on '2025-06-15'
delete from classes where class_date = '2025-06-15';
-- 8. delete classes with professor_id = 1
delete from classes where faculty_id = 1;
-- 9. delete classes where department_id = 5
delete from classes where dept_id = 5;
-- 10. delete classes where class_name in ('Digital Electronics', 'Thermodynamics')
delete from classes where subject in ('Digital Electronics', 'Thermodynamics');
-- 11. delete classes with students exactly 25
delete from classes where students = 25;
-- 12. delete classes with date before '2025-06-10'
delete from classes where class_date < '2025-06-10';
-- 13. delete classes with professor_id in (2, 3, 4)
delete from classes where faculty_id in (2, 3, 4);
-- 14. delete classes where class_name like '%Development%'
delete from classes where subject like '%Development%';
-- 15. delete classes where students between 40 and 60
delete from classes where students between 40 and 60;
-- 16. delete classes where date between '2025-06-12' and '2025-06-16'
delete from classes where class_date between '2025-06-12' and '2025-06-16';
-- 17. delete classes with department_id = 1
delete from classes where dept_id = 1;
-- 18. delete classes with professor_id = 7
delete from classes where faculty_id = 7;
-- 19. delete classes where class_name contains 'Machines'
delete from classes where subject like '%Machines%';
-- 20. delete classes with students less than or equal to 28
delete from classes where students <= 28;


-- Table.4-Students------------------------------------------------------------------------
create table Students(
Students_id int primary key,
Department_id int,
Class_id int,
Student_name varchar(50),
Year varchar(20),
Classes_attending text
);

-- insert the records into the table
insert into Students
values
(1,1,1,'Ravi Kumar','2nd Year','Fundamentals of Web Development'),
(2,2,2,'Yash Harad','4th Year','Fundamentals of Elements'),
(3,3,3,'Harshit Patil','1st Year','Blockchain using AI'),
(4,4,4,'Saurabh Zite','3rd Year','Concrete Technology'),
(5,5,5,'Kunal Gosavi','4th Year','Fundamentals of Digital Electronics'),
(6, 1, 6, 'Priya Desai', '2nd Year', 'Web Development'),
(7, 6, 7, 'Amit Kulkarni', '3rd Year', 'Thermodynamics'),
(8, 5, 8, 'Sneha Joshi', '4th Year', 'Digital Electronics'),
(9, 7, 9, 'Rohan Bane', '1st Year', 'Electrical Machines'),
(10, 10, 10, 'Meera Shah', '2nd Year', 'Neural Networks');

-- To view all the records
select * from Students;

-- To delete the records from the table
truncate table Students;

-- To delete the records and the table
drop table Students;

-- SELECT QUERIES(20)
-- 1. select student_name and year only
select student_name, year from students;
-- 2. select all students from 4th year
select * from students where year = '4th Year';
-- 3. select all students sorted by name in ascending order
select * from students order by student_name asc;
-- 4. fetch student with students_id = 4
select * from students where students_id = 4;
-- 5. get all students attending classes containing the word 'Digital'
select * from students where classes_attending like '%Digital%';
-- 6. select student where class_attending is exactly 'Blockchain using AI'
select * from students where classes_attending = 'Blockchain using AI';
-- 7. get student record for subject = 'Concrete Technology'
select * from students where classes_attending = 'Concrete Technology';
-- 8. get all students in descending order of students_id
select * from students order by students_id desc;
-- 9. order students by length of student_name (ascending)
select * from students order by char_length(student_name) asc;
-- 10. group by year and count number of students
select year, count(*) as total_students from students group by year;
-- 11. select students attending 'Web Development'
select * from students where classes_attending = 'Web Development';
-- 12. get records where department_id is 2
select * from students where department_id = 2;
-- 13. list all students from 1st or 2nd year
select * from students where year in ('1st Year', '2nd Year');
-- 14. filter students from department_id >= 5
select * from students where department_id >= 5;
-- 15. list student names ordered by longest name first
select student_name, char_length(student_name) as name_length from students order by name_length desc;
-- 16. fetch students from class_id = 5
select * from students where class_id = 5;
-- 17. search for class names that include the word 'Fundamentals'
select * from students where classes_attending like '%Fundamentals%';
-- 18. fetch records where student_name is 'Meera Shah'
select * from students where student_name = 'Meera Shah';
-- 19. select students from department_id between 1 and 4
select * from students where department_id between 1 and 4;
-- 20. get students where student name starts with 'S'
select * from students where student_name like 'S%';

-- ALTER QUERIES(20)
-- 1. add column enrollment_date of type date
alter table students add column enrollment_date date;
-- 2. rename column enrollment_date → joined_on
alter table students rename column enrollment_date to joined_on;
-- 3. drop the joined_on column
alter table students drop column joined_on;
-- 4. add last_updated column with default current timestamp
alter table students add column last_updated datetime default current_timestamp;
-- 5. add created_by column with default 'admin office'
alter table students add column created_by varchar(50) default 'admin office';
-- 6. modify created_by column size from varchar(50) → varchar(100)
alter table students modify column created_by varchar(100);
-- 7. rename column student_name → full_name
alter table students rename column student_name to full_name;
-- 8. rename column students_id → id
alter table students rename column students_id to id;
-- 9. drop column created_by
alter table students drop column created_by;
-- 10. drop column last_updated
alter table students drop column last_updated;
-- 11. rename column year → study_year
alter table students rename column year to study_year;
-- 12. change datatype of classes_attending from text → varchar(255)
alter table students modify column classes_attending varchar(255);
-- 13. add column status with default 'active'
alter table students add column status varchar(20) default 'active';
-- 14. drop column status
alter table students drop column status;
-- 15. re-add column status with default 'inactive'
alter table students add column status varchar(20) default 'inactive';
-- 16. rename column department_id → dept_id
alter table students rename column department_id to dept_id;
-- 17. rename column class_id → class_ref_id
alter table students rename column class_id to class_ref_id;
-- 18. add column email varchar(100)
alter table students add column email varchar(100);
-- 19. modify column email to be text instead of varchar(100)
alter table students modify column email text;
-- 20. drop column email
alter table students drop column email;

-- UPDATE QUERIES(20)
set sql_safe_updates = 0;

-- 1. update dept_id to 3 for id = 1
update students set dept_id = 3 where id = 1;
-- 2. update study_year to '3rd Year' for id = 2
update students set study_year = '3rd Year' where id = 2;
-- 3. update class_ref_id to 4 for id = 3
update students set class_ref_id = 4 where id = 3;
-- 4. update classes_attending to 'Advanced Blockchain' where full_name = 'Harshit Patil'
update students set classes_attending = 'Advanced Blockchain' where full_name = 'Harshit Patil';
-- 5. update dept_id to 6 where classes_attending = 'Digital Electronics'
update students set dept_id = 6 where classes_attending = 'Digital Electronics';
-- 6. update class_ref_id to 7 where study_year = '3rd Year'
update students set class_ref_id = 7 where study_year = '3rd Year';
-- 7. update study_year to '2nd Year' where full_name = 'Meera Shah'
update students set study_year = '2nd Year' where full_name = 'Meera Shah';
-- 8. update full_name to 'Ravi K.' where id = 1
update students set full_name = 'Ravi K.' where id = 1;
-- 9. update dept_id to 4 where class_ref_id = 5
update students set dept_id = 4 where class_ref_id = 5;
-- 10. update study_year to current_date where id = 10
update students set study_year = current_date where id = 10;
-- 11. update class_ref_id to 9 where classes_attending like '%Machines%'
update students set class_ref_id = 9 where classes_attending like '%Machines%';
-- 12. update dept_id to 2 where id in (3, 4)
update students set dept_id = 2 where id in (3, 4);
-- 13. update study_year to '1st Year' where dept_id = 1
update students set study_year = '1st Year' where dept_id = 1;
-- 14. update class_ref_id to 8 where classes_attending = 'Digital Electronics'
update students set class_ref_id = 8 where classes_attending = 'Digital Electronics';
-- 15. update study_year to '4th Year' where id >= 6
update students set study_year = '4th Year' where id >= 6;
-- 16. update classes_attending to 'Intro to Neural Networks' where id = 10
update students set classes_attending = 'Intro to Neural Networks' where id = 10;
-- 17. update dept_id to 5 where study_year = '2nd Year'
update students set dept_id = 5 where study_year = '2nd Year';
-- 18. update study_year to '3rd Year' where classes_attending = 'Thermodynamics'
update students set study_year = '3rd Year' where classes_attending = 'Thermodynamics';
-- 19. update dept_id to 1 where classes_attending = 'Concrete Technology'
update students set dept_id = 1 where classes_attending = 'Concrete Technology';
-- 20. update study_year to '2nd Year' where dept_id = 7
update students set study_year = '2nd Year' where dept_id = 7;

-- DELETE QUERIES(20)
-- 1. delete student with id = 1
delete from students where id = 1;
-- 2. delete student with id = 5
delete from students where id = 5;
-- 3. delete student with id = 10
delete from students where id = 10;
-- 4. delete students attending 'Blockchain using AI'
delete from students where classes_attending = 'Blockchain using AI';
-- 5. delete students with study_year less than '3rd Year'
delete from students where study_year < '3rd Year';
-- 6. delete students with study_year greater than or equal to '4th Year'
delete from students where study_year >= '4th Year';
-- 7. delete students with dept_id = 2
delete from students where dept_id = 2;
-- 8. delete students with class_ref_id = 1
delete from students where class_ref_id = 1;
-- 9. delete students from dept_id = 5
delete from students where dept_id = 5;
-- 10. delete students attending classes like '%Digital%'
delete from students where classes_attending like '%Digital%';
-- 11. delete students with id between 6 and 9
delete from students where id between 6 and 9;
-- 12. delete students where study_year = '1st Year'
delete from students where study_year = '1st Year';
-- 13. delete students with id in (2, 3, 4)
delete from students where id in (2, 3, 4);
-- 14. delete students attending classes containing 'Web'
delete from students where classes_attending like '%Web%';
-- 15. delete students from dept_id between 1 and 3
delete from students where dept_id between 1 and 3;
-- 16. delete students where study_year like '%Year'
delete from students where study_year like '%Year';
-- 17. delete students with class_ref_id in (7, 8)
delete from students where class_ref_id in (7, 8);
-- 18. delete students attending 'Thermodynamics'
delete from students where classes_attending = 'Thermodynamics';
-- 19. delete students with dept_id = 7
delete from students where dept_id = 7;
-- 20. delete students with study_year = '4th Year' and dept_id = 5
delete from students where study_year = '4th Year' and dept_id = 5;


-- Table.5-Labs------------------------------------------------------------------------
create table Labs(
Lab_id int primary key,
Lab_name varchar(50),
Lab_incharge varchar(50),
Lab_Professor varchar(50),
Students int
);

-- insert the records into the table
insert into Labs
values
(1,'Web Development Lab','Sandeep Mane','Dr. sharad kantute',20),
(2,'Elements Lab','Ashish Jadhav','Mrs. Smita Pawar',25),
(3,'Blockchain Lab','Sandeep Mane','Mr.  Dilip Patil',18),
(4,'Concrete Lab','Shila Jawale','Dr. Kishor Gawade',23),
(5,'Electronics Lab','Mr.  Omkar Jagtap','Mr.  Omkar Jagtap',30),
(6, 'Thermodynamics Lab', 'Vishal Patil', 'Dr. Ramesh Patil', 28),
(7, 'Power Systems Lab', 'Sangita Deshmukh', 'Dr. Neeta Deshmukh', 22),
(8, 'Communication Systems Lab', 'Ajay Pawar', 'Dr. Swati Kulkarni', 19),
(9, 'Biomedical Lab', 'Pooja More', 'Dr. Pranav Joshi', 26),
(10, 'AI Lab', 'Tejaswini Shinde', 'Dr. Meenal Shah', 24);

-- To view all the records
select * from Labs;

-- To delete the records from the table
truncate table Labs;

-- To delete the records and the table
drop table Labs;

-- SELECT QUERIES(20)
-- 1. Select all lab names and lab incharges
select Lab_name, Lab_incharge from Labs;
-- 2. Select all labs where number of students is greater than 20
select * from Labs where Students > 20;
-- 3. Select all labs ordered by Lab_name ascending
select * from Labs order by Lab_name asc;
-- 4. Select lab where Lab_id = 4
select * from Labs where Lab_id = 4;
-- 5. Select labs where Lab_Professor contains 'Patil'
select * from Labs where Lab_Professor like '%Patil%';
-- 6. Select labs where Lab_incharge is exactly 'Sandeep Mane'
select * from Labs where Lab_incharge = 'Sandeep Mane';
-- 7. Select labs with more than or equal to 25 students
select * from Labs where Students >= 25;
-- 8. Select labs ordered by number of students descending
select * from Labs order by Students desc;
-- 9. Select labs where Lab_name contains 'Systems'
select * from Labs where Lab_name like '%Systems%';
-- 10. Count number of labs grouped by Lab_incharge
select Lab_incharge, count(*) as lab_count from Labs group by Lab_incharge;
-- 11. Select labs where Lab_name starts with 'B'
select * from Labs where Lab_name like 'B%';
-- 12. Select labs where Lab_Professor ends with 'Shah'
select * from Labs where Lab_Professor like '%Shah';
-- 13. Select labs with students between 20 and 25
select * from Labs where Students between 20 and 25;
-- 14. Select labs where Lab_incharge is in ('Sandeep Mane', 'Ashish Jadhav')
select * from Labs where Lab_incharge in ('Sandeep Mane', 'Ashish Jadhav');
-- 15. Select labs with student count not equal to 20
select * from Labs where Students != 20;
-- 16. Select labs where Lab_name has length greater than 15
select * from Labs where char_length(Lab_name) > 15;
-- 17. Select labs where Lab_Professor is 'Dr. Meenal Shah'
select * from Labs where Lab_Professor = 'Dr. Meenal Shah';
-- 18. Select labs where Lab_id is in (1, 3, 5)
select * from Labs where Lab_id in (1, 3, 5);
-- 19. Select all labs ordered by Lab_incharge descending
select * from Labs order by Lab_incharge desc;
-- 20. Select labs with students less than 20
select * from Labs where Students < 20;

-- ALTER QUERIES(20)
-- 1. Add a column lab_established of type date
alter table Labs add column lab_established date;
-- 2. Rename column lab_established to established_on
alter table Labs rename column lab_established to established_on;
-- 3. Drop the column established_on
alter table Labs drop column established_on;
-- 4. Add last_updated column with default current timestamp
alter table Labs add column last_updated datetime default current_timestamp;
-- 5. Add created_by column with default 'lab admin'
alter table Labs add column created_by varchar(50) default 'lab admin';
-- 6. Modify created_by column size to varchar(100)
alter table Labs modify column created_by varchar(100);
-- 7. Rename column Lab_name to Lab_title
alter table Labs rename column Lab_name to Lab_title;
-- 8. Rename column Lab_id to id
alter table Labs rename column Lab_id to id;
-- 9. Drop column created_by
alter table Labs drop column created_by;
-- 10. Drop column last_updated
alter table Labs drop column last_updated;
-- 11. Rename column Students to Student_count
alter table Labs rename column Students to Student_count;
-- 12. Modify Lab_incharge datatype from varchar(50) to varchar(100)
alter table Labs modify column Lab_incharge varchar(100);
-- 13. Add column status with default 'active'
alter table Labs add column status varchar(20) default 'active';
-- 14. Drop column status
alter table Labs drop column status;
-- 15. Re-add column status with default 'inactive'
alter table Labs add column status varchar(20) default 'inactive';
-- 16. Rename column Lab_incharge to Incharge
alter table Labs rename column Lab_incharge to Incharge;
-- 17. Rename column Lab_Professor to Professor
alter table Labs rename column Lab_Professor to Professor;
-- 18. Add column lab_email varchar(100)
alter table Labs add column lab_email varchar(100);
-- 19. Modify lab_email to text datatype
alter table Labs modify column lab_email text;
-- 20. Drop column lab_email
alter table Labs drop column lab_email;

-- UPDATE QUERIES(20)
set sql_safe_updates = 0;

-- 1. Update Incharge to 'Ramesh Patil' where id = 1
update Labs set Incharge = 'Ramesh Patil' where id = 1;
-- 2. Update Student_count to 30 where id = 2
update Labs set Student_count = 30 where id = 2;
-- 3. Update Professor to 'Dr. Nitin Pawar' where id = 3
update Labs set Professor = 'Dr. Nitin Pawar' where id = 3;
-- 4. Update Lab_title to 'Advanced Blockchain Lab' where Incharge = 'Sandeep Mane'
update Labs set Lab_title = 'Advanced Blockchain Lab' where Incharge = 'Sandeep Mane';
-- 5. Update Student_count to 35 where Lab_title = 'Electronics Lab'
update Labs set Student_count = 35 where Lab_title = 'Electronics Lab';
-- 6. Update Professor to 'Dr. Smita Pawar' where Student_count > 25
update Labs set Professor = 'Dr. Smita Pawar' where Student_count > 25;
-- 7. Update Student_count to 20 where Lab_title = 'AI Lab'
update Labs set Student_count = 20 where Lab_title = 'AI Lab';
-- 8. Update Incharge to 'Ajay Pawar' where id = 8
update Labs set Incharge = 'Ajay Pawar' where id = 8;
-- 9. Update Professor to 'Dr. Sharad Kantute' where id = 1
update Labs set Professor = 'Dr. Sharad Kantute' where id = 1;
-- 10. Update Lab_title to 'Power Systems Lab' where Student_count = 22
update Labs set Lab_title = 'Power Systems Lab' where Student_count = 22;
-- 11. Update Student_count to 25 where Professor like '%Pawar%'
update Labs set Student_count = 25 where Professor like '%Pawar%';
-- 12. Update Incharge to 'Sangita Deshmukh' where id in (7, 8)
update Labs set Incharge = 'Sangita Deshmukh' where id in (7, 8);
-- 13. Update Student_count to 18 where Lab_title = 'Biomedical Lab'
update Labs set Student_count = 18 where Lab_title = 'Biomedical Lab';
-- 14. Update Professor to 'Dr. Vishal Patil' where Lab_title = 'Thermodynamics Lab'
update Labs set Professor = 'Dr. Vishal Patil' where Lab_title = 'Thermodynamics Lab';
-- 15. Update Lab_title to 'Communication Systems Laboratory' where id = 8
update Labs set Lab_title = 'Communication Systems Laboratory' where id = 8;
-- 16. Update Student_count to 28 where Incharge = 'Vishal Patil'
update Labs set Student_count = 28 where Incharge = 'Vishal Patil';
-- 17. Update Professor to 'Dr. Pranav Joshi' where id = 9
update Labs set Professor = 'Dr. Pranav Joshi' where id = 9;
-- 18. Update Lab_title to 'Concrete Technology Lab' where id = 4
update Labs set Lab_title = 'Concrete Technology Lab' where id = 4;
-- 19. Update Incharge to 'Pooja More' where id = 9
update Labs set Incharge = 'Pooja More' where id = 9;
-- 20. Update Student_count to 24 where id = 10
update Labs set Student_count = 24 where id = 10;

-- DELETE QUERIES(20)
-- 1. Delete lab with id = 1
delete from Labs where id = 1;
-- 2. Delete lab with id = 5
delete from Labs where id = 5;
-- 3. Delete lab with id = 10
delete from Labs where id = 10;
-- 4. Delete labs where Lab_title = 'Blockchain Lab'
delete from Labs where Lab_title = 'Blockchain Lab';
-- 5. Delete labs with Student_count less than 20
delete from Labs where Student_count < 20;
-- 6. Delete labs with Student_count greater than or equal to 25
delete from Labs where Student_count >= 25;
-- 7. Delete labs where Incharge = 'Ashish Jadhav'
delete from Labs where Incharge = 'Ashish Jadhav';
-- 8. Delete labs where id = 2
delete from Labs where id = 2;
-- 9. Delete labs where Incharge = 'Mr. Omkar Jagtap'
delete from Labs where Incharge = 'Mr. Omkar Jagtap';
-- 10. Delete labs where Lab_title like '%Systems%'
delete from Labs where Lab_title like '%Systems%';
-- 11. Delete labs with id between 6 and 9
delete from Labs where id between 6 and 9;
-- 12. Delete labs where Lab_title = 'Web Development Lab'
delete from Labs where Lab_title = 'Web Development Lab';
-- 13. Delete labs with id in (3, 4, 7)
delete from Labs where id in (3, 4, 7);
-- 14. Delete labs where Lab_title contains 'Development'
delete from Labs where Lab_title like '%Development%';
-- 15. Delete labs where Incharge between 'A' and 'M'
delete from Labs where Incharge between 'A' and 'M';
-- 16. Delete labs where Lab_Professor like '%Dr.%'
delete from Labs where Professor like '%Dr.%';
-- 17. Delete labs with id in (1, 5, 9)
delete from Labs where id in (1, 5, 9);
-- 18. Delete labs where Lab_title = 'Thermodynamics Lab'
delete from Labs where Lab_title = 'Thermodynamics Lab';
-- 19. Delete labs with Incharge = 'Sangita Deshmukh'
delete from Labs where Incharge = 'Sangita Deshmukh';
-- 20. Delete labs with Student_count = 24 and Incharge = 'Tejaswini Shinde'
delete from Labs where Student_count = 24 and Incharge = 'Tejaswini Shinde';