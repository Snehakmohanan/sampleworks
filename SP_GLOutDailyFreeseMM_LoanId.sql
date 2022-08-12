

 create procedure SP_GLOutDailyFreeseMM_LoanId
 @LoanId int
 as
 begin
 select LoanId,(InterestAmount+ODInterest) as TotalInterest
 from [dbo].[GLOutDailyFreeseMM]
 where LoanId=@LoanId
 end
 go
 
 
 execute SP_GLOutDailyFreeseMM_LoanId 10153172
