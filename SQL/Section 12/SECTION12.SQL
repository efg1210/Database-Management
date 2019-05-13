/*2*/
CREATE TABLE COPY_d_cds
AS (SELECT * FROM d_cds);

INSERT INTO COPY_d_cds (CD_NUMBER, TITLE, PRODUCER, YEAR)
VALUES (97, 'Celebrate the Day', 'R & B Inc.', 2003);
INSERT INTO COPY_d_cds (CD_NUMBER, TITLE, PRODUCER, YEAR)
VALUES (98, 'Holiday Tunes for All Ages', 'Tunes are Us', 2004);
INSERT INTO COPY_d_cds (CD_NUMBER, TITLE, PRODUCER, YEAR)
VALUES (99, 'Party Music', 'Old Town Records', 2004);
INSERT INTO COPY_d_cds (CD_NUMBER, TITLE, PRODUCER, YEAR)
VALUES (100, 'Best of Rock and Roll', 'Old Town Records', 2004);

SELECT * FROM COPY_d_cds;

/*3*/
CREATE TABLE COPY_d_songs
AS (SELECT * FROM d_SONGS);

INSERT INTO COPY_d_songs
VALUES (52, 'Surfing Summer', 'Not known', NULL, 12);
INSERT INTO COPY_d_songs
VALUES (53, 'Victory Victory', '5 min', NULL, 12);

/*4*/
CREATE TABLE copy_d_clients
AS (SELECT * FROM d_clients);

INSERT INTO copy_d_clients (Client_Number, First_Name, Last_Name, Phone, Email)
VALUES (6655, 'Ayako', 'Dahish', 3608859030, 'dahisha@harbor.net');
INSERT INTO copy_d_clients (Client_Number, First_Name, Last_Name, Phone, Email)
VALUES (6689, 'Nick', 'Neuville', 9048953049, 'nnicky@charter.net');

/*5*/
CREATE TABLE copy_d_events
AS (SELECT * FROM d_events);

INSERT INTO copy_d_events (ID, Name, Event_Date, Description, COST, Venue_ID, Package_Code, Theme_Code, Client_Number)
VALUES (110, 'Ayako Anniversary', '07-Jul2004', 'Party for 50, sixties dress, decorations', 0, 245, 79, 240, 6655);
INSERT INTO copy_d_events (ID, Name, Event_Date, Description, COST, Venue_ID, Package_Code, Theme_Code, Client_Number)
VALUES (115, 'Neuville Sports Banquet', '09-Sep2004', 'Barbecue at residence, college alumni, 100 people', 0, 315, 87, 340, 6689);

/*6*/
CREATE TABLE rep_email (
id NUMBER(6) CONSTRAINT rel_id_pk PRIMARY KEY,
first_name VARCHAR2(10),
last_name VARCHAR2(10),
email_address VARCHAR2(10));

INSERT INTO REP_EMAIL(ID, FIRST_NAME, LAST_NAME, EMAIL_ADDRESS)
    SELECT employee_id, first_name, last_name, email
    FROM EMPLOYEES
    WHERE JOB_ID LIKE '%REP%';
    
/*1*/
CREATE TABLE COPY_F_FOOD_ITEMS
AS (SELECT * FROM F_FOOD_ITEMS);

UPDATE COPY_F_FOOD_ITEMS
SET PRICE = 3.75
WHERE FOOD_ITEM_NUMBER = 93;
UPDATE COPY_F_FOOD_ITEMS
SET PRICE = 1.20
WHERE FOOD_ITEM_NUMBER = 90;

/*2*/
CREATE TABLE COPY_F_STAFFS
AS (SELECT * FROM F_STAFFS);

UPDATE COPY_F_STAFFS
SET OVERTIME_RATE = NVL(OVERTIME_RATE, 0) + .85
WHERE ID = 12;
UPDATE COPY_F_STAFFS
SET OVERTIME_RATE = NVL(OVERTIME_RATE, 0) + .75
WHERE ID = 9;

/*3*/
CREATE TABLE copy_f_orders
AS (SELECT * FROM f_orders);

INSERT INTO COPY_d_cds (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5680, TO_DATE('June 12, 2004','fmMonth dd, yyyy'), 159.78, 145, 9);
INSERT INTO COPY_d_cds (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5691, TO_DATE('09-23-2004','mm-dd-yyyy'), 145.98, 225, 12);
INSERT INTO COPY_d_cds (ORDER_NUMBER, ORDER_DATE, ORDER_TOTAL, CUST_ID, STAFF_ID)
VALUES (5701, TO_DATE('July 4, 2004','fmMonth dd, yyyy'), 229.31, 230, 12);

/*4*/
CREATE TABLE copy_f_customers
AS (SELECT * FROM f_customers);

INSERT INTO copy_f_customers
VALUES (145, 'Katie', 'Hernandez', '92 Chico Way', 'Los Angeles', 'CA', 98008, '8586667641');
INSERT INTO copy_f_customers
VALUES (225, 'Daniel', 'Spode', '1923 Silverado', 'Denver', 'CO', 80219, '7193343523');
INSERT INTO copy_f_customers
VALUES (230, 'Adam', 'Zurn', '5 Admiral Way', 'Seattle', 'WA', 0, '4258879009');

/*5*/
UPDATE COPY_F_STAFFS
SET SALARY = 
    (SELECT SALARY
    FROM F_STAFFS
    WHERE ID = 9)
WHERE ID = 12;

/*6*/
INSERT IN COPY_F_STAFFS (ID, FIRST_NAME, LAST_NAME, BIRTHDATE, SALARY, STAFF_TYPE)
VALUES (25, 'Kai', 'Kim', TO_DATE('3-Nov-1988', 'fmdd-Mon-yyyy'), 6.75, 'Order Taker');

/*7*/
UPDATE COPY_F_STAFFS
SET MANAGER_ID = 
    (SELECT MANAGER_ID
    FROM F_STAFFS
    WHERE ID = 12)
WHERE ID = 25;

/*9*/
DELETE FROM COPY_F_STAFFS
WHERE ID = 25;

SELECT * FROM COPY_F_STAFFS;

/*10*/
CREATE TABLE lesson7_emp
AS (SELECT * FROM employees);

DELETE FROM lesson7_emp
WHERE EMPLOYEE_ID IN
    (SELECT DISTINCT EMPLOYEE_ID
    FROM JOB_HISTORY);
    
/*2*/
CREATE TABLE copy_f_promotional_menus
AS (SELECT * FROM f_promotional_menus);

ALTER TABLE copy_f_promotional_menus
MODIFY(start_date DATE DEFAULT SYSDATE);

INSERT INTO copy_f_promotional_menus (CODE, NAME, START_DATE, END_DATE, give_away)
VALUES (120, '‘New Customer', DEFAULT,  '01-Jun-2005', '10% discount coupon');

/*3*/
CREATE TABLE manager_copy_D_CDS
AS (SELECT * FROM  D_CDS);

INSERT INTO manager_copy_D_CDS (cd_number, title, producer, year)
VALUES (20, 'Hello World Here I Am', 'Middle Earth Records', '1998');

MERGE INTO MANAGER_COPY_D_CDS M USING D_CDS C
    ON (C.CD_NUMBER = M.CD_NUMBER)
WHEN MATCHED THEN UPDATE
    SET
        M.TITLE = C.TITLE,
        M.YEAR = C.YEAR
WHEN NOT MATCHED THEN INSERT
    VALUES (C.cd_number, C.title, C.producer, C.year);
    
/*4*/
CREATE TABLE sal_history (employee_id, hire_date, salary)
AS SELECT employee_id, hire_date, salary
FROM employees
WHERE 1=2;

CREATE TABLE mgr_history (employee_id, manager_id, salary)
AS SELECT employee_id, manager_id, salary
FROM employees
WHERE 1=2;

CREATE TABLE special_sal (employee_id, salary)
AS SELECT employee_id, salary
FROM employees
WHERE 1=2;

INSERT FIRST
    WHEN SALARY > 20000 THEN
    INTO SPECIAL_SAL
        VALUES(EMPLOYEE_ID, SALARY)
    ELSE
    INTO SAL_HISTORY
            VALUES (employee_id, hire_date, salary)
    INTO MGR_HISTORY
        VALUES(employee_id, manager_id, salary);