/*1*/
SELECT LAST_NAME
FROM EMPLOYEES
WHERE SALARY >
    (SELECT SALARY
    FROM EMPLOYEES
    WHERE LAST_NAME = 'Lorentz')
AND DEPARTMENT_ID = 
    (SELECT DEPARTMENT_ID
    FROM EMPLOYEES
    WHERE LAST_NAME = 'Abel');
    
/*2*/
SELECT LAST_NAME
FROM EMPLOYEES
WHERE JOB_ID = 
    (SELECT JOB_ID
    FROM EMPLOYEES
    WHERE LAST_NAME = 'Rajs')
AND HIRE_DATE > 
    (SELECT HIRE_DATE
    FROM EMPLOYEES
    WHERE LAST_NAME = 'Davies');
    
/*3*/
SELECT NAME
FROM D_EVENTS
WHERE THEME_CODE =
    (SELECT THEME_CODE
    FROM D_EVENTS
    WHERE ID = 100);
    
/*4*/
SELECT STAFF_TYPE
FROM F_STAFFS
WHERE SALARY <
    (SELECT SALARY
    FROM F_STAFFS
    WHERE STAFF_TYPE = 'Cook');
    
/*5*/
SELECT DEPARTMENT_ID, AVG(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING AVG(SALARY) <
    (SELECT SALARY
    FROM EMPLOYEES
    WHERE LAST_NAME = 'Ernst');
    
/*6*/
SELECT DEPARTMENT_ID, MIN(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID
HAVING MIN(SALARY) > 
    (SELECT MIN(SALARY)
    FROM EMPLOYEES
    WHERE DEPARTMENT_ID != 50);