select * from EMPLOYEES;

/*
    create table syntax:
        colName1 DataType Constrains,
        colName2 DataType Constrains(optimal)
        colName3 DataType Constrains,
        ...
 */

 -- Create Table --
create  table scrumteam_greg (
    emp_Id Integer PRIMARY KEY,
    first_name varchar(30) not null,
    last_name varchar(20) not null,
    job_title varchar(20),
    salary Integer
);
select * from scrumteam_greg;

/*
 INSERT INTO tableName (column1, columns2, ...)
 VALUES (value1, value2, ...)
 */

 INSERT INTO SCRUMTEAM_GREG ( emp_id, first_name, last_name, job_title, salary)
 VALUES ( 1,'Steven', 'Shape', 'Tester', 125000);

INSERT INTO SCRUMTEAM_GREG ( emp_id, first_name, last_name, job_title, salary)
VALUES ( 2,'Herald', 'Shapee', 'developer', 115000);

INSERT INTO SCRUMTEAM_GREG ( emp_id, first_name, last_name, job_title, salary)
VALUES ( 3,'Jorge', 'Bush', 'QA', 105000);

INSERT INTO SCRUMTEAM_GREG ( emp_id, first_name, last_name, job_title, salary)
VALUES ( 4,'Sonia', 'Blue', 'Master', 135000);

INSERT INTO SCRUMTEAM_GREG( emp_id, first_name, last_name, job_title, salary)
VALUES (5 ,'Brain', 'Donovan', 'DevOp', 135000);

INSERT INTO SCRUMTEAM_GREG ( emp_id, first_name, last_name, job_title, salary)
VALUES ( 6,'Kay', 'Rooney', 'PO', 155000);

-- save changes so that other people can know
commit;

/*
 UPDATE tableName
 SET column2 = value2, ...
 Where condition;
 */
select * from SCRUMTEAM_GREG;

UPDATE SCRUMTEAM_GREG
Set salary = salary + 5000;

UPDATE SCRUMTEAM_GREG
Set salary = 110000
where emp_Id = 3;

commit work ;

/*
    DELETE FROM tableNAme
    WHERE condition;
 */
 select * from SCRUMTEAM_GREG;

DELETE from scrumteam_greg
where emp_Id =4;
commit ;

--> CRUD <--  SEE BELOW MEANING
--CREATE (INSERT)
--READ (SELECT)
--UPDATE (UPDATE)
--DELETE (DELETE)

--ALTER

--ADD NEW COLUMN
ALTER TABLE SCRUMTEAM_GREG ADD GENDER VARCHAR(10);

select * from SCRUMTEAM_GREG;

UPDATE SCRUMTEAM_GREG
SET GENDER = 'MALE'
WHERE EMP_ID =1;


-- RENAME THE COLUMN
ALTER TABLE SCRUMTEAM_GREG RENAME COLUMN SALARY TO ANUAL_SALARY;

--DROP COLUMN
ALTER TABLE SCRUMTEAM_GREG DROP COLUMN GENDER;

-- RENAME TABLE
ALTER TABLE SCRUMTEAM_GREG RENAME TO AGILETEAM;

SELECT * FROM AGILETEAM;

--TRUNCATE
TRUNCATE TABLE AGILETEAM;

-- DROP TABLE
DROP TABLE AGILETEAM;

COMMIT;

--IQ--
/*
    1. what is the difference between TRUNCATE and DROP
     --> TRUNCATE - it will delete table content, but keep the table
    --> DROP - it will delete all content and table itself. EVERYTHING
 */



