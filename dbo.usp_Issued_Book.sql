SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_Issued_Book') and OBJECTPROPERTY(id,'IsProecure') = 1)
DROP PROCEDURE usp_Issued_Book
GO

CREATE PROCEDURE dbo.usp_Issued_Book 
	@issue_id		INT
	,@member_id		INT
	,@book_id		INT
	,@issue_date		DATETIME
	,@due_date		DATETIME
	,@return_date	DATETIME
	,@fine			DECIMAL(5,2)
AS

SET NOCOUNT ON
BEGIN
	INSERT INTO IssuedBooks
	(
		issue_id
		,member_id	
		,book_id
		,issue_date
		,due_date
		,return_date
		,fine
	) 
	VALUES 
	(
		@issue_id
		,@member_id
		,@book_id
		,@issue_date
		,@due_date
		,@return_date
		,@fine	
	)

	SELECT @issue_id = SCOPE_IDENTITY()
	SELECT ErrorCol = 0, MsgCol = 'Book Issued Successfuly'
	RETURN(0)

END




SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO