ALTER PROCEDURE SP_GLOutDailyFreeseMM_Mobno
	@MobileNo varchar(20)
AS
BEGIN
	
	SELECT MobileNo,CustomerName, PrinceOutAmount,(InterestAmount+ODInterest) as TotalInterest
	FROM GLOutDailyFreeseMM
	WHERE MobileNo=@MobileNo

END
GO

EXECUTE SP_GLOutDailyFreeseMM_Mobno '9876543211'

select (InterestAmount+ODInterest) as TotalInterest from GLOutDailyFreeseMM




