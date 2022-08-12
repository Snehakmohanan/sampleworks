select * from FAMSalaryMaster_temp 
--where EmpId=0

select * from trnIDBPostingAlwDed

select * from trnIDBPostingBnkDetails

select * from trnPostingToIDBDetails

--drop table #temp5

select distinct trnIDBPostingAlwDed.paEmpName, trnIDBPostingBnkDetails.pbIFSCCode,
 trnIDBPostingBnkDetails.pbAccountNo, trnIDBPostingBnkDetails.pbcBranchName, 
 trnIDBPostingBnkDetails.pbYear,trnIDBPostingBnkDetails.pbMonth,trnIDBPostingBnkDetails.pbEmpID as EmpId into #temp5
 from ((trnIDBPostingAlwDed 
 inner join trnIDBPostingBnkDetails on 
 trnIDBPostingAlwDed.paEmpID =trnIDBPostingBnkDetails.pbEmpID)
 inner join trnPostingToIDBDetails on
  trnIDBPostingBnkDetails.pbEmpID=trnPostingToIDBDetails.piEmpID)

  select * from #temp5

 insert into FAMSalaryMaster_temp(EmpId, EmpName,ifsccode,acno,BranchName,[Year],[Month])
select EmpId,paEmpName,pbIFSCCode,pbAccountNo,pbcBranchName,pbYear,pbMonth from #temp5
select * from FAMSalaryMaster_temp  