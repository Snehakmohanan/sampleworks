Declare @Id int,@Rno int
 set @Id=1
 set @Rno=1 
 while(@Id<=10000)
 begin
  insert into MEMBER (Name,Branch_Code,Roll_Number,Phone_Number,Email_Id,Date_of_Join,Status) 
  values('Member-'+cast(@Id as nvarchar(10)),
          floor(1000 + rand() * 8999),
  @Rno, FLOOR(RAND() * POWER(CAST(10 as BIGINT), 10)),
         'Member'+cast(@Id as nvarchar(10))+'@gmail.com',
     '2022-05-20'
  ,1)

  set @Id=@Id+1
  set @Rno=@Rno+1

 end

