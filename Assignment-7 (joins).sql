create database Assignment7

use Assignment7

create table Employee1 (EID varchar(10), Ename varchar(25), Esalary decimal(6,1), DID varchar(10), MID varchar(10))


insert into Employee1 values 
('E101', 'VG', 99000, 'D1', 'M1'),
('E102', 'Simran', 98000, 'D2', 'M2'),
('E103', 'Vamika', 80000, 'D3', 'M3'),
('E104', 'Viha', 75000, 'D1', 'M4'),
('E105', 'Vrushti', 50000, 'D6', 'M3')


create table Manager (MID varchar(10), Mname varchar(25), DID varchar(10))


insert into Manager values 
('M1', 'Alice', 'D1'),
('M2', 'Navya', 'D2'),
('M5', 'Vartika', 'D3'),
('M4', 'Aaradhya', 'D4'),
('M3', 'Neha', 'D5')


create table Department (DID varchar(10), Dname varchar(25))


insert into Department values
('D1', 'IT'),
('D2', 'HR'),
('D6', 'Sales'),
('D4', 'Marketing')


create table Project (PID varchar(10), Pname varchar(25), EID varchar(10))


insert into Project values
('P1', 'Data migration', 'E102'),
('P2', 'Data analytics', 'E103'),
('P4', 'Data engineering', 'E106'),
('P5', 'Full stack', 'E104'),
('P7', 'AI', 'E105')


select * from Employee1
select * from Manager
select * from Department
select * from Project


-- 1. Display each employee's name and their corresponding department name.

select E.Ename, D.Dname from Employee1 E inner join Department D on E.DID = D.DID


-- 2. List all projects along with the name of the employee assigned to them.

select Project.Pname, Employee1.Ename from Employee1 inner join Project on Employee1.EID = Project.EID


-- 3. Show the names of employees and the names of their managers.

select Employee1.Ename, Manager.Mname from Employee1 inner join Manager on Employee1.MID = Manager.MID


-- 4. Display the Project ID and the Department ID for every project.

select Project.PID, Employee1.DID from Employee1 right join Project on Employee1.EID = Project.EID


-- 5. List employees who work in the 'IT' department.

select Employee1.Ename, Department.Dname from Employee1 inner join Department on Employee1.DID = Department.DID where Department.Dname = 'IT'


-- 6. Display employee names and their manager names for all employees in department 10.

select Employee1.Ename, Manager.Mname, Department.DID from Employee1 inner join Department on Employee1.DID = Department.DID inner join Manager on Employee1.MID = Manager.MID where Department.DID = 'D1'


-- 7. Show all projects handled by ‘Suresh’.

select Project.Pname from Project inner join Employee1 on Employee1.EID = Project.EID inner join Manager on Employee1.MID = Manager.MID where Manager.Mname = 'Navya'


-- 8. Find the department name associated with Project ID 101.

select Department.Dname from Department inner join Employee1 on Employee1.DID = Department.DID inner join Project on Employee1.EID = Project.EID where Project.PID = 'P7'


-- 9. List all employees whose manager's name is 'Suresh'.

select Employee1.Ename, Manager.Mname from Employee1 inner join Manager on Employee1.MID = Manager.MID where Manager.Mname = 'Aaradhya'


-- 10. Display the count of employees in each department name.

select Department.Dname, count(Employee1.EID) as Employee_count from Employee1 full join Department on Employee1.DID = Department.DID group by Department.Dname


-- 11. List all departments and the employees working in them (including departments with no employees).

select Department.Dname, Employee1.Ename from Employee1 right join Department on Employee1.DID = Department.DID


-- 12. Display all employees and the projects they are assigned to (including those with no projects).

select Employee1.Ename, Project.Pname from Employee1 left join Project on Employee1.EID = Project.EID


-- 13. Show the names of employees, their department names, and their manager names in one result.

select Employee1.Ename, Department.Dname, Manager.Mname from Employee1 inner join Department on Employee1.DID = Department.DID inner join Manager on Employee1.MID = Manager.MID


-- 14. Find all projects and the department name they belong to.

select Project.Pname, Department.Dname from Employee1 inner join Department on Employee1.DID = Department.DID right join Project on Employee1.EID = Project.EID


-- 15. List all managers and the names of employees reporting to them (including managers with no reporters).

select Manager.Mname, Employee1.Ename from Employee1 right join Manager on Employee1.DID = Manager.DID


-- 16. Find employees who are NOT assigned to any project.

select Employee1.Ename from Employee1 left join Project on Employee1.EID = Project.EID where Project.PID is null


-- 17. Display the names of all employees and the names of projects, but only for those in the ‘IT’ department.

select Employee1.Ename, Project.Pname from Employee1 inner join Project on Employee1.EID = Project.EID inner join Department on Employee1.DID = Department.DID where Department.Dname = 'IT'


-- 18. Show the names of managers who are managing employees in the 'Finance' department.

select Manager.Mname from Department inner join Manager on Department.DID = Manager.DID where Department.Dname = 'HR'


-- 19. Display Department Name, Employee Name, and Project Name for all matches.

select Department.Dname, Employee1.Ename, Project.Pname from Employee1 inner join Department on Employee1.DID = Department.DID inner join Project on Employee1.EID = Project.EID


-- 20. List all projects and the manager's name responsible for the employee assigned to that project.

select Project.Pname, Manager.Mname from Project inner join Employee1 on Project.EID = Employee1.EID inner join Manager on Employee1.MID = Manager.MID