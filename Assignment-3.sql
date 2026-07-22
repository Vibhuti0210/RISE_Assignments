create database Assignment3

use Assignment3

create table Employee (EID int, Ename varchar(20), Department varchar(20), Salary money) 

insert into Employee values (1,'Vibhuti','IT', 80000), 
(2,'Dhrumi','Finance', 90000), 
(3,'Simran','HR', 85000), 
(4,'Astha','IT', 85000),
(5,'Vanshika','HR', 10000),
(6,'Viha','HR', 20000),
(7,'Vrushti','Finance', 65000),
(8,'Vidhi','AI', 45000)


select * from Employee


 -- 1. Write a query to display each Department and the total number of employees working in that department from the Employee table.

 select Department, count(EID) as TotalEmployees from Employee group by Department


 -- 2. Write a query to find the Department, the highest salary (MAX), and the average salary (AVG) for each department.

 select Department, max(Salary) as MaximumSalary, avg(Salary) as AvgSalary from Employee group by Department


 -- 3. Write a query to count how many employees are in each Department.

 select Department, count(EID) as EmployeeCount from Employee group by Department


 -- 4. Write a query to find the minimum salary in each Department.

 select Department, min(Salary) as Minimum_Salary from Employee group by Department


 -- 5. Write a query to show departments that have more than 2 employees

 select Department, count(EID) as EmployeeCount from Employee group by Department having count(EID) > 2


 -- 6. Write a query to show departments where the total salary payout is greater than 100,000

 select Department, sum(Salary) as Total_Salary from Employee group by Department having sum(Salary) > 100000


 -- 7. Write a query to find departments where the average salary is above 60,000

 select Department, avg(Salary) as Avg_Salary from Employee group by Department having avg(Salary) > 60000


 -- 8. Write a query to show departments that have exactly 1 employee

 select Department, count(EID) as EmployeeCount from Employee group by Department having count(EID) = 1


 -- 9. Write a query to list all employees sorted by Salary from highest to lowest

 select Ename, Salary from Employee order by 2 desc


 -- 10. Write a query to list all employees sorted by Ename in alphabetical order

 select Ename from Employee order by Ename


 -- 11. Write a query to list all employees sorted by Department alphabetically, and then by Ename alphabetically.

 select Department, Ename from Employee order by Department, Ename 