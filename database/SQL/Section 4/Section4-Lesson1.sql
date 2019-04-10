/*making the DUAL table*/
CREATE TABLE  DUAL ("DUMMY" VARCHAR2(1));
INSERT INTO DUAL (DUMMY) VALUES ('X');

/*1*/
SELECT CONCAT('Oracle ', 'Internet ', 'Academy') AS "The Best Class"
FROM DUAL;

/*2*/
SELECT SUBSTR('Oracle Internet Academy', 13, 3) AS "The Net"
FROM DUAL;

/*3*/
SELECT LENGTH('Oracle Internet Academy')
FROM DUAL;

/*4*/
SELECT INSTR('Oracle Internet Academy', 'I')
FROM DUAL;

/*5*/
SELECT RPAD(LPAD(REPLACE('Oracle Internet Academy', ' ', '****'), 33, '*'), 37, '*')
FROM DUAL;

/*6*/
SELECT TRIM(BOTH '$' FROM RPAD(LPAD(REPLACE('Oracle Internet Academy', ' ', '$$$'), 33, '$'), 37, '$'))
FROM DUAL

/*7*/
SELECT REPLACE('Oracle Internet Academy', 'Internet', '2013-2014') "The Best Class"
FROM DUAL

/*8*/
SELECT ORDER_DATE, LPAD(ORDER_TOTAL, 7, '$') AS "TOTAL"
FROM F_ORDERS

/*9*/
SELECT UPPER(FIRST_NAME || ' ' || LAST_NAME || ' ' || ADDRESS || ' ' || CITY || ', ' || STATE || ' ' || ZIP) AS "ADDRESS"
FROM F_CUSTOMERS

/*10*/
SELECT SUBSTR(FIRST_NAME, 1, 1) || last_name AS "Name", salary, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = 20;

SELECT SUBSTR(FIRST_NAME, 1, 1) || last_name AS "Name", salary, DEPARTMENT_ID
FROM EMPLOYEES
WHERE DEPARTMENT_ID = :department_num;

/*11*/
SELECT DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID
FROM DEPARTMENTS
WHERE INITCAP(DEPARTMENT_NAME) = INITCAP(:DEPARTMENT_OF_YOUR_CHOICE);

/*12*/
SELECT *
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 4, 3) = INITCAP(:month);