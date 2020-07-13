--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
select
	e.emp_no AS "Employee Number",
	e.last_name AS "Last name",
	e.first_name AS "First name",
	e.sex AS "Sex",
	s.salary AS "Salary"
from employees e
inner join salaries s
	on e.emp_no=s.emp_no;
	
--2. List first name, last name, and hire date for employees who were hired in 1986.

select 
	first_name AS "First name",
	last_name AS "Last name",
	hire_date AS "Hire Date"
from employees
where date_part('year',hire_date)=1986;

--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.

select 
	d.dept_no AS "Department Number",
	d.dept_name AS "Department Name",
	dm.emp_no AS "Manager Employee Number",
	e.last_name AS "Manager Last Name",
	e.first_name AS "Manager First Name"
from employees as e
inner join dept_manager as dm
	on e.emp_no=dm.emp_no
inner join departments as d
	on d.dept_no=dm.dept_no;

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.

select 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
from employees as e
inner join dept_emp as de
	on e.emp_no=de.emp_no
inner join departments as d
	on d.dept_no=de.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."

select 
	first_name AS "First name",
	last_name AS "Last name",
	sex AS "Sex"
from employees
where (INITCAP(first_name)='Hercules' and INITCAP(last_name) like 'B%');

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
select 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
from employees as e
inner join dept_emp as de
	on e.emp_no=de.emp_no
inner join departments as d
	on d.dept_no=de.dept_no
where lower(d.dept_name)='sales';
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select 
	de.emp_no AS "Employee Number",
	e.last_name AS "Last Name",
	e.first_name AS "First Name",
	d.dept_name AS "Department Name"
from employees as e
inner join dept_emp as de
	on e.emp_no=de.emp_no
inner join departments as d
	on d.dept_no=de.dept_no
where lower(d.dept_name) in ('sales','development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select 
	last_name AS "Last name",
	count(*) AS "Count" 
from employees
group by last_name 
order by count(*) desc;
