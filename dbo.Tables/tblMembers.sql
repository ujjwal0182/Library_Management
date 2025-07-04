IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.Members') and OBJECTPROPERTY(id, 'IsUserTable') = 1)
BEGIN
	CREATE TABLE Members
	(
		member_id 		INT IDENTITY(1000,1) PRIMARY KEY,
		name 			VARCHAR(30),
		email 			VARCHAR(50),
		phone 			VARCHAR(15),
		join_date 		DATETIME DEFAULT GETDATE(),
		expiry_date 	DATETIME
	)
END
GO


-- INSERT INTO Members (name, email, phone, join_date, expiry_date)
-- VALUES 
-- ('Amit Sharma', 'amit@example.com', '9876543210', GETDATE(), DATEADD(YEAR, 1, GETDATE())),
-- ('Neha Verma', 'neha@example.com', '9123456789', GETDATE(), DATEADD(YEAR, 1, GETDATE())),
-- ('Rahul Mehta', 'rahul@example.com', '9988776655', GETDATE(), DATEADD(YEAR, 1, GETDATE()));

-- select * from Members