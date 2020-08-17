CREATE DATABASE RiverPlate


CREATE TABLE Student(
	StudentNo INT
	CONSTRAINT PK_Student_StudentNo PRIMARY KEY,
	StudentName VARCHAR(50),
	StudentAddress VARCHAR(50),
	PhoneNo INT,
)

CREATE TABLE Department(
	DeptNo INT
	CONSTRAINT PK_Department_DeptNo PRIMARY KEY,
	DeptName VARCHAR(50),
	ManagerName CHAR(30),
)

CREATE TABLE Assignment(
	AssignmentNo INT 
	CONSTRAINT PK_Assignment_AssignmentNo PRIMARY KEY,
	Description VARCHAR(100),
)

CREATE TABLE Works_Assign(
	JobID			INT 
	CONSTRAINT PK_Works_Assign_JobID PRIMARY KEY,
	StudentNo		INT,
	AssignmentNo	INT,
	TotalHours		INT,
	JobDetails		XML
	CONSTRAINT FK_Student_Works_Assign FOREIGN KEY (StudentNo) REFERENCES Student(StudentNo),
	CONSTRAINT FK_Assignment_Works_Assign FOREIGN KEY (AssignmentNo) REFERENCES AssignMent(AssignmentNo),
)

--1.
	CREATE INDEX IX_Student ON Student(StudentNo, StudentName);

--2.
	USE RiverPlate
	GO
	ALTER INDEX [IX_Student] ON Student REORGANIZE
	GO

	ALTER INDEX IX_Student ON Student 
	REBUILD;

--3.
	CREATE UNIQUE NonClustered Index IX_Dept
	ON Department 
	(
		DeptName ASC,
		DeptNo ASC,
		DeptManagerNo ASC
	)ON[PRIMARY]
	GO





