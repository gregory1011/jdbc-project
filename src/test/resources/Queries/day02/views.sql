select * from EMPLOYEES;

select substr(FIRST_NAME, 0, 1) || '.' || substr(LAST_NAME, 0, 1 || '.') as initials,
       FIRST_NAME || ' ' || LAST_NAME                                    as full_name
from EMPLOYEES;

create view EmployeeInfo as
    select  substr(FIRST_NAME, 0, 1) || '.' || substr(LAST_NAME, 0, 1 || '.') as initials,
            FIRST_NAME || ' ' || LAST_NAME                                    as full_name
    from EMPLOYEES;

select * from EMPLOYEEINFO;
select initials from EMPLOYEEINFO;

-- drop view
--drop view EMPLOYEEINFO;
select * from EMPLOYEEINFO;


