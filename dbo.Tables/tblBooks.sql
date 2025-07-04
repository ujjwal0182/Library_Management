IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.Books') and OBJECTPROPERTY(id, 'IsUserTable') = 1)
BEGIN
	CREATE TABLE Books
	(
		book_id			INT IDENTITY(100,1) PRIMARY KEY
		,title			VARCHAR(100)
		,author			VARCHAR(100)
		,publisher		VARCHAR(100)
		,genre			VARCHAR(50)
		,total_qty		INT
		,available_qty	INT
		,CONSTRAINT CK_Books_AvailableQty CHECK (available_qty BETWEEN 0 AND total_qty)
	)
END
GO

-- INSERT INTO Books (title, author, publisher, genre, total_qty, available_qty)
-- VALUES 
-- ('Atomic Habits', 'James Clear', 'Penguin', 'Self-help', 5, 5),
-- ('The Alchemist', 'Paulo Coelho', 'HarperCollins', 'Fiction', 3, 3),
-- ('Clean Code', 'Robert C. Martin', 'Prentice Hall', 'Programming', 4, 4);

-- SELECT * FROM Books;

