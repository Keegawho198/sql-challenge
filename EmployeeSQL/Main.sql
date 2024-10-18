
-- testing tables

select *
from departments;

select *
from dept_emp;

select *
from dept_manager;

select *
from employees;

select *
from salaries;

select *
from titles;



-- List the employee number, last name, first name, sex, and salary of each employee (2 points)

Select e.emp_no, e.last_name, e.first_name, e.sex, s.salary
from employees AS e
INNER JOIN salaries AS s ON e.emp_no = s.emp_no;


--List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)

SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--extract() -> specifies the part of the date or timestamp you want to extract


--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name (2 points)

SELECT dm.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM dept_manager AS dm
INNER JOIN departments AS d ON d.dept_no = dm.dept_no
INNER JOIN employees AS e ON e.emp_no = dm.emp_no;


--List the department number for each employee along with that employee’s employee number, 
--last name, first name, and department name (2 points)

SELECT de.dept_no, de.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp AS de
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON e.emp_no = de.emp_no;
--similar to last Q


--List first name, last name, and sex of each employee whose first name is Hercules and 
--whose last name begins with the letter B (2 points)
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';


--List each employee in the Sales department, including their employee number, 
--last name, and first name (2 points)
SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, including their employee number, 
--last name, first name, and department name (4 points)

SELECT d.dept_name, de.emp_no, e.last_name, e.first_name
FROM dept_emp AS de
INNER JOIN departments AS d ON d.dept_no = de.dept_no
INNER JOIN employees AS e ON e.emp_no = de.emp_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


--List the frequency counts, in descending order, of all the employee last names 
--(that is, how many employees share each last name) (4 points)
SELECT last_name, COUNT(*) AS frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;


--COUNT(*) counts the number of occurrences for each last name.
--GROUP BY last_name groups the results by last name.
--ORDER BY frequency DESC sorts the results in descending order based on the frequency count.