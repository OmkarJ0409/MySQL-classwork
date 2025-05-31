/*
This file consists of a database named ANIMAL_SHELTER having tables Animals, Adoptions, Medical_Records, Staff, and Donors.

Table.1 - ANIMALS TABLE - (Stores animal information)
        Attributes: Animal_id, Name, Species, Breed, Arrival_date

Table.2 - ADOPTIONS TABLE - (Stores animal adoption records)
        Attributes: Adoption_id, Animal_id, Adopter_name, Adoption_date, Fee, Contact

Table.3 - MEDICAL_RECORDS TABLE - (Stores animal medical history)
        Attributes: Record_id, Animal_id, Visit_Date, Treatment, Vet_name

Table.4 - STAFF TABLE - (Stores staff information)
        Attributes: Staff_id, Staff_name, Role, Hire_Date, Contact

Table.5 - DONORS TABLE - (Stores donor contributions)
        Attributes: Donor_id, Name, Donation_Amount, Donation_Date, Contact_Email

Step-by-step Creation of Animal_Shelter Database:
Step 1: Create the Database  
Step 2: Select the Database  
Step 3: Create Animals Table + Insert Data  
Step 4: Create Adoptions Table + Insert Data  
Step 5: Create Medical_Records Table + Insert Data  
Step 6: Create Staff Table + Insert Data  
Step 7: Create Donors Table + Insert Data  
Step 8: View Data  
*/


-- Step 1: Create the Database
create database Animal_Shelter;

-- Step 2: Use the Database
use Animal_Shelter;


-- Step 3: Create Animals Table ----------------------------------------------------------
create table Animals(
    Animal_id int primary key,
    Name varchar(50),
    Species varchar(30),
    Breed varchar(30),
    Arrival_date date
);

insert into Animals values
(1, 'Bella', 'Dog', 'Labrador', '2023-01-10'),
(2, 'Max', 'Cat', 'Siamese', '2023-02-15'),
(3, 'Luna', 'Dog', 'Beagle', '2023-03-01'),
(4, 'Charlie', 'Cat', 'Persian', '2023-03-22'),
(5, 'Coco', 'Rabbit', 'Lop', '2023-04-05'),
(6, 'Rocky', 'Dog', 'Bulldog', '2023-04-20'),
(7, 'Milo', 'Cat', 'Maine Coon', '2023-05-01'),
(8, 'Daisy', 'Dog', 'Poodle', '2023-05-18'),
(9, 'Lily', 'Rabbit', 'Rex', '2023-06-01'),
(10, 'Simba', 'Cat', 'Bengal', '2023-06-15');

-- To view Animals data
select * from Animals;

-- To clear table data
truncate table Animals;

-- To drop the table
drop table Animals;


-- Step 4: Create Adoptions Table ----------------------------------------------------------
create table Adoptions(
    Adoption_id int primary key,
    Animal_id int,
    Adopter_name varchar(50),
    Adoption_date date,
    Fee int,
    Contact varchar(10),
    foreign key (Animal_id) references Animals(Animal_id)
);

insert into Adoptions values
(1, 1, 'John Smith', '2023-02-01', 100, '9876543210'),
(2, 2, 'Emily Johnson', '2023-03-05', 80, '8765432109'),
(3, 3, 'Michael Lee', '2023-04-10', 90, '7654321098'),
(4, 4, 'Sarah Kim', '2023-05-02', 85, '6543210987'),
(5, 5, 'Daniel Wright', '2023-05-15', 70, '5432109876'),
(6, 6, 'Olivia Brown', '2023-06-01', 120, '4321098765'),
(7, 7, 'James Davis', '2023-06-20', 95, '3210987654'),
(8, 8, 'Sophia Wilson', '2023-07-05', 100, '2109876543'),
(9, 9, 'Benjamin Clark', '2023-07-15', 60, '1098765432'),
(10, 10, 'Emma Martinez', '2023-08-01', 110, '0987654321');

-- To view Adoptions data
select * from Adoptions;

-- To clear table data
truncate table Adoptions;

-- To drop the table
drop table Adoptions;


-- Step 5: Create Medical_Records Table ----------------------------------------------------------
create table Medical_Records(
    Record_id int primary key,
    Animal_id int,
    Visit_Date date,
    Treatment text,
    Vet_name varchar(50),
    foreign key (Animal_id) references Animals(Animal_id)
);

insert into Medical_Records values
(1, 1, '2023-01-15', 'Vaccination - Rabies', 'Dr. Patel'),
(2, 2, '2023-02-18', 'Deworming', 'Dr. Singh'),
(3, 3, '2023-03-05', 'Check-up', 'Dr. Mehta'),
(4, 4, '2023-03-25', 'Minor Surgery', 'Dr. Nair'),
(5, 5, '2023-04-10', 'Vaccination - Myxomatosis', 'Dr. Rao'),
(6, 6, '2023-04-25', 'Dental Cleaning', 'Dr. Shah'),
(7, 7, '2023-05-05', 'Flea Treatment', 'Dr. Joshi'),
(8, 8, '2023-05-20', 'Vaccination - DHPP', 'Dr. Iyer'),
(9, 9, '2023-06-05', 'Spay Surgery', 'Dr. Kapoor'),
(10, 10, '2023-06-18', 'Check-up', 'Dr. Das');

-- To view Medical_Records data
select * from Medical_Records;

-- To clear table data
truncate table Medical_Records;

-- To drop the table
drop table Medical_Records;


-- Step 6: Create Staff Table ----------------------------------------------------------
create table Staff(
    Staff_id int primary key,
    Staff_name varchar(50),
    Role varchar(40),
    Hire_Date date,
    Contact varchar(10)
);

insert into Staff values
(1, 'Alex Green', 'Manager', '2022-01-10', '9000000001'),
(2, 'Linda White', 'Vet Technician', '2022-03-15', '9000000002'),
(3, 'Tom Harris', 'Caretaker', '2022-05-01', '9000000003'),
(4, 'Nina Black', 'Receptionist', '2022-07-20', '9000000004'),
(5, 'Jake Lewis', 'Volunteer Coordinator', '2022-09-12', '9000000005'),
(6, 'Sara King', 'Admin Assistant', '2023-01-25', '9000000006'),
(7, 'Chris Moore', 'Animal Trainer', '2023-02-28', '9000000007'),
(8, 'Emily Baker', 'Caretaker', '2023-04-03', '9000000008'),
(9, 'Ryan Wood', 'Facilities Manager', '2023-05-17', '9000000009'),
(10, 'Olivia Hall', 'Veterinarian', '2023-06-10', '9000000010');

-- To view Staff data
select * from Staff;

-- To clear table data
truncate table Staff;

-- To drop the table
drop table Staff;


-- Step 7: Create Donors Table ----------------------------------------------------------
create table Donors(
    Donor_id int primary key,
    Name varchar(50),
    Donation_Amount int,
    Donation_Date date,
    Contact_Email varchar(20)
);

insert into Donors values
(1, 'Jessica Allen', 500, '2023-01-10', 'jessica@mail.com'),
(2, 'Robert Young', 1000, '2023-02-20', 'robert@mail.com'),
(3, 'Nancy Hill', 300, '2023-03-05', 'nancy@mail.com'),
(4, 'Paul Scott', 750, '2023-03-25', 'paul@mail.com'),
(5, 'Karen Adams', 1200, '2023-04-15', 'karen@mail.com'),
(6, 'Gary Turner', 400, '2023-05-01', 'gary@mail.com'),
(7, 'Amy Nelson', 600, '2023-05-22', 'amy@mail.com'),
(8, 'Brian Campbell', 950, '2023-06-10', 'brian@mail.com'),
(9, 'Laura Mitchell', 800, '2023-06-28', 'laura@mail.com'),
(10, 'Eric Perez', 1100, '2023-07-15', 'eric@mail.com');

-- To view Donors data
select * from Donors;

-- To clear table data
truncate table Donors;

-- To drop the table
drop table Donors;


-- Step 8: View All Tables ----------------------------------------------------------
select * from Animals;
select * from Adoptions;
select * from Medical_Records;
select * from Staff;
select * from Donors;