CREATE DATABASE Triggers
GO

USE Triggers
GO

CREATE TABLE Class(
	ClassCode	VARCHAR(10)
	CONSTRAINT PK_Class_ClassCode PRIMARY KEY,
	HeadTeacher VARCHAR(30),
	Room		VARCHAR(30),
	TimeSlot	CHAR,
	CloseDate	DATETIME,
)

CREATE TABLE Student(
	RollNo		VARCHAR(10)
	CONSTRAINT PK_Student_RollNo PRIMARY KEY,
	ClassCode	VARCHAR(30),
	FullName	VARCHAR(30),
	Male		BIT,
	BirthDate	DATETIME,
	Address		VARCHAR(30),
	Provide		CHAR(2),
	Email		VARCHAR(30)
	CONSTRAINT FK_Class_Student FOREIGN KEY ClassCode REFERENCES Class(ClassCode),
)

CREATE TABLE Subject(
	SubjectCode VARCHAR(10)
	CONSTRAINT FK_Subject_SubjectCode PRIMARY KEY,
	SubjectName VARCHAR(40),
	WMark		BIT,
	PMark		BIT,
	WTest_per	INT,
	PTest_per	INT,
)

CREATE TABLE Mark(
	RollNo		VARCHAR(10)
	SubjectCode	VARCHAR(10)
	PRIMARY KEY (RollNo, SubjectCode),
	WMark		FLOAT,
	PMark		FLOAT,
	Mark		FLOAT,
	CONSTRAINT FK_Student_Mark FOREIGN KEY RollNo REFERENCES Student(RollNo)
	CONSTRAINT FK_Subject_Mark FOREIGN KEY SubjectCode REFERENCES Subject(SubjectCode)
)






