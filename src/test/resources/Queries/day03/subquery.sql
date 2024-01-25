select *
from EMPLOYEES;

-- Display all information who is making max salary
select max(SALARY)
from EMPLOYEES;
-- 24000

-- if we know max salary  can we find who is getting it?
select *
from EMPLOYEES
where SALARY = 24000;
-- steven king

-- dynamic result
select *
from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES);

-- Task: display all info who is getting min salary
-- min salary?
select min(SALARY)
from EMPLOYEES;

-- who is making min salary
select *
from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES);

-- IQ -->
-- display all info who is getting 2nd highest salary
-- find max salary
select max(SALARY)
from EMPLOYEES;

-- 2nd max salary
select max(SALARY)
from EMPLOYEES
where SALARY < 24000;
-- 17000

-- who is making 17000
select *
from EMPLOYEES
where SALARY = 17000;

-- dynamic result
select *
from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES where SALARY < 24000);

-- dynamic result
select *
from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES where SALARY < (select max(SALARY) from EMPLOYEES));

-- Task: display all info who is getting more than average ?
--find avg salary
select round(avg(SALARY))
from EMPLOYEES;
-- 6462

-- who is making more than average salary?
select *
from EMPLOYEES
where SALARY > 6462;

-- dynamic result
select *
from EMPLOYEES
where SALARY > (select round(avg(SALARY)) from EMPLOYEES);













