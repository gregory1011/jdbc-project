-- display all info who is getting 3th lowest salary
select * from EMPLOYEES;

select distinct SALARY from EMPLOYEES order by SALARY asc;
-- 3rd min salary is 24000

select * from EMPLOYEES
where salary = 2400;

-- dynamic result
select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc)
where rownum < 4;

select * from EMPLOYEES
where SALARY =(select max(SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc )
where rownum < 4) ;

-- get 46th min salary dinamicly
select * from EMPLOYEES;
select distinct SALARY from EMPLOYEES order by SALARY asc;
select * from EMPLOYEES where SALARY = 9500;
select max(SALARY) from EMPLOYEES;

-- dynamic result
select * from EMPLOYEES
where SALARY = (select max (SALARY) from (select distinct SALARY from EMPLOYEES order by SALARY asc )
                                    where ROWNUM < 47);

---
select * from EMPLOYEES;

select * from DEPARTMENTS;




