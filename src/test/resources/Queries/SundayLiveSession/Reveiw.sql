--------------- SELECT, WHERE, LIKE -------------------

--TASK 1 - display department names  from departments table
SELECT DEPARTMENT_NAME from DEPARTMENTS;

--TASK 2 - display first_name, last_name, department_id, salary from employees
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES;

--TASK 3 - display first_name, last_name, department_id, salary from employees whose salary is higher than 9000
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
where SALARY > 9000;

--TASK 4 - display first_name, last_name, department_id, salary from employees
select  FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
--         whose salary equals or more than 9000 and salary equals or less than 15000
  -- where SALARY  between 9000 and 15000;
where SALARY >= 9000 and SALARY < 15000
--         sort result based on salary asc
order by SALARY asc;

--TASK 5 -  display first_name, last_name, department_id, salary from employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_ID, SALARY from EMPLOYEES
--          whose firstname is Peter and salary is bigger than 5000
where FIRST_NAME = 'Peter' and SALARY > 5000
--          sort result based on salary desc
order by SALARY desc;

--TASK 6 - display country_id, country_name from countries table for region id 2 or 4
select COUNTRY_ID,COUNTRY_NAME, REGION_ID from COUNTRIES
where REGION_ID = 2 or REGION_ID = 4
-- where REGION_ID in (2, 4)
--         sort result based on region_id desc and country_name asc
order by REGION_ID desc, COUNTRY_NAME asc ;

--TASK 7 -  display employee first_name and last_name as full_name, salary as annual_salary, job_id
select FIRST_NAME ||' '|| LAST_NAME as full_name, SALARY * 12 as annual_salary, JOB_ID from EMPLOYEES
--          whose job ID starts with S
where JOB_ID like 'S%';

-- whose job ID starts with S AND TOTAL 6 LETTER
select FIRST_NAME ||' '|| LAST_NAME as full_name, SALARY * 12 as annual_salary, JOB_ID from EMPLOYEES
where JOB_ID like 'S_____';

-- TASK 8 - display country id and country name where country name ends with a
select COUNTRY_ID, COUNTRY_NAME from COUNTRIES
where COUNTRY_NAME like '%a';

-- IQ -- get me employees where employees id's are even number
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME from EMPLOYEES
    where mod(EMPLOYEE_ID, 2) = 0;

-- TASK 9 -  display country id and country name where country name ends with a and third letter is i
select  COUNTRY_ID, COUNTRY_NAME from COUNTRIES
where COUNTRY_NAME like '__i%a'


------ INTERVIEW QUESTION  -->
/*
    Write a query to print first_name and salary for all employees in the Employee table
    who earn a salary larger than 3000
    Sort your results in ascending order of the last 3 characters in the employees first_name
    if two or more employees have first_names ending with same 3 characters, then sort them by highest salary
*/
select FIRST_NAME, SALARY, SUBSTR(FIRST_NAME, -3) from EMPLOYEES
where salary > 3000
order by LOWER(SUBSTR(FIRST_NAME, -3)) asc , SALARY desc ;




--------------- GROUP BY, HAVING  -------------------

-- TASK 10- 1 -  how many city we have in each country from locations table
select * from LOCATIONS;
select COUNTRY_ID, count(*) from LOCATIONS
group by COUNTRY_ID;

-- TASK 10- 2  - order them based on city count in desc
select COUNTRY_ID, count(*) as city_count from LOCATIONS
group by COUNTRY_ID
order by city_count desc;

-- TASK 10- 3 -  filter result where country id starts with C
    -- where
select COUNTRY_ID, count(*) as city_count from LOCATIONS
                                          where COUNTRY_ID like 'C%'
group by COUNTRY_ID
order by city_count desc;
    -- having
select COUNTRY_ID, count(*) as city_count from LOCATIONS
group by COUNTRY_ID
having COUNTRY_ID like 'C%'
order by city_count desc;

-- TASK 10- 4 -  display country id if city count is bigger than 1
select COUNTRY_ID, COUNT(*) as city_count from LOCATIONS
group by COUNTRY_ID
having COUNT(*) > 1
order by city_count desc;

-- TASK 11 -1  How many employees is working for each department
SELECT DEPARTMENT_ID, COUNT(*) AS EMPLOYEE_COUNT FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

-- TASK 11 -2  ignore null departments
select DEPARTMENT_ID, count(*) from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID;

-- TASK 11 -3  display department id where employees count is less than 5
select DEPARTMENT_ID, count(*) from EMPLOYEES
group by  DEPARTMENT_ID
having count(*) < 5;

------- SUBQUERY -------

-- TASK 12 - Display those employees firstname,lastname and salary
       -- who get higher salary than the employee whose employee_id is 104
        select salary from EMPLOYEES
        where EMPLOYEE_ID = 104;

            -- FIND ME WHO IS GETTING MORE THAN 6000
            SELECT * FROM EMPLOYEES
            WHERE SALARY > 6000;

            -- MAKE IT DYNAMIC
            SELECT * FROM EMPLOYEES
            WHERE SALARY > ( SELECT SALARY FROM EMPLOYEES
                                           WHERE EMPLOYEE_ID = 104);

-- TASK 13 -  Display Manager firstname,lastname of Peter,Vargas from employees table
SELECT EMPLOYEE_ID, FIRST_NAME, LAST_NAME, MANAGER_ID FROM EMPLOYEES;

-- who get higher salary than the employee whose employee_id is 104
select MANAGER_ID FROM EMPLOYEES
    WHERE FIRST_NAME ='Peter' AND LAST_NAME = 'Vargas';  -- 124

-- FIND ME WHO IS GETTING MORE THAN 6000
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = 124;

-- MAKE IT DYNAMIC
SELECT * FROM EMPLOYEES
WHERE EMPLOYEE_ID = ( select MANAGER_ID from EMPLOYEES
                      WHERE FIRST_NAME ='Peter' AND LAST_NAME = 'Vargas' );

-- TASK 14 -  display all information who is getting 11th highest salary
select * from EMPLOYEES;

-- TASK 15 - Display employees first_name,last_name who is working in Marketing department


--- DDL / DML ---

-- DQL --> DATA QUERY LANGUAGE  --> SELECT
-- DML --> DATA MANIPULATION LANGUAGE
-- DDL --> DATA DEFINITION LANGUAGE




----- JOINS ----

-- INNER JOIN RETURN ONLY THE DATA THAT MATCH FROM BOTH TABLE ACCORDING TO CONDITION
-- Display all first_name and  related department_name
select * from EMPLOYEES;
select * from DEPARTMENTS;

select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E
inner join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- table aliases
select FIRST_NAME, DEPARTMENT_NAME
from EMPLOYEES E inner join DEPARTMENTS D
on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- table aliases
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from EMPLOYEES E inner join DEPARTMENTS D
                            on E.DEPARTMENT_ID = D.DEPARTMENT_ID;
-- LEFT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR LEFT
-- Display all first_name and department_name including the  employee without department
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from EMPLOYEES E left join DEPARTMENTS D
                            on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- display from employees who is working from departments that starts  with S
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from EMPLOYEES E left join DEPARTMENTS D
                           on E.DEPARTMENT_ID = D.DEPARTMENT_ID
where DEPARTMENT_NAME like 'S%';

-- Display all first_name and department_name including the department without employee
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from DEPARTMENTS D LEFT JOIN EMPLOYEES E on D.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- RIGHT OUTER JOIN RETURN EVERYTHING THAT MATCH + UNIQUE FOR RIGHT
select * from EMPLOYEES;
select * from DEPARTMENTS;
select  FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from  EMPLOYEES E right join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;


-- Display all first_name and department_name including the department without employee
select FIRST_NAME, DEPARTMENT_NAME, D.DEPARTMENT_ID
from DEPARTMENTS D right join EMPLOYEES E
                           on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- FULL OUTER JOIN RETURNS EVERYTHING
-- Display all firstname and department name including the department without employees
-- and also employees without the department



----- SELF JOIN ---
-- Display all managers and their managers information

-- Given the Employee table, write a SQL query that finds out employees who earn more than their managers.



