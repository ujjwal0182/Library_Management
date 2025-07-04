SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_return_book') and OBJECTPROPERTY(id,'IsProcedure') = 1)
DROP PROCEDURE usp_return_book
GO

CREATE PROCEDURE dbo.usp_return_book 
	@member_id		INT
	,@book_id		INT
    ,@issue_id      INT
AS

SET NOCOUNT ON
BEGIN

DECLARE @return_date	DATETIME = GETDATE()

--CALCULATE THE FINE AND UPDATE THE RETURN DATE
UPDATE IssuedBooks 
SET return_date = @return_date,
    fine = CASE 
                WHEN return_date > due_date 
                then DATEDIFF(Day,due_date,@return_date) * 20 
                ELSE 0 
            END
WHERE issue_id = @issue_id;

--UPDATE BOOKS QUANTITY
UPDATE Books SET available_qty = available_qty + 1 WHERE book_id = @book_id 

SELECT ErrorCol = 0, MsgCol = 'Book Return Successfuly'
RETURN(0)

END


SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO


--EXEC usp_return_book 1001,102,7

