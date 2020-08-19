CREATE DATABASE QuanLyLopHoc
GO

USE QuanLyLopHoc
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
--1. Chèn ít nhất 5 bản ghi cho từng bảng ở trên.
	--Bảng Class
	INSERT INTO Class VALUES('B1001M','DangKimThi1','Class1','G','2019-1-5')
	INSERT INTO Class VALUES('B1002M','DangKimThi2','Class2','I','2019-2-6')
	INSERT INTO Class VALUES('B1003M','DangKimThi3','Class3','L','2019-3-7')
	INSERT INTO Class VALUES('B1004M','DangKimThi4','Class4','M','2019-4-8')
	INSERT INTO Class VALUES('B1005M','DangKimThi5','Class5','B','2014-5-9')

	--Bảng Student
	INSERT INTO Student VALUES('A00264','B1001M','Dao Duy Bach','1','2000-1-1','Ha Noi','HN','Boycodon_2k@gmail.com')
	INSERT INTO Student VALUES('A00265','B1002M','Hoang Van Can','1','2000-2-2','Vinh Phuc','VP','Yeuchungthuy_01mail.com')
	INSERT INTO Student VALUES('A00266','B1003M','Le Hoai Thu','2','2001-3-3','Ha Giang','HG','Voimamut1201@gmail.com')
	INSERT INTO Student VALUES('A00267','B1004M','Nguyen Van Tu','1','2001-4-4','Nam Dinh','ND','Yeudonphuong_99@gmail.com')
	INSERT INTO Student VALUES('A00268','B1005M','Nguyen Tra My','2','2000-5-5','Quang Ninh','QN','Tramy1102@gmail.com')

	--Bảng Subject
	INSERT INTO Subject VALUES('EPC','Elementary Programing with C','1','1',2,3)
	INSERT INTO Subject VALUES('HTML5','Hypertext Markup Language','1','1',2,3)
	INSERT INTO Subject VALUES('CCS3','Cascading Style Sheet','1','1',2,3)
	INSERT INTO Subject VALUES('SQL','Structured Query Language','1','1',2,3)
	INSERT INTO Subject VALUES('JAVA1','Java','1','1',2,3)

	--Bảng Mark
	INSERT INTO Mark VALUES('A00264','EPC',9,8,8.5)
	INSERT INTO Mark VALUES('A00265','HTML5',4,8,8.5)
	INSERT INTO Mark VALUES('A00266','CSS3',6,7,8.5)
	INSERT INTO Mark VALUES('A00267','SQL',9,8,8.5)
	INSERT INTO Mark VALUES('A00268','JAVA',9,8,8.5)
	--
	SELECT * FROM Class
	SELECT * FROM Student
	SELECT * FROM Subject
	SELECT * FROM Mark

--2. Tạo một khung nhìn chứa danh sách các sinh viên đã có ít nhất 2 bài thi (2 môn học khác nhau).
	CREATE VIEW VIEW_SoLuongMonHoc AS
	SELECT Student.RollNo, FullName
	FROM Student, Subject mh, Mark kq
	Where Student.RollNo = kq.RollNo and mh.Subject = kq.SubjectCode and SubjectName in ('HTML5','CSS3')
	SELECT * FROM VIEW_SoLuongMonHoc 

--3. Tạo một khung nhìn chứa danh sách tất cả các sinh viên đã bị trượt ít nhất là một môn.
	CREATE VIEW VIEW_TruotMon AS
	SECLECT STUDENT.RollNo, FullName
	FROM Student, Subject mh, Mark kq
	WHERE Student.RollNo = kq.RollNo and Mark < 5  
	GROUP BY Student.RollNo, FullName
	SELECT * FROM VIEW_TruotMon

--4.  Tạo một khung nhìn chứa danh sách các sinh viên đang học ở TimeSlot G.
	CREATE VIEW VIEW1_TimeSlot AS
	SELECT TimeSlot,RollNo,FullName
	FROM Class, Student
	WHERE TimeSlot='G';
	SELECT * FROM VIEW1_TimeSlot

--5. Tạo một khung nhìn chứa danh sách các giáo viên có ít nhất 3 học sinh thi trượt ở bất cứ môn nào.
	CREATE VIEW VIEW_Teacher AS
	SELECT HeadTeacher
	FROM Class, Subject mh, Mark kq
	SELECT * FROM VIEW_Teacher

