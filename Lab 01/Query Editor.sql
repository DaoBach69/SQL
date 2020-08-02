USE tempdb
GO
CREATE TABLE dbo.Customers(
	EmployeeId int INDENTITY(1,1) NOT NULL,
	CustomerInfo xml NOT NULL,
	Updated datetime NOT NULL DEFAULT (getdate()),
CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED
(
	[EmployeeID] ASC
) ON [PRIMARY]
) ON [PRIMARY]
GO