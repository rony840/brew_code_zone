/*
====================================================
|   Week 1
|   Mini Project 2 — Employee Data Tracker
|   Authors: brew_code_zone, Ronit Fozdar
====================================================

Requirements:
- Create Database 'EmployeeDB'
- Create 'Employees' table (emp_id, name, department, salary)
- Insert employee records
- Fetch employee data using SELECT
- Remove all records (but keep table schema)
- Delete table completely (including schema)

*/

CREATE DATABASE EmployeeDB;

CREATE TABLE Employees(
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(100),
    salary INT CHECK(salary > 0)
);

INSERT INTO Employees(emp_name, department, salary) VALUES
('Mary', 'Human Resources', '45000');

INSERT INTO Employees(emp_name, department, salary) VALUES
('Carlos', 'Sales', '72000'),
('Jenny', 'Human Resources', '66000'),
('Lara', 'Information Technology', '150000'),
('Jack', 'Sales', '50000');

SELECT * FROM Employees;

TRUNCATE TABLE Employees;

DROP TABLE Employees;