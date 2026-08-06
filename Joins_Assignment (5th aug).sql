use july2026


create table Department2 (DID int primary key, DeptName varchar(30) not null, Location varchar(30) not null)

create table Employee2 (EID int primary key, Ename varchar(30) not null, DOJ date, DID int foreign key(DID) references Department2 (DID),MID int foreign key (MID) references Employee2 (EID))

create table Salary (EID int primary key, foreign key (EID) references Employee2 (EID), Basic_salary decimal (7,2) check(basic_salary > 0) not null, Bonus decimal(7,2) default 0)

drop table Salary

insert into Department2 values 
(101, 'AI', 'Vadodara'),
(102, 'Data analytics', 'Mumbai'),
(103, 'Data engineering', 'Ahmedabad'),
(104, 'Cloud', 'Vadodara'),
(105, 'HR', 'Surat'),
(106, 'Finance', 'Pune'),
(107, 'Sales', 'Ahmedabad')


insert into Employee2 values 
(1, 'Vibhuti', '2026-08-10',102,1),
(2, 'Simran', '2026-09-15',103,null),
(3, 'Dhrumi', '2026-05-20',102,2),
(4, 'Vanshika', '2025-01-31',104,3),
(5, 'Vidhi', '2025-12-2',105,4),
(6, 'Viha', '2026-04-18',null,5),
(7, 'Rajvi', '2026-07-30',null,4),
(8, 'Vrushti', '2026-03-03',101,null),
(9, 'Vartika', '2026-06-25',107,7),
(10, 'Vini', '2026-11-11',105,8)


insert into Salary values 
(1, 95000, 5000),
(2, 90000, 1000),
(3, 75000, 9000),
(4, 20000, 3000),
(5, 45000, 1200),
(6, 80000, 7000),
(7, 30000, 8000),
(8, 15000, 10000),
(9, 6500, 20000),
(10, 25000, 6000)

select * from Department2
select * from Employee2
select * from salary


--1. Write a query to calculate the total compensation paid (BasicSalary + Bonus) across all payouts for each department. Display the DeptName, Location, and the total expenditure aliased as TotalExpenditure.

select DeptName, Location, sum(basic_salary + bonus) as TotalExpenditure from Department2 inner join Employee2 on Department2.DID = Employee2.DID inner join salary on Employee2.EID = salary.EID group by DeptName, Location


--2. Write a query to display all employee names (EName), their date of joining (DOJ), and their DeptName. Ensure that employees who are not assigned to any department are included in the result, displaying 'Unassigned' for their department name.

select Ename , DOJ, isnull(deptName, 'Unassigned') from Employee2 left join Department2 on Employee2.DID = Department2.DID


--3. Write a query to display every employee's name (EmployeeName), their assigned department's name (DeptName), and their manager's name (ManagerName). Exclude employees who do not have a manager.

select E.Ename as EmployeeName, D.DeptName, M.Ename as ManagerName from Employee2 E inner join Department2 D on E.DID = D.DID inner join Employee2 M on E.MID = M.EID


--4. Find all departments where the average total compensation (BasicSalary + Bonus) exceeds ₹60,000. Display DeptName, Location

select D.DeptName, D.location from Department2 D inner join Employee2 E on D.DID = E.DID inner join Salary S on E.EID = S.EID group by DeptName, Location having avg(basic_salary + bonus) > 60000


--5. Write a query to display the DeptID, DeptName, and Location of all departments that currently have no employees assigned to them.

select D.DID, D.DeptName, D.Location from Department2 D left join Employee2 E on D.DID = E.DID where E.EID is null


--6. Retrieve the EName, DeptName, BasicSalary, and Bonus of all employees whose department is located in either 'Vadodara' or 'Mumbai' and whose BasicSalary is greater than ₹40,000. Sort the results by BasicSalary in descending order.

select Ename, DeptName, basic_salary, bonus from Department2 inner join Employee2 on Department2.DID = Employee2.DID inner join salary on Employee2.EID = salary.EID where Location in('Vadodara','Mumbai') and basic_salary > 40000 order by basic_salary desc


--7. Find all pairs of employees who belong to the exact same department. Display DeptName, Employee_1, and Employee_2. Ensure an employee is not paired with themselves and eliminate duplicate reverse pairs

select DeptName, E1.Ename as Employee_1, E2.Ename as Employee_2 from Employee2 E1 inner join Employee2 E2 on E1.DID = E2.DID inner join Department2 on E1.DID = Department2.DID where E1.EID < E2.EID 


--8. Write a query using a full reconciliation approach to list all EName, DeptName, and BasicSalary. The output must include employees without departments, departments without employees, and employees without salary records.

select Ename, DeptName, basic_salary from Employee2 full join Department2 on Employee2.DID = Department2.DID full join salary on Employee2.EID = salary.EID


--9. Write a query to find all employees who earn a higher BasicSalary than the average BasicSalary of their own department. Display EName, DeptName, and BasicSalary.

select Ename, DeptName, basic_salary from Employee2 E inner join Department2 D on E.DID = D.DID inner join salary S on E.EID = S.EID where basic_salary > (select avg(basic_salary) from Employee2 E2 inner join salary S2 on E2.EID = S2.EID where E2.DID = E.DID)