create database Assignment1

use Assignment1

-- 1. Execute a literal select statement that returns your name.

Select 'Vibhuti' + ' ' + 'Goyal'


-- 2. Write the literal select statement that evaluates the product of 7 and 4.

Select 7*4


-- 3. Write the literal select statement that takes the difference of 7 and 4 then multiplies that difference by 8.

Select (7-4)*8


-- 4. Write a literal select statement that returns the phrase “Brewster’s SQL Training Class”.

Select '"Brewster’s SQL Training Class"'


-- 5. Execute a literal SELECT statement that returns the phrase “Day 1 of Training” in one column and the result of 5*3 in another column.

Select 'Day 1 of Training' as Column1,5*3 as Column2



-- Insert/Update/Delete


-- 1. Insert a new employee record with all details provided directly.

create table Employee(Emp_id int, Emp_name varchar(25), Emp_age int, Emp_salary money, Emp_email varchar(55), Emp_dept varchar(25))

select * from Employee

Insert into Employee values(1,'Vibhuti',21,90000,'vg@gmail.com','AI')


-- 2. Add multiple new team members to the HR department at once.

Insert into Employee values(2,'Simran',21,90000,'sk@gmail.com','HR'),
(3,'Einstein',51,80000,'en@gmail.com','HR'),
(4,'Vivekanand',61,70000,'vk@gmail.com','HR'),
(5,'Newton',71,65000,'nt@gmail.com','HR')


-- 3. Register an employee who hasn't been assigned a salary yet.

Insert into Employee(Emp_id, Emp_name, Emp_age, Emp_email, Emp_dept) values (6, 'Homi', 45, 'hom@gmail.com', 'Cloud')

select * from Employee


-- 4. Update the salary to 85,000 for everyone working in the 'Cloud' department.

update Employee set Emp_salary = 85000 where Emp_dept = 'Cloud'

select * from Employee


-- 5. Change both the department and salary for a specific employee by name.

update Employee set Emp_dept = 'Finance',Emp_salary = 50000 where Emp_name = 'Newton'

select * from Employee


-- 6. Give a flat 10% appraisal boost to employee working in AI department.

update Employee set Emp_salary = Emp_salary * 1.10 where Emp_dept = 'AI'


-- 7. Assign an initial entry-level salary of 30,000 to anyone whose salary column is completely blank (NULL).

update Employee set Emp_salary = 30000 where Emp_salary is null


-- 8. Remove a specific employee from the system using their unique ID.

delete from Employee where Emp_id = 3

select * from Employee


-- 9. Remove all records belonging to a department that has been completely shut down.

delete from Employee where Emp_dept = 'Cloud'

select * from Employee


-- 10. Drop records of any employee earning less than 20,000 in the Finance division.

delete from Employee where Emp_salary < 20000 and Emp_dept = 'Finance'

select * from Employee