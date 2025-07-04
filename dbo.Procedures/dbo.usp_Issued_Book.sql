SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_Issued_Book') and OBJECTPROPERTY(id,'IsProcedure') = 1)
DROP PROCEDURE usp_Issued_Book
GO

CREATE PROCEDURE dbo.usp_Issued_Book 
	@member_id		INT
	,@book_id		INT
	,@return_date	DATETIME
	,@fine			DECIMAL(5,2)
AS

SET NOCOUNT ON
BEGIN

DECLARE @issue_date	DATETIME = GETDATE()
DECLARE @due_date 	DATETIME = DATEADD(DAY,15,@issue_date)

--INSERT THE ISSUE BOOKS
	INSERT INTO IssuedBooks
	(
		member_id	
		,book_id
		,issue_date
		,due_date
		,return_date
		,fine
	) 
	VALUES 
	(
		@member_id
		,@book_id
		,@issue_date
		,@due_date
		,@return_date
		,@fine	
	)

	--UPDATE THE AVAILABLE QTY OF BOOKS
	UPDATE Books SET available_qty = available_qty - 1 WHERE book_id = @book_id 

	SELECT ErrorCol = 0, MsgCol = 'Book Issued Successfuly'
	RETURN(0)

END




SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO


--EXEC usp_Issued_Book 1001,102,null,0
