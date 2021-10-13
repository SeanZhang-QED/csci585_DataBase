# HW2: SQL

**Total points**: 6, plus 1 add'l point (related to Q5), but with a CAP of 6 points [if you score 7, your score would 'only' be a 6].

In this assignment, you will code solutions to the five SQL problems described below. Guess what - the questions relate back to HW1 - here, you're asked to create tables and data related to the COVID-19 tracing application you considered in HW1, and perform queries on the data.

Consider the following 'barebones' design (showing just entity names and connections), for the contact tracing application:

## Here are notes on the entities:
- Employee [contains info about employees]: ID, name, office number, floor number, phone number, email address etc.
- Meeting [contains meeting info, on every meeting between employees]: meeting ID, employee ID, room number, floor number, meeting start time (just an int between 8 and 18, standing for 8AM..6PM)
- Notification [based on contact tracing, to alert employees who might have been exposed]: notification ID, employee ID, notification date, notification type (mandatory, optional)
- Symptom [self-reported by employees, any of 5 symptoms]: row ID (1,2...), employee ID, date reported, symptom ID (1 through 5)
- Scan [random scans of employees' body temperatures]: scan ID, scan date, scan time, employee ID, temperature
- Test [to record test details]: test ID, location (company or hospital or clinic etc), test date, test time, employee ID, test result (positive or negative)
- Case [to record employees who test positive]: case ID, employee ID, date, resolution (back to work, left the company, or deceased)
- HealthStatus [self-reporting by employees]: row ID, employee ID, date, status (sick, hospitalized, well)
- time can be ints between 0 and 23, standing for 12AM to 11PM 'on the hour'
- the company has 10 floors, numbered 1 through 10
- do feel free to assume anything else you need, to answer the questions below (please list these in a README)

**Q1 (2 points)**. Write SQL commands to create the above tables (create your own column names), and populate them with data (as many/few rows as you see fit, eg. 25 employees, 15 meetings... you can start small, and add more rows later, to help write queries for Q2..Q5).

**Q2 (1 point)**. Write a query to output the most-self-reported symptom.

**Q3 (1 point)**. Write a query to output the 'sickest' floor.

**Q4 (1 point)**. The management would like stats, for a given period (between start, end dates), on the following: number of scans, number of tests, number of employees who self-reported symptoms, number of positive cases. Write queries to output these.

**Q5 (1 point)**. Create your own query! What else would you like to learn, from the data? Describe/list the question, and come up with the query to answer it. You'll get 1 extra point if your query involves table division [be sure to indicate this in your README].

## All the queries are written on Navicat for the **MySQL** database.

## Assumptions on each Entity:
* Employee:
  - I'd like to restore the employee's full name(VARCHAR(100)) instead of splitting it into first and last names.
  - The office room number(INT(4)) like 0505 is the fifth office room on the fifth floor.
  - The email address field is optional.	
* Meeting:
	- The room number(INT(1)) in this entity stands for the number of meeting room. 
	- There are nine meeting rooms on each floor, numbered 1 through 9.
* Symptom:
	- Symptom_ID(1 through 5) each stands for a distinct type of symptom.
* Scan: 
	- The temperature(INT(3)) is on the Fahrenheit scale.
	- The one who has been scanned over 99 degrees would be asked to take the test.

## The explanations for queries:
* Q1: 
	- I first create the table for each entity and then populate them with a small bunch of records.
* Q2: 
	- The most self-reported symptom is selected from the table Symptom. 
	- If two or more signs(symptoms) tie the first place, I will choose **all of them** to display.
* Q3:
	- The tracing system would record all of the positive sick employees in the Case table.
	- Assume that if an employee has recovered from covid 19, they will not be infected anymore. Ie. There will be only zero or one record for a specific employee in the Case table.
	- The sickest floor can be defined as the floor with the most infected employees, who will have the floor number in its record on the employee table.
	- If two or more floors tie the first place, I will choose **all of them** to display.
* Q4:
	- The given period is from 2021-10-1 to 2021-10-15 
	- The number of positive cases is retrieved from the table Case.
* Q5: 
	- Assuming there is only three status for the sick employees that they would like to report, i.e., sick, hospitalized, well. 
	- I'd like to know the number of employees who have reported **ALL of the statuses**.
	- Ie. I will compute the table division(for bonus points) between the HEALTH-STATUS table and sd(stands for status_description, and derived from the HEALTH-STATUS table).
 
