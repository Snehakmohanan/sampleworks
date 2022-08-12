SELECT distinct GG.CustomerID,GG.CustomerName,GS.cPermanentAddress  
FROM GLOutDailyFreeseMM as GG
INNER JOIN GShareHolder as  GS ON GG.CustomerID = GS.PersonalId


