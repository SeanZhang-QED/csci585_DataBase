# the Navicat for MySQL database is used for the questions.

-- the given period is from 
-- 2021-10-1 to 2021-10-15 
-- The number of employees implies the multiple reports from a specific employee will only be counted once. 
SELECT SUM(c1) AS Num_of_Scan, SUM(c2) AS Num_of_Test, SUM(c3) AS Num_of_Positive, SUM(c4) AS Num_of_Reported_Emp FROM (
	SELECT COUNT(Scan_ID) c1, 0 c2, 0 c3, 0 c4 FROM scan WHERE Scan_Date BETWEEN '2021-10-1' AND '2021-10-15'
	UNION ALL
	SELECT 0 c1, COUNT(Test_ID) c2, 0 c3, 0 c4 FROM test WHERE Test_Date BETWEEN '2021-10-1' AND '2021-10-15'
	UNION ALL
	SELECT 0 c1, 0 c2, COUNT(*) c3, 0 c4 FROM test WHERE (Test_Date BETWEEN '2021-10-1' AND '2021-10-15') AND Test_result = 'positive'
	UNION ALL
	SELECT 0 c1, 0 c2, 0 c3, COUNT(DISTINCT EMP_ID) c4 FROM symptom WHERE Date_Reported BETWEEN '2021-10-1' AND '2021-10-15'
) d;

-- An easier way
SELECT *
FROM
(SELECT COUNT(Scan_ID) AS Num_of_Scan FROM scan WHERE Scan_Date BETWEEN '2021-10-1' AND '2021-10-15') d1,
(SELECT COUNT(Test_ID) AS Num_of_Test FROM test WHERE Test_Date BETWEEN '2021-10-1' AND '2021-10-15') d2,
(SELECT COUNT(*) AS Num_of_Positive FROM test WHERE (Test_Date BETWEEN '2021-10-1' AND '2021-10-15') AND Test_result = 'positive') d3,
(SELECT COUNT(DISTINCT EMP_ID) AS Num_of_Reported_Emp FROM symptom WHERE Date_Reported BETWEEN '2021-10-1' AND '2021-10-15') d4;
