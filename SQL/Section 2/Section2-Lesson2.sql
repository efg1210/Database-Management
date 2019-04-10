/*1*/
SELECT FIRST_NAME, LAST_NAME, ADDRESS
FROM F_CUSTOMERS
WHERE ID = 456;

/*2*/
SELECT NAME, START_DATE, END_DATE
FROM F_PROMOTIONAL_MENUS
WHERE GIVE_AWAY = 'ballpen and highlighter';

/*3*/
SELECT 'The ' || year|| ' recording in our database is ' || TITLE AS "Oldest"
FROM D_CDS
WHERE YEAR = 1997;

/*5*/
SELECT title, YEAR
FROM D_CDS
WHERE YEAR < 2000;

/*7*/
SELECT studentno, fname, lname
FROM STUDENTS
WHERE SEX = 'F';

/*8*/
SELECT studentno AS "Student Number"
FROM STUDENTS
WHERE MAJOR = 'PE';

/*9*/
SELECT *
FROM STUDENTS
WHERE SEX = 'M';

/*10*/
SELECT title, YEAR
FROM D_CDS
WHERE YEAR != 2000;

/*11*/
SELECT *
FROM F_STAFFS
WHERE BIRTHDATE < '01-Jan-1980';