-- REFERENCES:
-- https://www.geeksforgeeks.org/sql-division/

CREATE TABLE test_a (sid INT, pid INT);
CREATE TABLE test_b (pid INT);

INSERT INTO test_a VALUES 
(101,1),(102,1),(101,3),(103,2),(102,2),(102,3),(102,4),(102,5);

INSERT INTO test_b VALUES 
(1),(2),(3),(4),(5);


SELECT * FROM test_a as sx
WHERE NOT EXISTS 
(		
	SELECT p.pid 
	FROM test_b p
	WHERE NOT EXISTS
	(
		SELECT sp.pid 
		FROM  test_a as sp 
		WHERE sp.sid = sx.sid
		AND sp.pid = p.pid
	) 
);