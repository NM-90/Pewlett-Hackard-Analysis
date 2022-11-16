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

Image of eligible employees for the mentorship program:

<img width="231" alt="Screen Shot 2022-11-16 at 10 22 52 AM" src="https://user-images.githubusercontent.com/111452227/202236575-d54bcccc-93f9-49c4-8584-9e82e2c38475.png">

4.  There are only 1550 eligible employees for the mentorship program.  

# Summary:

There are a total of 72,458 employees who about to retire.  To prepare for the this type of high volumne vacancy, the company will need to start hiring new employees to fill in the vacant roles to prevent loss of productivity. 

But, there are are only 1550 eligible employees so there not enough retirment-ready employeees eligible to mentor next generation of Pewlett Hackard employees. We need more eligible employees. 

Possible solutions: 

Increase the eligibile employees by expanding the birth date criteria to January 1, 1663 and December 31,1965.  We can change the SELECT DISTINCT code to expand the criteria

INTO mentorship_eligibility

AND (employees.birth_date BETWEEN '1963-01-01' and '1965-12-31')

It will allow more people to qualify for the mentorship program and fill the void a bit more. 

<img width="250" alt="Screen Shot 2022-11-16 at 10 48 16 AM" src="https://user-images.githubusercontent.com/111452227/202242734-f20904b5-206e-4ee9-a77c-2bedafc8f1dd.png">

