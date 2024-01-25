select * from EMPLOYEES;

select * from EMPLOYEES
where SALARY not in ( 2000, 4000);
select FIRST_NAME, LAST_NAME
from EMPLOYEES
where FIRST_NAME like 'Jen%';

select FIRST_NAME, max( SALARY) from EMPLOYEES
group by FIRST_NAME order by FIRST_NAME asc;

select max(SALARY) from EMPLOYEES;

select * from EMPLOYEES
where SALARY = (select max(SALARY) from EMPLOYEES);

select * from EMPLOYEES
where SALARY = (select min(SALARY) from EMPLOYEES
where rownum < 19);
