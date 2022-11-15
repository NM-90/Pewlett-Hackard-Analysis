--1. Retrieve emp_no, first_name, last_name from Employees table
SELECT emp_no, first_name, last_name
FROM employees

--2. Retrieve the title, from_date, to_date from Titles table
SELECT title, from_date, to_date
FROM titles

--3. Create a new table using the INTO clause
SELECT emp_no, first_name, last_name, 
INTO retirement_titles
FROM employees
Where(birth_date BETWEEN '1952-01-01' and '1955-12-31')

DROP TABLE retirement_titles

--3. Attempt #2. Create a new table using the INTO clause without Where dates.

SELECT employees.emp_no, first_name, last_name, titles.title
INTO retirement_titles
FROM employees
Left Join titles
ON titles.emp_no = employees.emp_no
Where(birth_date BETWEEN '1952-01-01' and '1955-12-31')


SELECT * FROM retirement_titles;

--4. Join both tables, retirement_titles and  on the primary key
SELECT retirement_titles.emp_no,
	retirement_titles.first_name,
retirement_titles.last_name,
	titles.title,
	titles.from_date,
	titles.to_date
FROM retirement_titles
LEFT JOIN titles
ON retirement_titles.emp_no = titles.emp_no;

SELECT * FROM retirement_titles;

--5. Filter the data on the birth_date column to retrieve employees who were born between 1952 and 1955.
--Then order by the employee number
SELECT emp_no, first_name, last_name
FROM employees
Where(birth_date BETWEEN '1952-01-01' and '1955-12-31')

--6. Export the Retirement Titles table from the previoius step and save it to your Data folder. -Done
--7. Confirm table -Done
--8. Copy query -Done

--9.  Retrieve the employee number, first and last name, title columns from the Retirement Titles table.

SELECT retirement_titles.emp_no,
	retirement_titles.first_name,
retirement_titles.last_name,
	retirement_titles.title
FROM retirement_titles


--10.  Use the DISTINCT ON to retrieve the first recurrence of the employee number. 
-- Use Dictinct with Orderby to remove duplicate rows
--SELECT DISTINCT ON (______) _____,
--______,
--______,
--______

--INTO nameyourtable
--FROM _______
--WHERE _______
--ORDER BY _____, _____ DESC;

-- Try

SELECT DISTINCT ON (employees.emp_no)
emp_no,
hire_date

INTO first_occurence
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
ORDER BY emp_no, hire_date DESC;

SELECT * FROM first_occurence;

--11.  Exclude those employees that have already left the company by filtering on to_date
--to keep only dates at are equal to '9999-01-01'
SELECT emp_no, to_date
FROM titles
Where(to_date BETWEEN '9999-01-01' and '9999-01-01')

--12.  Create a Unique Titles table using the INTO clause
SELECT employees.emp_no, first_name, last_name, titles.title, titles.to_date
INTO unique_titles
FROM employees
Left Join titles
ON titles.emp_no = employees.emp_no
Where(birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (to_date BETWEEN '9999-01-01' and '9999-01-01');

SELECT * FROM unique_titles

--13. Sort the Unique Titles table in ascending order by the employee number 
--and descending order  by the last date (i.e., to_date) of the most recent title.

SELECT DISTINCT ON (unique_titles.emp_no)
emp_no,
first_name,
last_name,
to_date
INTO new_unique_titles
FROM unique_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * from new_unique_titles



--14.  Export the Unique Titles table as unique_titles.csv and save it to your Data
--folder in the Pewlett-Hackard-Analysis folder. 


