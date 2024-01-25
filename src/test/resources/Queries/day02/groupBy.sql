-- your manager is asking all jobs and their average salary

select * from EMPLOYEES;

select distinct JOB_ID from EMPLOYEES;

-- get me average salary for 'IT_PROG'
select avg(SALARY) from EMPLOYEES
where JOB_ID = 'IT_PROG';

-- get me average salary for 'AC_ACCOUNT'
select avg(SALARY) from EMPLOYEES
where JOB_ID = 'AC_ACCOUNT';

-- get me average salary for 'AC_MGR'
select avg(SALARY) from EMPLOYEES
where JOB_ID = 'AC_MGR';

--
select JOB_ID, avg(SALARY) from EMPLOYEES
group by JOB_ID;

--
select JOB_ID, count(*), avg(SALARY), min(SALARY), max(SALARY), sum(SALARY) from EMPLOYEES
group by JOB_ID;

-- display how many departments we have in each location
select *
from DEPARTMENTS;

select LOCATION_ID, count(*)
from DEPARTMENTS
group by LOCATION_ID;

-- order them on number of departments in desc
select LOCATION_ID, count(*)
from DEPARTMENTS
group by LOCATION_ID
order by count(*) desc;

-- display how many countries we have in each regions
select *
from REGIONS;
select *
from COUNTRIES;

select REGION_ID, count(*)
from COUNTRIES
group by REGION_ID;

-- order them based on number of countries in desc
select REGION_ID, count(*)
from COUNTRIES
group by REGION_ID
order by count(*) desc;

----------
--get me total salary for each department from employees table

select *
from EMPLOYEES;
select DEPARTMENT_ID, sum(SALARY), count(*)
from EMPLOYEES
group by DEPARTMENT_ID;

select DEPARTMENT_ID, sum(SALARY), count(*)
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID;

-- display jobs id where their avg salary more than 5k
select JOB_ID, avg(SALARY)
from EMPLOYEES
group by JOB_ID;

select JOB_ID, avg(SALARY)
from EMPLOYEES
group by JOB_ID
having avg (SALARY) > 5000;

-- display departments where there avg salary is more than 6K
select DEPARTMENT_ID, round (avg(SALARY))
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg (SALARY) > 6000
order by 2 asc;

-- IQ --? display duplicate (more then one) firstname from employees table.
select FIRST_NAME, count(*) from EMPLOYEES
group by FIRST_NAME
having count(*) > 1;

--IQ --> display department ID where employees count is bigger then 5
select DEPARTMENT_ID, count(*)
from EMPLOYEES
group by DEPARTMENT_ID
having count(*) > 5 ;



