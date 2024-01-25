Select * from EMPLOYEES;







-- TASK 4
-- Get me how many employees getting more than employees avg
SELECT count(EMPLOYEE_ID) from EMPLOYEES
where SALARY > (SELECT avg(SALARY) from EMPLOYEES);

-- TASK 5
-- Get me all employees who is jobtitle is  'Sales Manager'
SELECT * from EMPLOYEES;
select * from jobs;

select JOB_ID from JOBS
where JOB_TITLE ='Sales Manager';

select * from EMPLOYEES
where JOB_ID = 'SA_MAN';

select * from EMPLOYEES
where JOB_ID = ( select JOB_ID from JOBS
              where JOB_TITLE='Sales Manager');



-- TASK 6
-- Get me all employees who is manager name is Neena Kocchar
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID from EMPLOYEES;

select EMPLOYEE_ID from EMPLOYEES
where FIRST_NAME ='Neena' and LAST_NAME ='Kochhar';  -- 101

select * from EMPLOYEES
where EMPLOYEE_ID = 101;




--- JOINS
-- TASK  1
-- From the employees and jobs tables,
-- find the difference between maximum salary of the job and
-- salary of the employees.
-- Return job title, employee name, and salary difference.
select JOB_TITLE, FIRST_NAME, MAX_SALARY-SALARY as Salary_DIFF from EMPLOYEES E
inner join Jobs J on J.JOB_ID = E.JOB_ID;


--TASK 2-1
-- From the departments and locations tables,
-- display the department name, city, and state province for each department.


--TASK 2-2
-- display only department names ends with Sales

--TASK 2-3
-- How many department we have for each city