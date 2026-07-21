create database Assignment2

use Assignment2

create table Employee (EmployeeID int, EmpName varchar(25),Department varchar(30), Salary money, Bonus money, Experience varchar(10), City varchar(30))

insert into Employee (EmployeeID,EmpName,Department,Salary,Experience,City) values (1,'Vibhuti','IT',99000,10,'Vadodara'),
(2,'Shizuka','IT',98000,3,'Mumbai'),
(3,'Vanshika','IT',95000,5,'Delhi'),
(4,'Simran','HR',90000,7,'Bangalore'),
(5,'Dora','Finance',50000,1,'Ahmedabad')

update Employee set Bonus = 20000 where Department = 'IT'
update Employee set Bonus = 15000 where EmpName = 'Simran'
update Employee set Bonus = 25000 where City = 'Ahmedabad'


select * from Employee


-- 1. Write a query to display all employees whose salary is greater than 50,000.

select * from Employee where Salary > 50000


-- 2. Retrieve employees who work in the IT department and have more than 5 years of experience.

select * from Employee where Department = 'IT' and Experience > 5


-- 3. Write a query to display employees whose salary is between 45,000 and 60,000.

select * from Employee where Salary between 45000 and 60000


-- 4. Display employees whose city is either Mumbai or Delhi.

select * from Employee where City = 'Mumbai' or City = 'Delhi'


-- 5. Write a query to display employee name along with their annual income

select EmpName as EmployeeName, Salary*12 as AnnualIncome from Employee


-- 6. Find employees whose name starts with the letter 'A'.

select * from Employee where EmpName like 'A%'


-- 7. Find the highest salary among all employees.

select max(Salary) from Employee


-- 8. Find the total bonus paid to employees in the IT department.

select sum(Bonus) from Employee where Department = 'IT'


-- 9. Display the minimum and maximum experience of employees.

select min(Experience) as MinimumExperience, max(Experience) as MaximumExperience from Employee


-- 10. Count the number of employees in each department.

select Department, count(EmployeeID) as TotalEmployees from Employee group by Department


-- 11. Find the total bonus paid to employees in the IT department.

select sum(Bonus) from Employee where Department = 'IT'


-- 12. Write an SQL statement to add a new column named Email of type VARCHAR(100) to the Employees table.

alter table Employee add Email varchar(100)

select * from Employee


-- 13. Write an SQL statement to modify the Salary column so that it becomes DECIMAL(10,2).

alter table Employee alter column Salary decimal(10,2)

sp_help Employee


-- 14. Write an SQL statement to drop the Bonus column from the Employees table.

alter table Employee drop column Bonus

select * from Employee