USE MyExpensesDB;
GO

CREATE OR ALTER VIEW vw_ExpensesBreakDown AS 
    SELECT 
    ItemName		AS "Item Paid",
    PaidCount	    AS "Count",
    CatName	        AS "Category",	
    DatePaid        AS "Spend Date",	
    PDayDate	    AS "PayDay Date",
 SUM(AmountPaid)   	AS "Money Spent"
 FROM dbo.Paidtbl
 GROUP BY ItemName, PaidCount, PaidCount, CatName, DatePaid,PDayDate;

