CREATE TABLE Student 
(StudNo int Primary Key,
StudName nvarchar(50) NOT NULL,
StudAddr nvachar (50),
StudPhone bigint,
BirthDate DateTime);
GO

INSERT INTO Student values
(1, 'Michael John', 'New York', 9145247891,'12-01-1989');
INSERT INTO Student values
(2, 'Anna Lombard', 'Alabama', 8942574632,'08-25-1989');
INSERT INTO Student values
(3, 'Peter Dawson', 'California', 9165688471,'02-15-1963');
INSERT INTO Student values
(4, 'Leonard Thornton', 'New Jersey', 9142563422,'12-20-1991');
INSERT INTO Student values
(5, 'Elizabeth Isaac', 'Atlanta', 9149855771,'07-11-1990');

GO

SELECT * FROM Student

ALTER TABLE Student ADD Country nvarchar (20)NULL

UPDATE Student SET Country = 'USA'

SELECT * FROM Student

GO

CREATE TABLE Batch
(BatchNo nvarchar(5) ,
Subject nvarchar (25),
SubjDesc nvarchar (25),
StartDt DateTime,
EndDt DateTime,
Hours int);

GO

INSERT INTI Batch values
('A01', 'Java', 'Database', '12-01-2006', '03-15-2006', 96);
INSERT INTO Batch values
('A02', 'Oracle', 'Forms', '08-25-2006', '11-02-2006', 55);
INSERT INTO Batch values
('A03', 'SQL Server 2005', 'Queries', '05-15-2006', '06-06-2006', 46);
INSERT INTO Batch values
('A04', 'Net', 'WinForms', '06-20-2005', '08-16-2005', 48);
INSERT INTO Batch values
('A05', 'JSF & Struts', 'CustomControls', '09-07-2005', '10-18-2005', 120);

SELECT * FROM Batch

SELECT DATEDIFF(month, StartDt,EndDt) FROM Batch

SELECT BatchNo, [2005] Y2005, [2006] Y2006 from
(SELECT YEAR(StartDt) StartYear, BatchNo, Hours FROM Batch)pft
PIVOT
(
SUM(Hours)
FOR StartYear in ([2005], [2006])
)pst

GO
