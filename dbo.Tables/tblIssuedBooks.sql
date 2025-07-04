IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.IssuedBooks') and OBJECTPROPERTY(id, 'IsUserTable') = 1)
BEGIN
	CREATE TABLE IssuedBooks
	(
		issue_id		INT IDENTITY(1,1) PRIMARY KEY
		,member_id		INT
		,book_id		INT
		,issue_date		DATETIME DEFAULT GETDATE()
		,due_date		DATETIME
		,return_date	DATETIME NULL
		,fine			DECIMAL(8,2)
		,CONSTRAINT FK_Members_IssueBooks_MemberId FOREIGN KEY (member_id) REFERENCES Members(member_id)
		,CONSTRAINT FK_Books_IssueBooks_BookId FOREIGN KEY (book_id) REFERENCES Books(book_id)
	)
END
GO

-- INSERT INTO IssuedBooks (member_id, book_id, issue_date, due_date, return_date, fine)
-- VALUES 
-- (1000, 100, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL, 0),
-- (1001, 101, GETDATE(), DATEADD(DAY, 14, GETDATE()), NULL, 0);

-- select * from IssuedBooks