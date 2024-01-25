select * from EMPLOYEES;
-- 1. Display all first name and related departments name

select FIRST_NAME, E.DEPARTMENT_ID, LAST_NAME, DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- order the list based on first name asc
select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
order by FIRST_NAME asc;

-- 2. Display all first name and department name including the employee without department
select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E left join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from DEPARTMENTS D right join EMPLOYEES E on d.DEPARTMENT_ID = E.DEPARTMENT_ID;

-- 3. Display all first name and department name including the department without employee
select * from DEPARTMENTS;

select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E right join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- how many employee we have for each department name
select DEPARTMENT_NAME, count(*)
from EMPLOYEES E join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID
group by DEPARTMENT_NAME;

-- 5. Display all first name and department name including the department without employees
-- and also employees without the department

select FIRST_NAME, E.DEPARTMENT_ID, DEPARTMENT_NAME
from EMPLOYEES E full join DEPARTMENTS D on E.DEPARTMENT_ID = D.DEPARTMENT_ID;

-- 6. Display all cities and countries names
select * from LOCATIONS;
select * from COUNTRIES;

select city, COUNTRY_NAME
from LOCATIONS inner join COUNTRIES C
on LOCATIONS.COUNTRY_ID = C.COUNTRY_ID;

-- 7. Display all cities and related country names including with countries without city.
select city, COUNTRY_NAME
from LOCATIONS RIGHT JOIN COUNTRIES C on LOCATIONS.COUNTRY_ID = C.COUNTRY_ID;

-- 8. Display all department name and related street address
select * from DEPARTMENTS;
select * from LOCATIONS;

select DEPARTMENT_NAME, STREET_ADDRESS
from DEPARTMENTS D join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 9. Display first name, last name and department name, city for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY
from EMPLOYEES join DEPARTMENTS D on EMPLOYEES.DEPARTMENT_ID = D.DEPARTMENT_ID
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID;

-- 10. Display first_name, last_name and department_name, city, country_name for all employees
select FIRST_NAME, LAST_NAME, DEPARTMENT_NAME, CITY, COUNTRY_NAME
from EMPLOYEES join DEPARTMENTS D on EMPLOYEES.DEPARTMENT_ID = D.DEPARTMENT_ID
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
join COUNTRIES C on L.COUNTRY_ID = C.COUNTRY_ID;

-- How many employees working for each country_name ?
select COUNTRY_NAME, count(*)
from EMPLOYEES join DEPARTMENTS D on EMPLOYEES.DEPARTMENT_ID = D.DEPARTMENT_ID
join LOCATIONS L on D.LOCATION_ID = L.LOCATION_ID
join COUNTRIES C on L.COUNTRY_ID = C.COUNTRY_ID
group by COUNTRY_NAME
having count(8) > 10;


