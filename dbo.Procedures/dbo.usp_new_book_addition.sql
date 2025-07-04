SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_new_book_addition') and OBJECTPROPERTY(id,'IsProcedure') = 1)
DROP PROCEDURE usp_new_book_addition
GO

CREATE PROCEDURE dbo.usp_new_book_addition 
	@title			VARCHAR(100)
	,@author		VARCHAR(20)
	,@publisher		VARCHAR(20)
	,@genre			VARCHAR(30)
	,@total_qty		INT
	,@available_qty	INT
	,@update		INT  = 0
AS

SET NOCOUNT ON
BEGIN

-- IF NOT EXISTS (SELECT 1 FROM Books WHERE title=@title AND author = @author AND publisher = @publisher)
IF @update = 0 AND NOT EXISTS (SELECT 1 FROM Books WHERE title=@title AND author = @author AND publisher = @publisher)
BEGIN
	INSERT INTO Books
	(
		title, author, publisher, genre, total_qty, available_qty
	) 
	VALUES 
	(
		@title, @author, @publisher, @genre, @total_qty, @available_qty
	)
END

IF @update = 1 AND EXISTS (SELECT 1 FROM Books WHERE title=@title AND author = @author AND publisher = @publisher)
BEGIN
	UPDATE 
		Books 
	SET	
		total_qty = @total_qty ,available_qty = @available_qty
	WHERE
		title = @title AND author = @author AND publisher = @publisher
END


END
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

exec usp_new_book_addition 'You Can not','James Willision','GorakhPur','Self-Awareness','25','24'
exec usp_new_book_addition 'You Can not','James Willision','GorakhPur','Self-Awareness','25','24',1


