-- 1. Create a database named CompanyDB.

create database CompanyDB


-- 2. Use the CompanyDB database and create the Employee table with all the columns mentioned above.

use CompanyDB

create table Employee (EmpID int, FirstName varchar(20), LastName varchar(20), Department varchar(25), Designation varchar(25),
Salary money, City varchar(20), Gender varchar(15), JoiningDate date, Age int)


-- 3. Add a new column Email to the Employee table.

alter table Employee add Email varchar(25)

select * from Employee


-- 4. Modify the Email column to increase its size.

alter table Employee alter column Email varchar(50)

sp_help Employee


-- 5. Rename the column City to Location.

sp_rename 'Employee.City','Location'

select * from Employee


-- 6. Rename the table Employee to EmployeeDetails and then rename it back to Employee.

sp_rename 'Employee','EmployeeDetails'

sp_rename 'EmployeeDetails','Employee'


-- 7. Drop the Email column from the Employee table.

alter table Employee drop column Email


-- 8. Write a query to check the structure (columns and data types) of the Employee table.

sp_help Employee


-- 9. Make EmpID column the Primary Key of the Employee table.


alter table Employee add constraint PK_Employee primary key(EmpID)


-- 10. Add a NOT NULL constraint on the FirstName column.

alter table Employee alter column FirstName varchar(20) not null


-- 11. Add a UNIQUE constraint on the column to ensure no two employees have the same email (create a new column Email and apply the constraint).

alter table Employee add Email varchar(25) unique

select * from Employee


-- 12. Add a DEFAULT constraint on the Department column so that if no value is provided, it should be set as 'General'.

alter table Employee add constraint Dept_Employee default 'General' for Department


-- 13. Add a CHECK constraint on the Salary column so that salary cannot be less than 10,000.

alter table Employee add constraint Sal_Employee check(Salary >= 10000)


-- 14. Add a CHECK constraint on the Age column so that age must be between 18 and 60.

alter table Employee add constraint Age_Employee check(Age between 18 and 60)


-- 15. Remove the CHECK constraint applied on the Salary column.

alter table Employee drop constraint Sal_Employee


-- 16. Add a FOREIGN KEY unrelated simple self-constraint task: add a Manager_EmpID column and apply a CHECK constraint so it cannot be equal to EmpID itself.

alter table Employee add Manager_EmpID int

alter table Employee add constraint Check_Manager_EmpID check (Manager_EmpID is null or Manager_EmpId <> EmpID)

select * from Employee


-- 17. Insert 15 records into the Employee table with different departments, cities, and salaries.

insert into Employee values
(2, 'Amit', 'Patel', 'IT', 'Executive', 55000, 'Ahmedabad', 'M', '2022-01-15', 25, 'amit.patel@gmail.com', 17),
(3, 'Priya', 'Shah', 'HR', 'Manager', 60000, 'Mumbai', 'F', '2021-03-20', 32, 'priya.shah@gmail.com', 18),
(4, 'Rahul', 'Verma', 'Finance', 'Analyst', 45000, 'Delhi', 'M', '2020-07-10', 29, 'rahul.verma@gmail.com', 19),
(5, 'Neha', 'Joshi', 'Sales', 'Executive', 40000, 'Pune', 'F', '2023-02-05', 24, 'neha.joshi@gmail.com', 20),
(6, 'Karan', 'Mehta', 'IT', 'Manager', 65000, 'Vadodara', 'M', '2019-05-12', 35, 'karan.mehta@gmail.com', 21),
(7, 'Sneha', 'Desai', 'HR', 'Analyst', 42000, 'Surat', 'F', '2022-11-18', 27, 'sneha.desai@gmail.com', 22),
(8, 'Vikram', 'Rao', 'Finance', 'Manager', 70000, 'Bangalore', 'M', '2018-09-25', 40, 'vikram.rao@gmail.com', 23),
(9, 'Anjali', 'Singh', 'Sales', 'Analyst', 52000, 'Jaipur', 'F', '2021-12-01', 30, 'anjali.singh@gmail.com', 24),
(10, 'Rohan', 'Kapoor', 'IT', 'Executive', 48000, 'Chandigarh', 'M', '2023-06-15', 26, 'rohan.kapoor@gmail.com', 25),
(11, 'Pooja', 'Nair', 'HR', 'Manager', 75000, 'Kochi', 'F', '2017-08-20', 38, 'pooja.nair@gmail.com', 26),
(12, 'Arjun', 'Yadav', 'Finance', 'Executive', 58000, 'Hyderabad', 'M', '2020-10-11', 33, 'arjun.yadav@gmail.com', 30),
(13, 'Meera', 'Iyer', 'Sales', 'Manager', 68000, 'Chennai', 'F', '2019-04-30', 36, 'meera.iyer@gmail.com', 90),
(14, 'Sahil', 'Gupta', 'IT', 'Analyst', 50000, 'Noida', 'M', '2022-05-17', 28, 'sahil.gupta@gmail.com', 50),
(15, 'Riya', 'Sharma', 'HR', 'Executive', 62000, 'Kolkata', 'F', '2021-01-22', 31, 'riya.sharma@gmail.com', 75),
(16, 'Dev', 'Malhotra', 'Finance', 'Analyst', 35000, 'Indore', 'M', '2023-09-08', 23, 'dev.malhotra@gmail.com', 55)

select * from Employee


-- 18. Insert a new employee record without specifying the Department (to check the DEFAULT constraint).

insert into Employee (EmpID, FirstName, LastName, Designation, Salary, Location, Gender, JoiningDate, Age, Email, Manager_EmpID) values
(17, 'Vanshika', 'Goyal', 'Analyst', 35000, 'Indore', 'M', '2023-09-08', 23, 'vanshika.goyal@gmail.com', 55);

select * from Employee


-- 19. Update the salary of all employees working in the IT department by increasing it by 10%.

update Employee set Salary = Salary*1.10 where Department = 'IT'

select * from Employee


-- 20. Update the Designation of an employee whose EmpID is 5 to 'Senior Executive'.

update Employee set Designation = 'Senior Executive' where EmpID = 5


-- 21. Delete the record of an employee whose EmpID is 10.

delete from Employee where EmpID = 10


-- 22. Delete all employees whose Salary is less than 15,000.

delete from Employee where Salary < 15000


-- 23. Update the City of all employees from 'Mumbai' to 'Pune'.

update Employee set Location = 'Pune' where Location = 'Mumbai'


-- 24. Insert a record and intentionally leave FirstName blank to check if the NOT NULL constraint blocks it.

insert into Employee (EmpID, LastName, Department, Salary, Location, Gender, JoiningDate, Age, Email, Manager_EmpID) values
(17, 'Goyal', 'Analyst', 35000, 'Indore', 'M', '2023-09-08', 23, 'vanshika.goyal@gmail.com', 60);


-- 25. Write a query to display all the records from the Employee table.

select * from Employee


-- 26. Write a query to display FirstName, LastName, and Salary of all employees.

select FirstName, LastName, Salary from Employee


-- 27. Write a query to display the details of employees working in the 'HR' department.

select * from Employee where Department = 'HR'


-- 28. Write a query to display all distinct Department names from the table.

select distinct Department from Employee


-- 29. Write a query to display the total number of employees in the table.

select count(EmpID) as TotalEmployees from Employee 


-- 30. Write a query to display FirstName and Salary and rename the Salary column as MonthlySalary using an alias.

select FirstName, Salary as MonthlySalary from Employee


-- 31. Write a query to display all employee details whose Gender is 'F'.

select * from Employee where Gender = 'F'


-- 32. Write a query to display the top 5 highest paid employees.

select top 5 * from Employee order by Salary desc


-- 33. Display all employees whose Salary is greater than 30,000 (comparison operator).

select * from Employee where Salary > 30000


-- 34. Display all employees whose Department is 'IT' AND Salary is greater than 25,000 (logical operator).

select * from Employee where Department = 'IT' and Salary > 25000


-- 35. Display all employees whose Department is 'HR' OR 'Finance'.

select * from Employee where Department = 'HR' or Department = 'Finance'


-- 36. Display all employees whose Salary is BETWEEN 20,000 and 40,000.

select * from Employee where Salary between 20000 and 40000


-- 37. Display all employees whose City IN ('Delhi', 'Mumbai', 'Pune').

select * from Employee where Location in('Delhi','Mumbai','Pune')


-- 38. Display all employees whose FirstName LIKE starts with 'A'.

select * from Employee where FirstName like 'A%'


-- 39. Display all employees whose FirstName LIKE ends with 'a'.

select * from Employee where FirstName like '%a'


-- 40. Display all employees whose Department is NOT 'Sales' (NOT operator).

select * from Employee where Department != 'Sales'


-- 41. Display the total number of employees in each department.

select Department, count(EmpID) as Employee_Count from Employee group by Department


-- 42. Display the average salary of employees department-wise.

select Department, avg(Salary) as Avg_Salary from Employee group by Department


-- 43. Display the maximum salary in each department.

select Department, max(Salary) as Maximum_Salary from Employee group by Department


-- 44. Display the minimum salary city-wise.

select Location, min(Salary) as Minimum_Salary from Employee group by Location


-- 45. Display the total salary paid, grouped by Designation.

select Designation, sum(Salary) as Total_Salary_Paid from Employee group by Designation


-- 46. Display departments having more than 3 employees.

select Department, count(EmpID) as Employee_Count from Employee group by Department having count(EmpID) > 3


-- 47. Display departments whose average salary is greater than 30,000.

select Department, avg(Salary) as Avg_Salary from Employee group by Department having avg(Salary) > 30000


-- 48. Display cities having a total employee count greater than 2.

select Location, count(EmpID) as Employee_Count from Employee group by Location having count(EmpID) > 2

select * from Employee


-- 49. Display all employee records sorted by Salary in descending order.

select * from Employee order by Salary desc


-- 50. Display all employee records sorted by Department (ascending) and then by Salary (descending).

select * from Employee order by Department, Salary