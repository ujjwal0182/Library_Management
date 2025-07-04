-- 📌 2. Most Issued Books
-- Show: Book Title, Author, Total Times Issued


CREATE OR ALTER VIEW [vw_OverdueBooks] AS
SELECT 
    B.title, B.author, COUNT(*) AS times_issued 
FROM 
    Books B
INNER JOIN IssuedBooks I ON I.book_id = B.book_id
GROUP BY 
    b.title, b.author
ORDER BY 
    times_issued DESC;