CREATE DATABASE QuanLySV

USE [QuanLySV]
GO

CREATE TABLE Class(
	CODE int NOT NULL,
	Name nvarchar(10) NULL,
	StartDate datetime NOT NULL,
	EndDate datetime NOT NULL,
	Status int NOT NULL,
	)
	GO

ALTER TABLE [Class] ADD  CONSTRAINT [DF_Students_StartDate]  DEFAULT (getdate()) FOR [StartDate]
GO

ALTER TABLE [Class] ADD  CONSTRAINT [DF_Students_EndDate]  DEFAULT (getdate()) FOR [EndDate]
GO

ALTER TABLE [Class] ADD  CONSTRAINT [DF_Students_Status]  DEFAULT ((0)) FOR [Status]
GO
