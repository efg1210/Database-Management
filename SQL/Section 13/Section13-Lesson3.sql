/*PRE*/
DESCRIBE o_employees;
DESCRIBE o_departments;
DESCRIBE o_jobs;

CREATE TABLE o_jobs AS (SELECT * FROM jobs);
CREATE TABLE o_employees AS (SELECT * FROM employees);
CREATE TABLE o_departments AS (SELECT * FROM departments);

INSERT INTO o_jobs (job_id, job_title, min_salary, max_salary)
VALUES('HR_MAN', 'Human Resources Manager', 4500, 5500);

INSERT INTO o_employees (employee_id, first_name, last_name, email, hire_date,
job_id)
VALUES(210, 'Ramon', 'Sanchez', 'RSANCHEZ', SYSDATE, 'HR_MAN');

INSERT INTO o_departments(department_id, department_name)
VALUES (210,'Human Resources');

/*2*/
CREATE D_ARTISTS
    (artist_ID NUMBER(4) NOT NULL,
    first_name VARCHAR(50)
    last_name VARCHAR(50)
    band_name VARCHAR(50)
    email VARCHAR(100)
    hourly_rate NUMBER(6)
    song_ID NUMBER(4)
    CONSTRAINT ART_ID_PK PRIMARY KEY(ARTIST_ID));

INSERT INTO D_ARTISTS
VALUES(1, NULL, NULL, 'The Hobbits', 'email@gmail.com', 200, 45);

INSERT INTO D_ARTISTS
VALUES(2, 'Kelly', 'Clarkson', NULL, 'KellyClarkson@gmail.com', 500, 60);

/*3*/
ALTER o_employees
ADD (TERMINATE VARCHAR(50) DEFAULT TO_CHAR(SYSDATE, 'Month ddth, YYYY'));

/*4*/
ALTER o_employees
ADD (start_date  TIMESTAMP WITH LOCAL TIME ZONE);

/*5*/
TRUNCATE TABLE O_JOBS;

SELECT * FROM O_JOBS;

/*8*/
COMMENT ON TABLE O_JOBS
    IS 'New job description added';
    
/*9*/
RENAME o_jobs TO o_job_description;

/*10*/
DROP TABLE COPY_F_STAFFS PURGE;

CREATE TABLE COPY_F_STAFFS
AS (SELECT * FROM F_STAFFS);

DESCRIBE COPY_F_STAFFS;

DROP TABLE COPY_F_STAFFS;

SELECT * FROM COPY_F_STAFFS;

SELECT * FROM "";

FLASHBACK TABLE COPY_F_STAFFS TO BEFORE DROP;

/*11*/
DROP TABLE COPY_F_STAFFS PURGE;

CREATE TABLE COPY_F_STAFFS
AS (SELECT * FROM F_STAFFS);

SELECT * FROM COPY_F_STAFFS;

UPDATE COPY_F_STAFFS
SET SALARY = 12
WHERE first_name = 'Sue' AND last_name = 'Doe';

SELECT * FROM COPY_F_STAFFS;

UPDATE COPY_F_STAFFS
SET SALARY = 2
WHERE first_name = 'Sue' AND last_name = 'Doe';

SELECT * FROM COPY_F_STAFFS;

SELECT VERSIONS_OPERATION, VERSIONS_STARTTIME, VERSIONS_ENDTIME, SALARY
FROM COPY_F_STAFFS
    VERSIONS BETWEEN SCN MINVALUE AND MAXVALUE
WHERE first_name = 'Sue' AND last_name = 'Doe';

UPDATE COPY_F_STAFFS
SET SALARY = 12
WHERE first_name = 'Sue' AND last_name = 'Doe';