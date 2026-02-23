# Week 1

## Learning SQL

### *SQL Foundation: Basics & Commands*

#### SQL Commands

1. CREATE DATABASE
- Syntax: `CREATE DATABASE ${database_name};`
- Example: `CREATE DATABASE learn_sql;`
- This command will create a database with name "learn_sql"

<br>

2. USE DATABASE
- Syntax `USE ${database_name};`
- Example: `USE learn_sql;`
- This command doesnt work with postgreSQL, you have to manually select the database in postgreSQL

<br>

3.  CREATE TABLE
- Syntax:
```sql
CREATE ${table_name}(
    ${column1_name} ${datatype} ${constraint},
    ${column2_name} ${datatype} ${constraint},
);
```
- Example:
```sql
CREATE TABLE employees (
    emp_id int,
    emp_name varchar(20),
    emp_department varchar(20)
);
```
- This will create a table with name "employees" which has 3 columns:
    - emp_id (integer datatype)
    - emp_name (varchar datatype with a limit of 20 characters)
    - emp_department (varchar datatype with a limit of 20 characters)

<br>

4. INSERT VALUES IN TABLE
- Syntax:
```sql
INSERT INTO ${table_name}
VALUES
('${column1_value1}', '${column2_value1}', '${column3_value1}'),
('${column1_value2}', '${column2_value2}', '${column3_value2}');
```
- Example:
```sql
INSERT INTO ${table_name}
VALUES
(1, 'Amy', 'IT'),
(2, 'John', 'Acc');
```
- <b>Data Types:</b> The data type of each value must match the data type of its corresponding column.
- <b>Quotes:</b> String/text values and dates must be enclosed in single quotes eg: 'Amy', while numeric values should not be quoted eg: 1.
- <b>Column Order:</b> The order of the values must exactly match the order of the columns specified (either explicitly in the column list or implicitly by the table definition).

<br>

5. SELECT COMMAND
- Syntax:
```sql
SELECT * FROM table_name;
```
- Example:
```sql
-- Select all from Employee table:
SELECT * FROM Employee

-- Select only mentioned columns:
SELECT emp_id, emp_name FROM Employee
```
- <b>SELECT</b> => This kevword initiates the data retrieval command.
- <b>*</b> => This wildcard character is shorthand for "all columns" in the specified table.
- <b>FROM</b> => This clause specifies the name of the table you want to query data from.
- <b>table_name</b> => The name of the table in your database.
- <b>;</b> => A semiolon is used to end the SQL statement (though not strictly required in all SQL dialects).

<br>

6. TRUNCATE TABLE
- Syntax:
```sql
TRUNCATE TABLE table_name;
```
- Example:
```sql
TRUNCATE TABLE Employee;
```
- <b>TRUNCATE</b> is a Data Definition Language (DDL)
command used to remove all rows from a table quickly.
- It is <b>faster than the DELETE statement</b> because it deallocates the entire data pages rather than deleting individual rows.
- The table structure, columns, constraints (except foreign keys), and indexes remain intact for future use.
- The operation generally cannot be rolled back (though some database systems, like SQL Server within a transaction, might allow it) and automatically commits changes.
- It <b>does not fire DELETE triggers.</b>
- <b>For tables with an AUTO_INCREMENT or identity column, the counter is reset to its starting value.</b>

<br>

7. DROP COMMAND
- Syntax:
```sql
DROP DATABASE name_of_database;
DROP TABLE table_name;
```
- Example:
```sql
DROP TABLE Employee;
DROP DATABASE Learn_SQL;
```
- DROP command <b>permanently deletes the table structure</b> and all its data, indexes and constraints.
- It can also <b>delete entire database</b> and all its associated tables and data.
- This is an <b>irreversible operation</b> and the data/structure cannot be recovered without a backup.
- <b>You typically cannot drop a database that is currently in use. You may need to switch to another database or close all active connections before running the command.</b>
- If you only want to remove all rows from a table while keeping its structure, consider using the TRUNCATE TABLE command instead.

<br>

*Click [here](./SQLFoundations.sql) to get SQLFoundations.sql (postgreSQL) file containing working queries with examples of different Datatypes and Constraints*

*Click [here](./PythonBasics.ipynb) to get PythonBasics.ipynb file which has all the learnings of python basics with appropriate examples and comments to understand all the concepts thoroughly*

<br>

✨ *Master SQL & Python one week at a time*  
💪 *Level up your skills week-by-week*

*𝗙𝗼𝗹𝗹𝗼𝘄 ╰┈➤ [`@brew_code zone`](https://www.instagram.com/brew_code_zone/) on* 🅾 𝐈𝐧𝐬𝐭𝐚𝐠𝐫𝐚𝐦 ★ *for daily Learnings*