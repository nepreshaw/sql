﻿--Chapter 5 Question 1
--Write a SELECT statement that returns two columns from the Invoices table:
--Write a SELECT statement that returns three columns: 
SELECT VendorName, Count(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Vendors JOIN Invoices
ON Vendors.VendorID  = Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC

--Chapter 5 Question 4
--Write a SELECT statement that returns three columns: AccountDescription, 


--Chapter 5 Question 5
--Modify the solution to exercise 4 to filter for invoices dated from October 1, 2019 to December 31, 2019. 
--Write a SELECT statement that answers the following question: 
--What is the total amount invoiced for each AccountNo? 
--Use the ROLLUP operator to include a row that gives the grand total. 
--Hint: Use the InvoiceLineItemAmount column



--Chapter 5 Question 7
-- Write a SELECT statement that returns four columns: 


--Chapter 5 Question 9





