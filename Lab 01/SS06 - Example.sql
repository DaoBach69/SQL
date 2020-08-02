EXAMPLE 4
CREATE TABLE Class
{
	RollNumber int PRIMARY KEY,
	StudentName text,

CREATE TABLE Class
{
	Roll Number int NOT NULL,
	StudentName text,

EXAMPLE 5
ALTER TABLE Contacts
ADD FaxNumber int

EXAMPLE 6
DROP TABLE Contacts

EXAMPLE 7 
USE AdventureWorks2016CTP3
SELECT * Employee

EXAMPLE 8
USE AdventureWorks2016CTP3
INSERT INTO Contacts
VALUES ('john@abc.com','John',5432677,5432678)

EXAMPLE 9
UPDATE Ccontacts
SET TelephoneNumber = 5322366
WHERE Name LIKE 'John'

EXAMPLE 10
DELETE FROM Contacts
WHERE TelephoneNumber = 5322366

EXAMPLE 11
CREATE TABLE NewEmployees (EmployeeID smallint,FirstName char(10),
LastName char(10), Department varchar(50), HiredDate datetime, Salary
money );
INSERT INTO NewEmployees
VALUES(11,’Kevin’,’Blaine’,’Research’,’2006-07-31 00:00:00.000’,54000);
WITH EmployeeTemp (EmployeeID,FirstName,LastName,Department,
HiredDate, Salary)
AS
(
SELECT * FROM NewEmployees
)
INSERT INTO Employee
SELECT * FROM EmployeeTemp

EXAMPLE 12
GRANT SELECT
ON Employee
TO JOHN

EXAMPLE 13
REVOKE SELECT
ON Employee
FROM JOHN

EXAMPLE 14
DENY SELECT
ON Employee
TO JOHN

EXAMPLE 16
USE AdventureWorks2016CTP3
GO
SELECT * FROM Employee
GO

EXAMPLE 17
DECLARE @PriceChangeDetails TABLE
(
HotelNumber int,
Price money,
NewPrice money
)
UPDATE Hotels
SET Price = 3000
OUTPUT INSERTED.HotelNumber,DELETED.Price, INSERTED.Price
INTO @PriceChangeDetails
WHERE HotelNumber = 101
SELECT * FROM @PriceChangeDetails