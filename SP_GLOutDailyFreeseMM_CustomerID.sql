Alter PROCEDURE SP_GLOutDailyFreeseMM_CustomerID
	@CustomerID INT
AS
BEGIN

SELECT distinct GG.CustomerID,GG.CustomerName,GS.cPermanentAddress,GG.LoanId,GG.LoanNo,GG.LoanDate  
FROM GLOutDailyFreeseMM as GG
INNER JOIN GShareHolder as  GS ON GG.CustomerID = GS.PersonalId

where CustomerID=@CustomerID
	

END
GO