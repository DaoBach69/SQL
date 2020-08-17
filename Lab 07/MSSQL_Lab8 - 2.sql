CREATE DATABASE Aptech
GO

USE Aptech
GO

CREATE TABLE Classes(
	ClassName	CHAR(6),
	Teacher		VARCHAR(30),
	TimeSlot	VARCHAR(30),
	Class		INT,
	Lab			INT,
)
INSERT INTO Classes VALUES('A1','Dao','2h',12,11)
INSERT INTO Classes VALUES('A2','Duy','2h',14,12)
INSERT INTO Classes VALUES('A3','Bach','2h',12,13)
INSERT INTO Classes VALUES('A4','Tuan','2h',15,14)
INSERT INTO Classes VALUES('A5','Quang','2h',12,15)

--1.
	CREATE INDEX MyClusteredIndex ON Classes(ClassName);

	CREATE UNIQUE INDEX MyClusterd
	ON Classes(ClassName)

--2.
	CREATE UNIQUE NonClustered Index TeacherIndex 
	ON Classes(Teacher)

--3.
	DROP INDEX TeacherIndex

--6.
	SELECT * FROM Aptech





