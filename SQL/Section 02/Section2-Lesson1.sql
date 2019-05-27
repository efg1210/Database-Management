/*1*/
SELECT LAST_NAME, ADDRESS FROM F_CUSTOMERS;

/*2*/
/*a*/
SELECT first_name
FROM f_staffs;

/*b*/
SELECT first_name ||' '|| last_name AS "DJs on Demand Clients"
FROM d_clients;

/*c*/
SELECT DISTINCT quantity
FROM f_order_lines;

/*d*/
SELECT order_number
FROM f_orders;

/*3*/
SELECT '*** ' || FIRST_NAME || ' *** ' || FIRST_NAME || ' ***'
FROM  f_staffs;

/*5*/
SELECT LAST_NAME AS "EMPLOYEE LAST NAME", SALARY AS "CURRENT SALARY", SALARY*1.05 AS "SALARY WITH 5% RAISE"
FROM F_STAFFS;

/*6*/
DESCRIBE EMPLOYEES;

/*7*/
SELECT CD_NUMBER AS "Inventory Item", TITLE AS "CD Title", PRODUCER AS "Music Producer", YEAR AS "Year Purchased"
FROM D_CDS;