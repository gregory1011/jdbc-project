--1. Display full addresses from locations table in a single column
select STREET_ADDRESS|| ', ' ||city||', '||STATE_PROVINCE||' '||POSTAL_CODE||', '||COUNTRY_ID as fullAddress
from LOCATIONS;


-- 2. Display all information of the employee who has the minimum salary in employees table
select * from EMPLOYEES
where SALARY = ( select min(SALARY) from EMPLOYEES);



-- 3. Display the second minimum salary from the employees
select min(SALARY), COunt(*) from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES where SALARY >( select min(Salary) from EMPLOYEES));


-- 4. Display all information of the employee who has the second minimum salary
select * from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES where SALARY > (select min(SALARY) from EMPLOYEES));

-- 5. List all the employees who are making above the average salary;
select round(avg(SALARY), 1) from EMPLOYEES;
select * from EMPLOYEES
where SALARY > (select avg(SALARY) from EMPLOYEES)
order by SALARY asc ;

-- 6. List all the employees who are making less than the average salary
select round(avg(SALARY), 1) from EMPLOYEES;
select * from EMPLOYEES
where SALARY < ( select avg(SALARY) from EMPLOYEES)
order by SALARY desc ;

-- 7. Display manager name of 'Neena'
select * from EMPLOYEES
where FIRST_NAME = 'Neena';

-- 8. Find the 3rd maximum salary from the employees table (do not include duplicates)
select * from  EMPLOYEES
where  SALARY = (select  min(SALARY) from ( select distinct  SALARY from EMPLOYEES order by SALARY desc )
                                          where   rownum < 4                   );

-- 9. Find the 5th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where SALARY = (select min(SALARY) from ( select distinct salary from EMPLOYEES order by SALARY desc)
                                   where rownum < 6);

-- 10. Find the 7th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where SALARY = (select min(Salary) from ( select distinct SALARY from EMPLOYEES order by SALARY desc)
                                   where rownum <7);


-- 11. Find the 10th maximum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where salary = ( select  min(Salary) from ( select distinct Salary from EMPLOYEES order by Salary desc)
                                    where rownum < 11);

-- 12. Find the 3rd minimum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where SALARY = ( select max(SALARY) from ( select distinct  SALARY from EMPLOYEES order by SALARY asc )
                                    where rownum < 4);

-- 13. Find the 5th minimum salary from the employees table (do not include duplicates)
select * from EMPLOYEES
where SALARY = (select max(SALARY) from ( select distinct SALARY from EMPLOYEES order by SALARY asc)
                                   where rownum < 6);