select *
from EMPLOYEES;

-- it limits row on provided number
select *
from EMPLOYEES
where rownum < 11;

-- display all info from employees who is getting first 5 highest salary
-- bad practice, it is getting data before order them based on salary
-- and cut the list from line 6 then it tries to order them between first 5 row
-- that is why we are getting wrong list
select *
from EMPLOYEES
where rownum < 6
order by SALARY desc;

--
select * from  EMPLOYEES
order by SALARY desc ;

-- correct answer using order by salary desc employee table as an input,
-- after FROM keyword then cutting first 5 with rownum
select *
from  ( select * from  EMPLOYEES order by SALARY desc )
where rownum < 6;

-- display all info who is getting 5th highest salary
select distinct SALARY from EMPLOYEES order by SALARY desc ;

-- first we need to find what is 5th highest salary
select min(SALARY) from ( select distinct SALARY from EMPLOYEES order by SALARY desc )
where rownum < 6
order by SALARY desc;

-- who is making 5th highest salary?
select * from EMPLOYEES
where SALARY = 13000;

-- dynamic result, 5th highest salary
select * from EMPLOYEES
where SALARY = ( select min(SALARY) from ( select distinct SALARY from EMPLOYEES order by SALARY desc )
                where rownum < 6 );

-- IQ -- how do you find who is making the 37th highest salary
-- for X highest salary formula is rownum < X+1
-- for the 37th salary formula  is rownum < (37+1)= 38
select * from EMPLOYEES
where SALARY = ( select min(SALARY) from ( select distinct SALARY from EMPLOYEES order by SALARY desc )
                 where rownum < 38 );

-- HOMEWORK --
-- display all info who is getting 3th lowest salary
select * from EMPLOYEES
where SALARY =  (select min(SALARY) from ( select distinct SALARY from EMPLOYEES order by  SALARY desc )
                                    where ROWNUM < 4);








