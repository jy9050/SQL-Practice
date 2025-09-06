-- CREATE DATABASE employee5;
-- DROP TABLE IF EXISTS employee5;
CREATE TABLE employee5(
            employee_id SERIAL PRIMARY KEY,
			name VARCHAR(100) NOT NULL,
			department VARCHAR(50),
			joining_date DATE,
			salary NUMERIC(10,2),
			performance_score INT,
			location VARCHAR(100)
);

SELECT*FROM employee5;

INSERT INTO employee5(name,department,joining_date,salary,performance_score,location)

     VALUES ('Harshit','IT','2024-01-05',50000.00,2,'Bangalore'),
           ('Jyoti','IT','2025-12-25',900000.00,1,'Europe'),
           ('Dinesh','Sales','2024-02-16',30000.00,3,'Gujarat'),
		   ('Rahul','Marketing','2023-03-15',40000.00,5,'Gurugram');
-- TRUNCATE TABLE employee5;
TRUNCATE TABLE employee5;
TRUNCATE TABLE employee5 RESTART IDENTITY;

-- IT
SELECT*FROM employee5
WHERE department='IT';

-- Greater then  50000 salary
SELECT name , salary
FROM employee5
WHERE salary>=50000;

-- Average salary department wise
SELECT department, AVG(salary) AS avg_salary
From employee5
GROUP BY department;

-- JOINIG date as a asc 

SELECT name,joining_date
FROM employee5
ORDER BY joining_date ASC
LIMIT 1;


-- max salary department wise
SELECT department, name ,salary
FROM employee5 e
WHERE salary =(
       SELECT MAX(salary)
	   FROM employee5
	   WHERE department = e.department
);


-- Total count employee
SELECT COUNT(*) AS total_employee5
FROM employee5;


-- joining_date
 SELECT name,joining_date
 FROM employee5
 WHERE joining_date >'2021-12-31';


SELECT name,department,salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS salary_rank
		FROM employee5;

























