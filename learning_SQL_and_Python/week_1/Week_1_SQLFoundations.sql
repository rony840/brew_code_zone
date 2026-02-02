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
    emp_id INT,                 -- Employee ID
    emp_name VARCHAR(20),       -- Employee name
    emp_department VARCHAR(20)  -- Employee department
);

/*
-----------------------
|   INSERTING DATA
-----------------------
*/

-- INSERT INTO: Adds rows to a table
INSERT INTO employees (emp_id, emp_name, emp_department) VALUES
(1, 'John', 'IT'),
(2, 'Sara', 'HR'),
(3, 'Anita', 'Accounts'),
(4, 'Robert', 'Sales');

/*
-----------------------
|   SELECTING DATA
-----------------------
*/

-- SELECT *: Get all columns from all rows
SELECT * FROM employees;

-- SELECT specific columns
SELECT emp_name, emp_department FROM employees;

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
-----------------------
|   Datatypes
-----------------------
*/

-- Numeric Types:
/*
| Type                            | Description            | Example                   | Notes                    |
| ------------------------------- | ---------------------- | ------------------------- | ------------------------ |
| `SMALLINT`                      | 2-byte integer         | `age SMALLINT`            | Range: -32,768 to 32,767 |
| `INT` / `INTEGER`               | 4-byte integer         | `id INT`                  | Range: ~-2B to 2B        |
| `BIGINT`                        | 8-byte integer         | `big_number BIGINT`       | Very large integers      |
| `SERIAL`                        | Auto-increment integer | `emp_id SERIAL`           | Used for primary keys    |
| `BIGSERIAL`                     | Auto-increment BIGINT  | `id BIGSERIAL`            | For huge tables          |
| `DECIMAL(p,s)` / `NUMERIC(p,s)` | Fixed precision        | `price DECIMAL(10,2)`     | Great for money          |
| `REAL`                          | 4-byte floating point  | `score REAL`              | Approximate              |
| `DOUBLE PRECISION`              | 8-byte float           | `rating DOUBLE PRECISION` | Approximate              |
*/

-- Character/String Types:
/*
| Type         | Description            | Example             | Notes                              |
| ------------ | ---------------------- | ------------------- | ---------------------------------- |
| `CHAR(n)`    | Fixed-length string    | `code CHAR(5)`      | Always 5 chars, padded with spaces |
| `VARCHAR(n)` | Variable-length string | `name VARCHAR(100)` | Most common                        |
| `TEXT`       | Unlimited length text  | `description TEXT`  | Use for long content like notes    |
*/

-- Boolean:
/*
| Type      | Description | Example             | Notes                             |
| --------- | ----------- | ------------------- | --------------------------------- |
| `BOOLEAN` | True/False  | `is_active BOOLEAN` | Stores `TRUE`, `FALSE`, or `NULL` |
*/

-- Date and Time:
/*
| Type        | Description   | Example                | Notes                                             |
| ----------- | ------------- | ---------------------- | ------------------------------------------------- |
| `DATE`      | Calendar date | `birthdate DATE`       | YYYY-MM-DD                                        |
| `TIME`      | Time of day   | `start_time TIME`      | HH:MM:SS                                          |
| `TIMESTAMP` | Date + Time   | `created_at TIMESTAMP` | With optional timezone `TIMESTAMP WITH TIME ZONE` |
| `INTERVAL`  | Duration      | `duration INTERVAL`    | Useful for differences between timestamps         |
*/

-- UUID/JSON/Array(postgreSQL only):
/*
| Type    | Description                      | Example                             | Notes                         |
| ------- | -------------------------------- | ----------------------------------- | ----------------------------- |
| `UUID`  | Universally unique ID            | `id UUID DEFAULT gen_random_uuid()` | Good for distributed systems  |
| `JSON`  | Stores JSON objects              | `data JSON`                         | Can store nested objects      |
| `JSONB` | Binary JSON (faster for queries) | `data JSONB`                        | Recommended for querying JSON |
| `ARRAY` | Array of values                  | `tags TEXT[]`                       | Can store lists               |
*/

-- Multiple Datatypes Example:
CREATE TABLE example_table (
    id SERIAL PRIMARY KEY,        -- Integer auto-increment
    username VARCHAR(50) NOT NULL,
    email TEXT UNIQUE,
    is_active BOOLEAN DEFAULT TRUE,
    signup_date DATE DEFAULT CURRENT_DATE,
    last_login TIMESTAMP,
    profile JSONB,
    tags TEXT[]
);

/*
-----------------------
|   Constraints
-----------------------
*/

-- Primary Key
CREATE TABLE students (
    student_id SERIAL PRIMARY KEY   -- Unique, cannot be null
);

-- Foreign Key
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name TEXT UNIQUE NOT NULL
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    dept_id INT REFERENCES departments(dept_id)  -- must exist in departments
);
/*
Optional actions:

FOREIGN KEY(dept_id) REFERENCES departments(dept_id) ON DELETE CASCADE

ON DELETE CASCADE → deleting a department deletes all employees in it.
*/

-- Unique
CREATE TABLE departments (
    department_name TEXT UNIQUE       -- No two departments can have same name
);

-- Multi-column Unique
CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    UNIQUE(student_id, course_id)  -- same student cannot enroll in same course twice
);

-- Not Null
CREATE TABLE bank_accounts (
    account_holder TEXT NOT NULL  -- account_holder must always exist
);

-- Check
CREATE TABLE employees (
    salary INT CHECK(salary > 0)  -- salary must be positive
);

-- Multi Column Check
CREATE TABLE courses (
    course_start_date DATE,
    end_date DATE,
    CHECK(end_date > course_start_date)  -- end date must be after start
);

-- Default
CREATE TABLE employees (
    is_active BOOLEAN DEFAULT TRUE  -- defaults to TRUE if not provided
);

-- Example of all constraints
CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    salary INT CHECK(salary > 0) DEFAULT 50000,
    dept_id INT REFERENCES departments(dept_id)
);


-- Extra tip
/*
Constraints can be defined inline (in the column) or out-of-line (after all columns). Example:

CREATE TABLE enrollment (
    student_id INT,
    course_id INT,
    PRIMARY KEY(student_id, course_id),  -- composite primary key
    FOREIGN KEY(student_id) REFERENCES students(id),
    FOREIGN KEY(course_id) REFERENCES courses(id)
);

Composite keys (multi-column) are common for many-to-many tables.
*/

/*
✨ *Master SQL & Python one week at a time*  
💪 *Level up your skills week-by-week*

*𝗙𝗼𝗹𝗹𝗼𝘄 ╰┈➤ [`@brew_code zone`](https://www.instagram.com/brew_code_zone/) on* 🅾 𝐈𝐧𝐬𝐭𝐚𝐠𝐫𝐚𝐦 ★ *for daily Learnings*
*/