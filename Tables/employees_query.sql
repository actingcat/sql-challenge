CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    emp_no INTEGER NOT NULL,
    emp_title_id VARCHAR(300025) NOT NULL,
	birth_date VARCHAR(300025) NOT NULL,
	first_name VARCHAR(300025) NOT NULL,
	last_name VARCHAR(300025) NOT NULL,
	sex VARCHAR(300025) NOT NULL,
	hire_date VARCHAR(300025) NOT NULL
);