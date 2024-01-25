select * from EMPLOYEES;

-- task: how many locations we have for each country

select * from LOCATIONS;

select COUNTRY_ID, count(*)
from LOCATIONS
group by COUNTRY_ID;

-- order then based on country_id asc
select COUNTRY_ID, count(*)
from LOCATIONS
group by COUNTRY_ID
order by COUNTRY_ID desc;

 --- select only US, UK and CA

select COUNTRY_ID, count(*)
from LOCATIONS
where COUNTRY_ID in('US','UK', 'CA')
group by COUNTRY_ID
order by COUNTRY_ID desc;

 -- display where location count is bigger then 2
select COUNTRY_ID, count(*)
from LOCATIONS
where COUNTRY_ID in('US','UK', 'CA')
group by COUNTRY_ID
having count(*) > 2
order by COUNTRY_ID desc;

-- Task 2: display all employees salary in following format as column name Employees_salary
-- Ex:
    --Steven makes 2400
    --Nina makes 17000
select * from EMPLOYEES;

select FIRST_NAME ||' makes '||SALARY as Employees_salary
from EMPLOYEES;
