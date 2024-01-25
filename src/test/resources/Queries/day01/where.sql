-- here we gonna learn how to filter data
-- where keyword

select * from EMPLOYEES;


-- display all information of first name is david

select * from EMPLOYEES
where FIRST_NAME = 'David';

select * from EMPLOYEES
where FIRST_NAME = 'David' and LAST_NAME = 'Lee';

-- display firstname, lastname, salary where firstname is Peter;

select FIRST_NAME, LAST_NAME, SALARY
from EMPLOYEES
where FIRST_NAME ='Peter';

--display all information from employees where salary is greater  than 6000
select * from EMPLOYEES
where SALARY > 6000;

-- display email of who is making less than 5000
select email
from EMPLOYEES
where SALARY < 5000;

-- display all info from employees who is making more than 7000 and department ID 60
select * from EMPLOYEES
where SALARY > 7000 and DEPARTMENT_ID = 60;


-- display all info  from employees where salary is equal ot more then 3000 and salary equal or less than 7000
select * from EMPLOYEES
where SALARY >= 3000 and SALARY <= 7000;

select * from EMPLOYEES
where SALARY between 3000 and 7000 ;

-- display all info from employees who is working as IT_PROG or MK-MAN
SELECT * from EMPLOYEES
where JOB_ID  = 'IT_PROG' or JOB_ID ='MK+MAN';

-- display all info where employees id 121, 142, 154,165,187
-- solution 1
select * from EMPLOYEES
where EMPLOYEE_ID = 121 or EMPLOYEE_ID = 142 or EMPLOYEE_ID =154  or EMPLOYEE_ID =165 or EMPLOYEE_ID = 187;

-- solution 2 , same result
SELECT * from EMPLOYEES
where EMPLOYEE_ID in (121, 142, 154, 165, 187);

-- display all info where country ID is US and IT
select * from COUNTRIES
where COUNTRY_ID in ('US','IT');

-- -- display all info except where country ID is not US and IT
select * from COUNTRIES
where COUNTRY_ID not in ('US','IT');

-- IS Null
select * from EMPLOYEES
where DEPARTMENT_ID is null;

--
select * from EMPLOYEES
where MANAGER_ID is null ;

-- IS  Not Null
select * from EMPLOYEES
where DEPARTMENT_ID is not null;



