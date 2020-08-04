CREATE DATABASE QuanLySV

USE [QuanLySV]
GO

CREATE TABLE ClassDetails(
	CodeStudent int NOT NULL,
	CodeClass int NOT NULL,
	StartTime datetime NOT NULL,
	EndTime datetime NOT NULL,
	Status int NOT NULL,
CONSTRAINT fk_cd_codestudent FOREIGN KEY (CodeStudent) REFERENCES Students (Code)
)
GO

ALTER TABLE [ClassDetails] ADD  CONSTRAINT [DF_ClassDetails_StartTime]  DEFAULT (getdate()) FOR [StartTime]
GO

ALTER TABLE [ClassDetails] ADD  CONSTRAINT [DF_ClassDetails_EndTime]  DEFAULT (getdate()) FOR [EndTime]
GO

ALTER TABLE [ClassDetails] ADD  CONSTRAINT [DF_ClassDetails_Status]  DEFAULT ((0)) FOR [Status]
GO

ALTER TABLE [ClassDetails] ADD CONSTRAINT fk_cd_codeclass FOREIGN KEY (CodeClass) REFERENCES Class (Code)