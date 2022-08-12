
CREATE PROCEDURE GLOutDailyFreeseMM1
	@id int
AS
BEGIN
	
	SELECT LoanId, BranchName, CustomerID, CustomerName
	FROM GLOutDailyFreeseMM
	WHERE LoanId=@id
END
GO

EXECUTE GLOutDailyFreeseMM1 2539324
