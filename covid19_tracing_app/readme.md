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
