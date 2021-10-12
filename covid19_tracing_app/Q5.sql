# Q5, the Navicat for MySQL database is used for the questions.

-- Assuming there are only 3 status for the sick employees that they would like to report, ie. sick, hospitalized, well. 
-- I'd like to know the number of employees who have reported ALL of the stutes.
-- ie. I'm going to computing table division between HEALTHSTATUS and sd(status_description). 

SELECT COUNT(DISTINCT h1.EMP_ID ) AS Num_of_Emp
FROM healthstatus as h1
WHERE NOT EXISTS 
(		
	SELECT sd.`Status`
	FROM 
	(SELECT DISTINCT `Status` FROM healthstatus) sd -- only contains all the distinct values of status. 
	WHERE NOT EXISTS
	(
		SELECT h2.`Status` 
		FROM  healthstatus as h2 
		WHERE h2.EMP_ID = h1.EMP_ID
		AND h2.`Status` = sd.`Status`
	) 
);