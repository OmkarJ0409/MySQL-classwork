/*
1. What is a database?
Database: A database is a structured collection of data that can be easily accessed, managed, and updated.
Example: A library database stores info about books, members, and loans.

2. What is the difference between a database and a DBMS?
Database vs DBMS: A database stores the actual data; a DBMS (Database Management System) is software used to manage and
interact with that data.

3. What are the different types of databases?
Types of Databases: Relational, NoSQL, Object-Oriented, Hierarchical, Network, and Graph databases.

4. What is a relational database?
Relational Database: A database that stores data in tables with rows and columns, using keys to relate them.
Example: MySQL, PostgreSQL.

5. What is normalization? Explain its types.
Normalization: Process of organizing data to reduce redundancy.
Types: 1NF (atomic values), 2NF (no partial dependency), 3NF (no transitive dependency), BCNF.

6. What is denormalization?
Denormalization: The process of combining tables to improve read performance, at the cost of redundancy.

7. What is a primary key? How is it different from a unique key?
Primary Key vs Unique Key: Both ensure uniqueness, but the primary key can't be null and there’s only one per table, 
while a table can have multiple unique keys.

8. What is a foreign key?
Foreign Key: A key used to link two tables; it refers to the primary key in another table.

9. What are indexes? Why are they used?
Indexes: Data structures that speed up data retrieval.
Example: Index on email for faster user login lookup.

10. What is a composite key?
Composite Key: A primary key made of two or more columns.
Example: order_id + product_id in order_details.

11. What is the purpose of the CREATE command?
CREATE:It is Used to create a database or table.
Example: CREATE TABLE students(id INT, name VARCHAR(100));

12. How do you delete a database in MySQL?
Delete Database:
Command: DROP DATABASE db_name;

13. What is the ALTER command used for?
ALTER: Used to modify an existing table structure.
Example: ALTER TABLE students ADD age INT;

14. How do you create a table in MySQL?
Create Table:
CREATE TABLE users(id INT, name VARCHAR(50));

15. What is the DROP command?
DROP: Removes a table or database permanently.
Example: DROP TABLE users;

16. How do you insert data into a table?
Insert Data:
INSERT INTO students (id, name) VALUES (1, 'John');

17. What is the syntax for updating records in a table?
Update Records:
UPDATE students SET name = 'Mike' WHERE id = 1;

18. How do you delete records from a table?
Delete Records:
DELETE FROM students WHERE id = 1;

19. What is the SELECT statement used for?
SELECT: Retrieves data from a table.
Example: SELECT * FROM students;

20. How do you retrieve unique records from a table?
Unique Records: Use DISTINCT.
SELECT DISTINCT city FROM customers;

21. What is the purpose of the WHERE clause?
WHERE: Filters records based on a condition.
SELECT * FROM students WHERE age > 18;

22. Explain the ORDER BY clause.
ORDER BY: Sorts results ascending or descending.
SELECT * FROM users ORDER BY name ASC;

23. What is the GROUP BY clause used for?
GROUP BY: Groups rows with the same values.
SELECT city, COUNT(*) FROM users GROUP BY city;

24. How do you use the HAVING clause?
HAVING: Filters groups created by GROUP BY.
SELECT city, COUNT(*) FROM users GROUP BY city HAVING COUNT(*) > 1;

25. What are the different comparison operators in MySQL?
Comparison Operators: =, !=, <, >, <=, >=
Example: SELECT * FROM emp WHERE salary >= 50000;

26. What is the BETWEEN operator?
BETWEEN: Checks if value lies in range.
SELECT * FROM items WHERE price BETWEEN 100 AND 500;

27. Explain the LIKE operator.
LIKE: Matches a pattern.
SELECT * FROM emp WHERE name LIKE 'A%';

28. What is the IN operator?
IN: Matches multiple values.
SELECT * FROM emp WHERE dept IN ('HR', 'IT');

29. How do you use the NULL operator?
NULL: Checks for null values.
SELECT * FROM emp WHERE email IS NULL;

30. What is the difference between AND and OR operators?
AND vs OR:
AND: all conditions must be true
OR: at least one condition must be true
Example: WHERE age > 18 AND city = 'Mumbai'

31. What are aggregate functions? Give examples.
Aggregate Functions: Perform calculations on a set of values.
Examples: COUNT(), SUM(), AVG(), MAX(), MIN()

32. What is the COUNT() function?
COUNT(): Returns number of rows.
SELECT COUNT(*) FROM students;

33. Explain the SUM() function.
SUM(): Adds values.
SELECT SUM(price) FROM orders;

34. What is the AVG() function?
AVG(): Returns average.
SELECT AVG(marks) FROM students;

35. How does the MAX() function work?
MAX(): Returns maximum value.
SELECT MAX(salary) FROM employees;

36. What is the MIN() function?
MIN(): Returns minimum value.
SELECT MIN(age) FROM users;

37. Explain string functions in MySQL.
String Functions: Manipulate strings.
Examples: LENGTH(), LOWER(), UPPER(), SUBSTRING(), CONCAT()

38. What is the CONCAT() function?
CONCAT(): Combines strings.
SELECT CONCAT(first_name, ' ', last_name) FROM users;

39. How do you use the SUBSTRING() function?
SUBSTRING(): Extracts part of string.
SELECT SUBSTRING(name, 1, 3) FROM students;

40. What is the NOW() function?
NOW(): Returns current date and time.
SELECT NOW();

41. What is a user-defined function (UDF) in MySQL?
UDF: A custom function created by the user in MySQL for reusable logic.

42. How do you create a UDF?
Create UDF:
DELIMITER //
CREATE FUNCTION get_discount(price DECIMAL(10,2)) 
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
	RETURN price * 0.90;
END
// DELIMITER ;

43. What is the syntax for calling a UDF?
Call UDF:
SELECT get_discount(100);

44. Can UDFs return multiple values?
Multiple Values in UDF: No, UDFs return only one value; use procedures for multiple outputs.

45. What are the advantages of using UDFs?
Advantages of UDFs: Code reuse, modularity, and simplified queries.

46. What is a view in MySQL?
View: A virtual table based on a query.
Example: CREATE VIEW high_salary AS SELECT * FROM emp WHERE salary > 50000;

47. How do you create a view?
Create View:
CREATE VIEW view_name AS SELECT ...;

48. What is the difference between a view and a table?
View vs Table: Views are virtual and do not store data; tables are physical storage structures.

49. Can you update a view? If yes, how?
Update View: Possible if based on a single table without aggregations.
UPDATE view_name SET ...;

50. How do you drop a view?
Drop View:
DROP VIEW view_name;

51. What is a Common Table Expression (CTE)?
CTE: A temporary result set named for reference in the main query.

52. How do you create a CTE?
Create CTE:
WITH top_students AS (SELECT * FROM students WHERE marks > 80)
SELECT * FROM top_students;

53. What is the difference between a CTE and a subquery?
CTE vs Subquery: CTE improves readability and can be reused; subqueries are inline and often harder to manage.

54. Can you use a CTE recursively?
Recursive CTE: Yes, used for hierarchical queries like organization structure.

55. How do you reference a CTE in a query?
Reference CTE: Use the CTE name directly after defining it with WITH.

56. What is a join in SQL?
Join: Combines rows from two or more tables based on related columns.

57. Explain the different types of joins.
Types of Joins: INNER, LEFT, RIGHT, FULL OUTER, CROSS, SELF.

58. What is an INNER JOIN?
INNER JOIN: Returns matching rows from both tables.
SELECT * FROM A INNER JOIN B ON A.id = B.id;

59. What is a LEFT JOIN?
LEFT JOIN: All records from left table + matches from right.
SELECT * FROM A LEFT JOIN B ON A.id = B.id;

60. What is a RIGHT JOIN?
RIGHT JOIN: All from right + matches from left.
SELECT * FROM A RIGHT JOIN B ON A.id = B.id;

61. What is a FULL OUTER JOIN?
FULL OUTER JOIN: All records from both tables. Not directly supported in MySQL; use UNION.

62. How do you perform a CROSS JOIN?
CROSS JOIN: Returns Cartesian product.
SELECT * FROM A CROSS JOIN B;

63. What is a self-join?
Self Join: Joining a table to itself.
Example: Find employees with the same manager.

64. How do you join multiple tables?
Multiple Joins: Chain multiple join clauses.
A JOIN B ON ... JOIN C ON ...

65. What is the difference between a join and a subquery?
Join vs Subquery: Joins combine tables; subqueries nest one query inside another.

66. What is a subquery?
Subquery: A query within another query.
SELECT * FROM emp WHERE salary > (SELECT AVG(salary) FROM emp);

67. How do you write a subquery in the SELECT statement?
Subquery in SELECT:
SELECT name, (SELECT COUNT(*) FROM orders WHERE user_id = u.id) FROM users u;

68. Can you use a subquery in the WHERE clause?
Yes.
WHERE Subquery:
SELECT * FROM emp WHERE dept_id = (SELECT id FROM dept WHERE name='HR');

69. What is a correlated subquery?
Correlated Subquery: Subquery that references columns from outer query.
Example: Used in row-by-row comparisons.

70. How do you handle subqueries that return multiple rows?
Multiple Rows in Subquery: Use IN, ANY, or EXISTS.

71. What is a stored procedure?
Stored Procedure: A saved set of SQL statements executed by a call.

72. How do you create a stored procedure in MySQL?
Create Procedure:
DELIMITER //
CREATE PROCEDURE getAllStudents() 
BEGIN 
	SELECT * FROM students; 
END;
// DELIMITER ;

73. What is the syntax for calling a stored procedure?
Call Procedure:
CALL getAllStudents();

74. Can stored procedures accept parameters?
Procedure Parameters: Yes, you can define IN, OUT, and INOUT parameters.

75. What are the advantages of using stored procedures?
Advantages: Reusability, better performance, security, and logic encapsulation.

76. What is a trigger in MySQL?
Trigger: A block that executes automatically before/after an event like INSERT, UPDATE, DELETE.

77. How do you create a trigger?
Create Trigger:
CREATE TRIGGER before_insert 
BEFORE INSERT ON students FOR EACH ROW 
SET NEW.created_at = NOW();

78. What are the different types of triggers?
Types: BEFORE INSERT, AFTER INSERT, BEFORE UPDATE, AFTER UPDATE, etc.

79. Can a trigger call a stored procedure?
Trigger Calling Procedure: Yes, a trigger can call a stored procedure inside its body.

80. What is the difference between a trigger and a stored procedure?
Trigger vs Procedure: Triggers run automatically on events; procedures are manually called.

81. What is Data Control Language (DCL)?
DCL: Used for access control and permissions.
Commands: GRANT, REVOKE

82. What is the purpose of the GRANT command?
GRANT: Gives privileges.
GRANT SELECT ON db.* TO 'user'@'localhost';

83. How do you revoke privileges using the REVOKE command?
REVOKE: Removes privileges.
REVOKE SELECT ON db.* FROM 'user'@'localhost';

84. What is the difference between a user and a role in MySQL?
User vs Role: Users are individual accounts; roles are sets of privileges that can be assigned to users.

85. How do you create a new user in MySQL?
Create User:
CREATE USER 'john'@'localhost' IDENTIFIED BY 'pass123';

86. What is Transaction Control Language (TCL)?
TCL: Manages changes made by DML statements.
Commands: COMMIT, ROLLBACK, SAVEPOINT

87. What is the purpose of the COMMIT command?
COMMIT: Saves all changes.
COMMIT;

88. How do you use the ROLLBACK command?
ROLLBACK: Undoes changes since last commit/savepoint.
ROLLBACK;

89. What is the SAVEPOINT command?
SAVEPOINT: Sets a point to rollback to.
SAVEPOINT sp1;

90. How do you set the transaction isolation level?
Transaction Isolation: Set using SET TRANSACTION ISOLATION LEVEL READ COMMITTED;

91. What are the different types of databases (e.g., relational, NoSQL)?
Types: Relational, NoSQL, Graph, Hierarchical, Object-Oriented.

92. What is the difference between SQL and NoSQL databases?
SQL vs NoSQL: SQL uses structured schemas and tables; NoSQL uses flexible, document or key-value models.

93. What are some examples of NoSQL databases?
NoSQL Examples: MongoDB, Cassandra, Redis, CouchDB.

94. What is a distributed database?
Distributed Database: A database spread across multiple machines.
Example: Google Spanner.

95. What is a cloud database?
Cloud Database: Hosted on cloud platforms.
Example: AWS RDS, Google Cloud SQL.

96. What is a Database Management System (DBMS)?
DBMS: Software to manage databases, allowing data storage, retrieval, and manipulation.

97. What are the functions of a DBMS?
Functions of DBMS: Data storage, security, backup, transaction management, concurrency control.

98. What is the difference between a DBMS and a RDBMS?
DBMS vs RDBMS: RDBMS supports relational models and keys; DBMS may not follow relational rules.

99. What are some popular DBMS software?
Popular DBMS: MySQL, PostgreSQL, Oracle, SQL Server, MongoDB.

100. What is data integrity, and how does a DBMS ensure it?
Data Integrity: Ensures accuracy and consistency via constraints like PRIMARY KEY, FOREIGN KEY, UNIQUE.
*/