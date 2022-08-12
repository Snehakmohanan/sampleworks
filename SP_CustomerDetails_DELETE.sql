CREATE PROCEDURE SP_CustomerDetails_DELETE

@CustomerId int,
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
    @pstate varchar(50),
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
    DELETE FROM customerdetails 
  WHERE [customerid]=@CustomerId
END