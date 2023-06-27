# Creating the database
	create database employees;
	
	
# Creating tables:

## creating employees table:	
	create table employees (
		employee_id serial primary key,
		first_name varchar(50),
		last_name varchar(50),
		email varchar(100),
		department_id int,
		foreign key (department_id) references departments(department_id));

## creating departments table:	
	create table departments (
		department_id serial primary key,
		department_name varchar(50),
		location varchar(50));

## creating salaries table:	
	create table salaries (
		salary_id serial primary key,
		employee_id int,
		salary_amount numeric(10,2),
		start_date date,
		foreign key (employee_id) references employees(employee_id));

## creating positions table: 
	create table positions (
		position_id serial primary key,
		employee_id int,
		title varchar(50),
		start_date date,
		foreign key (employee_id) references employees(employee_id));
	
		
# Inserting values into tables:

## Inserting values into employees table:
	insert into employees (first_name, last_name, email, department_id) VALUES
		  ('John', 'Doe', 'johndoe@example.com', 1),
		  ('Jane', 'Smith', 'janesmith@example.com', 4),
		  ('Michael', 'Johnson', 'michaeljohnson@example.com', 2),
		  ('Emily', 'Davis', 'emilydavis@example.com', 3);
		  
## Inserting values into departments table:
	insert into departments (department_name, location) VALUES
		  ('IT', 'New York'),
		  ('HR', 'Los Angeles'),
		  ('Marketing', 'Chicago'),
		  ('Finance', 'San Francisco');

## Inserting values into salaries table:
	insert into salaries (employee_id, salary_amount, start_date) VALUES
		  (1, 5000, '2021-01-01'),
		  (2, 6000, '2021-02-15'),
		  (3, 5500, '2021-03-10'),
		  (4, 7000, '2021-04-20');
		  
## Inserting values into positions table:
	insert into positions (employee_id, title, start_date) VALUES
		  (1, 'Software Engineer', '2021-01-01'),
		  (2, 'HR Manager', '2021-02-15'),
		  (3, 'Marketing Analyst', '2021-03-10'),
		  (4, 'Financial Analyst', '2021-04-20');


# join queries:

## Inner join between 'employees' and 'departments' tables:
	SELECT e.employee_id, e.first_name, e.last_name, d.department_name
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id;
	
## Inner join between 'employees', 'salaries', and 'positions' tables:
	SELECT e.employee_id, e.first_name, e.last_name, s.salary_amount, p.title
	FROM employees e
	INNER JOIN salaries s ON e.employee_id = s.employee_id
	INNER JOIN positions p ON e.employee_id = p.employee_id;
	
## Inner join between all four tables, 'employees', 'departments', 'salaries', and 'positions':
	SELECT e.employee_id, e.first_name, e.last_name, d.department_name, s.salary_amount, p.title
	FROM employees e
	INNER JOIN departments d ON e.department_id = d.department_id
	INNER JOIN salaries s ON e.employee_id = s.employee_id
	INNER JOIN positions p ON e.employee_id = p.employee_id;
