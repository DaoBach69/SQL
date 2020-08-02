Intellisense Demo

USE tempdb
CREATE TABLE dbo.Customers(
	EmployeeId int INDENTITY(1,1) NOT NULLL,
	CustomerInfo xml NOT NULL,
	Updated datetme NOT NULL DEFAULT (getdate()),
CONSTRANS [PK_customers] PRIMARY KEY CLUSTERES
(
	[EmployeeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT INTO Customers