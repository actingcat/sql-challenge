-- 1) List the employee number, last name, first name, sex, and salary of each employee (2 points)
CREATE TABLE question_one AS 
SELECT a.emp_no, a.last_name, a.first_name, a.sex, b.salary
FROM employees a
JOIN salaries b on a.emp_no= b.emp_no;

-- 2) List the first name, last name, and hire date for the employees who were hired in 1986 (2 points)
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date::Date >= '1986-01-01'
	AND hire_date::Date < '1987-01-01';
-- 3) List the manager of each department along with their department number, department name, employee number, last name, and first name (2 points)
CREATE TABLE question_three AS
SELECT a.dept_no, a.dept_name, b.emp_no, c.last_name, c.first_name
FROM departments a
JOIN department_manager b ON a.dept_no = b.dept_no
JOIN employees c ON b.emp_no = CAST(c.emp_no AS VARCHAR);




-- 4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name (2 points)
CREATE TABLE question_four AS
SELECT a.dept_no, b.emp_no, b.last_name, b.first_name, a.dept_name
FROM departments a
JOIN department_employees ab ON a.dept_no = ab.dept_no
JOIN employees b ON ab.emp_no = b.emp_no;

-- 5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B (2 points)
CREATE TABLE question_5 AS
SELECT first_name, last_name, sex
FROM employees
WHERE last_name LIKE 'B%'
And first_name= 'Hercules';

-- 6) List each employee in the Sales department, including their employee number, last name, and first name (2 points)
CREATE TABLE question_six AS
SELECT a.emp_no, a.last_name, a.first_name
FROM employees a
JOIN department_employees b ON a.emp_no = b.emp_no
JOIN departments ab ON ab.dept_no = b.dept_no
WHERE LOWER(ab.dept_name) = 'sales';

--7)  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name (4 points)
CREATE TABLE question_seven AS
SELECT a.emp_no, a.last_name, a.first_name, ab.dept_name
FROM employees a
JOIN department_employees b ON a.emp_no = b.emp_no
JOIN departments ab ON ab.dept_no = b.dept_no
WHERE LOWER(ab.dept_name) = 'sales' OR LOWER(ab.dept_name)= 'development';


--8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name) (4 points)
CREATE TABLE question_eight AS
SELECT last_name, COUNT(*) as frequency
FROM employees
GROUP BY last_name
ORDER BY frequency DESC;
