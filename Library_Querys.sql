------4A-------Get the number of books written by the given author-------

select COUNT(BK.Book_Id) AS countOfBooks from BOOK BK
inner join BOOK_AUTHOR BA
on BK.Book_Id=BA.Book_Id
inner join AUTHOR LA
on BA.Author_Id=LA.Author_Id

where LA.Name='Author-3'


--------------------------------------------------------------------------------------------------------------------------------------
-----4B------Get the publishers and the number of books published by each one

     select p.Name,count(b.Book_Id) OVER (PARTITION BY b.Book_ID)
     NoofBook from PUBLISHER as p
     inner join BOOK as b
     on p.Publisher_id=b.Publisher_Id


-------------------------------------------------------------------------------------------------------------------------------------
---4C--Get the names of authors who jointly wrote more than one book------


SELECT Name FROM
 AUTHOR
 INNER JOIN BOOK_AUTHOR
 ON AUTHOR.Author_Id=BOOK_AUTHOR.Author_Id
 INNER JOIN BOOK
 ON BOOK.Book_Id=BOOK_AUTHOR.Book_Id



 --4 c Get the names of authors who jointly wrote more than one book.

select a.Name,b.Title,count(ba.Book_ID) OVER (
        PARTITION BY ba.Book_ID
     bookid from Book as b
inner join Book_Author as ba on
b.Book_Id=ba.Book_Id
left join AUTHOR as a
on a.Author_Id=ba.Author_Id
 

--SELECT AUTHOR.Name
--     , book.title
--     , book.cost
--     , author.id
--     , author.name
--     , publisher.id
--     , publisher.name
--  FROM book
--INNER
--  JOIN publisher
--    ON publisher.id = book.publid
--INNER
--  JOIN writtenby
--    ON writtenby.bookid = book.id
--INNER
--  JOIN author
--    ON author.id = writtenby.authorid



--	select a.Name,b.Title,count(ba.Book_ID) OVER (
--        PARTITION BY ba.Book_ID
--     bookid from Book as b
--inner join Book_Author as ba on
--b.Book_Id=ba.Book_Id
--left join AUTHOR as a 
--on a.Author_Id=ba.Author_Id

----------------------------------------------------------------------------------------------------------------------------------------------
--4D--Get the list of books which are issues but not returned---

SELECT BK.Book_Id,BK.Title
 FROM BOOK BK
 INNER JOIN BOOK_ISSUE BI
 ON BI.Book_Id=BK.Book_Id
 WHERE BI.Status=1


-----------------------------------------------------------------------------------------------------------------------------------------
--4E--Get the list of students who reads only ‘Malayalam’ book---

SELECT LB.Name FROM
 MEMBER LB
 INNER JOIN BOOK_ISSUE BI
 ON LB.Member_Id=BI.Member_Id
 INNER JOIN BOOK BK
 ON BI.Book_Id=BK.Book_Id
 WHERE BK.Language_Id=1


----------------------------------------------------------------------------------------------------------------------------------------
--4F--Get the total fine collected for the month of March 2021----

select sum(LateFee) AS 'Total Fine of March' from
 [BOOK_RETURN]
 where Month(Actual_Date_Of_Return)=3

 --SELECT * FROM [Lib_BOOK_RETURN]
 --WHERE Month(Actual_Date_Of_Return)=3

 --UPDATE [Lib_BOOK_RETURN]
 --SET Actual_Date_Of_Return='2022-03-12',LateDays=10,LateFee=100
 --WHERE Issue_Id=13518




-------------------------------------------------------------------------------------------------------------------------------------
----Get the list of students who has overdue (not returned the books even on due date)---



 select Name,Roll_Number from MEMBER 
 INNER JOIN BOOK_ISSUE 
 ON MEMBER.Member_Id=BOOK_ISSUE.Member_Id
 WHERE BOOK_ISSUE.Status=1  AND BOOK_ISSUE.Expected_Date_Of_Return<GETDATE()



------------------------------------------------------------------------------------------------------------------------------------------
-----Calculate the fine as on today to be collected from each overdue book----

 select sum(LateFee) AS 'Fine ON today' from
 [BOOK_RETURN]
 where Actual_Date_Of_Return = GETDATE()

 UPDATE [BOOK_RETURN]
 SET Actual_Date_Of_Return='2022-07-21',LateDays=5,LateFee=10
 WHERE Issue_Id=1234



-----------------------------------------------------------------------------------------------------------------------------------------
----Members who joined after Jan 1 2021 but has not taken any books-----







-------------------------------------------------------------------------------------------------------------------------------------------
----8-------Use cursors and create a procedure to print Books Issue Register (page wise – 20 rows in a page)-----




declare @Title Varchar(50)
declare @Name Varchar(50)


PRINT '-------- Print Book Issue Register --------'

DECLARE BookRegister_cursor CURSOR FOR

SELECT B.Title,M.Name
FROM BOOK_ISSUE BI
inner join BOOK B
on BI.Book_Id=B.Book_Id
inner join MEMBER M
on BI.Member_Id=M.Member_Id
where BI.status=1
order by BI.Issue_Id

OPEN BookRegister_cursor

FETCH NEXT FROM BookRegister_cursor
INTO @Title,@Name

print '      Title             Name       '
WHILE @@FETCH_STATUS = 0
BEGIN
    print '   ' + CAST(@Title as Varchar(50)) +'           '+
        cast(@Name as Varchar(50))


    FETCH NEXT FROM BookRegister_cursor
INTO @Title,@Name

END
CLOSE BookRegister_cursor
DEALLOCATE BookRegister_cursor



----10. Create an index for table MEMBER to search based on phone number


          CREATE INDEX MEMBER
          ON MEMBER (Member_Id,Phone_Number)
 

-----------3F-----------------------------GRANT AND REVOKE---------

USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [Sneha]    Script Date: 20-07-2022 12:37:10 ******/
CREATE LOGIN [Sneha] WITH PASSWORD=N'TMOxGRB9fO0HZ2YKEKqX+1HzgfMfQCF4uqDFRc5SLD4=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [Sneha] DISABLE
GO



grant insert, select,delete
on [LATE_FEE] to Sneha2

revoke insert,
select on [LATE_FEE] from Sneha2





-----9. Create a history table (you may use same structure without any keys) for MEMBER table 
----------and copy the original values of the row being updated to the history table using a trigger

CREATE TABLE [dbo].[MEMBER_HISTORY](
[Member_Id] [int] NULL,
[Name] [varchar](100) NULL,
[Branch_Code] [varchar](50) NULL,
[Roll_Number] [int] NULL,
[Phone_Number] [bigint] NULL,
[Email_Id] [varchar](100) NULL,
[Date_of_Join] [date] NULL,
[Status] [varchar](100) NULL
);

--CREATE TRIGGER trInsertMEMBER ON MEMBER
--FOR INSERT
--AS
--   declare @Member_Id int;
--   declare @MName varchar(100);
--   declare @MBranch_Code varchar(100);
--   declare @MRoll_Number int
--   declare @MPhone_Number bigint
--   declare @MEmail_Id varchar(100);
--   declare @MDate_of_Join varchar(100);
--declare @MStatus varchar(100);
--declare @T_action varchar(100);


--select @Member_Id=@Member_Id from inserted;  
--select @Mname=@MName from inserted;
--select @MBranch_Code=@MBranch_Code  from inserted ;
--select @MRoll_Number=@MRoll_Number from inserted ;
--select @MPhone_Number=@MPhone_Number from inserted ;
--select @MEmail_Id=@MEmail_Id from inserted ;
--select @MDate_of_Join=@MDate_of_Join from inserted ;
--select @MStatus=@MStatus from inserted ;

--set @T_action='Inserted Record -- After Insert Trigger.';



--insert into Member_History (Member_Id,Name,Branch_Code,Roll_Number,Phone_Number,Email_Id,Date_of_Join,Status)
--    values(@Member_Id,@MName,@MBranch_Code,@MRoll_Number,@MPhone_Number,@MEmail_Id,@MDate_of_Join,@MStatus)


	

--PRINT 'AFTER INSERT trigger fired.'
--GO








CREATE TRIGGER trgAfterInsertMEMBER ON [MEMBER]
FOR INSERT
AS
declare @Mid int;
declare @Mname varchar(100);
declare @Bcode decimal(10,2);
declare @Rollno int
    declare @phnNo bigint
    declare @emailid varchar(100);
declare @doj varchar(100);
declare @stats varchar(100);
declare @T_action varchar(100);

select @Mid=i.[Member_Id] from inserted i;	
select @Mname=i.[Name] from inserted i;	
select @Bcode=i.[Branch_Code] from inserted i;
select @Rollno=i.[Roll_Number] from inserted i;
select @phnNo=i.[Phone_Number] from inserted i;
select @emailid=i.[Email_Id] from inserted i;	
select @doj=i.[Date_of_Join] from inserted i;	
    select @stats=i.[Status] from inserted i;	


set @T_action='Inserted Record -- After Insert Trigger.';

--insert into [MEMBER_HISTORY]
 --          --(Emp_ID,Emp_Name,Emp_Sal,Audit_Action,Audit_Timestamp) 
--values(@empid,@empname,@empsal,@audit_action,getdate());

insert into Member_History (Member_Id,Name,Branch_Code,Roll_Number,Phone_Number,Email_Id,Date_of_Join,Status) 
    values(@Mid,@Mname,@Bcode,@Rollno,@phnNo,@emailid,@doj,@stats)

PRINT 'AFTER INSERT trigger fired.'
GO



insert into MEMBER values('Dev','1','4',9876543210,'dev@gmail.com','2022-6-8',1)


------------------------------------------------------------------------------------------------------------------------------------
----7. Create a database procedure to add a new book to the Library database.

CREATE PROCEDURE SP_ADD_NEWBOOK

(@BookName varchar(100),@LanguageId int,
 @MRP int, @Publisher_Id int,@Published_Date date,@Volume int,
 @Status varchar(100))
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    
insert into BOOK
values(@BookName,
      @LanguageId,
      @MRP,
      @Publisher_Id,
      @Published_Date,
       @Volume,
       @Status)

END
GO


exec SP_ADD_NEWBOOK 'abc',1,100,15897,'2022-05-25',4,0
--------------------------------------------------------------------------------------------------------------------------------------
--5. Book return should insert an entry into the Book_Return table and also update the status
--in Book_Issue table as ‘Returned’. Create a database TRANSACTION to do this operation.






------------------------------------------------------------------------------------------------------------------------------------- 
--6. Create a database view ‘Available_Books’, which will list out books which are available in 
--the library



------------TRANACTION

CREATE PROCEDURE [dbo].[InsertPersonalDetailsAndAccount]
       -- Add the parameters for the stored procedure here
       @FirstName varchar(50),
       @LastName varchar(50),
       @Age smallint,
       @Active bit,
       @Salary money,
       @PPFDeduction money
AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
       -- interfering with SELECT statements.
       SET NOCOUNT ON;

       BEGIN TRAN
              BEGIN TRY
                     -- Insert into PersonalDetails table first
                     INSERT INTO PersonalDetails
                            (FirstName, LastName, Age, Active)
                     VALUES
                            (@FirstName, @LastName, @Age, @Active)

                     DECLARE @pdId int
                     SET @pdId = SCOPE_IDENTITY()
                     -- now insert into Accounts table
                     INSERT INTO Accounts
                            (Salary, PPFDeduction, PersonalDetailsId)
                     VALUES
                            (@Salary, @PPFDeduction, @pdId)
                     
              -- if not error, commit the transcation
              COMMIT TRANSACTION
       END TRY
       BEGIN CATCH
              -- if error, roll back any chanegs done by any of the sql statements
              ROLLBACK TRANSACTION
       END CATCH
END






--------------failed in maths in class 5
SELECT student.id,student.name
FROM student
INNER JOIN marks ON student.id=marks.id
where student.class=5 and marks.maths<40

-------------average marks greater than 50 but failed in maths




select student.id,student.name,student.class
FROM student 
INNER JOIN marks  ON student.id=marks.id
where marks.maths<40 and ((physics+chemistry+maths)/3)>50

---------------------------------------------------------------------------------
select * from student
select * from marks

			--SELECT student.name
--FROM student
--INNER JOIN marks ON student.id=marks.id
--where marks.maths<40 and marks.chemistry>40


--SELECT sum(physics + chemistry + maths) as total
--		FROM marks where
--		id=5



--		SELECT student.id,student.name
--FROM student
--INNER JOIN marks ON student.id=marks.id

--where (physics+chemistry+maths)>200 and marks.maths<40
	