SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_new_user_registration') and OBJECTPROPERTY(id,'IsProcedure') = 1)
DROP PROCEDURE dbo.usp_new_user_registration
GO

CREATE PROCEDURE dbo.usp_new_user_registration
	@name 			VARCHAR(30)
	,@email 		VARCHAR(50)
	,@phone 		BIGINT
AS

SET NOCOUNT ON
BEGIN

--DECLARE THE VARIABLES
DECLARE @join_date DATETIME
DECLARE @expiry_date DATETIME

--SET THE VARIABLES
SET @join_date = GETDATE();
SET @expiry_date = DATEADD(YEAR,1,@join_date)

--INSERT THE RECORD INTO Members 
	INSERT INTO Members
	(
		name,
		email,
		phone,
		join_date,
		expiry_date
	) 
	VALUES 
	(
		@name, 
		@email,
		@phone, 
		@join_date, 
		@expiry_date
	)

SELECT 'Member registered successfully' AS Msg, @name AS [Members Name], SCOPE_IDENTITY() AS NewMemberID;

END


SET QUOTED_IDENTIFIER OFF
GO
SET ANSI_NULLS OFF
GO


--exec usp_new_user_registration 'Ujjwal Verma','u@gmail.com','7351128344'
