-- ---------------------------------------------- Database Queries -----------------------------------------------

-- create a database
CREATE DATABASE E_Learning_Platform;

-- to work on it, you need to use it first
USE E_Learning_Platform;

-- delete database
DROP DATABASE E_Learning_Platform;

-- ---------------------------------------- Database Analysis ----------------------------------------

/*
T1 : Students(StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID)

T2 : Teachers(TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status)

T3 : Courses(CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status)

T4 : Enrollments(EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus)

T5 : Classes(ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate)

T6 : Assignments(AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink)

T7 : Submissions(SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission)

T8 : Exams(ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished)

T9 : Payments(PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments)

T10: DiscussionForum(PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink)

*/

-- --------------------------------------- Table Related Queries ---------------------------------

-- Table 1: Students
CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    DateOfBirth DATE,
    Address VARCHAR(255),
    EnrollmentDate DATE,
    Status VARCHAR(20),
    ClassID INT
);

-- Insert 10 records into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, DateOfBirth, Address, EnrollmentDate, Status, ClassID) VALUES
(1, 'Aarav', 'Sharma', 'aarav.sharma@example.com', '9876543210', '2005-05-10', 'Delhi, India', '2023-06-01', 'Active', 101),
(2, 'Saanvi', 'Verma', 'saanvi.verma@example.com', '9876543211', '2004-11-23', 'Mumbai, India', '2023-06-02', 'Active', 101),
(3, 'Vivaan', 'Patel', 'vivaan.patel@example.com', '9876543212', '2006-01-15', 'Ahmedabad, India', '2023-06-03', 'Active', 102),
(4, 'Ananya', 'Singh', 'ananya.singh@example.com', '9876543213', '2005-08-30', 'Lucknow, India', '2023-06-04', 'Active', 102),
(5, 'Arjun', 'Rao', 'arjun.rao@example.com', '9876543214', '2005-03-18', 'Hyderabad, India', '2023-06-05', 'Active', 103),
(6, 'Ishaan', 'Nair', 'ishaan.nair@example.com', '9876543215', '2006-12-11', 'Kochi, India', '2023-06-06', 'Active', 103),
(7, 'Diya', 'Mishra', 'diya.mishra@example.com', '9876543216', '2004-07-09', 'Pune, India', '2023-06-07', 'Active', 104),
(8, 'Kabir', 'Joshi', 'kabir.joshi@example.com', '9876543217', '2005-02-20', 'Bengaluru, India', '2023-06-08', 'Active', 104),
(9, 'Myra', 'Kaur', 'myra.kaur@example.com', '9876543218', '2006-04-14', 'Chandigarh, India', '2023-06-09', 'Active', 105),
(10, 'Ayaan', 'Yadav', 'ayaan.yadav@example.com', '9876543219', '2005-09-25', 'Jaipur, India', '2023-06-10', 'Active', 105);

-- to display/retrieve table data
select * from Students;

-- to remove the records from database
truncate table students;

-- to remove the records and table
drop table students;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1.select studentid and concat(firstname + lastname) from students
select studentid, concat(firstname,' ',lastname) as Student_Name from students;
-- 2.select students with birth year after 2005
select * from students where year(dateofbirth) > 2005;
-- 3.select students with status = 'active'
select * from students where status = 'Active';
-- 4.select students with classid = 104
select * from students where classid = 104;
-- 5.select students containing 'ma' in lastname
select * from students where lastname like '%ma%';
-- 6.select students with address 'mumbai'
select * from students where address = 'Mumbai, India';
-- 7.count the total no of students
select count(*) as Student_Count from students;
-- 8.select students having enrollmentdate between '2023-06-04' ans '2023-06-10'
select * from students where enrollmentdate between '2023-06-04' and '2023-06-10';
-- 9.select students(firstname,email,address)
select firstname, email, address from students;
-- 10.select students ordered by date of birth
select * from students order by dateofbirth desc;
-- 11.select students ordered by enrollmentdate
select * from students order by enrollmentdate;
-- 12.select students with firstname starting from 'A'
select * from students where firstname like 'A%';
-- 13.select firstname along with its charactercount
select firstname,char_length(firstname) as firstname_count from students group by firstname;
-- 14.select students ordered by firstname
select * from students order by firstname;
-- 15.select students with email_char_length > 21
select * from students where char_length(email) > 21;
-- 16. group students by enrollment month
select month(enrollmentdate) as month, count(*) as count from students group by month(enrollmentdate);
-- 17. show studentid, firstname and last 4 digits of phone
select studentid, firstname, right(phone, 4) as phone_end from students;
-- 18. list students with same first and last letter in firstname
select * from students where left(firstname, 1) = right(firstname, 1);
-- 19. calculate the age of each student (approximate)
select studentid, firstname, year(curdate()) - year(dateofbirth) as age from students;
-- 20. students whose phone ends with '10'
select * from students where phone like '%10';
-- 21. find students born between 2005 and 2006
select * from students where year(dateofbirth) between 2005 and 2006;
-- 22. show students with classid greater than 103
select * from students where classid > 103;
-- 23. find average classid value
select avg(classid) as avg_classid from students;
-- 24. show student name with status appended
select concat(firstname, ' ', lastname, ' (', status, ')') as student_info from students;
-- 25. classify students based on year of birth
select studentid, firstname,
       case
         when year(dateofbirth) <= 2004 then 'senior'
         when year(dateofbirth) = 2005 then 'intermediate'
         else 'junior'
       end as category
from students;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 2: Teachers
CREATE TABLE Teachers (
    TeacherID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    Specialization VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10,2),
    Experience INT,
    Status VARCHAR(20)
);

INSERT INTO Teachers (TeacherID, FirstName, LastName, Email, Phone, Specialization, HireDate, Salary, Experience, Status) VALUES
(1, 'Rajesh', 'Kumar', 'rajesh.kumar@example.com', '9998887770', 'Mathematics', '2015-01-15', 75000.00, 10, 'Active'),
(2, 'Anita', 'Desai', 'anita.desai@example.com', '9998887771', 'Science', '2016-02-20', 70000.00, 9, 'Active'),
(3, 'Sanjay', 'Gupta', 'sanjay.gupta@example.com', '9998887772', 'English', '2014-03-25', 80000.00, 11, 'Active'),
(4, 'Priya', 'Sharma', 'priya.sharma@example.com', '9998887773', 'History', '2017-04-30', 68000.00, 8, 'Active'),
(5, 'Rakesh', 'Mehta', 'rakesh.mehta@example.com', '9998887774', 'Geography', '2013-05-10', 85000.00, 12, 'Active'),
(6, 'Kavita', 'Singh', 'kavita.singh@example.com', '9998887775', 'Computer Science', '2018-06-15', 72000.00, 6, 'Active'),
(7, 'Ajay', 'Patel', 'ajay.patel@example.com', '9998887776', 'Physics', '2012-07-20', 90000.00, 13, 'Active'),
(8, 'Sunita', 'Nair', 'sunita.nair@example.com', '9998887777', 'Chemistry', '2019-08-25', 71000.00, 5, 'Active'),
(9, 'Vikram', 'Rao', 'vikram.rao@example.com', '9998887778', 'Economics', '2011-09-30', 95000.00, 14, 'Active'),
(10, 'Meena', 'Joshi', 'meena.joshi@example.com', '9998887779', 'Biology', '2020-10-05', 68000.00, 4, 'Active');

-- to display/retrieve table data
select * from teachers;

-- to remove the records from database
truncate table teachers;

-- to remove the records and table
drop table teachers;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all teachers with experience greater than 10 years
select * from teachers where experience > 10;
-- 2. find teachers whose specialization is 'science' or 'mathematics'
select * from teachers where specialization in ('science', 'mathematics');
-- 3. get teachers hired after 2015
select * from teachers where hiredate > '2015-12-31';
-- 4. display teachers’ full names in uppercase
select upper(firstname) as firstname_upper, upper(lastname) as lastname_upper from teachers;
-- 5. get length of each teacher's email
select teacherid, length(email) as emaillength from teachers;
-- 6. find teachers whose first name starts with 's'
select * from teachers where firstname like 's%';
-- 7. get email domain of each teacher
select teacherid, substring_index(email, '@', -1) as domain from teachers;
-- 8. concatenate full name with specialization
select concat(firstname, ' ', lastname, ' - ', specialization) as teacherinfo from teachers;
-- 9. find the average salary of all teachers
select avg(salary) as avgsalary from teachers;
-- 10. count how many teachers are active
select count(*) as activeteachers from teachers where status = 'active';
-- 11. find the highest and lowest salary
select max(salary) as highestsalary, min(salary) as lowestsalary from teachers;
-- 12. total combined experience of all teachers
select sum(experience) as totalexperience from teachers;
-- 13. group teachers by specialization and count them
select specialization, count(*) as count from teachers group by specialization;
-- 14. find specializations with more than 1 teacher
select specialization, count(*) as count from teachers group by specialization having count(*) > 1;
-- 15. find teachers with salary > 75000 and experience > 10
select * from teachers where salary > 75000 and experience > 10;
-- 16. teachers with salary < 70000 or hired after 2019
select * from teachers where salary < 70000 or hiredate > '2019-01-01';
-- 17. teachers with experience between 5 and 10 years
select * from teachers where experience between 5 and 10;
-- 18. increase salary by 10% in output for all teachers
select teacherid, firstname, salary, salary * 1.10 as increasedsalary from teachers;
-- 19. find salary per year of experience
select teacherid, salary / experience as salaryperyear from teachers where experience > 0;
-- 20. show how many years teacher has been working (as of today)
select teacherid, firstname, year(curdate()) - year(hiredate) as yearsworked from teachers;
-- 21. find teachers hired in the month of june
select * from teachers where month(hiredate) = 6;
-- 22. list teachers ordered by salary descending
select * from teachers order by salary desc;
-- 23. top 3 highest paid teachers
select * from teachers order by salary desc limit 3;
-- 24. get distinct specializations
select distinct specialization from teachers;
-- 25. display teacher experience category (e.g., junior/senior)
select teacherid, firstname, 
       case 
         when experience <= 5 then 'junior'
         when experience <= 10 then 'mid-level'
         else 'senior'
       end as experiencelevel
from teachers;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 3: Courses
CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    Description TEXT,
    Credits INT,
    Category VARCHAR(50),
    DurationWeeks INT,
    TeacherID INT,
    Level VARCHAR(20),
    Language VARCHAR(30),
    Status VARCHAR(20),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);

INSERT INTO Courses (CourseID, CourseName, Description, Credits, Category, DurationWeeks, TeacherID, Level, Language, Status) VALUES
(1, 'Mathematics 101', 'Introductory math course', 4, 'STEM', 12, 1, 'Beginner', 'English', 'Active'),
(2, 'Science Basics', 'Foundation in science', 3, 'STEM', 10, 2, 'Beginner', 'English', 'Active'),
(3, 'English Grammar', 'Grammar essentials', 2, 'Languages', 8, 3, 'Intermediate', 'English', 'Active'),
(4, 'World History', 'Global historical events', 3, 'Social Studies', 10, 4, 'Intermediate', 'English', 'Active'),
(5, 'Physical Geography', 'Earth’s features', 3, 'Social Studies', 10, 5, 'Intermediate', 'English', 'Active'),
(6, 'Python Programming', 'Basics of Python', 4, 'Computer Science', 12, 6, 'Beginner', 'English', 'Active'),
(7, 'Physics Concepts', 'Mechanics and waves', 4, 'STEM', 12, 7, 'Intermediate', 'English', 'Active'),
(8, 'Organic Chemistry', 'Carbon compounds', 4, 'STEM', 12, 8, 'Advanced', 'English', 'Active'),
(9, 'Macroeconomics', 'National economy', 3, 'Commerce', 10, 9, 'Advanced', 'English', 'Active'),
(10, 'Botany Basics', 'Plant biology', 3, 'Science', 10, 10, 'Beginner', 'English', 'Active');

-- to display/retrieve table data
select * from Courses;

-- to remove the records from database
truncate table Courses;

-- to remove the records and table
drop table Courses;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all courses with more than 3 credits
select * from courses where credits > 3;
-- 2. list courses in the 'stem' or 'commerce' category
select * from courses where category in ('stem', 'commerce');
-- 3. find courses that are of level 'advanced'
select * from courses where level = 'advanced';
-- 4. show all courses that are 10 weeks or longer
select * from courses where durationweeks >= 10;
-- 5. courses whose name starts with 'p'
select * from courses where coursename like 'p%';
-- 6. display coursename in uppercase
select upper(coursename) as uppercourse from courses;
-- 7. get total number of credits offered
select sum(credits) as totalcredits from courses;
-- 8. count how many courses each teacher is handling
select teacherid, count(*) as coursecount from courses group by teacherid;
-- 9. average duration of all courses
select avg(durationweeks) as averageduration from courses;
-- 10. minimum and maximum credits of courses
select min(credits) as mincredits, max(credits) as maxcredits from courses;
-- 11. display courses ordered by duration descending
select * from courses order by durationweeks desc;
-- 12. top 5 longest duration courses
select * from courses order by durationweeks desc limit 5;
-- 13. courses grouped by level and count
select level, count(*) as count from courses group by level;
-- 14. average credits per category
select category, avg(credits) as avgcredits from courses group by category;
-- 15. courses taught by teacherid 6 or 7
select * from courses where teacherid in (6, 7);
-- 16. courses that are not in english
select * from courses where language <> 'english';
-- 17. duration in months (approximated)
select courseid, coursename, round(durationweeks / 4.0, 2) as durationmonths from courses;
-- 18. display course level category using case
select courseid, coursename,
       case 
         when level = 'beginner' then 'entry level'
         when level = 'intermediate' then 'mid level'
         else 'expert level'
       end as levelcategory
from courses;
-- 19. list all distinct categories
select distinct category from courses;
-- 20. courses having the same duration as 12 weeks
select * from courses where durationweeks = 12;
-- 21. courses with teacherid > 5 and credits > 3
select * from courses where teacherid > 5 and credits > 3;
-- 22. courses with credits between 3 and 4 inclusive
select * from courses where credits between 3 and 4;
-- 23. number of courses per language
select language, count(*) as count from courses group by language;
-- 24. get length of course name
select coursename, length(coursename) as namelength from courses;
-- 25. append '(active)' or '(inactive)' to course names based on status
select coursename, concat(coursename, ' (', status, ')') as coursestatus from courses;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 4: Enrollments
CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    Progress INT,
    CompletionDate DATE,
    Grade VARCHAR(5),
    Feedback TEXT,
    Status VARCHAR(20),
    PaymentStatus VARCHAR(20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, CourseID, EnrollmentDate, Progress, CompletionDate, Grade, Feedback, Status, PaymentStatus) VALUES
(1, 1, 1, '2023-06-01', 50, NULL, NULL, 'Doing well', 'In Progress', 'Paid'),
(2, 2, 1, '2023-06-02', 60, NULL, NULL, 'Excellent', 'In Progress', 'Paid'),
(3, 3, 2, '2023-06-03', 45, NULL, NULL, 'Needs improvement', 'In Progress', 'Pending'),
(4, 4, 3, '2023-06-04', 70, NULL, NULL, 'Great participation', 'In Progress', 'Paid'),
(5, 5, 4, '2023-06-05', 40, NULL, NULL, 'Struggling', 'In Progress', 'Paid'),
(6, 6, 5, '2023-06-06', 55, NULL, NULL, 'Average', 'In Progress', 'Paid'),
(7, 7, 6, '2023-06-07', 65, NULL, NULL, 'Above average', 'In Progress', 'Paid'),
(8, 8, 7, '2023-06-08', 35, NULL, NULL, 'Needs assistance', 'In Progress', 'Pending'),
(9, 9, 8, '2023-06-09', 80, NULL, NULL, 'Outstanding', 'In Progress', 'Paid'),
(10, 10, 9, '2023-06-10', 50, NULL, NULL, 'Good effort', 'In Progress', 'Paid');

-- to display/retrieve table data
select * from Enrollments;

-- to remove the records from database
truncate table Enrollments;

-- to remove the records and table
drop table Enrollments;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all enrollments with progress more than 50%
select * from enrollments where progress > 50;
-- 2. find enrollments where payment status is 'pending'
select * from enrollments where paymentstatus = 'pending';
-- 3. list students enrolled in courseid 1
select * from enrollments where courseid = 1;
-- 4. show enrollmentid, progress, and double the progress
select enrollmentid, progress, progress * 2 as double_progress from enrollments;
-- 5. find enrollments where feedback contains the word 'average'
select * from enrollments where feedback like '%average%';
-- 6. count total enrollments
select count(*) as total_enrollments from enrollments;
-- 7. find average progress of all students
select avg(progress) as avg_progress from enrollments;
-- 8. find maximum and minimum progress
select max(progress) as max_progress, min(progress) as min_progress from enrollments;
-- 9. count enrollments by payment status
select paymentstatus, count(*) as count from enrollments group by paymentstatus;
-- 10. get enrollment dates in year 2023 only
select * from enrollments where year(enrollmentdate) = 2023;
-- 11. get the length of each feedback
select enrollmentid, length(feedback) as feedback_length from enrollments;
-- 12. list all students with progress between 40 and 60
select * from enrollments where progress between 40 and 60;
-- 13. list enrollments where completiondate is null
select * from enrollments where completiondate is null;
-- 14. concatenate enrollment info
select concat('student ', studentid, ' in course ', courseid) as enrollment_info from enrollments;
-- 15. find enrollments made in june month
select * from enrollments where month(enrollmentdate) = 6;
-- 16. show all enrollments with 'paid' status and progress >= 60
select * from enrollments where paymentstatus = 'paid' and progress >= 60;
-- 17. sort enrollments by progress descending
select * from enrollments order by progress desc;
-- 18. top 3 students with highest progress
select * from enrollments order by progress desc limit 3;
-- 19. show status label using case expression
select enrollmentid,
       case 
         when progress < 40 then 'low'
         when progress between 40 and 69 then 'medium'
         else 'high'
       end as progress_category
from enrollments;
-- 20. total enrollments per course
select courseid, count(*) as total_students from enrollments group by courseid;
-- 21. find enrollments with short feedback (length < 15)
select * from enrollments where length(feedback) < 15;
-- 22. list all distinct statuses
select distinct status from enrollments;
-- 23. add 10 to progress just in output
select enrollmentid, studentid, progress + 10 as projected_progress from enrollments;
-- 24. find students who have progress of exactly 50
select * from enrollments where progress = 50;
-- 25. count how many students are in progress, completed 
select status, count(*) as count from enrollments group by status;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 5: Classes
CREATE TABLE Classes (
    ClassID INT PRIMARY KEY,
    ClassName VARCHAR(100),
    Schedule VARCHAR(50),
    RoomNumber VARCHAR(20),
    Capacity INT,
    CourseID INT,
    TeacherID INT,
    Semester VARCHAR(10),
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (TeacherID) REFERENCES Teachers(TeacherID)
);


INSERT INTO Classes (ClassID, ClassName, Schedule, RoomNumber, Capacity, CourseID, TeacherID, Semester, StartDate, EndDate) VALUES
(101, 'Math A', 'Mon-Wed 10am', 'R101', 30, 1, 1, '2023S1', '2023-06-01', '2023-08-31'),
(102, 'Science B', 'Tue-Thu 11am', 'R102', 25, 2, 2, '2023S1', '2023-06-01', '2023-08-31'),
(103, 'English C', 'Mon-Wed 2pm', 'R103', 20, 3, 3, '2023S1', '2023-06-01', '2023-08-31'),
(104, 'History D', 'Tue-Thu 1pm', 'R104', 30, 4, 4, '2023S1', '2023-06-01', '2023-08-31'),
(105, 'Geography E', 'Fri 9am', 'R105', 15, 5, 5, '2023S1', '2023-06-01', '2023-08-31'),
(106, 'Python F', 'Mon 3pm', 'R106', 20, 6, 6, '2023S1', '2023-06-01', '2023-08-31'),
(107, 'Physics G', 'Wed 10am', 'R107', 25, 7, 7, '2023S1', '2023-06-01', '2023-08-31'),
(108, 'Chemistry H', 'Thu 2pm', 'R108', 20, 8, 8, '2023S1', '2023-06-01', '2023-08-31'),
(109, 'Economics I', 'Fri 11am', 'R109', 30, 9, 9, '2023S1', '2023-06-01', '2023-08-31'),
(110, 'Botany J', 'Tue 4pm', 'R110', 15, 10, 10, '2023S1', '2023-06-01', '2023-08-31');

-- to display/retrieve table data
select * from Classes;

-- to remove the records from database
truncate table Classes;

-- to remove the records and table
drop table Classes;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all classes with capacity more than 20
select * from classes where capacity > 20;
-- 2. list classes held in room 'r105' or 'r108'
select * from classes where roomnumber in ('r105', 'r108');
-- 3. find classes starting in june
select * from classes where month(startdate) = 6;
-- 4. get the duration in days of each class
select classid, classname, datediff(enddate, startdate) as duration_days from classes;
-- 5. show classnames in uppercase
select upper(classname) as uppercase_class from classes;
-- 6. show class schedule that includes 'mon'
select * from classes where schedule like '%mon%';
-- 7. count total number of classes
select count(*) as total_classes from classes;
-- 8. find minimum and maximum capacity
select min(capacity) as min_capacity, max(capacity) as max_capacity from classes;
-- 9. count how many classes each teacher is handling
select teacherid, count(*) as class_count from classes group by teacherid;
-- 10. total capacity per semester
select semester, sum(capacity) as total_capacity from classes group by semester;
-- 11. classes ordered by capacity descending
select * from classes order by capacity desc;
-- 12. top 3 classes with highest capacity
select * from classes order by capacity desc limit 3;
-- 13. show distinct room numbers
select distinct roomnumber from classes;
-- 14. find classes that start and end in the same month
select * from classes where month(startdate) = month(enddate);
-- 15. find classes with capacity between 15 and 25
select * from classes where capacity between 15 and 25;
-- 16. list classes conducted by teacherid 1 or 2
select * from classes where teacherid in (1, 2);
-- 17. calculate weeks between start and end date
select classid, round(datediff(enddate, startdate) / 7, 2) as weeks_duration from classes;
-- 18. show weekday from startdate
select classid, dayname(startdate) as start_weekday from classes;
-- 19. list classid and capacity increased by 5 (for display only)
select classid, capacity, capacity + 5 as updated_capacity from classes;
-- 20. get the length of each classname
select classname, length(classname) as name_length from classes;
-- 21. find classes scheduled on friday
select * from classes where schedule like '%fri%';
-- 22. concatenate class name and room number
select concat(classname, ' in ', roomnumber) as class_location from classes;
-- 23. group classes by roomnumber and count
select roomnumber, count(*) as class_count from classes group by roomnumber;
-- 24. find classes where teacherid equals courseid
select * from classes where teacherid = courseid;
-- 25. categorize capacity as small/medium/large
select classid, classname,
       case
         when capacity <= 15 then 'small'
         when capacity <= 25 then 'medium'
         else 'large'
       end as capacity_category
from classes;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 6: Assignments
CREATE TABLE Assignments (
    AssignmentID INT PRIMARY KEY,
    Title VARCHAR(100),
    Description TEXT,
    DueDate DATE,
    CourseID INT,
    ClassID INT,
    MaxMarks INT,
    AssignedDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Assignments (AssignmentID, Title, Description, DueDate, CourseID, ClassID, MaxMarks, AssignedDate, Status, AttachmentLink) VALUES
(1, 'Algebra HW', 'Practice algebra problems', '2023-07-15', 1, 101, 100, '2023-06-15', 'Open', 'link1'),
(2, 'Physics Quiz', 'Concepts of motion', '2023-07-20', 7, 107, 50, '2023-06-18', 'Open', 'link2'),
(3, 'Essay', 'Write on World Wars', '2023-07-25', 4, 104, 100, '2023-06-20', 'Open', 'link3'),
(4, 'Python Project', 'Basic calculator app', '2023-07-30', 6, 106, 100, '2023-06-22', 'Open', 'link4'),
(5, 'Grammar Test', 'Tenses exercise', '2023-07-10', 3, 103, 50, '2023-06-10', 'Open', 'link5'),
(6, 'Botany Diagram', 'Label plant parts', '2023-07-12', 10, 110, 30, '2023-06-12', 'Open', 'link6'),
(7, 'Chemistry Lab', 'Acid-base reactions', '2023-07-28', 8, 108, 70, '2023-06-25', 'Open', 'link7'),
(8, 'Economic Report', 'Indian GDP growth', '2023-07-22', 9, 109, 80, '2023-06-19', 'Open', 'link8'),
(9, 'Geography Map', 'Continents labeling', '2023-07-17', 5, 105, 60, '2023-06-16', 'Open', 'link9'),
(10, 'Science Experiment', 'Simple circuits', '2023-07-18', 2, 102, 90, '2023-06-14', 'Open', 'link10');

-- to display/retrieve table data
select * from Assignments;

-- to remove the records from database
truncate table Assignments;

-- to remove the records and table
drop table Assignments;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all assignments with maxmarks greater than 70
select * from assignments where maxmarks > 70;
-- 2. find assignments due after '2023-07-20'
select * from assignments where duedate > '2023-07-20';
-- 3. list assignments whose title starts with 'p'
select * from assignments where title like 'p%';
-- 4. display only assignment titles in lowercase
select lower(title) as lower_title from assignments;
-- 5. show total number of assignments
select count(*) as total_assignments from assignments;
-- 6. find total maxmarks of all assignments
select sum(maxmarks) as total_maxmarks from assignments;
-- 7. average marks across assignments
select avg(maxmarks) as avg_maxmarks from assignments;
-- 8. find minimum and maximum marks
select min(maxmarks) as min_marks, max(maxmarks) as max_marks from assignments;
-- 9. count how many assignments are assigned per course
select courseid, count(*) as assignment_count from assignments group by courseid;
-- 10. show number of assignments per class
select classid, count(*) as total from assignments group by classid;
-- 11. assignments assigned between '2023-06-15' and '2023-06-22'
select * from assignments where assigneddate between '2023-06-15' and '2023-06-22';
-- 12. order assignments by duedate descending
select * from assignments order by duedate desc;
-- 13. show assignments that are due within the same month (july 2023)
select * from assignments where month(duedate) = 7 and year(duedate) = 2023;
-- 14. show assignments with maxmarks between 50 and 100
select * from assignments where maxmarks between 50 and 100;
-- 15. list assignments sorted by maxmarks descending
select * from assignments order by maxmarks desc;
-- 16. get assignments with the word 'test' in title
select * from assignments where title like '%test%';
-- 17. count assignments with maxmarks more than 50 grouped by status
select status, count(*) as count from assignments where maxmarks > 50 group by status;
-- 18. find average maxmarks per class
select classid, avg(maxmarks) as avg_marks from assignments group by classid;
-- 19. calculate days remaining for due date
select assignmentid, title, datediff(duedate, curdate()) as days_left from assignments;
-- 20. display length of each assignment title
select title, length(title) as title_length from assignments;
-- 21. get assignments whose description contains the word 'basic'
select * from assignments where description like '%basic%';
-- 22. list assignments with courseid in (1, 2, 3)
select * from assignments where courseid in (1, 2, 3);
-- 23. format assigneddate as 'dd-mm-yyyy'
select assignmentid, date_format(assigneddate, '%d-%m-%Y') as formatted_date from assignments;
-- 24. get assignments where status is 'open'
select * from assignments where status = 'open';
-- 25. show assignment difficulty level based on maxmarks
select assignmentid, title,
       case 
         when maxmarks <= 50 then 'easy'
         when maxmarks <= 80 then 'medium'
         else 'hard'
       end as difficulty
from assignments;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 7: Submissions
CREATE TABLE Submissions (
    SubmissionID INT PRIMARY KEY,
    AssignmentID INT,
    StudentID INT,
    SubmissionDate DATE,
    MarksObtained INT,
    Feedback TEXT,
    Status VARCHAR(20),
    FileLink VARCHAR(255),
    PlagiarismScore DECIMAL(5,2),
    LateSubmission BOOLEAN,
    FOREIGN KEY (AssignmentID) REFERENCES Assignments(AssignmentID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Submissions (SubmissionID, AssignmentID, StudentID, SubmissionDate, MarksObtained, Feedback, Status, FileLink, PlagiarismScore, LateSubmission) VALUES
(1, 1, 1, '2023-07-14', 90, 'Excellent work', 'Graded', 'sub_link1', 5.00, FALSE),
(2, 2, 2, '2023-07-19', 45, 'Good effort', 'Graded', 'sub_link2', 10.00, FALSE),
(3, 3, 3, '2023-07-24', 70, 'Needs clarity', 'Graded', 'sub_link3', 0.00, FALSE),
(4, 4, 4, '2023-07-29', 95, 'Outstanding project', 'Graded', 'sub_link4', 2.50, FALSE),
(5, 5, 5, '2023-07-09', 48, 'Improve grammar', 'Graded', 'sub_link5', 15.00, TRUE),
(6, 6, 6, '2023-07-11', 25, 'Incomplete submission', 'Graded', 'sub_link6', 0.00, TRUE),
(7, 7, 7, '2023-07-27', 60, 'Well done', 'Graded', 'sub_link7', 5.00, FALSE),
(8, 8, 8, '2023-07-21', 78, 'Very detailed', 'Graded', 'sub_link8', 7.50, FALSE),
(9, 9, 9, '2023-07-16', 55, 'Good attempt', 'Graded', 'sub_link9', 3.00, FALSE),
(10, 10, 10, '2023-07-17', 65, 'Nice experiment', 'Graded', 'sub_link10', 12.00, FALSE);

-- to display/retrieve table data
select * from Submissions;

-- to remove the records from database
truncate table Submissions;

-- to remove the records and table
drop table Submissions;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all submissions with marks more than 60
select * from submissions where marksobtained > 60;

-- 2. find submissions with plagiarismscore greater than 10
select * from submissions where plagiarismscore > 10;

-- 3. list all late submissions
select * from submissions where latesubmission = true;

-- 4. count total number of submissions
select count(*) as total_submissions from submissions;

-- 5. average marks obtained by students
select avg(marksobtained) as average_marks from submissions;

-- 6. highest and lowest marks obtained
select max(marksobtained) as highest, min(marksobtained) as lowest from submissions;

-- 7. show feedbacks containing the word 'good'
select * from submissions where feedback like '%good%';

-- 8. group submissions by status
select status, count(*) as count from submissions group by status;

-- 9. count of late vs on-time submissions
select latesubmission, count(*) as count from submissions group by latesubmission;

-- 10. total plagiarism score across all submissions
select sum(plagiarismscore) as total_plagiarism from submissions;

-- 11. average plagiarism score
select avg(plagiarismscore) as avg_plagiarism from submissions;

-- 12. submissions done between '2023-07-10' and '2023-07-20'
select * from submissions where submissiondate between '2023-07-10' and '2023-07-20';

-- 13. list submissions ordered by marks descending
select * from submissions order by marksobtained desc;

-- 14. show submissions where marks are below average
select * from submissions where marksobtained < (select avg(marksobtained) from submissions);

-- 15. submissions submitted on a monday
select * from submissions where weekday(submissiondate) = 0;

-- 16. find length of each feedback comment
select submissionid, length(feedback) as feedback_length from submissions;

-- 17. submissions with feedback containing the word 'project'
select * from submissions where feedback like '%project%';

-- 18. find submissions where plagiarism score is exactly 0
select * from submissions where plagiarismscore = 0.00;

-- 19. number of submissions per student
select studentid, count(*) as submission_count from submissions group by studentid;

-- 20. number of submissions per assignment
select assignmentid, count(*) as submission_count from submissions group by assignmentid;

-- 21. average marks by assignment
select assignmentid, avg(marksobtained) as avg_marks from submissions group by assignmentid;

-- 22. display status and mark category using case
select submissionid, marksobtained,
       case
         when marksobtained >= 75 then 'distinction'
         when marksobtained >= 50 then 'pass'
         else 'fail'
       end as mark_category
from submissions;

-- 23. number of students with perfect marks (marks >= 90)
select count(*) as top_scorers from submissions where marksobtained >= 90;

-- 24. total marks for each student
select studentid, sum(marksobtained) as total_marks from submissions group by studentid;

-- 25. how many days after the assigned date each submission was done
select status, count(*) as total from submissions group by status;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 8: Exams
CREATE TABLE Exams (
    ExamID INT PRIMARY KEY,
    ExamName VARCHAR(100),
    Date DATE,
    DurationMinutes INT,
    TotalMarks INT,
    CourseID INT,
    ClassID INT,
    Type VARCHAR(30),
    Status VARCHAR(20),
    ResultPublished BOOLEAN,
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    FOREIGN KEY (ClassID) REFERENCES Classes(ClassID)
);

INSERT INTO Exams (ExamID, ExamName, Date, DurationMinutes, TotalMarks, CourseID, ClassID, Type, Status, ResultPublished) VALUES
(1, 'Math Midterm', '2023-07-20', 90, 100, 1, 101, 'Written', 'Completed', TRUE),
(2, 'Science Quiz', '2023-07-22', 60, 50, 2, 102, 'Online', 'Completed', TRUE),
(3, 'English Final', '2023-07-30', 120, 100, 3, 103, 'Written', 'Upcoming', FALSE),
(4, 'History Exam', '2023-07-28', 90, 100, 4, 104, 'Written', 'Completed', TRUE),
(5, 'Geography Test', '2023-07-25', 60, 50, 5, 105, 'Online', 'Upcoming', FALSE),
(6, 'Python Practical', '2023-07-29', 90, 100, 6, 106, 'Practical', 'Upcoming', FALSE),
(7, 'Physics Theory', '2023-07-23', 90, 100, 7, 107, 'Written', 'Completed', TRUE),
(8, 'Chemistry Lab', '2023-07-27', 60, 50, 8, 108, 'Practical', 'Upcoming', FALSE),
(9, 'Economics Exam', '2023-07-24', 90, 100, 9, 109, 'Written', 'Completed', TRUE),
(10, 'Botany Assessment', '2023-07-26', 60, 50, 10, 110, 'Written', 'Upcoming', FALSE);

-- to display/retrieve table data
select * from Exams;

-- to remove the records from database
truncate table Exams;

-- to remove the records and table
drop table Exams;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all exams with total marks greater than 80
select * from exams where totalmarks > 80;
-- 2. find exams with duration more than 90 minutes
select * from exams where durationminutes > 90;
-- 3. list all upcoming exams
select * from exams where status = 'Upcoming';
-- 4. count total number of exams
select count(*) as total_exams from exams;
-- 5. average exam duration
select avg(durationminutes) as average_duration from exams;
-- 6. maximum and minimum total marks
select max(totalmarks) as highest_marks, min(totalmarks) as lowest_marks from exams;
-- 7. show exams where name contains 'test'
select * from exams where examname like '%Test%';
-- 8. group exams by type
select type, count(*) as type_count from exams group by type;
-- 9. count of published vs unpublished results
select resultpublished, count(*) as count from exams group by resultpublished;
-- 10. total duration of all exams
select sum(durationminutes) as total_duration from exams;
-- 11. exams scheduled between '2023-07-22' and '2023-07-28'
select * from exams where date between '2023-07-22' and '2023-07-28';
-- 12. list exams ordered by total marks descending
select * from exams order by totalmarks desc;
-- 13. show exams with duration less than average
select * from exams where durationminutes < (select avg(durationminutes) from exams);
-- 14. exams held on a sunday
select * from exams where weekday(date) = 6;
-- 15. find length of each exam name
select examid, length(examname) as name_length from exams;
-- 16. exams with name starting with 'p'
select * from exams where examname like 'P%';
-- 17. exams with total marks equal to 100
select * from exams where totalmarks = 100;
-- 18. number of exams per status
select status, count(*) as status_count from exams group by status;
-- 19. number of exams per course
select courseid, count(*) as exam_count from exams group by courseid;
-- 20. average marks by type
select type, avg(totalmarks) as avg_marks from exams group by type;
-- 21. display exam duration in hours
select examid, examname, round(durationminutes / 60.0, 2) as duration_hours from exams;
-- 22. number of upcoming vs completed exams
select status, count(*) as exam_count from exams group by status;
-- 23. find exams of type 'written' that are completed
select * from exams where type = 'Written' and status = 'Completed';
-- 24. list distinct exam types
select distinct type from exams;
-- 25. categorize exam duration
select examid, examname,
       case
         when durationminutes <= 60 then 'Short'
         when durationminutes <= 90 then 'Medium'
         else 'Long'
       end as duration_category
from exams;


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 9: Payments
CREATE TABLE Payments (
    PaymentID INT PRIMARY KEY,
    StudentID INT,
    Amount DECIMAL(10,2),
    PaymentDate DATE,
    PaymentMethod VARCHAR(30),
    Status VARCHAR(20),
    TransactionID VARCHAR(50),
    PaymentFor VARCHAR(100),
    ReceiptLink VARCHAR(255),
    Comments TEXT,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Payments (PaymentID, StudentID, Amount, PaymentDate, PaymentMethod, Status, TransactionID, PaymentFor, ReceiptLink, Comments) VALUES
(1, 1, 5000.00, '2023-06-01', 'Card', 'Completed', 'TXN001', 'Course Fee', 'receipt1', 'First installment'),
(2, 2, 5200.00, '2023-06-02', 'UPI', 'Completed', 'TXN002', 'Course Fee', 'receipt2', ''),
(3, 3, 5300.00, '2023-06-03', 'NetBanking', 'Completed', 'TXN003', 'Course Fee', 'receipt3', 'On time'),
(4, 4, 5500.00, '2023-06-04', 'Card', 'Completed', 'TXN004', 'Course Fee', 'receipt4', ''),
(5, 5, 5100.00, '2023-06-05', 'UPI', 'Pending', 'TXN005', 'Course Fee', 'receipt5', 'Awaiting clearance'),
(6, 6, 5400.00, '2023-06-06', 'Cash', 'Completed', 'TXN006', 'Course Fee', 'receipt6', 'Paid at center'),
(7, 7, 5000.00, '2023-06-07', 'Card', 'Completed', 'TXN007', 'Course Fee', 'receipt7', ''),
(8, 8, 5200.00, '2023-06-08', 'NetBanking', 'Completed', 'TXN008', 'Course Fee', 'receipt8', ''),
(9, 9, 5300.00, '2023-06-09', 'UPI', 'Completed', 'TXN009', 'Course Fee', 'receipt9', ''),
(10, 10, 5500.00, '2023-06-10', 'Card', 'Completed', 'TXN010', 'Course Fee', 'receipt10', 'Final installment');

-- to display/retrieve table data
select * from Payments;

-- to remove the records from database
truncate table Payments;

-- to remove the records and table
drop table Payments;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all payments greater than 5200
select * from payments where amount > 5200;
-- 2. find payments made using card
select * from payments where paymentmethod = 'Card';
-- 3. list all pending payments
select * from payments where status = 'Pending';
-- 4. count total number of payments
select count(*) as total_payments from payments;
-- 5. average payment amount
select avg(amount) as average_amount from payments;
-- 6. highest and lowest payment amounts
select max(amount) as highest_amount, min(amount) as lowest_amount from payments;
-- 7. show payments where comments contain the word 'installment'
select * from payments where comments like '%installment%';
-- 8. group payments by payment method
select paymentmethod, count(*) as method_count from payments group by paymentmethod;
-- 9. count of completed vs pending payments
select status, count(*) as count from payments group by status;
-- 10. total payment amount collected
select sum(amount) as total_collected from payments;
-- 11. payments made between '2023-06-02' and '2023-06-08'
select * from payments where paymentdate between '2023-06-02' and '2023-06-08';
-- 12. list payments ordered by amount descending
select * from payments order by amount desc;
-- 13. show payments with amount below average
select * from payments where amount < (select avg(amount) from payments);
-- 14. payments made in the first week of June 2023
select * from payments where paymentdate between '2023-06-01' and '2023-06-07';
-- 15. find length of each comment
select paymentid, length(comments) as comment_length from payments;
-- 16. payments with transaction ID starting with 'TXN00'
select * from payments where transactionid like 'TXN00%';
-- 17. payments with exact amount of 5000
select * from payments where amount = 5000.00;
-- 18. number of payments per method
select paymentmethod, count(*) as count from payments group by paymentmethod;
-- 19. number of payments per status
select status, count(*) as count from payments group by status;
-- 20. average amount by payment method
select paymentmethod, avg(amount) as avg_amount from payments group by paymentmethod;
-- 21. display payment type based on amount
select paymentid, amount,
       case
         when amount >= 5400 then 'High'
         when amount >= 5100 then 'Medium'
         else 'Low'
       end as amount_category
from payments;
-- 22. number of students who paid using UPI
select count(distinct studentid) as upi_students from payments where paymentmethod = 'UPI';
-- 23. total amount paid by each student
select studentid, sum(amount) as total_paid from payments group by studentid;
-- 24. list distinct payment statuses
select distinct status from payments;
-- 25. find payments where receipt link is available but comments are blank
select * from payments where receiptlink is not null and comments = '';


-- =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- Table 10: DiscussionForum
CREATE TABLE DiscussionForum (
    PostID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    Title VARCHAR(150),
    Content TEXT,
    PostDate DATE,
    ReplyCount INT,
    LastReplyDate DATE,
    Status VARCHAR(20),
    AttachmentLink VARCHAR(255),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO DiscussionForum (PostID, StudentID, CourseID, Title, Content, PostDate, ReplyCount, LastReplyDate, Status, AttachmentLink) VALUES
(1, 1, 1, 'Doubt in Algebra', 'How to solve quadratic equations?', '2023-07-01', 5, '2023-07-03', 'Open', 'forum_link1'),
(2, 2, 1, 'Math formulas', 'Request for formula sheet', '2023-07-02', 3, '2023-07-04', 'Closed', 'forum_link2'),
(3, 3, 2, 'Science Project', 'Need help with model ideas', '2023-07-05', 2, '2023-07-06', 'Open', 'forum_link3'),
(4, 4, 3, 'English Essay', 'Tips for writing essays?', '2023-07-07', 4, '2023-07-08', 'Open', 'forum_link4'),
(5, 5, 4, 'History Timeline', 'Where can I get a good timeline?', '2023-07-09', 1, '2023-07-10', 'Closed', 'forum_link5'),
(6, 6, 5, 'Map Reading', 'Help with latitude and longitude', '2023-07-11', 0, NULL, 'Open', 'forum_link6'),
(7, 7, 6, 'Python Installation', 'Installation error on Windows', '2023-07-12', 3, '2023-07-13', 'Open', 'forum_link7'),
(8, 8, 7, 'Physics Formulas', 'Derivation of kinematic equations', '2023-07-14', 2, '2023-07-15', 'Open', 'forum_link8'),
(9, 9, 8, 'Chemistry Lab', 'Safety precautions for experiments', '2023-07-16', 1, '2023-07-17', 'Open', 'forum_link9'),
(10, 10, 9, 'Economic Data', 'Where to find recent GDP figures?', '2023-07-18', 4, '2023-07-19', 'Closed', 'forum_link10');

-- to display/retrieve table data
select * from DiscussionForum;

-- to remove the records from database
truncate table DiscussionForum;

-- to remove the records and table
drop table DiscussionForum;

-- --------------------------------------------------------------QUERIES---------------------------------------------------
-- 1. select all posts with more than 2 replies
select * from discussionforum where replycount > 2;
-- 2. find posts with status 'closed'
select * from discussionforum where status = 'Closed';
-- 3. list all posts made after '2023-07-10'
select * from discussionforum where postdate > '2023-07-10';
-- 4. count total number of posts
select count(*) as total_posts from discussionforum;
-- 5. average number of replies per post
select avg(replycount) as avg_replies from discussionforum;
-- 6. highest and lowest number of replies
select max(replycount) as max_replies, min(replycount) as min_replies from discussionforum;
-- 7. show posts where title contains the word 'help'
select * from discussionforum where title like '%help%';
-- 8. group posts by status
select status, count(*) as count from discussionforum group by status;
-- 9. count of posts with vs without replies
select 
	case 
		when replycount = 0 then 'No Replies' 
        else 'Has Replies' 
	end as reply_status, count(*) as count 
from discussionforum group by reply_status;
-- 10. total replies across all posts
select sum(replycount) as total_replies from discussionforum;
-- 11. posts that haven't received any reply yet
select * from discussionforum where replycount = 0;
-- 12. posts made between '2023-07-05' and '2023-07-12'
select * from discussionforum where postdate between '2023-07-05' and '2023-07-12';
-- 13. list posts ordered by reply count descending
select * from discussionforum order by replycount desc;
-- 14. posts where title starts with 'Python'
select * from discussionforum where title like 'Python%';
-- 15. posts with more than 2 replies
select * from discussionforum where replycount > 2;
-- 16. find length of each post title
select postid, length(title) as title_length from discussionforum;
-- 17. posts that mention 'formula' in the content
select * from discussionforum where content like '%formula%';
-- 18. posts with no last reply yet
select * from discussionforum where lastreplydate is null;
-- 19. number of posts per student
select studentid, count(*) as post_count from discussionforum group by studentid;
-- 20. number of posts per course
select courseid, count(*) as post_count from discussionforum group by courseid;
-- 21. average replies per course
select courseid, avg(replycount) as avg_replies from discussionforum group by courseid;
-- 22. display post status as 'active' or 'inactive' using case
select postid, status,
       case
         when status = 'Open' then 'Active'
         else 'Inactive'
       end as status_type
from discussionforum;
-- 23. number of posts with more than 3 replies
select count(*) as popular_posts from discussionforum where replycount > 3;
-- 24. total replies by student
select studentid, sum(replycount) as total_replies from discussionforum group by studentid;
-- 25. show how many days each post took to receive last reply
select postid, datediff(lastreplydate, postdate) as days_to_reply from discussionforum where lastreplydate is not null;