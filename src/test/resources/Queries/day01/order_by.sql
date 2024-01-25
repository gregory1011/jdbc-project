-- orderby it allows us to sort the data based on provided column
-- as a result it will order the result Ascending order ( A -Z, 0 -9)
-- if you want to sort Descending order we need to specify right after column name

--display all employees based on salary on asc order
select * from EMPLOYEES
order by SALARY;

--same query ascending
select * from EMPLOYEES
order by SALARY asc ;

--same query descending
select * from EMPLOYEES
order by SALARY desc ;

-- display all the employees based on their firstname decs
select * from EMPLOYEES
order by FIRST_NAME desc ;

-- display all the info where employee id is less the 120 and order them based on salary decs
select * from EMPLOYEES
where EMPLOYEE_ID < 120
ORDER BY SALARY desc;

-- display all info from employees and order them based on first name asc and last name desc
select * from EMPLOYEES
order by FIRST_NAME asc, LAST_NAME desc ;

select * from EMPLOYEES
order by FIRST_NAME asc , LAST_NAME desc ;

select FIRST_NAME from EMPLOYEES
where LENGTH(FIRST_NAME) = 6;





