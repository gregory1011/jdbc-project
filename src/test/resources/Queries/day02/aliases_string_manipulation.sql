select * from EMPLOYEES;

/*
    1. column aliases --> it is temporary name to show in display
    2. table aliases which we will learn later
 */

-- the query below 2nd column name is 'round(avg(salary))' which is not nice.
select DEPARTMENT_ID, round (avg(SALARY)) as "Average_Salary"
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg (SALARY) > 6000
order by 2 asc;

select DEPARTMENT_ID, round (avg(SALARY)) as Average_Salary
from EMPLOYEES
where DEPARTMENT_ID is not null
group by DEPARTMENT_ID
having avg (SALARY) > 6000
order by 2 asc;


-- manager is asking display manual annual salary for all employees as annual_salary
select FIRST_NAME, SALARY * 12 as annual_salary   -- multiply salary with 12
from EMPLOYEES;

-- NOTE --> we are just displaying and nothing will change it DB

----------------------- String Manipulation -------------------------
/*
    contatenation anotation
    java --> +  firstname+" "+lastname
    SQL --> ||   firstname||' '||lastname
 */
-- I want to get full name column where we have firstname+" "+lastname
select FIRST_NAME || ' ' || LAST_NAME as full_name
from EMPLOYEES;

--add @cydeo.com to ll the emails in the employee table
select email||'@cydeo.com' from EMPLOYEES;

select concat(EMAIL,'@cydeo.com') from EMPLOYEES;

-- lowercase
select lower(concat (EMAIL,'@cydeo.com')) from EMPLOYEES;

-- uppercase
select upper(concat(EMAIL,'@cydeo.com')) from EMPLOYEES;

--INITCAP - initial capital
-- it makes first letter uppercase
select INITCAP(concat(EMAIL,'@cydeo.com')) from EMPLOYEES;

--LENGTH
select email , length(EMAIL) as email_length from EMPLOYEES;

-- display all employees where firstname length equals 6
select FIRST_NAME from EMPLOYEES
where length(FIRST_NAME) = 6;

-- another solution
select FIRST_NAME from EMPLOYEES
where FIRST_NAME like'______';

-- how many?
select count(*) FIRST_NAME from EMPLOYEES
where FIRST_NAME like'______';

-- display initial from firstname and lastname --> S.K --- N.K
--SUBSTR(columNAme, beginningIndex, numberOFChar)
select *from EMPLOYEES;
select substr(FIRST_NAME, 0, 1)||'.'||substr(LAST_NAME,0,1||'.') as initials
from EMPLOYEES;

select substr(FIRST_NAME, 1, 1)||'.'||substr(LAST_NAME,1,1||'.') as initials
from EMPLOYEES;

select FIRST_NAME, substr(FIRST_NAME, -2,2) from EMPLOYEES;

select FIRST_NAME, substr(FIRST_NAME, -3,2) from EMPLOYEES;

select FIRST_NAME, substr(FIRST_NAME, -4,2) from EMPLOYEES;

select FIRST_NAME, substr(FIRST_NAME, -3) from EMPLOYEES;

/*
    - if beginning index is0, it is treated as 1
    - if the beginning index negative, it will start from backwards
    - if we don't specify of char it will work till the end
 */
