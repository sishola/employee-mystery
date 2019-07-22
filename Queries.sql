--List the following details of each employee: employee number, last name, first name, gender, and salary.
SELECT  E.Emp_no "Employee Number", E.Last_name "Last Name", E.First_name "First Name"
	, E.Gender, S.Salary
FROM Employees E
JOIN Salaries S ON E.Emp_No = S.Emp_No;

--List employees who were hired in 1986.
SELECT * 
FROM Employees
WHERE EXTRACT( YEAR FROM hire_date) = 1986 ;

--List the manager of each department with the following information: department number
--, department name, the manager's employee number, last name, first name, and start 
--and end employment dates.
SELECT D.dept_no "Department Number", D.dept_name "Department Name"
	, E.emp_no "Employee Number", E.last_name "Last Name", E.first_name "First Name"
	, DE.from_date "Start Employment Date", DE.to_date "End Employment Date"
FROM dept_manager DM
	JOIN department D ON DM.dept_no = D.dept_no
	JOIN employees E ON DM.emp_no = E.emp_no
	JOIN dept_emp DE ON D.dept_no = DE.dept_no AND E.emp_no = DE.emp_no;


--List the department of each employee with the following information: employee number
--, last name, first name, and department name.
SELECT E.emp_no "Employee Number", E.last_name "Last Name", E.first_name "First Name"
	, D.dept_name "Deprtment Name"
FROM employees E
	JOIN dept_emp DE ON E.emp_no = DE.emp_no
	JOIN department D ON DE.dept_no = D.dept_no;

--List all employees whose first name is "Hercules" and last names begin with "B."
SELECT E.*
FROM employees E
WHERE E.first_name= 'Hercules'
	AND E.last_name like 'B%';

--List all employees in the Sales department, including their employee number
--, last name, first name, and department name.
SELECT E.emp_no "Employee Number", E.last_name "Last Name", E.first_name "First Name"
	, D.dept_name "Deprtment Name"
FROM employees E
	JOIN dept_emp DE ON E.emp_no = DE.emp_no
	JOIN department D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales';

--List all employees in the Sales and Development departments, including their employee number
--, last name, first name, and department name.
SELECT E.emp_no "Employee Number", E.last_name "Last Name", E.first_name "First Name"
	, D.dept_name "Deprtment Name"
FROM employees E
	JOIN dept_emp DE ON E.emp_no = DE.emp_no
	JOIN department D ON DE.dept_no = D.dept_no
WHERE D.dept_name = 'Sales' OR D.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e.
--, how many employees share each last name.
SELECT E.last_name "Last Name", COUNT(E.last_name) "Last Name Frequency"
FROM employees E
GROUP BY E.last_name
ORDER BY "Last Name Frequency" DESC;