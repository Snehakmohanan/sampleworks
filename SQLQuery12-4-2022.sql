 select * from FAMSalaryMaster_temp
 select * from trnIDBPostingAlwDed
 select * from trnIDBPostingBnkDetails
 select * from trnPostingToIDBDetails

 select distinct trnIDBPostingAlwDed.paEmpcode,trnIDBPostingAlwDed.paEmpName, 
   trnIDBPostingBnkDetails.pbIFSCCode,
   trnIDBPostingBnkDetails.pbAccountNo, trnIDBPostingBnkDetails.pbcBranchName, 
   trnIDBPostingBnkDetails.pbYear,trnIDBPostingBnkDetails.pbMonth
  into #temp5
 from ((trnIDBPostingAlwDed 
 inner join trnIDBPostingBnkDetails on 
 trnIDBPostingAlwDed.paEmpID =trnIDBPostingBnkDetails.pbEmpID)
 inner join trnPostingToIDBDetails on
  trnIDBPostingBnkDetails.pbEmpID=trnPostingToIDBDetails.piEmpID)

  
  select * from #temp5

   insert into FAMSalaryMaster_temp(EmpId, EmpName,ifsccode,acno,BranchName,[Year],[Month])
select paEmpcode,paEmpName,pbIFSCCode,pbAccountNo,pbcBranchName,pbYear,pbMonth from #temp5
--select * from FAMSalaryMaster_temp 

select * from  FAMSalaryMaster_temp 
