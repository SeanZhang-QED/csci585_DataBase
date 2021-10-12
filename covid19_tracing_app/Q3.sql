# the Navicat for MySQL database is used for the questions.

-- SELECT EMP_Floor_Num AS Sickest_Floor
-- FROM employee e, `case` c
-- WHERE e1.EMP_ID = c1.EMP_ID
-- GROUP BY e1.EMP_Floor_Num
-- ORDER BY COUNT(EMP_Floor_Num) DESC
-- LIMIT 1;

SELECT EMP_Floor_Num AS Sickest_Floor
FROM employee e1, `case` c1
WHERE e1.EMP_ID = c1.EMP_ID
GROUP BY e1.EMP_Floor_Num
HAVING COUNT(e1.EMP_Floor_Num) = (
	SELECT MAX(Counts)
	FROM (
		SELECT COUNT(e2.EMP_Floor_Num) AS Counts
		FROM employee e2, `case` c2
		WHERE e2.EMP_ID = c2.EMP_ID
		GROUP BY e2.EMP_Floor_Num) d
);
