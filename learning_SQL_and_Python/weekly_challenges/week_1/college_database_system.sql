CREATE DATABASE CollegeDB;

CREATE TABLE Students (
    student_id INT GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    student_name VARCHAR(50),
    department VARCHAR(30)
);

CREATE TABLE Courses (
    course_id INT GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    course_name VARCHAR(50)
);

CREATE TABLE Enrollments (
    enrollment_id INT GENERATED ALWAYS AS IDENTITY
        (START WITH 1 INCREMENT BY 1),
    student_id INT,
    course_id INT
);

INSERT INTO Students (student_name, department) VALUES
('Jimmy', 'CS'),
('Jenny', 'IT'),
('Julia', 'DS');

INSERT INTO Courses (course_name) VALUES
('SQL Basics'),
('Python Programming'),
('Statistics');

INSERT INTO Enrollments (student_id, course_id) VALUES
(1,1),
(1,2),
(2,1),
(3,3);

SELECT * FROM Students;
SELECT * FROM Courses;
SELECT * FROM Enrollments;

SELECT student_name, department FROM Students;

TRUNCATE TABLE Enrollments;
SELECT * FROM Enrollments;

DROP TABLE Courses;
SELECT * FROM Courses;

DROP DATABASE CollegeDB;