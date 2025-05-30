/*
This file consists of a database named ATTENDANCE_TRACKER having tables Classes, Teachers, Students, Subjects, and Attendance.

Table.1 - CLASSES TABLE - (Stores details of each class session)
        Attributes: Class_id, Subject, Teacher_name, Student_Present, Date

Table.2 - TEACHERS TABLE - (Stores details of teachers and their classes)
        Attributes: Teacher_id, Teacher_name, Class_id (FK), Subject, Date

Table.3 - STUDENTS TABLE - (Stores details of students attending classes)
        Attributes: Student_id, Student_name, Class_id (FK), Subject, Date

Table.4 - SUBJECTS TABLE - (Stores details about subjects and attendance status)
        Attributes: Subject_id, Subject_name, Teacher_name, Date, Attendance

Table.5 - ATTENDANCE TABLE - (Stores monthly attendance summaries for teachers and students)
        Attributes: Attendance_id, Attendance_Month, Teacher_name, Avg_Teacher_Attendance, Student_name, Avg_Student_Attendance

Step-by-step Creation of Attendance_Tracker Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Classes Table + Insert Data  
Step 4: Create Teachers Table + Insert Data  
Step 5: Create Students Table + Insert Data  
Step 6: Create Subjects Table + Insert Data  
Step 7: Create Attendance Table + Insert Data  
Step 8: View Data  
*/

-- Step 1: Create the Database
create database Attendance_Tracker;

-- Step 2: Use the Database
use Attendance_Tracker;

-- Step 3: Create Classes Table ----------------------------------------------------------
create table Classes(
    Class_id int primary key,
    Subject varchar(50),
    Teacher_name varchar(50),
    Student_Present int,
    Date date
);

insert into Classes values
(1, 'Math', 'Ravi Sharma', 25, '2025-05-01'),
(2, 'Science', 'Pooja Mehta', 28, '2025-05-01'),
(3, 'History', 'Amit Sinha', 27, '2025-05-01'),
(4, 'English', 'Sonal Desai', 26, '2025-05-01'),
(5, 'Geography', 'Nikhil Patil', 24, '2025-05-01'),
(6, 'Math', 'Ravi Sharma', 25, '2025-05-02'),
(7, 'Science', 'Pooja Mehta', 27, '2025-05-02'),
(8, 'History', 'Amit Sinha', 26, '2025-05-02'),
(9, 'English', 'Sonal Desai', 25, '2025-05-02'),
(10, 'Geography', 'Nikhil Patil', 23, '2025-05-02');

-- To display table data
select * from Classes;

-- To remove complete records from table
truncate table Classes;

-- To remove complete records and attributes from table
drop table Classes;


-- Step 4: Create Teachers Table ----------------------------------------------------------
create table Teachers(
    Teacher_id int primary key,
    Teacher_name varchar(50),
    Class_id int,
    Subject varchar(50),
    Date date,
    foreign key (Class_id) references Classes(Class_id)
);

insert into Teachers values
(101, 'Ravi Sharma', 1, 'Math', '2025-05-01'),
(102, 'Pooja Mehta', 2, 'Science', '2025-05-01'),
(103, 'Amit Sinha', 3, 'History', '2025-05-01'),
(104, 'Sonal Desai', 4, 'English', '2025-05-01'),
(105, 'Nikhil Patil', 5, 'Geography', '2025-05-01'),
(106, 'Ravi Sharma', 6, 'Math', '2025-05-02'),
(107, 'Pooja Mehta', 7, 'Science', '2025-05-02'),
(108, 'Amit Sinha', 8, 'History', '2025-05-02'),
(109, 'Sonal Desai', 9, 'English', '2025-05-02'),
(110, 'Nikhil Patil', 10, 'Geography', '2025-05-02');

-- To display table data
select * from Teachers;

-- To remove complete records from table
truncate table Teachers;

-- To remove complete records and attributes from table
drop table Teachers;


-- Step 5: Create Students Table ----------------------------------------------------------
create table Students(
    Student_id int primary key,
    Student_name varchar(50),
    Class_id int,
    Subject varchar(50),
    Date date,
    foreign key (Class_id) references Classes(Class_id)
);

insert into Students values
(201, 'Ankit Verma', 1, 'Math', '2025-05-01'),
(202, 'Sneha Shah', 2, 'Science', '2025-05-01'),
(203, 'Karan Mehta', 3, 'History', '2025-05-01'),
(204, 'Divya Rai', 4, 'English', '2025-05-01'),
(205, 'Tarun Patel', 5, 'Geography', '2025-05-01'),
(206, 'Meena Das', 6, 'Math', '2025-05-02'),
(207, 'Siddharth Kale', 7, 'Science', '2025-05-02'),
(208, 'Aisha Khan', 8, 'History', '2025-05-02'),
(209, 'Reena Paul', 9, 'English', '2025-05-02'),
(210, 'Neha Joshi', 10, 'Geography', '2025-05-02');

-- To display table data
select * from Students;

-- To remove complete records from table
truncate table Students;

-- To remove complete records and attributes from table
drop table Students;


-- Step 6: Create Subjects Table ----------------------------------------------------------
create table Subjects(
    Subject_id int primary key,
    Subject_name varchar(50),
    Teacher_name varchar(50),
    Date date,
    Attendance varchar(10)
);

insert into Subjects values
(301, 'Math', 'Ravi Sharma', '2025-05-01', 'Present'),
(302, 'Science', 'Pooja Mehta', '2025-05-01', 'Present'),
(303, 'History', 'Amit Sinha', '2025-05-01', 'Present'),
(304, 'English', 'Sonal Desai', '2025-05-01', 'Present'),
(305, 'Geography', 'Nikhil Patil', '2025-05-01', 'Present'),
(306, 'Math', 'Ravi Sharma', '2025-05-02', 'Present'),
(307, 'Science', 'Pooja Mehta', '2025-05-02', 'Present'),
(308, 'History', 'Amit Sinha', '2025-05-02', 'Present'),
(309, 'English', 'Sonal Desai', '2025-05-02', 'Present'),
(310, 'Geography', 'Nikhil Patil', '2025-05-02', 'Present');

-- To display table data
select * from Subjects;

-- To remove complete records from table
truncate table Subjects;

-- To remove complete records and attributes from table
drop table Subjects;


-- Step 7: Create Attendance Table ----------------------------------------------------------
create table Attendance(
    Attendance_id int primary key,
    Attendance_Month varchar(15),
    Teacher_name varchar(50),
    Avg_Teacher_Attendance int,
    Student_name varchar(50),
    Avg_Student_Attendance int
);

insert into Attendance values
(1, 'May 2025', 'Ravi Sharma', 95, 'Ankit Verma', 90),
(2, 'May 2025', 'Pooja Mehta', 96, 'Sneha Shah', 92),
(3, 'May 2025', 'Amit Sinha', 97, 'Karan Mehta', 93),
(4, 'May 2025', 'Sonal Desai', 94, 'Divya Rai', 89),
(5, 'May 2025', 'Nikhil Patil', 98, 'Tarun Patel', 91),
(6, 'May 2025', 'Ravi Sharma', 95, 'Meena Das', 88),
(7, 'May 2025', 'Pooja Mehta', 96, 'Siddharth Kale', 90),
(8, 'May 2025', 'Amit Sinha', 97, 'Aisha Khan', 91),
(9, 'May 2025', 'Sonal Desai', 94, 'Reena Paul', 87),
(10, 'May 2025', 'Nikhil Patil', 98, 'Neha Joshi', 89);

-- To display table data
select * from Attendance;

-- To remove complete records from table
truncate table Attendance;

-- To remove complete records and attributes from table
drop table Attendance;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Classes;
select * from Teachers;
select * from Students;
select * from Subjects;
select * from Attendance;
