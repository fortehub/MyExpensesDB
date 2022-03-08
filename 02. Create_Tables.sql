USE MyExpensesDB;
GO

/****** Create PyExSvtbl Table *******/
CREATE TABLE dbo.PyExSvtbl (
    PDay_No     INT PRIMARY KEY IDENTITY, 
    PDayAmount	DECIMAL (10,2),
    PDayDate    DATE UNIQUE,
    ExpAmount	DECIMAL (10,2),
    SavAmount	DECIMAL (10,2)
);

/******* Create Paidtbl Table *******/
CREATE TABLE dbo.Paidtbl (
    Paid_No		INT PRIMARY KEY IDENTITY,
    ItemName	VARCHAR (100),
    AmountPaid	DECIMAL (10,2),
    PaidCount	INT,
    CatName		CHAR (4),
    DatePaid	DATE,
    PDayDate	DATE,
CONSTRAINT  CK_CatName CHECK
     -- Transportation = Tran
     -- Foods          = Food
     -- Drinks         = Drnk
     -- Medicine       = Medc
     -- MedicalKits    = Medk
     -- Bills          = Bill
     -- Contributions  = Cont
     -- Payments       = Pay 
     -- Others         = Othr
        (CatName in ('Tran','Food','Drnk','Medc','Medk','Bill','Cont','Paym','Othr')),
CONSTRAINT FK_PDayDate FOREIGN KEY (PDayDate) REFERENCES dbo.PyExSvtbl (PDayDate)
        ON DELETE CASCADE ON UPDATE CASCADE
);

/******* Create FrmDepotbl Table *******/ 
CREATE TABLE dbo.FrmDepotbl (
    FrmDepo_no	INT PRIMARY KEY IDENTITY,
    ItemDesc	VARCHAR (100),
    ExpAmount	DECIMAL (10,2),
    FrDatePaid	DATE
);
GO
