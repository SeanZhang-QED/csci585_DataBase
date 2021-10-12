# the Navicat for MySQL database is used for the questions.

-- the given period is from 
-- 2021-10-1 to 2021-10-15 
SELECT SUM(c1) AS Num_of_Scan, SUM(c2) AS Num_of_Test, SUM(c3) AS Num_of_Positive, SUM(c4) AS Num_of_Reported_Emp FROM (
	SELECT COUNT(Scan_ID) c1, 0 c2, 0 c3, 0 c4 FROM scan WHERE Scan_Date BETWEEN '2021-10-1' AND '2021-10-15'
	UNION ALL
	SELECT 0 c1, COUNT(Test_ID) c2, 0 c3, 0 c4 FROM test WHERE Test_Date BETWEEN '2021-10-1' AND '2021-10-15'
	UNION ALL
	SELECT 0 c1, 0 c2, COUNT(*) c3, 0 c4 FROM test WHERE (Test_Date BETWEEN '2021-10-1' AND '2021-10-15') AND Test_result = 'positive'
	UNION ALL
	SELECT 0 c1, 0 c2, 0 c3, COUNT(DISTINCT EMP_ID) c4 FROM symptom WHERE Date_Reported BETWEEN '2021-10-1' AND '2021-10-15'
) d;

-- 
-- SELECT COUNT(DISTINCT Scan_ID), COUNT(DISTINCT Test_ID), COUNT(DISTINCT symptom.EMP_ID), COUNT(Test_result = 'positive')
-- FROM scan, test, symptom, 
-- WHERE (Scan_Date BETWEEN '2021-10-1' AND '2021-10-15') 
-- AND (Test_Date BETWEEN '2021-10-1' AND '2021-10-15')
-- AND (Date_Reported BETWEEN '2021-10-1' AND '2021-10-15');