/*
====================================================
|   Week 1
|   Mini Project 1 — Student Management System
|   Authors: brew_code_zone, Ronit Fozdar
====================================================

Requirements:
- Create Database 'StudentDB'
- Create 'Students' table (student_id, name, age, course)
- Insert student records
- Fetch student data using SELECT
- Remove all records (but keep table schema)
- Delete table completely (including schema)

*/

CREATE DATABASE StudentDB;

CREATE TABLE Students(
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    age SMALLINT,
    course_name VARCHAR(30)
);

INSERT INTO Students(student_name, age, course_name) VALUES
('Alice', '24', 'Data Science');

INSERT INTO Students(student_name, age, course_name) VALUES
('John', '20', 'Python'),
('Sara', '21', 'Deep Learning'),
('Samantha', '19', 'Statistics-1'),
('Robert', '22', 'PostgreSQL');

SELECT * FROM Students;

TRUNCATE TABLE Students;

DROP TABLE Students;