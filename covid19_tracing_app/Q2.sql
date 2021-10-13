# the Navicat for MySQL database is used for the questions.

-- SELECT Symptom_ID
-- FROM symptom
-- GROUP BY Symptom_ID
-- ORDER BY COUNT(Symptom_ID) DESC
-- LIMIT 1;

SELECT Symptom_ID 
FROM symptom s1
GROUP BY Symptom_ID
HAVING COUNT(s1.Symptom_ID) = (
	SELECT MAX(Counts)
	FROM (
		SELECT COUNT(s2.Symptom_ID) AS Counts
		FROM symptom s2
		GROUP BY Symptom_ID) d
);