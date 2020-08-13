
CREATE DATABASE BookLibrary
GO
USE BookLibrary
GO

CREATE TABLE BOOK (
	BookCode int,
	BookTitle varchar(100) NOT NULL,
	Author varchar(50) NOT NULL,
	Edition int,
	BookPrice money,
	Copies int,
	constraint bookcode_pk primary key (BookCode)
)
GO

CREATE TABLE MEMBER (
	MemberCode int,
	Namee varchar(50) NOT NULL,
	Address varchar(100) NOT NULL,
	PhoneNumber int,
	constraint membercode_pk primary key (MemberCode)
)
GO

CREATE TABLE ISSUEDETAILS(
	BookCode int,
	MemberCode int,
	IssueDate datetime,
	ReturnDate datetime,
	constraint bookcode foreign key (BookCode) references Book,
	constraint membercode foreign key (MemberCode) references Member,
)
GO

--Xoá bỏ ràng buộc khoá ngoại của bảng issuedetails
ALTER TABLE ISSUEDETAILS
Drop constraint bookcode, membercode
GO
--Xoá bỏ ràng buộc khoá chính của bảng code và member
ALTER TABLE BOOK
Drop constraint bookcode_pk
GO

ALTER TABLE MEMBER
Drop constraint membercode_pk
GO
--Thêm ràng buộc khoá chính bảng book và member 
ALTER TABLE BOOK
Add constraint bookcode_pk primary key (MemberCode)
GO 

ALTER TABLE MEMBER
Add constraint membercode_pk primary key (BookCode)
GO
--Thêm ràng buộc khoá ngoại cho bảng issuedetails
ALTER TABLE ISSUEDETAILS
Add constraint bookcode foreign key (BookCode) references Book(BookCode)
GO

ALTER TABLE ISSUEDETAILS
Add constraint membercode foreign key (MemberCode) references Member(MemberCode)
GO
--Bổ sung thêm ràng buộc giá bán sách >0 và <200
ALTER TABLE Book
Add constraint bookprice check (BookPrice >0 and BookPrice < 200)
GO
--Bổ sung thêm ràng buộc duy nhất cho PhoneNumber của bảng MEMBER
ALTER table MEMBER
Add constraint PhoneNumber unique
GO
--Bổ sung thêm rang buộc NOT NULL cho BookCode, MemberCode trong bảng ISSUESDETAILS
ALTER TABLE ISSUEDETAILS
Alter column BookCode int NOT NULL
GO

ALTER TABLE ISSUEDETAILS
ALter column MemberCode int NOT NULL
GO
--Tạo khoá chính gồm 2 cột Bookcode, MembeerCode cho bảng ISSUEDETAILS
ALTER TABLE ISSUEDETAILS
Add constraint bcmc_pk PRIMARY KEY (BookCode, MemberCode)
GO
