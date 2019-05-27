/*2*/
SELECT employee_id, job_id, hire_date, department_id
FROM EMPLOYEES
UNION
SELECT employee_id, job_id, start_date, department_id
FROM JOB_HISTORY;

/*3*/
SELECT employee_id, job_id, hire_date, department_id
FROM EMPLOYEES
UNION ALL
SELECT employee_id, job_id, start_date, department_id
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;

/*4*/
SELECT employee_id
FROM EMPLOYEES
MINUS
SELECT employee_id
FROM JOB_HISTORY;

/*5*/
SELECT employee_id
FROM EMPLOYEES
INTERSECT
SELECT employee_id
FROM JOB_HISTORY;

/*6*/
SELECT employee_id, job_id, NVL(SALARY, 0)
FROM EMPLOYEES
UNION
SELECT employee_id, job_id, 0
FROM JOB_HISTORY
ORDER BY EMPLOYEE_ID;