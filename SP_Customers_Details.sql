 alter procedure SP_Customers_Details
    @customerid int,
	@title varchar,
	@firstname varchar(50),
	@middlename varchar(50),
	@lastname varchar(50),
    @age int,
    @caddress varchar(50),
    @ccity varchar(50),
    @cdistrict varchar(50),
    @cstate varchar(50),
    @ccountry varchar(50),
    @cpin varchar(50),
    @paddress varchar(50),
    @pcity varchar(50),
    @pdistrict varchar(50),
    @pstste varchar(50),
    @pcountry varchar(50),
    @ppin varchar(50),
    @occupation varchar(50),
    @experience varchar(50),
    @idproof varchar(50),
    @idnumber varchar(50),
    @addrerssproof varchar(50),
    @details varchar(50)
  
  
AS
BEGIN 
insert into customerdetails(customerid,title,firstname,middlename,lastname,age
      ,caddress,ccity,cdistrict,cstate,ccountry,cpin,paddress,pcity,
	  pdistrict,pstste,pcountry,ppin,occupation,experience,idproof,
	  idnumber,addrerssproof,details )
	  values
	  (@customerid,@title,@firstname,@middlename,@lastname, @age,@caddress,@ccity,@cdistrict,@cstate,
	  @ccountry,@cpin,@paddress,@pcity,@pdistrict,@pstste,@pcountry,@ppin, @occupation,
    @experience,@idproof,@idnumber,@addrerssproof,@details)

END
GO
