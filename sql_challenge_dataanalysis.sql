-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT
	i.emp_no,
	i.last_name,
	i.first_name,
	i.sex,
	f.salary
from
	employees i
	inner join salaries f
		on i.emp_no = f.emp_no

-- List the first name, last name, and hire date for the employees who were hired in 1986.
select
	first_name,
	last_name,
	hire_date
from employees
where hire_date >= '1986-01-01'
	and hire_date <= '1986-12-31'
	
-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
  
SELECT
	i.dept_no,
	f.dept_name,
	i.emp_no,
	j.first_name,
	j.last_name
from dept_manager i
left join departments f
on i.dept_no = f.dept_no
left join employees j
on i.emp_no = j.emp_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select
	i.dept_no,
	j.emp_no,
	j.last_name,
	j.first_name,
	f.dept_name
from dept_emp i
join employees j
on i.emp_no = j.emp_no
join departments f
on i.dept_no = f.dept_no

-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select first_name, last_name, sex
from employees
where first_name = 'Hercules'
	and last_name like 'B%';

-- List each employee in the Sales department, including their employee number, last name, and first name.
select 
	j.emp_no,
	j.last_name,
	j.first_name,
	i.dept_no,
	f.dept_name
from employees j
join dept_emp i
on j.emp_no = i.emp_no
join departments f
on i.dept_no = f.dept_no
where dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
	j.emp_no,
	j.last_name,
	j.first_name,
	i.dept_no,
	f.dept_name
from employees j
join dept_emp i
on j.emp_no = i.emp_no
join departments f
on i.dept_no = f.dept_no
where dept_name = 'Sales' or dept_name = 'Development'


-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name)
FROM employees
GROUP BY last_name
HAVING COUNT(last_name) > 1
order by COUNT DESC
