-- create a database first
create database university1;

-- to work on this database, you need to use it first
use university1;

-- --------------------------------------- Database Analysis ----------------------------------------------------------------
/*
T1  : departments(dept_id, name, building, phone, email, head, established_year, faculty_count, budget, accreditation)
T2  : professors(prof_id, full_name, email, phone, gender, dob, hire_date, dept_id, qualification, designation)
T3  : students(student_id, full_name, email, phone, gender, dob, dept_id, enrollment_year, degree_program, address)
T4  : courses(course_id, title, credits, dept_id, semester, level, instructor_id, schedule, room_no, status)
T5  : enrollments(enrollment_id, student_id, course_id, enrollment_date, grade, status, attendance, remarks, attempt, session)
T6  : classrooms(room_no, building, capacity, resources, floor, type, status, dept_id, opened_year, maintenance_status)
T7  : library_books(book_id, title, author, publisher, edition, year_published, isbn, dept_id, quantity, category)
T8  : issued_books(issue_id, student_id, book_id, issue_date, due_date, return_date, fine, status, issued_by, remarks)
T9  : fees(fee_id, student_id, amount, fee_type, payment_date, method, transaction_id, semester, status, remarks)
T10 : exam_results(result_id, student_id, course_id, semester, exam_date, marks_obtained, total_marks, grade, result_status, remarks)
*/

-- Table-1 departments -------------------------------------------------------------------------------------------------------
create table departments (
dept_id int primary key,
name varchar(100),
building varchar(50),
phone varchar(20),
email varchar(100),
head varchar(100),
established_year int,
faculty_count int,
budget int,
accreditation varchar(50)
);

insert into departments values
(1, 'Computer Science', 'Block A', '022-12345678', 'cs@univ.edu', 'Dr. Mehta', 1998, 25, 2000000, 'NAAC A'),
(2, 'Mechanical Engineering', 'Block B', '022-87654321', 'mech@univ.edu', 'Dr. Patil', 1995, 20, 1800000, 'NAAC B+'),
(3, 'Electrical Engineering', 'Block C', '022-23456789', 'ee@univ.edu', 'Dr. Sharma', 1992, 22, 1900000, 'NBA'),
(4, 'Civil Engineering', 'Block D', '022-98765432', 'civil@univ.edu', 'Dr. Joshi', 1989, 18, 1700000, 'NAAC A'),
(5, 'Information Technology', 'Block E', '022-34567890', 'it@univ.edu', 'Dr. Iyer', 2001, 24, 1850000, 'NAAC A+'),
(6, 'Mathematics', 'Block F', '022-45678901', 'maths@univ.edu', 'Dr. Nair', 1980, 15, 1000000, 'NAAC A'),
(7, 'Physics', 'Block G', '022-56789012', 'physics@univ.edu', 'Dr. Roy', 1985, 17, 1100000, 'NAAC B'),
(8, 'Chemistry', 'Block H', '022-67890123', 'chem@univ.edu', 'Dr. Verma', 1983, 19, 1150000, 'NAAC A'),
(9, 'Biotechnology', 'Block I', '022-78901234', 'bio@univ.edu', 'Dr. Khan', 2005, 14, 950000, 'NAAC A+'),
(10, 'Management Studies', 'Block J', '022-89012345', 'mba@univ.edu', 'Dr. Desai', 1999, 21, 2500000, 'AICTE Approved');

-- to display table data
select * from departments;
-- to remove complete records from table
truncate table departments;
-- to remove complete records and attributes from table
drop table departments;


-- Table-2 professors -------------------------------------------------------------------------------------------------------
create table professors (
prof_id int primary key,
full_name varchar(100),
email varchar(100),
phone varchar(20),
gender varchar(10),
dob date,
hire_date date,
dept_id int,
qualification varchar(50),
designation varchar(50),
foreign key (dept_id) references departments(dept_id)
);

insert into professors values
(1, 'Dr. Anil Mehta', 'anil.mehta@univ.edu', '9999988881', 'Male', '1970-06-15', '2000-07-01', 1, 'PhD in CS', 'Professor'),
(2, 'Dr. Neha Patil', 'neha.patil@univ.edu', '9999988882', 'Female', '1975-09-20', '2003-01-10', 2, 'PhD in Mech', 'Associate Professor'),
(3, 'Dr. Ravi Sharma', 'ravi.sharma@univ.edu', '9999988883', 'Male', '1968-03-05', '1995-11-15', 3, 'PhD in EE', 'HOD'),
(4, 'Dr. Shreya Joshi', 'shreya.joshi@univ.edu', '9999988884', 'Female', '1980-12-30', '2005-08-01', 4, 'PhD in Civil', 'Assistant Professor'),
(5, 'Dr. Ajay Iyer', 'ajay.iyer@univ.edu', '9999988885', 'Male', '1978-02-25', '2006-09-12', 5, 'PhD in IT', 'Professor'),
(6, 'Dr. Radhika Nair', 'radhika.nair@univ.edu', '9999988886', 'Female', '1982-11-10', '2010-01-20', 6, 'PhD in Mathematics', 'Associate Professor'),
(7, 'Dr. Amit Roy', 'amit.roy@univ.edu', '9999988887', 'Male', '1976-07-14', '2002-03-18', 7, 'PhD in Physics', 'Professor'),
(8, 'Dr. Kavita Verma', 'kavita.verma@univ.edu', '9999988888', 'Female', '1981-04-19', '2009-06-23', 8, 'PhD in Chemistry', 'Assistant Professor'),
(9, 'Dr. Imran Khan', 'imran.khan@univ.edu', '9999988889', 'Male', '1979-01-08', '2007-04-05', 9, 'PhD in Biotech', 'Professor'),
(10, 'Dr. Alok Desai', 'alok.desai@univ.edu', '9999988890', 'Male', '1973-08-11', '2001-10-27', 10, 'PhD in Management', 'HOD');

-- to display table data
select * from professors;
-- to remove complete records from table
truncate table professors;
-- to remove complete records and attributes from table
drop table professors;


-- Table-3 students ---------------------------------------------------------------------------------------------------------
create table students (
student_id int primary key,
full_name varchar(100),
email varchar(100),
phone varchar(20),
gender varchar(10),
dob date,
dept_id int,
enrollment_year int,
degree_program varchar(50),
address text,
foreign key (dept_id) references departments(dept_id)
);

insert into students values
(1, 'Amit Singh', 'amit.singh@univ.edu', '9000000001', 'Male', '2003-04-10', 1, 2021, 'B.Tech Computer Science', 'Pune, Maharashtra'),
(2, 'Priya Desai', 'priya.desai@univ.edu', '9000000002', 'Female', '2002-07-25', 2, 2020, 'B.Tech Mechanical', 'Mumbai, Maharashtra'),
(3, 'Raj Malhotra', 'raj.malhotra@univ.edu', '9000000003', 'Male', '2003-11-15', 3, 2021, 'B.Tech Electrical', 'Delhi'),
(4, 'Sneha Nair', 'sneha.nair@univ.edu', '9000000004', 'Female', '2002-02-28', 4, 2020, 'B.Tech Civil', 'Kochi, Kerala'),
(5, 'Arjun Mehra', 'arjun.mehra@univ.edu', '9000000005', 'Male', '2001-10-12', 5, 2019, 'B.Tech IT', 'Nagpur, Maharashtra'),
(6, 'Meera Joshi', 'meera.joshi@univ.edu', '9000000006', 'Female', '2003-06-09', 6, 2021, 'B.Sc Mathematics', 'Ahmedabad, Gujarat'),
(7, 'Kunal Roy', 'kunal.roy@univ.edu', '9000000007', 'Male', '2002-09-18', 7, 2020, 'B.Sc Physics', 'Kolkata, West Bengal'),
(8, 'Neha Verma', 'neha.verma@univ.edu', '9000000008', 'Female', '2003-12-03', 8, 2021, 'B.Sc Chemistry', 'Bhopal, MP'),
(9, 'Zoya Khan', 'zoya.khan@univ.edu', '9000000009', 'Female', '2001-08-05', 9, 2019, 'B.Tech Biotech', 'Lucknow, UP'),
(10, 'Nikhil Sharma', 'nikhil.sharma@univ.edu', '9000000010', 'Male', '2000-01-30', 10, 2018, 'BBA', 'Jaipur, Rajasthan');

-- to display table data
select * from students;
-- to remove complete records from table
truncate table students;
-- to remove complete records and attributes from table
drop table students;

-- Table-4 courses ----------------------------------------------------------------------------------------------------------
create table courses (
course_id int primary key,
title varchar(100),
credits int,
dept_id int,
semester int,
level varchar(20),
instructor_id int,
schedule varchar(50),
room_no varchar(10),
status varchar(20),
foreign key (dept_id) references departments(dept_id),
foreign key (instructor_id) references professors(prof_id)
);

insert into courses values
(1, 'Data Structures', 4, 1, 3, 'Undergraduate', 1, 'Mon-Wed 10:00-11:30', 'A101', 'Active'),
(2, 'Thermodynamics', 4, 2, 4, 'Undergraduate', 2, 'Tue-Thu 09:00-10:30', 'B202', 'Active'),
(3, 'Circuits & Systems', 3, 3, 2, 'Undergraduate', 3, 'Mon-Wed 11:30-13:00', 'C303', 'Active'),
(4, 'Structural Analysis', 3, 4, 5, 'Undergraduate', 4, 'Tue-Thu 14:00-15:30', 'D404', 'Active'),
(5, 'Web Development', 4, 5, 6, 'Undergraduate', 5, 'Fri 10:00-13:00', 'E505', 'Active'),
(6, 'Linear Algebra', 3, 6, 1, 'Undergraduate', 6, 'Mon-Wed 09:00-10:30', 'F606', 'Active'),
(7, 'Quantum Mechanics', 4, 7, 6, 'Undergraduate', 7, 'Tue-Thu 11:00-12:30', 'G707', 'Active'),
(8, 'Organic Chemistry', 4, 8, 5, 'Undergraduate', 8, 'Mon-Wed 14:00-15:30', 'H808', 'Active'),
(9, 'Genetic Engineering', 4, 9, 6, 'Undergraduate', 9, 'Tue-Thu 09:00-10:30', 'I909', 'Active'),
(10, 'Principles of Management', 3, 10, 1, 'Undergraduate', 10, 'Fri 11:00-13:00', 'J010', 'Active');

-- to display table data
select * from courses;
-- to remove complete records from table
truncate table courses;
-- to remove complete records and attributes from table
drop table courses;


-- Table-5 enrollments ------------------------------------------------------------------------------------------------------
create table enrollments (
enrollment_id int primary key,
student_id int,
course_id int,
enroll_date date,
grade varchar(2),
attendance_percent float,
semester int,
academic_year varchar(20),
exam_status varchar(20),
remarks varchar(100),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);

insert into enrollments values
(1, 1, 1, '2023-08-01', 'A', 92.5, 3, '2023-24', 'Passed', 'Excellent performance'),
(2, 2, 2, '2022-08-05', 'B+', 85.0, 4, '2022-23', 'Passed', 'Good attendance'),
(3, 3, 3, '2023-01-10', 'B', 78.5, 2, '2022-23', 'Passed', 'Needs improvement in assignments'),
(4, 4, 4, '2022-08-01', 'A-', 90.0, 5, '2022-23', 'Passed', 'Very punctual'),
(5, 5, 5, '2021-08-12', 'A', 95.0, 6, '2021-22', 'Passed', 'Outstanding project'),
(6, 6, 6, '2023-07-25', 'B+', 88.0, 1, '2023-24', 'Passed', 'Strong mathematics skills'),
(7, 7, 7, '2022-07-30', 'A-', 91.0, 6, '2022-23', 'Passed', 'Great conceptual clarity'),
(8, 8, 8, '2022-08-10', 'B', 82.0, 5, '2022-23', 'Passed', 'Active participation in labs'),
(9, 9, 9, '2021-08-01', 'A', 94.0, 6, '2021-22', 'Passed', 'Excellent practical skills'),
(10, 10, 10, '2019-08-01', 'A+', 96.0, 1, '2019-20', 'Passed', 'Top scorer in batch');

-- to display table data
select * from enrollments;
-- to remove complete records from table
truncate table enrollments;
-- to remove complete records and attributes from table
drop table enrollments;


-- Table-6 classrooms -------------------------------------------------------------------------------------------------------
create table classrooms (
room_no varchar(10) primary key,
building varchar(50),
floor int,
capacity int,
has_projector boolean,
has_ac boolean,
whiteboard_type varchar(20),
allocated_dept int,
availability_status varchar(20),
remarks varchar(100),
foreign key (allocated_dept) references departments(dept_id)
);

insert into classrooms values
('A101', 'Main Block', 1, 60, true, true, 'Smart Board', 1, 'Available', 'CS Dept. Main Lab'),
('B202', 'Mechanical Wing', 2, 50, false, false, 'Whiteboard', 2, 'In Use', 'Thermodynamics Class'),
('C303', 'EE Block', 3, 40, true, false, 'Smart Board', 3, 'Available', 'Circuit Lab'),
('D404', 'Civil Block', 4, 45, false, true, 'Whiteboard', 4, 'Available', 'Bridge Analysis Room'),
('E505', 'IT Wing', 5, 60, true, true, 'Smart Board', 5, 'In Use', 'Web Development Lab'),
('F606', 'Science Wing', 6, 40, false, true, 'Whiteboard', 6, 'Available', 'Math Class'),
('G707', 'Science Wing', 7, 50, true, false, 'Smart Board', 7, 'Available', 'Quantum Lab'),
('H808', 'Science Wing', 8, 55, false, false, 'Whiteboard', 8, 'In Use', 'Chemistry Lab'),
('I909', 'Biotech Block', 9, 45, true, true, 'Smart Board', 9, 'In Use', 'Genetics Lab'),
('J010', 'Management Block', 1, 40, false, true, 'Whiteboard', 10, 'Available', 'Seminar Room');

-- to display table data
select * from classrooms;
-- to remove complete records from table
truncate table classrooms;
-- to remove complete records and attributes from table
drop table classrooms;


-- Table-7 library_books ----------------------------------------------------------------------------------------------------
create table library_books (
book_id int primary key,
title varchar(150),
author varchar(100),
publisher varchar(100),
edition varchar(20),
year_published int,
isbn varchar(20),
dept_id int,
quantity int,
category varchar(50),
foreign key (dept_id) references departments(dept_id)
);

insert into library_books values
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '3rd', 2009, '9780262033848', 1, 10, 'Computer Science'),
(2, 'Engineering Thermodynamics', 'P.K. Nag', 'McGraw-Hill', '6th', 2013, '9780070151314', 2, 8, 'Mechanical'),
(3, 'Electrical Machinery', 'P.S. Bimbhra', 'Khanna Publishers', '7th', 2011, '9788174091735', 3, 6, 'Electrical'),
(4, 'Basic Structural Analysis', 'C.S. Reddy', 'Tata McGraw-Hill', '3rd', 2010, '9780070147287', 4, 7, 'Civil'),
(5, 'Web Technologies', 'Uttam K. Roy', 'Oxford University Press', '2nd', 2012, '9780199456147', 5, 9, 'IT'),
(6, 'Higher Engineering Mathematics', 'B.S. Grewal', 'Khanna Publishers', '44th', 2017, '9789382609052', 6, 12, 'Mathematics'),
(7, 'Concepts of Modern Physics', 'Arthur Beiser', 'McGraw-Hill', '7th', 2013, '9789339204787', 7, 5, 'Physics'),
(8, 'Organic Chemistry', 'Morrison and Boyd', 'Pearson', '7th', 2011, '9788131704814', 8, 6, 'Chemistry'),
(9, 'Principles of Genetics', 'Snustad & Simmons', 'Wiley', '7th', 2015, '9781119142287', 9, 4, 'Biotech'),
(10, 'Marketing Management', 'Philip Kotler', 'Pearson', '15th', 2016, '9789332587405', 10, 10, 'Management');

-- to display table data
select * from library_books;
-- to remove complete records from table
truncate table library_books;
-- to remove complete records and attributes from table
drop table library_books;


-- Table-8 issued_books -----------------------------------------------------------------------------------------------------
create table issued_books (
issue_id int primary key,
student_id int,
book_id int,
issue_date date,
due_date date,
return_date date,
fine int,
status varchar(20),
issued_by varchar(50),
remarks varchar(100),
foreign key (student_id) references students(student_id),
foreign key (book_id) references library_books(book_id)
);

insert into issued_books values
(1, 1, 1, '2025-06-01', '2025-06-15', '2025-06-14', 0, 'Returned', 'Librarian A', ''),
(2, 2, 2, '2025-06-02', '2025-06-16', '2025-06-18', 20, 'Returned', 'Librarian B', 'Late fee charged'),
(3, 3, 3, '2025-06-03', '2025-06-17', null, 0, 'Issued', 'Librarian A', ''),
(4, 4, 4, '2025-06-04', '2025-06-18', '2025-06-18', 0, 'Returned', 'Librarian B', ''),
(5, 5, 5, '2025-06-05', '2025-06-19', '2025-06-20', 10, 'Returned', 'Librarian C', 'Returned late'),
(6, 6, 6, '2025-06-06', '2025-06-20', null, 0, 'Issued', 'Librarian A', ''),
(7, 7, 7, '2025-06-07', '2025-06-21', '2025-06-21', 0, 'Returned', 'Librarian B', ''),
(8, 8, 8, '2025-06-08', '2025-06-22', '2025-06-22', 0, 'Returned', 'Librarian C', ''),
(9, 9, 9, '2025-06-09', '2025-06-23', '2025-06-23', 0, 'Returned', 'Librarian A', ''),
(10, 10, 10, '2025-06-10', '2025-06-24', null, 0, 'Issued', 'Librarian C', '');

-- to display table data
select * from issued_books;
-- to remove complete records from table
truncate table issued_books;
-- to remove complete records and attributes from table
drop table issued_books;


-- Table-9 fees -------------------------------------------------------------------------------------------------------------
create table fees (
fee_id int primary key,
student_id int,
amount int,
fee_type varchar(50),
payment_date date,
method varchar(30),
transaction_id varchar(50),
semester int,
status varchar(20),
remarks varchar(100),
foreign key (student_id) references students(student_id)
);

insert into fees values
(1, 1, 50000, 'Tuition', '2025-06-01', 'UPI', 'TXN1001', 3, 'Paid', ''),
(2, 2, 55000, 'Tuition', '2025-06-02', 'Credit Card', 'TXN1002', 4, 'Paid', ''),
(3, 3, 40000, 'Hostel', '2025-06-03', 'Debit Card', 'TXN1003', 2, 'Paid', ''),
(4, 4, 3000, 'Exam', '2025-06-04', 'Net Banking', 'TXN1004', 5, 'Paid', ''),
(5, 5, 50000, 'Tuition', '2025-06-05', 'UPI', 'TXN1005', 6, 'Paid', 'Scholarship adjusted'),
(6, 6, 3200, 'Exam', '2025-06-06', 'UPI', 'TXN1006', 1, 'Paid', ''),
(7, 7, 55000, 'Tuition', '2025-06-07', 'Credit Card', 'TXN1007', 6, 'Paid', ''),
(8, 8, 40000, 'Hostel', '2025-06-08', 'Net Banking', 'TXN1008', 5, 'Paid', ''),
(9, 9, 3000, 'Exam', '2025-06-09', 'Debit Card', 'TXN1009', 6, 'Paid', ''),
(10, 10, 50000, 'Tuition', '2025-06-10', 'UPI', 'TXN1010', 1, 'Paid', '');

-- to display table data
select * from fees;
-- to remove complete records from table
truncate table fees;
-- to remove complete records and attributes from table
drop table fees;


-- Table-10 exam_results ----------------------------------------------------------------------------------------------------
create table exam_results (
result_id int primary key,
student_id int,
course_id int,
semester int,
exam_date date,
marks_obtained int,
total_marks int,
grade varchar(2),
result_status varchar(20),
remarks varchar(100),
foreign key (student_id) references students(student_id),
foreign key (course_id) references courses(course_id)
);

insert into exam_results values
(1, 1, 1, 3, '2025-05-20', 85, 100, 'A', 'Pass', 'Excellent'),
(2, 2, 2, 4, '2025-05-21', 78, 100, 'B+', 'Pass', ''),
(3, 3, 3, 2, '2025-05-22', 70, 100, 'B', 'Pass', 'Needs improvement'),
(4, 4, 4, 5, '2025-05-23', 88, 100, 'A', 'Pass', 'Very good'),
(5, 5, 5, 6, '2025-05-24', 92, 100, 'A+', 'Pass', 'Topper'),
(6, 6, 6, 1, '2025-05-25', 80, 100, 'A', 'Pass', ''),
(7, 7, 7, 6, '2025-05-26', 83, 100, 'A-', 'Pass', ''),
(8, 8, 8, 5, '2025-05-27', 77, 100, 'B+', 'Pass', ''),
(9, 9, 9, 6, '2025-05-28', 89, 100, 'A', 'Pass', ''),
(10, 10, 10, 1, '2025-05-29', 95, 100, 'A+', 'Pass', 'Outstanding');

-- to display table data
select * from exam_results;
-- to remove complete records from table
truncate table exam_results;
-- to remove complete records and attributes from table
drop table exam_results;