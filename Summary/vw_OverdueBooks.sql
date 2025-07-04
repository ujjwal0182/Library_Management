-- 📌 1. Overdue Books
-- Show: Issue ID, Member Name, Book Title, Due Date, Days Overdue, Fine


CREATE OR ALTER VIEW [vw_OverdueBooks] AS
SELECT 
    IB.issue_id, 
    M.name AS [Member Name], 
    B.title AS [Book Title], 
    IB.due_date, 
    DATEDIFF(DAY,IB.due_date,GETDATE()) AS [Day Overdue], 
    IB.fine
FROM 
    Members M
INNER JOIN IssuedBooks IB ON M.member_id = IB.member_id
INNER JOIN Books B ON B.book_id = IB.book_id
WHERE 
    return_date IS NULL AND IB.due_date < GETDATE();

