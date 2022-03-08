# **MyExpensesDB**

**Database Objects Creation**
----------------------------------------------------------------------------------------------------------------------------------

**Step 1** - Create the database (MyExpensesDB). Execute the following SQL statements to create the Database. Script file also uploaded.

USE master;                                                  <br/>
GO

CREATE DATABASE MyExpensesDB                                  <br/>
ON PRIMARY (                                                  <br/>
    NAME = 'MyExpensesDB',                                    <br/>
    FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB.mdf',          <br/>
    SIZE = 1024MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB)                                                            
LOG ON (                                                      <br/>
    NAME = 'MyExpensesDB_log',                                <br/>
    FILENAME = 'D:\MSSQL\DataLogs\MyExpensesDB_log.mdf',      <br/>
    SIZE = 64MB, MAXSIZE = UNLIMITED, FILEGROWTH = 64MB);     <br/>

![image](https://user-images.githubusercontent.com/95063830/157047148-bbbc9cdb-5dac-415f-84f1-14eaaea6d425.png)

Database succesfully created!

![image](https://user-images.githubusercontent.com/95063830/157047315-946e482d-0bb8-4054-83ac-6fe6ab01dfd9.png)


**Step 2** - Create the tables. Execute the following SQL statements to create the tables. Script file also uploaded.

USE MyExpensesDB;                                           <br/>
GO

/****** Create PyExSvtbl Table *******/                         <br/>
CREATE TABLE dbo.PyExSvtbl (                                    <br/>
    PDay_No     INT PRIMARY KEY IDENTITY,                                           
    PDayAmount	DECIMAL (10,2),                                 <br/>
    PDayDate    DATE UNIQUE,                                    <br/>
    ExpAmount	DECIMAL (10,2),                                 <br/>
    SavAmount	DECIMAL (10,2)                                  <br/>
);                                                              <br/>
                        
/******* Create Paidtbl Table *******/                          <br/>
CREATE TABLE dbo.Paidtbl (                                      <br/>
    Paid_No		INT PRIMARY KEY IDENTITY,                       <br/>
    ItemName	VARCHAR (100),                                  <br/>
    AmountPaid	DECIMAL (10,2),                                 <br/>
    PaidCount	INT,                                            <br/>
    CatName		CHAR (4),                                       <br/>
    DatePaid	DATE,                                           <br/>
    PDayDate	DATE,                                           <br/>
CONSTRAINT  CK_CatName CHECK                                    
     -- Transportation = Tran                                              
     -- Foods          = Food                                   <br/>
     -- Drinks         = Drnk                                   <br/>
     -- Medicine       = Medc                                      
     -- MedicalKits    = Medk                                   <br/>
     -- Bills          = Bill                                   <br/>
     -- Contributions  = Cont                                   <br/>
     -- Payments       = Pay                                    <br/> 
     -- Others         = Othr                                   <br/>
        (CatName in ('Tran','Food','Drnk','Medc','Medk','Bill','Cont','Paym','Othr')),  <br/>
CONSTRAINT FK_PDayDate FOREIGN KEY (PDayDate) REFERENCES dbo.PyExSvtbl (PDayDate)       <br/>
    ON DELETE CASCADE ON UPDATE CASCADE                                                 <br/>
);                                                                                      <br/>   

/******* Create FrmDepotbl Table *******/                                                                                          
CREATE TABLE dbo.FrmDepotbl (                                                           <br/>
    FrmDepo_no	INT PRIMARY KEY IDENTITY,                                               <br/>
    ItemDesc	VARCHAR (100),                                                          <br/>
    ExpAmount	DECIMAL (10,2),                                                         <br/>
    FrDatePaid	DATE                                                                    <br/>
);                                                                                      <br/>
GO                                                                                      <br/>


![image](https://user-images.githubusercontent.com/95063830/157194423-5f4b5849-0c63-4510-925c-71d495352022.png)

![image](https://user-images.githubusercontent.com/95063830/157194509-d89d4b74-840a-4d1b-8d70-a538da9f25cf.png)
 <br/>

**Step3** - Create the view 

USE MyExpensesDB;                                           <br/>
GO

CREATE OR ALTER VIEW vw_ExpensesBreakDown AS                <br/>
    SELECT                                                    
    ItemName		AS "Item Paid",                         <br/>
    PaidCount	    AS "Count",                             <br/>
    CatName	        AS "Category",	                        <br/>
    DatePaid        AS "Spend Date",	                    <br/>
    PDayDate	    AS "PayDay Date",                       <br/>
 SUM(AmountPaid)   	AS "Money Spent"                        <br/>
 FROM dbo.Paidtbl                                           <br/>
 WHERE PDayDate >   '12/09/2021'                            <br/>
 GROUP BY ItemName, PaidCount, PaidCount, CatName, DatePaid,PDayDate;       <br/>

![image](https://user-images.githubusercontent.com/95063830/157197670-cb77473a-23d0-4c1b-af05-28f00dd9aaa6.png)
 <br/>

**Step4** - Create the stored procedure

USE MyExpensesDB;                                           <br/>
GO

CREATE PROCEDURE dbo.usp_CutOffExpSav_param                 <br/>
(@NthPayDate AS DATE)                                       <br/>
AS                                                          <br/>
BEGIN                                                       <br/>
SET NOCOUNT ON;                                             <br/>
    -- Set the Cutoff/PayDay amount                                                  
    DECLARE @NthCutOffExp DECIMAL (10,2)                    <br/>
    SET @NthCutOffExp = (SELECT SUM (AmountPaid)            <br/>
                         FROM dbo.Paidtbl                   <br/>
                         WHERE PDayDate =  @NthPayDate);    <br/>                                                               
    PRINT @NthCutOffExp;                                    <br/>
    -- Update PyExSvtbl.ExpAmount and PyExSvtbl.SavAmount Column    <br/>
    UPDATE dbo.PyExSvtbl                                                               
    SET     ExpAmount = @NthCutOffExp,                                 
            SavAmount = (PDayAmount - @NthCutOffExp)                   
    WHERE   PDayDate = @NthPayDate;                                 <br/>
END;                                                                <br/>
GO    

![image](https://user-images.githubusercontent.com/95063830/157201113-d16374b1-5f6f-4a25-87ed-dcba2f7ec0e0.png)
 <br/>


**Next Step**
----------------------------------------------------------------------------------------------------------------------------------
Database records insertion. Proceed to "Insert DB Stage.md" file
