CREATE DATABASE QuanLySV

USE [QuanLySV]
GO


CREATE TABLE STUDENTS(
	IDName varchar(10) primary key NOT NULL,
	FullName nvarchar(40) NOT NULL,
	Birthday datetime NOT NULL,
	Gender bit NULL,
	IDClass varchar(15) NOT NULL,
	Address nvarchar(500) NULL,
	Email varchar(150) NULL,
	Facebook varchar(150) NULL,
	Phone int NOT NULL,
	Note nvarchar(500) NULL,
	Constraint fk foreign key (STUDENTS) References Class(IDClass)  
	)
	GO

ALTER TABLE [Students] ADD  CONSTRAINT [DF_Students_Gender]  DEFAULT ((0)) FOR [Gender]
GO

ALTER TABLE [Students] ADD  CONSTRAINT [DF_Students_Birthday]  DEFAULT (getdate()) FOR [Birthday]
GO

ALTER TABLE [Students] ADD  CONSTRAINT [DF_Students_Facebook]  DEFAULT ((0)) FOR [Facebook]
GO

ALTER TABLE [Students] ADD  CONSTRAINT [DF_Students_Phone]  DEFAULT ((0)) FOR [Phone]
GO