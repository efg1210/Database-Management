/*1*/
SELECT name, START_DATE, NVL2(END_DATE, 'end in two weeks', SYSDATE)
FROM f_promotional_menus;

/*2*/
SELECT LAST_NAME, NVL(OVERTIME_RATE, 0) as "Overtime Status"
FROM  F_STAFFS;

/*3*/
SELECT LAST_NAME, NVL(OVERTIME_RATE, 5.00) as "Overtime Status"
FROM  F_STAFFS; 

/*4*/
SELECT LAST_NAME, NVL(MANAGER_ID, 9999) as "Overtime Status"
FROM  F_STAFFS; 

/*7*/
SELECT FIRST_NAME, LAST_NAME, TO_CHAR(hire_date, 'Month')
FROM EMPLOYEES;

SELECT FIRST_NAME, LAST_NAME, NULLIF(TO_CHAR(hire_date, 'Month'), 'September')
FROM EMPLOYEES; 

/*8*/
SELECT name, NVL(SPECIALTY, 'No Specialty')
FROM d_partners;