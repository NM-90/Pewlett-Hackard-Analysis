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


--10.  Use the DISTINCT ON to retrieve the first occurrence of the employee number. 
-- Use Dictinct with Orderby to remove duplicate rows

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
title,
to_date
INTO new_unique_titles
FROM unique_titles
ORDER BY emp_no ASC, to_date DESC;

SELECT * from new_unique_titles

--14.  Export the Unique Titles table as unique_titles.csv and save it to your Data
--folder in the Pewlett-Hackard-Analysis folder. 
--Done

--15. Confirm table. Done. 
--My table includes the to_date

--16. Write another query in the Employee_Database_challenge.sql file to retrieve 
--the number of employees by their most recent job title who are about to retire.

--17. First, retrieve the number of titles from the Unique Titles Table. 

SELECT COUNT(new_unique_titles.emp_no),
title
FROM new_unique_titles 
GROUP BY title 
ORDER BY COUNT(title)

--18.  Then, create a Retiring Titles table to hold the required information.

SELECT COUNT(new_unique_titles.emp_no),
title
INTO retiring_titles
FROM new_unique_titles 
GROUP BY title 
ORDER BY COUNT(title)

DROP TABLE retiring_titles

--19. Group the table by title, then sorT the count column in descending order.
SELECT COUNT(new_unique_titles.emp_no),
title
INTO retiring_titles
FROM new_unique_titles 
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * FROM retiring_titles

---	DELIVERABLE 2 ---- 

--1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table. 
SELECT emp_no, first_name, last_name, birth_date
FROM employees

--2. Retrieve the from_date and to_date columns from the Department Employee table.
SELECT from_date, to_date
FROM dept_emp

SELECT * FROM dept_emp

--3. Retrieve the title column from the Titles table.
SELECT title
FROM titles

--4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of rows
--defined by the ON() clause. 

SELECT DISTINCT ON (employees.emp_no)
emp_no,
first_name,
last_name,
birth_date
FROM employees
WHERE (birth_date BETWEEN '1965-01-01' and '1965-12-31')
ORDER BY emp_no

--5. Create a new table using the INTO clause.

SELECT DISTINCT ON (employees.emp_no)
emp_no,
first_name,
last_name,
birth_date
INTO mentorship_eligibility
FROM employees
ORDER BY emp_no 

DROP TABLE mentorship_elibility

SELECT * FROM mentorship_eligibility

--6. Join the Employees and the Department Employee tables on the primary key

SELECT DISTINCT ON (employees.emp_no) first_name, last_name, birth_date, 
dept_emp.from_date,
dept_emp.to_date
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp 
ON employeeS.emp_no = dept_emp.emp_no
WHERE (to_date BETWEEN '9999-01-01' and '9999-01-01');

SELECT * FROM mentorship_eligibility

DROP TABLE mentorship_elibility

--7. Join the Employees and the Titles tables on the primary key

SELECT DISTINCT ON (employees.emp_no) first_name, last_name, birth_date, 
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp 
ON employeeS.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date BETWEEN '9999-01-01' and '9999-01-01');

SELECT * FROM mentorship_eligibility

DROP TABLE mentorship_elibility

--8. Filter the data on the to_date column to all the current employees, then filter
--the data on the birth_date columns to get all the employees whose
--birth dates are between January 1, 1965 and December 31, 1965. 

SELECT DISTINCT ON (employees.emp_no) first_name, last_name, birth_date, 
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp 
ON employeeS.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (dept_emp.to_date BETWEEN '9999-01-01' and '9999-01-01');
AND (employees.birth_date BETWEEN '1965-01-01' and '1965-12-31')


--9. Order the table by the employee number

SELECT DISTINCT ON (employees.emp_no) employees.emp_no, first_name, last_name, birth_date, 
dept_emp.from_date,
dept_emp.to_date,
titles.title
INTO mentorship_eligibility
FROM employees
INNER JOIN dept_emp 
ON employeeS.emp_no = dept_emp.emp_no
INNER JOIN titles
ON employees.emp_no = titles.emp_no
WHERE (birth_date BETWEEN '1965-01-01' and '1965-12-31')
AND (dept_emp.to_date BETWEEN '9999-01-01' and '9999-01-01')
ORDER BY employees.emp_no;

SELECT * FROM mentorship_eligibility


--10.  Export the Mentorship Elibility table as mentorship_eligibility.csv


