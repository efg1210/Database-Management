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