-- select * from EMPLOYEES;

-- it returns 107 results
select FIRST_NAME from EMPLOYEES;

-- it returns 91 results
-- it removes duplicates
select distinct FIRST_NAME from EMPLOYEES;

-- it will check each filter row to filter different columns
 -- > *  is all columns here
select distinct * from EMPLOYEES;

select * from JOBS;

select JOB_ID from JOBS;

-- same result , since primary key cannot be duplicate it gives the same result
select distinct JOB_ID from JOBS;


