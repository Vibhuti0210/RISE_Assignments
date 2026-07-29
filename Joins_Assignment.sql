use july2026

create table Employee (emp_id int, emp_name varchar(25), department_id int, designation varchar(30), salary money, join_date date, manager_id int)

insert into Employee values
(101, 'Vibhuti', 1, 'CEO', 99000, '2026-07-30', 1001),
(102, 'Simran', 2, 'VP', 95000, '2026-07-31', 1002),
(103, 'Vanshika', 3, 'AGM', 90000, '2026-08-02', 1003),
(104, 'Vamika', 4, 'GM', 99000, '2026-08-03', 1001),
(105, 'Viha', 6, 'DGM', 92000, '2026-08-10', 1004)


create table Departments (department_id int, department_name varchar(30), location varchar(30), budget money)

insert into Departments values
(1, 'AI', 'Vadodara', 1000),
(2, 'Data analytics', 'Vadodara', 5000),
(3, 'Data engineering', 'Ahmedabad', 7000),
(4, 'HR', 'Mumbai', 8000),
(5, 'Cloud', 'Bangalore', 10000),
(6, 'Marketing', 'Surat', 15000),
(7, 'Sales', 'Pune', 20000)


select * from Employee
select * from Departments


-- 1. Display the employee name along with the name of the department they belong to.

select emp_name, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 2. List all employees along with their department, including employees who are not currently assigned to any department.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id 


-- 3. Show all department names along with the names of employees working in them, including departments that currently have no employees.

select department_name, emp_name from Employee right join Departments on Employee.department_id = Departments.department_id 


-- 4. Display emp_name, designation, and department_name for employees who are assigned to a valid department.

select emp_name, designation, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 5. Show the department_name, location, and emp_name for every department, even if no employee currently works there.

select department_name, location, emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 6. Display emp_name and department_name for every employee, even those without a department (show department as blank/null in that case).

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 7. List emp_name, salary, and department_name only for employees whose department actually exists in the Departments table.

select emp_name, salary, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 8. Show department_name and budget along with emp_name and salary, ensuring all departments are shown even the ones without staff.

select department_name, budget, emp_name, salary from Employee right join Departments on Employee.department_id = Departments.department_id


-- 9. Display the full list of employees with their department_name, making sure no employee is left out of the result even without a department.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 10. List emp_name, designation, and location of the department for employees who have a department assigned.

select emp_name, designation, location from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 11. Show all departments and the count-relevant employee names in them, keeping every department visible even if empty.

select department_name, count(emp_id) as Employee_count from Employee right join Departments on Employee.department_id = Departments.department_id group by department_name


-- 12. Display emp_name, join_date, and department_name for employees who joined a department.

select emp_name, join_date, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 13. List every department along with emp_name and salary, ensuring departments with zero employees still appear with blank employee details.

select department_name, emp_name, salary from Employee right join Departments on Employee.department_id = Departments.department_id


-- 14. Show emp_name and department_name for employees, and make sure every employee appears in the output regardless of department status.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 15. Display emp_name, department_name, and budget for employees working in departments with a budget greater than 2,000,000.

select emp_name, department_name, budget from Employee E inner join Departments D on E.department_id = D.department_id where D.budget > 2000000


-- 16. List department_name and location for every department, along with emp_name of employees there, keeping all departments visible.

select department_name, location, emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 17. Show emp_name, designation, and department_name for employees, excluding those without an assigned department.

select emp_name, designation, department_name from Employee e inner join Departments d on e.department_id = d.department_id


-- 18. Display all employees and their respective department location, including employees without a department.

select Employee.emp_name, Departments.location from Employee left join Departments on Employee.department_id = Departments.department_id 


-- 19. List department_name for all departments and emp_name of employees, ensuring unmatched departments (no staff) are still shown.

select Dept.department_name, Emp.emp_name from Employee Emp right join Departments Dept on Emp.department_id = Dept.department_id


-- 20. Show emp_name and salary for employees along with their department_name, only where a genuine department match exists.

select emp_name, salary, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 21. Display emp_name, manager_id, and department_name for employees who belong to some department.

select Employee.emp_name, Employee.manager_id, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 22. List all departments with their budget and emp_name of any employees, keeping departments with no staff visible in the result.

select department_name, budget, emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 23. Show emp_name for every employee together with department_name, ensuring the full employee list is retained even without a department match.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 24. Display department_name, location, and emp_name only where the employee record is properly linked to a department.

select Departments.department_name, Departments.location, Employee.emp_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 25. List every department along with emp_name and designation, so that departments without employees still show up with empty employee fields.

select department_name, emp_name, designation from Employee right join Departments on Employee.department_id = Departments.department_id


-- 26. Show emp_name, department_name, and join_date only for employees who have valid department information.

select emp_name, department_name, join_date from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 27. Display all employees with department_name, and ensure employees having a NULL department are still part of the result.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 28. List department_name and budget for all departments and the emp_name working there, making sure departments without employees are not excluded.

select Departments.department_name, Departments.budget, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 29. Show emp_name and salary for employees who are linked to a department that has a budget above 3,000,000.

select emp_name, salary from Employee inner join Departments on Employee.department_id = Departments.department_id where Departments.budget > 3000000


-- 30. Display the full employee list along with department_name, location, so no employee is missing from the output.

select emp_name, department_name, location from Employee left join Departments on Employee.department_id = Departments.department_id


-- 31. List all departments and emp_name of staff, ensuring departments like ones with no current employees still show in the result.

select Departments.department_name, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 32. Show emp_name, designation, and department_name where the department information genuinely matches between both tables.

select emp_name, designation, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 33. Display department_name, budget, and emp_name for departments, keeping every department in the output even without matching employees.

select Departments.department_name, Departments.budget, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 34. List emp_name and department_name for employees, retaining every single employee row even if their department is missing.

select emp_name, department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 35. Show emp_name, salary, and department_name only for employees whose department_id correctly matches a department record.

select emp_name, salary, department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 36. Display all department details along with any assigned employees, so unmatched departments (no employees) still appear.

select * from Departments inner join Employee on Departments.department_id = Employee.department_id


-- 37. List emp_name and department_name for employees who have a proper, existing department assigned to them.

select Employee.emp_name, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 38. Show every employee's emp_name and department_name, ensuring the complete employee list shows up regardless of department availability.

select Employee.emp_name, Departments.department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 39. Display department_name, location, and emp_name, keeping all departments in the result even those without any employee.

select Departments.department_name, Departments.location, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 40. List emp_name, designation, and department_name for employees, only including cases with a genuine department match.

select Employee.emp_name, Employee.designation, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 41. Show all employees with emp_name and department_name, including those employees whose department_id is missing.

select Employee.emp_name, Departments.department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 42. Display department_name and emp_name for all departments, retaining every department row even if there's no employee to match.

select Departments.department_name, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 43. List emp_name, salary, and department_name for employees, only when both employee and department data align.

select Employee.emp_name, Employee.salary, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 44. Show the complete list of employees along with department_name, so that unmatched employees (no department) are not dropped.

select Employee.emp_name, Departments.department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 45. Display all departments along with emp_name, location, and budget, ensuring departments with no employees are still listed.

select Departments.department_name, Employee.emp_name, Departments.location, Departments.budget from Employee right join Departments on Employee.department_id = Departments.department_id


-- 46. List emp_name and department_name only for employees who are properly linked to an existing department record.

select Employee.emp_name, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 47. Show emp_name, designation, and department_name for every employee, keeping the full employee list intact even without department data.

select Employee.emp_name, Employee.designation, Departments.department_name from Employee left join Departments on Employee.department_id = Departments.department_id


-- 48. Display department_name, budget, and emp_name for every department, making sure departments without any employee still appear in the output.

select Departments.department_name, Departments.budget, Employee.emp_name from Employee right join Departments on Employee.department_id = Departments.department_id


-- 49. List emp_name and department_name for employees where the department match is valid on both sides.

select Employee.emp_name, Departments.department_name from Employee inner join Departments on Employee.department_id = Departments.department_id


-- 50. Show all employees and all departments together with emp_name and department_name, keeping every department visible even without staff, and every employee visible even without a department (attempt this with two separate queries: one keeping all employees, another keeping all departments).

select Employee.emp_name, Departments.department_name from Employee right join Departments on Employee.department_id = Departments.department_id

select Employee.emp_name, Departments.department_name from Employee left join Departments on Employee.department_id = Departments.department_id