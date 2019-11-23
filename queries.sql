
--Get dept of emp w emp num, last name, first name, department name.

SELECT department_employees.employee_number, employees.last_name, employees.first_name, departments.department_name
FROM department_employees
JOIN employees
ON department_employees.employee_number = employees.employee_number
JOIN departments
ON department_employees.department_number = departments.department_number;

--Get all emp whose first name is Hercules and last name starts w/ "B"

SELECT first_name, last_name
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Get all emp in the 'Sales' dept, with their emp num, last name, first name, and department name

SELECT department_employees.employee_number, employees.last_name, employees.first_name, departments.department_name
FROM department_employees
JOIN employees
ON department_employees.employee_number = employees.employee_number
JOIN departments
ON department_employees.department_number = departments.department_number
WHERE departments.department_name = 'Sales';

--Get all above, but also all emp in 'Development' dept.

SELECT department_employees.employee_number, employees.last_name, employees.first_name, departments.department_name
FROM department_employees
JOIN employees
ON department_employees.employee_number = employees.employee_number
JOIN departments
ON department_employees.department_number = departments.department_number
WHERE departments.department_name = 'Development'
OR departments.department_name = 'Sales';

--Count frequency of employee last name in descending order
SELECT last_name,
COUNT(last_name) AS "Number of Employees"
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC;