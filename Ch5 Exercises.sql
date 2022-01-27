﻿--Chapter 5 Question 1
--Write a SELECT statement that returns two columns from the Invoices table:
--Write a SELECT statement that returns three columns: VendorName, InvoiceCount, and InvoiceSum. 
SELECT VendorName, Count(*) AS InvoiceCount, SUM(InvoiceTotal) AS InvoiceSum
FROM Vendors JOIN Invoices
ON Vendors.VendorID = Invoices.VendorID
GROUP BY VendorName
ORDER BY InvoiceCount DESC

--Chapter 5 Question 4
--Write a SELECT statement that returns three columns: AccountDescription, LineItemCount, and LineItemSum. 
SELECT AccountDescription, COUNT (*) AS LineItemCount , SUM (InvoiceLineItemAmount) AS LineItemSum
FROM GLAccounts JOIN InvoiceLineItems
ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC

--Chapter 5 Question 5
--Modify the solution to exercise 4 to filter for invoices dated from October 1, 2019 to December 31, 2019. 
FROM GLAccounts 
	JOIN InvoiceLineItems
	ON GLAccounts.AccountNo = InvoiceLineItems.AccountNo
    JOIN Invoices
	ON InvoiceLineItems.InvoiceID = Invoices.InvoiceID
WHERE InvoiceDate BETWEEN '2019-10-01' AND '2019-12-31' 
GROUP BY AccountDescription
HAVING COUNT(*) > 1
ORDER BY LineItemCount DESC
--Write a SELECT statement that answers the following question: 
--What is the total amount invoiced for each AccountNo? 
--Use the ROLLUP operator to include a row that gives the grand total. 
--Hint: Use the InvoiceLineItemAmount column

SELECT AccountNo, InvoiceLineItemAmount, SUM(InvoiceLineItemAmount) AS Amount
FROM InvoiceLineItems
GROUP BY ROLLUP(AccountNo, InvoiceLineItemAmount)

--Chapter 5 Question 7
-- Write a SELECT statement that returns four columns: 
SELECT VendorName, AccountDescription, Count(*) AS LineItemCount, SUM(InvoiceLineItemAmount) AS LineItemSum
	JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
    JOIN InvoiceLineItems
	ON Invoices.InvoiceID = InvoiceLineItems.InvoiceID
FROM Vendors
	JOIN InvoiceLineItems 
	ON Vendors.VendorID = InvoiceLineItems.InvoiceID
	JOIN GLAccounts
	ON InvoiceLineItems.AccountNo = GLAccounts.AccountNo
GROUP BY VendorName
HAVING COUNT(DISTINCT InvoiceLineItems.AccountNo) > 1
ORDER BY TotalNumOfAccounts DESC 

--Chapter 5 Question 9

SELECT Vendors.VendorID, InvoiceDate, InvoiceTotal, VendorName, 
SUM(InvoiceTotal) OVER (PARTITION BY VendorName) AS VendorTotal, 
COUNT(Vendors.VendorID) OVER (PARTITION BY VendorName) AS VendorCount, 
AVG(InvoiceTotal) OVER (PARTITION BY VendorName) AS VendorAvg
FROM Vendors 
	JOIN Invoices
	ON Vendors.VendorID = Invoices.VendorID
ORDER BY VendorName




