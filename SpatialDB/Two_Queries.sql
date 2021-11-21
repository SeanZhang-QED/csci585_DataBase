-- Postgres.app + pgadmin4

-- create the table
CREATE TABLE Locations(
	Loc_Name VARCHAR(15) PRIMARY KEY,
	Loc_COORD geometry
);

-- insert the geometry data
-- note: Trojan Terrace is My Apt's name
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Trojan Terrace', ST_GeomFromText('POINT(-118.28829091799844 34.031724423726054)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Lyon Center', ST_GeomFromText('POINT(-118.28778404338267 34.024323246935726)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('THH', ST_GeomFromText('POINT(-118.28407810482246 34.02241134847554)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('CPA', ST_GeomFromText('POINT(-118.28462335410216 34.021116253974334)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Leavey', ST_GeomFromText('POINT(-118.28303973804223 34.02158118680993)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Lewis Hall', ST_GeomFromText('POINT(-118.28350377090044 34.019481869285986)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('AHF', ST_GeomFromText('POINT(-118.28475056580333 34.02004669773055)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Tommy Trojan', ST_GeomFromText('POINT(-118.2853975254542 34.02056051231266)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Bookstore', ST_GeomFromText('POINT(-118.2863639554364 34.02088968919598)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Trojan Sword', ST_GeomFromText('POINT(-118.28846603241012 34.02280742708744)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('OHE', ST_GeomFromText('POINT(-118.2897097387086 34.02089221325203)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('GER', ST_GeomFromText('POINT(-118.29034387468731 34.020195275928286)', 4326));
INSERT INTO Locations(Loc_Name, Loc_COORD )
VALUES('Fisher Museum', ST_GeomFromText('POINT(-118.2876472412777 34.018513903155946)', 4326));

--SELECT * FROM Locations;

-- obtain convex hull
SELECT ST_AsText(
	ST_ConvexHull(
		ST_Collect(
			ARRAY(
				SELECT Loc_COORD FROM Locations
			)
		)
	)
) AS polygon;

-- find the 4 nearest points for Trojan Terrace APT.
SELECT Loc_Name AS Nearest_Locs
FROM Locations
WHERE Loc_Name != 'Trojan Terrace'
ORDER BY Loc_COORD <-> st_setsrid(st_makepoint(-118.28829091799844, 34.031724423726054),4326)
LIMIT 4;
