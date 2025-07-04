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
select * from Members
select * from Books
select * from IssuedBooks

/**********************************
usp_issue_book
usp_return_book
usp_calculate_fine
*********************************/

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












