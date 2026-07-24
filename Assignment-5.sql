-- Section 1: DDL (Data Definition Language) — Q1 to Q12


-- 1. Create a database for the college records.

create database Assignment5

use Assignment5


-- 2. Create the Department table.

create table Department (DepartmentID int primary key, DeptName varchar(25))


-- 3. Create the Student table with all required columns.

create table Student (RollNo int primary key, StudentName varchar(25), Course varchar(25), Marks int, City varchar(20), 
Gender char(1) check(Gender in ('M','F')), Age int, AdmissionDate date, Fee money, 
DepartmentID int foreign key references Department(DepartmentID))


-- 4. Add a new column to the Student table to store the student's email address.

alter table Student add Email varchar(50)

select * from Student


-- 5. Modify the data type/size of the email column you just added.

alter table Student alter column Email varchar(55)

sp_help Student


-- 6. Rename the newly added email column to something more suitable.

sp_rename 'Student.Email','Email_id'

select * from Student


-- 7. Drop the email column from the Student table.

alter table Student drop column Email_id


-- 8. Rename the Student table to StudentRecords and then rename it back to Student.

sp_rename 'Student','StudentRecords'

sp_rename 'StudentRecords','Student'


-- 9. Write a query to view the complete structure of the Student table.

sp_help Student


-- 10. Write a query to view the complete structure of the Department table.

sp_help Department


-- 11. Truncate all the data from the Department table and recreate it.

alter table Student drop constraint FK__Student__Departm__5FB337D6

truncate table Department

alter table Student add constraint FK_Student_Dept foreign key (DepartmentID) references Department(DepartmentID)


-- 12. Drop the Department table and create it again with the same structure.

alter table Student drop constraint FK_Student_Dept

drop table Department

create table Department (DepartmentID int primary key, DeptName varchar(25))

alter table Student add constraint FK_Student_Dept foreign key (DepartmentID) references Department(DepartmentID)



-- Section 2: Constraints — PK, FK, UNIQUE, NOT NULL, DEFAULT, CHECK — Q13 to Q32


-- 13. Set the primary key on the Department table.

alter table Department add constraint PK_Dept primary key (DepartmentID)


-- 14. Set the primary key on the Student table.

alter table Student add constraint PK_Student primary key (RollNo)


-- 15. Add a foreign key on the Student table that references the Department table.

alter table student add constraint FK_Stud_Department foreign key (DepartmentID) references Department (DepartmentID)


-- 16. Try inserting a student record with a department value that does not exist in the Department table and observe the result.

insert into Student values (1, 'Viha', 'Data Engineering', 100, 'Vadodara', 'F', 21, '2026-08-01', 50, 1)


-- 17. Apply a NOT NULL constraint on the student's name column.

alter table Student alter column StudentName varchar(25) not null 


-- 18. Apply a NOT NULL constraint on the course column.

alter table Student alter column Course varchar(25) not null


-- 19. Apply a UNIQUE constraint on a column that stores each student's roll number.

alter table Student add constraint Unique_RollNo unique (RollNo)


-- 20. Apply a UNIQUE constraint on the email column (add the column again if you had dropped it earlier).

select * from Student

alter table Student add Email varchar(50)

alter table Student add constraint Unique_email unique (Email)


-- 21. Apply a DEFAULT constraint on the city column with a default value of your choice.

alter table Student add constraint Default_city default 'Vadodara' for City


-- 22. Apply a DEFAULT constraint on the fee column with a default value.

alter table Student add constraint Default_fees default '20000' for Fee


-- 23. Apply a CHECK constraint on the marks column so that marks cannot be negative or greater than 100.

alter table Student add constraint Check_mks check(Marks >= 0 or Marks <=100)


-- 24. Apply a CHECK constraint on the age column so that age must be greater than or equal to 15.

alter table Student add constraint Check_age check(Age >= 15)


-- 25. Apply a CHECK constraint on the gender column so that only 'M' or 'F' can be entered.

alter table Student add constraint Check_gender check(Gender in ('M','F'))


-- 26. Remove the CHECK constraint applied on the age column.

alter table Student drop constraint Check_age


-- 27. Remove the UNIQUE constraint applied on the roll number column.

alter table Student drop constraint Unique_RollNo


-- 28. Remove the DEFAULT constraint applied on the fee column.

alter table Student drop constraint Default_fees


-- 29. Remove the foreign key constraint from the Student table.

alter table Student drop constraint FK_Student_Dept


-- 30. Add the foreign key constraint back to the Student table.

alter table student add constraint FK_Stud_Department foreign key (DepartmentID) references Department (DepartmentID)


-- 31. Remove the primary key from the Department table and then reapply it.

sp_help Department

alter table Department drop constraint PK__Departme__B2079BCD3FAD9E3B

alter table Department add constraint PK_Dept primary key (DepartmentID)


-- 32. Try deleting a department from the Department table that is still referenced by a student and observe the result.

insert into Department values (1, 'CS')

select * from Department

insert into Student (RollNo, StudentName, Course, Marks, City, Gender, Age, AdmissionDate, Fee, DepartmentID) values
(1, 'Viha', 'Data Engineering', 100, 'Vadodara', 'F', 21, '2026-08-01', 50, 1)

delete from Department where DepartmentID = 1



-- Section 3: DML (Data Manipulation Language) — Q33 to Q47


-- 33. Insert 5 records into the Department table.

insert into Department values (2, 'Arts'), (3, 'Commerce'), (4, 'Science'), (5, 'AI'), (6, 'Data analytics')


-- 34. Insert 20 records into the Student table with varied courses, cities, marks, and fees.


insert into Student values
(1, 'Amit', 'CS', 85, 'Vadodara', 'M', 20, '2026-01-10', 50000, 1, 'amit@gmail.com'),
(2, 'Riya', 'Data analytics', 92, 'Ahmedabad', 'F', 21, '2026-01-15', 55000, 6, 'riya@gmail.com'),
(3, 'Karan', 'Commerce', 75, 'Surat', 'M', 19, '2026-02-01', 30000, 3, 'karan@gmail.com'),
(4, 'Neha', 'Arts', 88, 'Rajkot', 'F', 22, '2026-02-05', 25000, 2, 'neha@gmail.com'),
(5, 'Rahul', 'AI', 95, 'Vadodara', 'M', 20, '2026-02-10', 60000, 5, 'rahul@gmail.com'),
(6, 'Priya', 'Science', 78, 'Mumbai', 'F', 21, '2026-02-15', 40000, 4, 'priya@gmail.com'),
(7, 'Arjun', 'CS', 67, 'Pune', 'M', 20, '2026-03-01', 45000, 1, 'arjun@gmail.com'),
(8, 'Sneha', 'Data Engineering', 90, 'Delhi', 'F', 22, '2026-03-05', 55000, 6, 'sneha@gmail.com'),
(9, 'Vikas', 'Commerce', 72, 'Surat', 'M', 19, '2026-03-10', 32000, 3, 'vikas@gmail.com'),
(10, 'Meera', 'Arts', 81, 'Ahmedabad', 'F', 20, '2026-03-15', 27000, 2, 'meera@gmail.com'),
(11, 'Rohan', 'AI', 96, 'Vadodara', 'M', 21, '2026-04-01', 65000, 5, 'rohan@gmail.com'),
(12, 'Anjali', 'Science', 84, 'Rajkot', 'F', 22, '2026-04-05', 42000, 4, 'anjali@gmail.com'),
(13, 'Dev', 'CS', 76, 'Mumbai', 'M', 20, '2026-04-10', 48000, 1, 'dev@gmail.com'),
(14, 'Kavya', 'Data analytics', 91, 'Pune', 'F', 21, '2026-04-15', 58000, 6, 'kavya@gmail.com'),
(15, 'Yash', 'Commerce', 69, 'Delhi', 'M', 19, '2026-05-01', 31000, 3, 'yash@gmail.com'),
(16, 'Isha', 'Arts', 87, 'Surat', 'F', 20, '2026-05-05', 26000, 2, 'isha@gmail.com'),
(17, 'Manav', 'AI', 93, 'Vadodara', 'M', 21, '2026-05-10', 62000, 5, 'manav@gmail.com'),
(18, 'Tanya', 'Science', 79, 'Ahmedabad', 'F', 22, '2026-05-15', 41000, 4, 'tanya@gmail.com'),
(19, 'Aditya', 'CS', 89, 'Rajkot', 'M', 20, '2026-06-01', 50000, 1, 'aditya@gmail.com'),
(20, 'Nisha', 'Data analytics', 94, 'Mumbai', 'F', 21, '2026-06-05', 57000, 6, 'nisha@gmail.com')


-- 35. Insert a record into the Student table without providing a value for the city column, to check the DEFAULT constraint.

insert into Student (RollNo,StudentName,Course,Marks,Gender,Age,AdmissionDate,Fee,DepartmentID,Email) 
values (21, 'Jay', 'AI', 95, 'M', 24, '2026-02-02', 75000, 5, 'jay@gmail.com')

select * from Student


-- 36. Insert a record into the Student table without providing a value for the fee column, to check the DEFAULT constraint.

insert into Student (RollNo,StudentName,Course,Marks,Gender,Age,AdmissionDate,DepartmentID,Email) 
values (22, 'Raj', 'Arts', 50, 'M', 26, '2026-04-04',  2, 'raj@gmail.com')

select * from Student


-- 37. Update the marks of a student whose roll number is a specific value, increasing it by 5.

update Student set Marks = Marks + 5 where RollNo = 8

select * from Student


-- 38. Update the fee amount of all students belonging to a particular course.

update Student set Fee = 45000 where Course = 'Commerce'

select * from Student


-- 39. Update the city of a student from one city to another.

update Student set City = 'Ahmedabad' where Age = 24


-- 40. Update the department of a student to a different valid department.

update Student set DepartmentID = 3 where StudentName = 'Rahul'


-- 41. Delete the record of a student with a specific roll number.

delete from Student where RollNo = 22

select * from Student


-- 42. Delete all students whose marks are less than 35.

delete from Student where Marks < 35


-- 43. Delete all students belonging to a particular city.

delete from Student where City = 'Surat'

select * from Student


-- 44. Insert a record leaving the student name blank and check whether the NOT NULL constraint blocks it.

insert into Student (RollNo,Course,Marks,City,Gender,Age,AdmissionDate,Fee,DepartmentID,Email) 
values (21, 'AI', 95, 'Surat', 'M', 24, '2026-02-02', 75000, 5, 'jay@gmail.com')


-- 45. Insert a record with a duplicate roll number and check whether the UNIQUE constraint blocks it.

insert into Student (RollNo,StudentName,Course,Marks,City,Gender,Age,AdmissionDate,Fee,DepartmentID,Email) 
values (21,'V', 'AI', 95, 'Surat', 'M', 24, '2026-02-02', 75000, 5, 'jay@gmail.com')


-- 46. Insert a record with age less than the allowed minimum and check whether the CHECK constraint blocks it.

insert into Student (RollNo,StudentName,Course,Marks,City,Gender,Age,AdmissionDate,Fee,DepartmentID,Email) 
values (22,'V', 'AI', 95, 'Surat', 'M', 14, '2026-02-02', 75000, 5, 'v@gmail.com')


-- 47. Update the marks of a student to a value greater than 100 and check whether the CHECK constraint blocks it.

update Student set Marks = 101 where RollNo = 15



-- Section 4: Operators — Q48 to Q62


-- 48. Display all students whose marks are greater than 75.

select * from Student where Marks > 75


-- 49. Display all students whose fee is less than or equal to 20,000.

select * from Student where Fee <= 20000


-- 50. Display all students whose age is not equal to 18.

select * from Student where Age != 18


-- 51. Display all students belonging to the 'Computer Science' course AND having marks greater than 60.

select * from Student where Course = 'CS' and Marks > 60


-- 52. Display all students belonging to the 'Computer Science' course OR the 'Commerce' course.

select * from Student where Course = 'CS' or Course = 'Commerce'


-- 53. Display all students whose marks are BETWEEN 50 and 90.

select * from Student where Marks between 50 and 90


-- 54. Display all students whose fee is BETWEEN 10,000 and 30,000.

select * from Student where Fee between 10000 and 30000


-- 55. Display all students whose city is IN ('Delhi', 'Jaipur', 'Ahmedabad').

select * from Student where City in ('Delhi', 'Jaipur', 'Ahmedabad')


-- 56. Display all students whose course is NOT IN ('Arts', 'Commerce').

select * from Student where Course not in ('Arts', 'Commerce')


-- 57. Display all students whose name starts with the letter 'S' using the LIKE operator.

select * from Student where StudentName like 'S%'


-- 58. Display all students whose name ends with the letter 'n' using the LIKE operator.

select * from Student where StudentName like '%n'


-- 59. Display all students whose name contains the substring 'an' anywhere in it.

select * from Student where StudentName like '%an%'


-- 60. Display all students whose gender is 'F' and marks are greater than 80.

select * from Student where Gender = 'F' and Marks > 80


-- 61. Display all students whose department value IS NULL (if any).

select * from Student where DepartmentID = null


-- 62. Display all students whose department value IS NOT NULL.

select * from Student where DepartmentID is not null



-- Section 5: Aggregation Functions — Q63 to Q80


-- 63. Find the total number of students using COUNT.

select count(RollNo) as Total_Students from Student


-- 64. Find the total number of students who belong to the 'Computer Science' course.

select count(RollNo) as Total_students from Student where Course = 'CS' 


-- 65. Find the total fee collected from all students using SUM.

select sum(Fee) as Total_fees_collected from Student


-- 66. Find the total fee collected from students of a specific course.

select sum(Fee) as Total_fees_collected from Student where Course = 'Data analytics'


-- 67. Find the average marks of all students using AVG.

select avg(Marks) as Avg_marks from Student


-- 68. Find the average fee paid by students belonging to a specific city.

select avg(Fee) as Avg_fees from Student where City = 'Vadodara'


-- 69. Find the highest marks scored by any student using MAX.

select max(Marks) as Highest_marks from Student


-- 70. Find the lowest marks scored by any student using MIN.

select min(Marks) as Lowest_marks from Student


-- 71. Find the highest fee paid by any student.

select max(Fee) as Highest_paid_fees from Student


-- 72. Find the lowest fee paid by any student.

select min(Fee) as Lowest_paid_fees from Student


-- 73. Find the average age of all students.

select avg(Age) as Avg_age from Student


-- 74. Find the total number of distinct courses offered, using COUNT with DISTINCT.

select count(distinct Course) as Distinct_courses from Student


-- 75. Find the total number of distinct cities the students belong to.

select count(distinct City) as Distinct_cities from Student


-- 76. Find the maximum age among all students.

select max(Age) as Maximum_age from Student


-- 77. Find the minimum age among all students.

select min(Age) as Minimum_age from Student


-- 78. Find the sum of marks of all students combined.

select sum(Marks) as Sum_of_marks from Student


-- 79. Find the average marks of only the female students.

select avg(Marks) as Avg_marks from Student where Gender = 'F'


-- 80. Find the count of students who scored more than 90 marks.

select count(RollNo) as Student_count from Student where Marks > 90



-- Section 6: Clauses — GROUP BY, HAVING, ORDER BY — Q81 to Q100


-- 81. Display the total number of students in each course, using GROUP BY.

select Course, count(RollNo) as Student_count from Student group by Course


-- 82. Display the average marks of students, grouped by course.

select Course, avg(Marks) as Avg_mks_of_students from Student group by Course


-- 83. Display the total fee collected, grouped by department.

select DepartmentID, sum(Fee) as Total_fees_collected from Student group by DepartmentID


-- 84. Display the maximum marks scored, grouped by city.

select City, max(Marks) as Maximum_marks_scored from Student group by City


-- 85. Display the minimum age, grouped by gender.

select Gender, min(Age) as Minimum_age from Student group by Gender


-- 86. Display the count of students, grouped by city.

select City, count(RollNo) as Student_count from Student group by City


-- 87. Display the average fee, grouped by course and city together.

select Course, City, avg(Fee) as Avg_fees from Student group by Course, City


-- 88. Display the sum of marks, grouped by department.

select DepartmentID, sum(Marks) as Sum_of_marks from Student group by DepartmentID


-- 89. Display courses having more than 5 students enrolled, using HAVING.

select Course, count(RollNo) as Student_count from Student group by Course having COUNT(RollNo) > 5


-- 90. Display cities having an average fee greater than 15,000, using HAVING.

select City, avg(Fee) as Avg_Fees from Student group by City having avg(Fee) > 15000


-- 91. Display departments having a total student count greater than 3, using HAVING.

select DepartmentID, count(RollNo) as Total_student_count from Student group by DepartmentID having count(RollNo) > 3


-- 92. Display courses having an average marks greater than 70, using HAVING.

select Course, avg(Marks) as Avg_marks from Student group by Course having avg(Marks) > 70


-- 93. Display genders having a maximum marks value greater than 95, using HAVING.

select Gender, max(Marks) as Maximum_marks from Student group by Gender having max(Marks) > 95


-- 94. Display all student records sorted by marks in descending order, using ORDER BY.

select * from Student order by Marks desc


-- 95. Display all student records sorted by fee in ascending order.

select * from Student order by Fee


-- 96. Display all student records sorted by course (ascending) and then marks (descending).

select * from Student order by Course, Marks desc


-- 97. Display all student records sorted by admission date, showing the most recently admitted students first.

select * from Student order by AdmissionDate desc


-- 98. Display the top 10 students with the highest marks, using ORDER BY along with a row-limiting clause.

select top 10 * from Student order by Marks desc


-- 99. Display all distinct courses sorted alphabetically.

select distinct Course from Student order by Course


-- 100. Display department-wise student count sorted from highest to lowest count, combining GROUP BY and ORDER BY.

select DepartmentID, count(RollNo) as Student_count from Student group by DepartmentID order by count(RollNo) desc