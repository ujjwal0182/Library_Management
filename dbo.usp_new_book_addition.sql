SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_new_book_addition') and OBJECTPROPERTY(id,'IsProecure') = 1)
DROP PROCEDURE usp_new_book_addition
GO

CREATE PROCEDURE dbo.usp_new_book_addition 
	@book_id		INT 
	,@title			VARCHAR(100)
	,@author		VARCHAR(20)
	,@publisher		VARCHAR(20)
	,@genre			VARCHAR(30)
	,@total_qty		INT
	,@available_qty	INT
AS

SET NOCOUNT ON
BEGIN
	INSERT INTO Books
	(
		book_id	
		,title	
		,author	
		,publisher
		,genre
		,total_qty
		,available_qty

	) 
	VALUES 
	(
		@book_id
		,@title
		,@author
		,@publisher
		,@genre
		,@total_qty
		,@available_qty
	)
END


SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO