/*1*/
SELECT MANAGER_ID, JOB_ID, SUM(SALARY), GROUPING(manager_id), GROUPING(job_id)
FROM EMPLOYEES
GROUP BY ROLLUP (MANAGER_ID, JOB_ID);

/*2*/
SELECT MANAGER_ID, JOB_ID, SUM(SALARY), GROUPING(manager_id), GROUPING(job_id)
FROM EMPLOYEES
GROUP BY CUBE (MANAGER_ID, JOB_ID);

/*3*/
SELECT department_id, manager_id, job_id
FROM EMPLOYEES
GROUP BY 
GROUPING SETS ((department_id, manager_id, job_id), (manager_id, job_id), (department_id, manager_id));