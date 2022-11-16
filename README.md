# Pewlett-Hackard-Analysis

##
Overview of the analysis:

                "SILVER TSUNAMI"

To determine the number of retiring employes per title.

To identify employees who are eligible to participate in a mentorship program. 

# Results:

Deliverable 1 - Total retirees

1. I selected employees born between January 1, 1952 and December 31, 1955 and removed duplicate entries who have switched titles over the years.  

2. There are seven titles of employees retiring.  Senior Engineer, Senior Staff, Engineer, Staff, Technique Leader, Assistant Engineer and Manager.  

Image of totals:

<img width="397" alt="Screen Shot 2022-11-16 at 9 03 11 AM" src="https://user-images.githubusercontent.com/111452227/202216727-9c400ba1-ac7c-4ce9-b02a-cdc50ebedc34.png">

Deliverable 2 - Employees who were eligible for the mentorship programm. 

3. A table of current employees who were born between January 1, 1965 and December 31, 1965 was created.  

Image of eligible employees:

4.  There are only 1550 eligible employees for the mentorship program.  

# Summary:

There are a total of 72,458 employees who about to retire.  To prepare for the this type of high volumne vacancy, the company will need to start hiring new employees to fill in the vacant roles to prevent loss of productivity. 

There are are only 1550 eligible employees so there not enough retirment-ready employeees eligible to mentor next generation of Pewlett Hackard employees.  

Possible solutions: 

Increase the eligibile employees by expanding the birth date criteria.  January 1, 1965 and December 31, 1985.  We can change the SELECT DISTINCT code to expand the criteria

INTO mentorship_eligibility

AND (employees.birth_date BETWEEN '1965-01-01' and '1985-12-31')
