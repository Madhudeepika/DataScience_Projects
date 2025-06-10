SELECT * FROM sql_practice.student_data;

# Create a table called "students" with the following columns: "id" (integer, primary key), "name" (text), "age" (integer), "gender" (text), and "major" (text).
CREATE TABLE students (
    id INT PRIMARY KEY,
    name TEXT,
    age INT,
    gender TEXT,
    major TEXT
);

# - Insert a new row into the "students" table with the following values: id=1, name='John Smith', age=22, gender='Male', major='Computer Science'.
INSERT INTO students (id, name, age, gender, major) 
VALUES (1, 'Madhu', 22, 'Male', 'Computer Science');

# 3. Write a SQL query to retrieve the names of all students in the "students" table
SELECT name FROM students;

# 4. Write a SQL query to retrieve the names and ages of all female students in the "students" table.
SELECT name, age FROM students WHERE gender = 'Female';

# 5. - Write a SQL query to update the age of the student with id=1 to 23.
UPDATE students SET age = 23 WHERE id = 1;

# 6. Create a new table called "courses" with the following columns: "id" (integer, primary key), "name" (text), and "description" (text).
CREATE TABLE courses (
    id INT PRIMARY KEY,
    name TEXT,
    description TEXT
);

#DATABASE CREATION: -
# 1.	Create a database ‘classroom’
CREATE DATABASE classroom;
# 2.	Create a table named ‘science_class’ with the following properties
# a.	columns(enrollment_no int, name varchar, science_marks int)
CREATE TABLE science_class (
    enrollment_no INT PRIMARY KEY,
    name VARCHAR(255),
    science_marks INT
);
# INSERTING & IMPORTING: -
# 1.	Insert the following data into science_class using the insert into command
# 1	popeye	33
# 2	olive	54
# 3	brutus	98
INSERT INTO science_class (enrollment_no, name, science_marks) 
VALUES 
    (1, 'Popeye', 33),
    (2, 'Olive', 54),
    (3, 'Brutus', 98);
# 2.	import data from CSV file ‘student.csv’ attached in resources to science_class to insert data of the next 8 students

# SELECT & WHERE: -
# 1.	Retrieve all data from the table ‘Science_Class’
SELECT * FROM science_class;

# 2.	Retrieve the name of students who have scored more than 60 marks
SELECT name FROM science_class WHERE science_marks > 60;

# 3.	Retrieve all data of students who have scored more than 35 but less than 60 marks
SELECT * FROM science_class WHERE science_marks > 35 AND science_marks < 60;

# 4.	Retrieve all other students i.e., who have scored less than or equal to 35 or more than or equal to 60.
SELECT * FROM science_class WHERE science_marks <= 35 OR science_marks >= 60;

# UPDATING TABLES: -
# 1.	update the marks of popeye to 45
SET SQL_SAFE_UPDATES = 0;
UPDATE science_class SET science_marks = 45 WHERE name = 'Popeye';

# 2.	delete the row containing details of the student named ‘robb’
DELETE FROM science_class WHERE name = 'Robb';

# 3.	Rename column ‘name’ to ‘student_name’
ALTER TABLE science_class CHANGE name student_name VARCHAR(255);
