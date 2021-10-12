
#-----------Insert the data for Q2--------------------#
INSERT INTO employee (EMP_Name, EMP_Office_Num, EMP_Floor_Num, EMP_Phone_Num, EMP_Email_addr) VALUES 
('Test', 0101, 1, 2130000001, 'a@test.com'),
('James', 0102, 1, 2130000002, 'b@test.com'),
('David', 0103, 1, 2130000003, 'c@test.com'),
('Christopher', 0201, 2, 2130000004, 'd@test.com'),
('Join', 0301, 3, 2130000005, 'e@test.com'),
('Richard', 0401, 4, 2130000006, 'f@test.com'),
('Daniel', 0501, 5, 2130000007, 'g@test.com'),
('Robert', 0601, 6, 2130000008, 'h@test.com'),
('Charles', 0701, 7, 2130000009, 'i@test.com'),
('Willian', 0801, 8, 2130000010, 'g@test.com')
('Mary', 0401, 4, 2130000109, 'k@test.com'),
('Patricia', 0501, 5, 2130000209, 'l@test.com'),
('Karen', 0601, 6, 2130000309, 'm@test.com'),
('Jessica', 0701, 7, 2130000409, 'n@test.com'),
('Sarah', 0201, 2, 2130000509, 'o@test.com'),
('Lisa', 0301, 3, 2130000609, 'p@test.com'),
('Daniel', 0401, 4, 2130000709, 'q@test.com'),
('Thomas', 0501, 5, 2130000809, 'r@test.com'),
('Betty', 0801, 8, 2130000909, 's@test.com'),
('Emily', 0120, 1, 2130001009, 't@test.com'),
('Paul', 0721, 7, 2130002009, 'u@test.com'),
('Steven', 0231, 2, 2130003009, 'v@test.com'),
('Sean', 0741, 7, 2130004009, 'w@test.com'),
('Anthony', 0314, 3, 2130005009, 'x@test.com'),
('Kimberly', 0721, 7, 2130006009, 'y@test.com'),
('Deborah', 1001, 10, 2130007009, 'z@test.com');

SELECT * FROM employee;

INSERT INTO symptom (EMP_ID, Date_Reported, Symptom_ID) VALUES 
(1,'2021-10-1', 1),
(1,'2021-10-1', 2),
(1,'2021-10-1', 3),
(2,'2021-10-2', 1),
(2,'2021-10-2', 5),
(3,'2021-10-2', 1),
(3,'2021-10-2', 4),
(10,'2021-10-4', 2),
(10,'2021-10-4', 3),
(5,'2021-10-3', 2),
(5,'2021-10-3', 5),
(6,'2021-10-3', 1);

SELECT * FROM symptom;
#---------------------End for Q2-------------------------#

#-------------Then, insert the data for Q3---------------#
INSERT INTO `case`(EMP_ID, Date, Resolution) VALUES 
(1, '2021-10-1', 'left the company'),
(2, '2021-10-2', 'left the company'),
(3, '2021-10-2', 'left the company'),
(6, '2021-10-3', 'left the company'),
(10, '2021-10-4', 'left the company');

SELECT * FROM `case`;
#---------------------End for Q3-------------------------#

#-------------Then, insert the data for Q4---------------#
INSERT INTO scan (scan.EMP_ID, scan.Scan_Date, scan.Scan_Time, scan.Temperature) VALUES
(7, '2021-09-28', '09:01:01', 96),
(1, '2021-09-30', '08:00:01', 99),
(1, '2021-10-01', '09:00:01', 101),
(5, '2021-10-02', '15:10:01', 94),
(7, '2021-10-08', '11:11:11', 97),
(8, '2021-10-10', '09:30:01', 94),
(9, '2021-10-10', '17:00:00', 98),
(4, '2021-10-14', '10:00:01', 96),
(4, '2021-10-15', '09:01:01', 102),
(4, '2021-10-16', '13:10:01', 101),
(7, '2021-10-16', '14:14:14', 105),
(6, '2021-10-18', '08:01:01', 96);

SELECT * FROM scan;

INSERT INTO test (EMP_ID, Test_Date, Test_Time, Location, Test_result) VALUES
(7, '2021-09-28', '13:01:01', 'hospital','positive'), 
(1, '2021-09-30', '08:30:01', 'company', 'negative'),
(1, '2021-10-01', '09:30:01', 'company', 'positive'),
(2, '2021-10-02', '12:30:01', 'clinic', 'positive'),
(3, '2021-10-02', '09:30:01', 'company', 'positive'),
(5, '2021-10-03', '19:30:01', 'clinic', 'negative'),
(6, '2021-10-03', '22:30:01', 'hospital', 'positive'),
(10, '2021-10-04', '12:50:01', 'hospital', 'negative'),
(4, '2021-10-15', '14:01:01', 'company', 'positive'),
(4, '2021-10-16', '16:10:01', 'company', 'positive'),
(7, '2021-10-16', '15:14:14', 'company', 'positive'),
(6, '2021-10-18', '18:01:01', 'hospital', 'negative');

SELECT * FROM test;
#---------------------End for Q4-------------------------#























