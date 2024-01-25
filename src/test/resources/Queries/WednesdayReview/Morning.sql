---- PRACTICE 1 ----


--4. List all the different region_ids in countries table
Select * from EMPLOYEES;
SELECT  Distinct  REGION_ID from COUNTRIES;

-- get all different firstname from employees table
select distinct  FIRST_NAME from EMPLOYEES; -- 91


--5. Display the salary of the employee Grant Douglas (lastName: Grant, firstName: Douglas)
SELECT SALARY from EMPLOYEES
where FIRST_NAME ='Douglas' and LAST_NAME ='Grant';


--6. Display all department information from departments table
-- if the department name values are as below
-- IT , Public Relations , Sales , Executive

--> option 1
Select * from DEPARTMENTS
where DEPARTMENT_NAME ='IT' or DEPARTMENT_NAME ='Public Relations'
   or DEPARTMENT_NAME='Sales' or DEPARTMENT_NAME='Executive';

--> option 2
Select * from DEPARTMENTS
where DEPARTMENT_NAME in ('IT', 'Public Relations', 'Sales', 'Executive');

--> option 3 ( if not included )
Select * from DEPARTMENTS
where DEPARTMENT_NAME not in ('IT', 'Public Relations', 'Sales', 'Executive');

-- 16 . Display all unique job_id that end with CLERK in employee table
SELECT distinct JOB_ID from EMPLOYEES
where JOB_ID like '%CLERK';

-- same data by using JOBS table
select JOB_ID from JOBS
where JOB_ID like '%CLERK';


-- 20-4 How many employees are there in each group that have minimum
-- salary of 5000 ?
select JOB_ID, SALARY from EMPLOYEES
where SALARY > 5000;

select JOB_ID, count(*) from EMPLOYEES
where SALARY > 5000 group by JOB_ID;


-- 21. display all job_id and average salary who work as any of these jobs
-- IT_PROG,SA_REP, FI_ACCOUNT, AD_VP

-- WHERE option
select  JOB_ID, avg(SALARY) from EMPLOYEES
where JOB_ID in ('IT_PROG', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID;

-- HAVING option its inefficient
select  JOB_ID, avg(SALARY) from EMPLOYEES
having JOB_ID in ('IT_PROG', 'FI_ACCOUNT', 'AD_VP')
group by JOB_ID;

-- display job_id where their avg salary is less that 10000
select JOB_ID, avg(salary), count(*) from EMPLOYEES
having avg(SALARY) < 10000
group by JOB_ID;


-- 23. Display total salary for each department except department_id 50, and where
select DEPARTMENT_ID, sum(SALARY) from EMPLOYEES
where DEPARTMENT_ID != 50
group by DEPARTMENT_ID;


---- PRACTICE 2 ----
--8.  Find the 3rd maximum salary from the employees table (do not include duplicates)

-- 1st step: find all salary in desc orders
select distinct SALARY from EMPLOYEES
order by SALARY desc;

-- 2nd step: find all 3rd highest salary
select min(SALARY) from ( select distinct  SALARY from EMPLOYEES
    order by SALARY desc)
    where rownum  < 4;

-- 3rd step: get me all employees who is getting 3rd max salary;
select * from EMPLOYEES
    where SALARY = (select min(salary) from (select distinct  SALARY from EMPLOYEES
order by SALARY desc) where rownum  < 4);

select distinct SALARY from EMPLOYEES;

--IQ -- get me all employees who is getting 213th max salary
select * from EMPLOYEES
where SALARY = (select min(SALARY) from ( select distinct SALARY from EMPLOYEES
order by SALARY desc) where rownum < 214);



--12. Find the 3rd minimum salary from the employees table (do not include duplicates)
select distinct  SALARY from EMPLOYEES
where SALARY = ( select max(SALARY)from
(select distinct  SALARY from EMPLOYEES order by SALARY asc) where rownum < 4);




---- PRACTICE 3 ----
-- 1. FIND OUT COUNTRY NAME AND REGION NAME FROM COUNTRIES AND  REGION TABLE
select COUNTRY_NAME, REGION_NAME from COUNTRIES C
inner join REGIONS R on C.REGION_ID = R.REGION_ID;

-- how many country we have for each region name
select COUNTRY_NAME, REGION_NAME from COUNTRIES C
inner join REGIONS R on C.REGION_ID = R.REGION_ID
order by REGION_NAME;

-- Display regions which has more than 5 countries
select REGION_NAME, count(*)
from COUNTRIES C
    inner join REGIONS R on C.REGION_ID = R.REGION_ID
group by  REGION_NAME
having  count(*) > 5;

-- 3.  FIND OUT DEPARTMENT_NAME AND CITY
select DEPARTMENT_NAME,CITY from DEPARTMENTS D
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
group by DEPARTMENT_NAME, CITY;

-- 5.  FIND OUT FIRST_NAME, LAST NAME, DEPARTMENT ID , DEPARTMENT NAME FOR DEPARTMENT ID 80 OR 40
select FIRST_NAME, LAST_NAME, D.DEPARTMENT_ID, DEPARTMENT_NAME from EMPLOYEES E
inner join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
where D.DEPARTMENT_ID in (80, 40) order by DEPARTMENT_ID asc;

-- 7. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,  CITY
select FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
from JOBS J inner join EMPLOYEES E on J.JOB_ID = E.JOB_ID
inner join DEPARTMENTS D on E.EMPLOYEE_ID = D.MANAGER_ID
inner join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 8. FIND OUT EMPLOYEES FIRST_NAME , JOB_TITLE , DEPARTMENT_NAME ,CITY , COUNTRY_NAME , REGION_NAME


-- 11 .FIND OUT DEPARTMENT_NAME , LOCATION_ID , AND COUNTRY_NAME INCLUDING THOSE COUNTRIES WITH NO DEPARTMENT





----- SELF JOIN ---

-- Display all managers and their managers information
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID from EMPLOYEES;

select  workers.FIRST_NAME, workers.LAST_NAME, workers.MANAGER_ID,
        managers.EMPLOYEE_ID, managers.FIRST_NAME, managers.LAST_NAME
from EMPLOYEES workers inner join EMPLOYEES managers
on workers.MANAGER_ID=managers.EMPLOYEE_ID;

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.








