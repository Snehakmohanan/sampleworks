Declare @Id int,@Id1 int,@Id2 int,@PbNo int
 set @Id=1 
 set @Id1=1 
 set @Id2=1 
 set @PbNo=1 
 
 while(@Id<=10000)
 begin
  insert into BOOK([Title],[Language_Id],[MRP],[Publisher_Id],[Published_Date],[Volume],[Status]) 
  values('Title-'+cast(@Id as nvarchar(10)),
  @Id1,@Id2,@PbNo,'1993-05-20' , @Id1, 1 )
         
  set @Id=@Id+1
  set @Id1=@Id1+1
 set @Id2=@Id2+20
  set @PbNo=@PbNo+1
  
  if(@Id1=12)
  begin
  set @Id1=1
  end

  if(@Id2=1000)
  begin
  set @Id2=1
  end
 

  end