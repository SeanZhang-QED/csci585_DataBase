## HomeWork Description
You (a database design specialist) are contracted by a private business, to build them a COVID-19 contact tracing system. The business operates in a building with several floors, with multiple office rooms and meeting rooms on each floor (eg. a law firm, investment company, etc). The rationale is this - the company would like to assure its employees that they would be notified as soon as possible, of any exposure they might have had with a sick co-worker, including pre-symptomatic (where testing indicates the presence of n-CoV, but symptoms haven't developed yet) and asymptomatic (testing indicates virus presence, no symptoms ever develop) cases detected through random testing.

Below are descriptions of what the business would like to have happen - if the specifications seem incomplete, you are free (expected, in fact) to make relevant assumptions [be sure to document them] that help create your design.

In RL, your design would get implemented (possibly in the form of a web-connected DB, along with an app that employees will use, in order to get notified and to self-report symptoms and any additional status). The system might softly go live, on a small scale, deployed to a limited set of 'beta' users; their usage feedback will guide the evolution of your design, possibly through one or two more versions, after which the process would be rolled out company-wide.

1. Employees would mandatorily need to sign up via a registration system where they need to provide their employee ID, a smartphone number and optionally an email address. They will then be required to install an app that would let them get alerts and do reporting of their health.
2. The company would randomly scan employees as they enter the facility or when they exit, taking their temperature. Any employee that has a fever, would be immediately tested onsite for COVID-19; at random, employees will also be singled out for testing even if they don't display a high temperature (this is to catch presymptomatic or asymptomatic cases).
3. Employees can also self-report (using their app), if they develop COVID-19 symptoms (any of five symptoms that the company would like them to report). Such employees will be required to undergo a test, and report the result (positive or negative) to the company (again, via their app); they can get tested at a location of their choice, or choose to be tested onsite at their company.
4. Employees who test positive would be triggers for initiating contact tracing.
5. Close contact between employees that happens during meetings, is always recorded, via the employees' apps - the location (meeting room number and floor), and the meeting start time.
6. As soon as an employee tests positive, the contact tracing system kicks in - others who were in close proximity (ie in a meeting) with this employee, will be notified via their phone (in the form of a live call from HR), and additionally, if they provided an email address, via email.
7. The notified employees are expected to get tested as soon as they can, and report the result (again, they can get tested at a location they choose, or onsite at their company) - if any of them tests positive, the contact tracing procedure is repeated for others who were in proximity, until all affected employees have been notified and tested. Sick employees (who tested positive) are expected to self-quarantine for two weeks (unless they end up going to a hospital to get admitted), and during that time, report their status to the company daily - the status would be 'sick', 'hospitalized' or 'well'. An employee who feels well after two weeks is allowed to return to work, and the hospitalized ones come back to work upon recovery (after reporting a 'well' status); there is a chance that a hospitalized employee could become deceased :(
8. Also, employees on the same floor as the sick employee are notified as well, but this time, with a message of concern, suggesting that they consider getting tested (not mandatory) - because such employees might have gotten sick, on account of virus transmission via door handles, restrooms or break rooms/kitchens.

## Tab of Design Conponents
	ENTITY			RELATIONSHIP		CONNECTIVETY  	ENTITY
	EMPLOYEE 		signs in		1:1		REGISTRATION_ACCOUNT
	REGISTRATION_ACCOUNT	contains		1:1		EMPLOYEE_INFO
	REGISTRATION_ACCOUNT	is scaned for		1:M		FEVER_TEST
	REGISTRATION_ACCOUNT	informs			1:M		SELF_REPORT
	SELF_REPORT		results in		1:1		LAB_TEST
	FEVER_TEST		results in		1:1		LAB_TEST
	REGISTRATION_ACCOUNT    is chosen to take	1:M		LAB_TEST 	
	QUARANTINE		is caused by		1:1		LAB_TEST
	QUARANTINE 		restricts		1:1		REGISTRATION_ACCOUNT
	REGISTRATION_ACCOUNT	attends			M:N		MEETING 				 
	MEETING_ROOM            is used for		1:M		MEETING
	OFFICE_ROOM        	has			1:M		REGISTRATION_ACCOUNT
	REGISTRATION_ACCOUNT    reports			1:M		QUARANTIN_REPORT
	QUARANTIN_REPORT	corresponding to 	M:1		QUARANTINE

## Notes
- REGISTRATION_ACCOUNT, which included all the information needed by the APP. 
- EMPLOYEE_INFO, which included the employee's email address and employee's id
- OFFICE_ROOM assumes that many employees would work in the same room and that the office room may be empty with no employees.

To be specific,
1. As the employees mandatorily need to sign up for an account, one and only one EMPLOYEE will register one and only one account. The primary key of the EMPLOYEE entity is the employee's id. And the REGISTRATION_ACCOUNT's primary key is also the employee's id.
2. The email address is optional when the employee signs up for the APP. Accordingly, one or zero EMPLOYEE_INFO is provided to one and only one REGISTRATION_ACCOUNT entity.
3. The company would randomly scan employees' temperatures. Therefore, one and only one REGISRTATION_ACCOUNT owner takes zero or more FEVER_TEST. Zero correspondings to the random nature of the scanning test. As the people will not be tested twice simultaneously, the fever test is specified by the test date with time and the id of that scanned employee.  
4. Employees can also self-report if they develop covid-19 symptoms. The report is just committed by the man who submits it, not others. But one employee may report several times. Thus, one and only one REGISRTATION_ACCOUNT informs zero or many SELF_REPORT. Zero if the man is fortunate and never fell unwell. The many case is just the opposite. 
5. Those who have a fever or display a high temperature have to take a lab test. And one lab test operation is for one request. Consequently, one and only one FEVER_TEST result would result in zero or one LAB_TEST. Zero lab test if the fever test's temperature is regular.  One if the unnormal temperature detected.
6. Similarly, one and only one SELF_REPORT results in zero or one LAB_TEST.
7. At random, an employee will also be selected for testing. The test just shows the lab results of that person. Hence, one and only one REGISRTATION_ACCOUNT owner is chosen to take zero or many LAB_TEST. That guy may not be singled even one time or can be picked several times. 
8. As soon as the employee tests Positive, they need to self-quarantine for two weeks and report their health status. But the lab test could be Negative, so that would not lead to quarantine. Then, zero or one QUARANTINE is caused by one and only one LAB_TEST. 
9. Quarantine is for a specific person. So, one or zero QUARANTINE restricts one and only one REGISRTATION_ACCOUNT owner. Zero is for not tested or tested negative.
10. Close contact between employees that happens during meetings is always recorded. I am assuming that is implemented by storing the meeting schedule of employees. The MEETING entity stores the allocated meeting room number, date, time, and the meeting schedule ID as PK. The meeting at least needs one employee, and some employees may not need to participate in the conference even once. Hence, one or many REGISRTATION_ACCOUNT owners would attend zero or many MEETING. 
11. The MEETING_ROOM entity contains the property of the meeting room using the meeting room id as PK. Clearly, a meeting only needs one room, and a room may have a lot of arrangements. So, one and only one MEETING_ROOM is used for one or many MEETING.
12. As mentioned in the problem description, employees on the same floor as the sick employee would be notified. OFFICE_ROOM is used for storing information regarding the room, like the number, the floor, and so on. The office room may be empty with no employees. But one employee can only own one office room. Therefore,  one and only one OFFICE_ROOM has zero or many REGISTRATION_ACCOUNT owners.

## Tracing realization 
1. As specified in the problem description, close contact is always recorded. And, it could be implemented by recording all the MEETING_SCHEDUAL_ID. Then, per MEETING_SCHEDUAL_ID, we could take the information about the meeting location and the meeting start time. 
2. When the contact tracing system kicks in, the APP would select all the employees (REGISTRATION_ACCOUNT) who have attended the same MEETING_SCHEDUAL_ID and notify them to take lab tests via the SMARTPHONE_NUM stored in the REGISTRATION_ACCOUNT entity.
3. If any of the notified employees tests positive, then the same operation would occur. First, picks out the MEETING_SCHEDUAL_ID of the positive one and sent an alert to others who have the same MEETING_SCHEDUAL_ID in their record.
4. Per MEETING_SCHEDUAL_ID, we can obtain the floor of that meeting room. Likewise, per OFFICE_ROOM_NUM, we can get the floor of that man's office room. Then, the message of concern can be sent to those whose office room is located on the same floor as the sick man or those who show up on the same floor that the sick man attends meetings.
5. Company can check the sick employees' quarantine report daily via all the QUARANTINE data and selected the one who is still in self-quarantine by calculated by START_DATE and current date. 
