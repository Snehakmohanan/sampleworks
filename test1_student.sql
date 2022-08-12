


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
	