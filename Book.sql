

Declare @Id int,@Id1 int
 set @Id=1
 set @Id1=1
 while(@Id<=1000)
 begin
  insert into BOOK_RETURN (Actual_Date_Of_Return,LateDays,LateFee) 
  values('2022-08-25',@Id1,10)
   --   update  Lib_BOOK_RETURN
  --set LateFee=100
  --where Issue_Id=@Id

  set @Id=@Id+1
  set @Id1=@Id1+1

  if(@Id1=8)
  begin 
   set @Id1=1
  end

  end


  
Declare @Id int,@Id1 int
 set @Id=1
 set @Id1=8 
 while(@Id<=2000)
 begin
  insert into BOOK_RETURN (Actual_Date_Of_Return,LateDays,LateFee) 
  values('2022-08-25',@Id1,100)
   --   update  Lib_BOOK_RETURN
  --set LateFee=100
  --where Issue_Id=@Id

  set @Id=@Id+1
  set @Id1=@Id1+1

  if(@Id1=31)
  begin 
   set @Id1=8
  end

  end



  Declare @Id int,@Id1 int,@Id2 int
 set @Id=1
 set @Id1=31
 set @Id2=1 
 while(@Id<=10000)
 begin
  insert into BOOK_RETURN (Actual_Date_Of_Return,LateDays,LateFee) 
  values('2022-08-25',@Id1,@Id2)
   --   update  Lib_BOOK_RETURN
  --set LateFee=100
  --where Issue_Id=@Id

  set @Id=@Id+1
  set @Id1=@Id1+1
  set @Id2=@Id2+10


  if(@Id1=100)
  begin 
   set @Id1=31
  end

  if(@Id2=1000)
  begin 
   set @Id2=100
  end

  end
