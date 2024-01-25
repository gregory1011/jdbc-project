-- select * from  EMPLOYEES;

/*
     - percent % -->for matching any sequence of characters. (0 or more)
     - underscore _ --> for matching any single character.

     - contains
     - startswith
     - endswith

 */

-- display all employees where first_name startswith B
select * from EMPLOYEES
where FIRST_NAME like 'B%';

-- display all employees where firstname starts with B and length of it 5 letter
select * from EMPLOYEES
where FIRST_NAME like 'B____';

-- display 5 letter firstname from employee where middle char is z
select * from EMPLOYEES
where FIRST_NAME like '__z__';

-- display first name ends with 'e'
select *
from EMPLOYEES
where FIRST_NAME like '%e';

-- display all employees where job id contains IT
select * from EMPLOYEES
where JOB_ID like '%IT%';

-- display all info where firstname starts with H and ending with l
select * FROM EMPLOYEES
WHERE FIRST_NAME LIKE 'H%l';



