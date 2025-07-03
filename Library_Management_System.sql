IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Projects')
BEGIN
	CREATE DATABASE Projects
END
GO

USE [Projects]
GO

/***********************************************************************************
1. Create Tables
Members - member_id, name, email, phone, join_date, expiry_date
Books - book_id, title, author, publisher, genre, total_qty, available_qty
IssuedBooks - issue_id, member_id, book_id, issue_date, due_date, return_date, fine
***********************************************************************************/
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Members')
BEGIN
	CREATE TABLE Members
	(
		member_id 		INT PRIMARY KEY,
		name 			VARCHAR(30),
		email 			VARCHAR(50),
		phone 			BIGINT,
		join_date 		DATETIME,
		expiry_date 	DATETIME
	)
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'Books')
BEGIN
	CREATE TABLE Books
	(
		book_id			INT IDENTITY(100,1) PRIMARY KEY
		,title			VARCHAR(100)
		,author			VARCHAR(20)
		,publisher		VARCHAR(20)
		,genre			VARCHAR(30)
		,total_qty		INT
		,available_qty	INT
	)
END
GO

IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'IssuedBooks')
BEGIN
	CREATE TABLE IssuedBooks
	(
		issue_id		INT PRIMARY KEY
		,member_id		INT
		,book_id		INT
		,issue_date		DATETIME
		,due_date		DATETIME
		,return_date	DATETIME
		,fine			DECIMAL(5,2)
		,CONSTRAINT FK_Members_IssueBooks_MemberId FOREIGN KEY (member_id) REFERENCES Members(member_id)
		,CONSTRAINT FK_Books_IssueBooks_BookId FOREIGN KEY (book_id) REFERENCES Books(book_id)
	)
END
GO

select * from Members
select * from Books
select * from IssuedBooks


/********************************************
2. Create Stored Procedure: User Registration
usp_new_user_registration


3. Create Stored Procedure: Add New Book
usp_new_book_addition

4. Create Stored Procedure: Issue Book
usp_Issued_Book
Insert into IssuedBooks
Update Books.available_qty

5. Create Stored Procedure: Return Book
Update return_date in IssuedBooks
Calculate fine if late
Update Books.available_qty

6. Create Views or Queries for Reports
Overdue books
Most issued books
Active members

7. Test All Procedures with Sample Data

8. (Optional) Create Triggers or More Logic
Auto-calculate fine
Auto-update availability

9. (Optional) Create a Front-End or UI
*************************************************/












