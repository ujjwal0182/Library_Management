SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


IF EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID('dbo.usp_new_user_registration') and OBJECTPROPERTY(id,'IsProcedure') = 1)
DROP PROCEDURE dbo.usp_new_user_registration
GO

CREATE PROCEDURE dbo.usp_new_user_registration 
	@member_id 		INT,
	@name 			VARCHAR(30),
	@email 			VARCHAR(50),
	@phone 			BIGINT,
	@join_date 		DATETIME,
	@expiry_date 	DATETIME
AS

SET NOCOUNT ON
BEGIN
	INSERT INTO Members
	(
		member_id,
		name,
		email,
		phone,
		join_date,
		expiry_date
	) 
	VALUES 
	(
		@member_id, 
		@name, 
		@email,
		@phone, 
		@join_date, 
		@expiry_date
	)
END


SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO