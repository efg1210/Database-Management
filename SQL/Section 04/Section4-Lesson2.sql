/*1*/
SELECT LAST_NAME, SALARY, ROUND(SALARY/1.55, 2)
FROM EMPLOYEES
WHERE EMPLOYEE_ID BETWEEN 100 AND 102;

/*2*/
SELECT LAST_NAME, SALARY, TRUNC(SALARY*1.05333, 2) "Raise"
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 80;

/*3*/
SELECT MOD(38873, 2)
FROM DUAL;

/*4*/
SELECT ROUND(845.553, 1)
FROM DUAL;

SELECT ROUND(30695.348, 2)
FROM DUAL;

SELECT ROUND(30695.348, -2)
FROM DUAL;

SELECT TRUNC(2.3454, 1)
FROM DUAL;

/*5*/
SELECT LAST_NAME, SALARY
FROM EMPLOYEES
WHERE MOD(SALARY, 3) = 0;

/*6*/
SELECT MOD(34, 8) AS "EXAMPLE"
FROM DUAL;