/*
====================================================
|   Week 1
|   SQL Foundation — PostgreSQL
|   Authors: brew_code_zone, Ronit Fozdar
|   Purpose: Understand basics and commands
====================================================
*/

/*
This file was designed for postgreSQL.
Proceed only If you already have postgre installed from week_0.
Launch pgAdmin4 and connect to the server using the credentials
used during the installation of postgreSQL.
*/

/*
-----------------------
|   DATABASE COMMANDS
-----------------------
*/

-- CREATE DATABASE: Creates a new database
CREATE DATABASE learn_sql;

-- NOTE:
-- PostgreSQL does NOT support `USE database;`
-- You must connect to the database manually
-- (e.g., in pgAdmin or psql) before running table/queries


/*
-----------------------
|   TABLE CREATION
-----------------------
*/

-- CREATE TABLE: Creates a new table
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,          -- Employee ID
    emp_name TEXT NOT NULL,             -- Employee name
    emp_email TEXT UNIQUE,              -- Email must be unique
    emp_salary INT CHECK (emp_salary > 0),  -- Salary must be positive
    emp_dept TEXT
);

/*
-----------------------
|   INSERTING DATA
-----------------------
*/

-- INSERT INTO: Adds rows to a table
INSERT INTO employees (emp_name, emp_email, emp_salary, emp_dept) VALUES
('John', 'john@company.com', 70000, 'IT'),
('Sara', 'sara@company.com', 60000, 'HR'),
('Anita', 'anita@company.com', 80000, 'Accounts'),
('Robert', 'robert@company.com', 50000, 'Sales');

/*
-----------------------
|   SELECTING DATA
-----------------------
*/

-- SELECT *: Get all columns from all rows
SELECT * FROM employees;

-- SELECT specific columns
SELECT emp_name, emp_salary FROM employees;

/*
-----------------------
|   TRUNCATE
-----------------------
*/

-- TRUNCATE TABLE: Quickly remove all rows, keeps
-- table structure intact
TRUNCATE TABLE employees;

/*
-----------------------
|   DROP (Permanent delete)
-----------------------
*/

-- DROP TABLE: Deletes a table completely
DROP TABLE employees;

-- DROP DATABASE: Deletes the database and all tables inside it
DROP DATABASE learn_sql;

/*
✨ *Master SQL & Python one week at a time*  
💪 *Level up your skills week-by-week*

*𝗙𝗼𝗹𝗹𝗼𝘄 ╰┈➤ [`@brew_code zone`](https://www.instagram.com/brew_code_zone/) on* 🅾 𝐈𝐧𝐬𝐭𝐚𝐠𝐫𝐚𝐦 ★ *for daily Learnings*
*/