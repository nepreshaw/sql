--Chapter 7 Question 1
--Write SELECT INTO statements to create two test tables named VendorCopy and InvoiceCopy
--Write an INSERT statement that adds a row to the VendorCopy table 
--(This will result in duplicate vendors in the VendorCopy table.)

INSERT INTO VendorsCopy
SELECT *
FROM Vendors
WHERE VendorCity <> 'CA'

INSERT VendorCopy
SELECT VendorName, VendorAddress1, VendorAddress2,
       VendorCity, VendorState, VendorZipCode,
       VendorPhone, VendorContactLName, VendorContactFName,
       DefaultTermsID, DefaultAccountNo
FROM Vendors
WHERE VendorState <> 'CA'

--Chapter 7 Exercise 4
--Write an UPDATE statement that modifies the VendorCopy table. 
--Change the default account number to 403 for each vendor that has a default account 
--number of 400.

UPDATE VendorsCopy
SET DefaultAccountNo = 403
WHERE DefaultAccountNo = 400

--Chapter 7 Exercise 5
--Write an UPDATE statement that modifies the InvoiceCopy table. 
UPDATE InvoiceCopy
SET PaymentDate = GETDATE(), 
	PaymentTotal = InvoiceTotal - CreditTotal - PaymentTotal
	WHERE InvoiceTotal - CreditTotal - PaymentTotal > 0
	
--Chapter 7 Exercise 6
--Write an UPDATE statement that modifies the InvoiceCopy table. 
SET TermsID = 2
WHERE VendorID IN
    (SELECT VendorID
     FROM VendorsCopy
     WHERE DefaultTermsID = 2);

--Chapter 7 Exercise 7
--Solve exercise 6 using a join rather than a subquery. 

UPDATE InvoiceCopy
--Write a DELETE statement that deletes all vendors in the state of Minnesota 
