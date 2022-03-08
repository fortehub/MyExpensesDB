USE MyExpensesDB;
GO

CREATE PROCEDURE dbo.usp_CutOffExpSav_param
(@NthPayDate AS DATE)
AS
BEGIN
SET NOCOUNT ON;


    -- Set the Cutoff/PayDay amount
    DECLARE @NthCutOffExp DECIMAL (10,2)
    SET @NthCutOffExp = (SELECT SUM (AmountPaid)
                         FROM dbo.Paidtbl
                         WHERE PDayDate =  @NthPayDate);

    PRINT @NthCutOffExp;


    -- Update PyExSvtbl.ExpAmount and PyExSvtbl.SavAmount Column
    UPDATE dbo.PyExSvtbl
    SET     ExpAmount = @NthCutOffExp,
            SavAmount = (PDayAmount - @NthCutOffExp)
    WHERE   PDayDate = @NthPayDate;

END;
GO
