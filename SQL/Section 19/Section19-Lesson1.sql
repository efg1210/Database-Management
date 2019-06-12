SELECT * FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'C' AND TABLE_NAME = 'JOB_HISTORY';

SELECT * FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'C' AND TABLE_NAME = 'JOB_HISTORY';

SELECT * FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'R' AND TABLE_NAME = 'EMPLOYEES';
ALTER TABLE EMPLOYEES ADD CONSTRAINT EMP_DEPT_FK FOREIGN KEY(DEPARTMENT_ID) REFERENCES DEPARTMENTS(DEPARTMENT_ID);

SELECT * FROM USER_CONSTRAINTS WHERE CONSTRAINT_TYPE = 'C' AND TABLE_NAME = 'EMPLOYEES';
ALTER TABLE EMPLOYEES DROP CONSTRAINT EMP_SALARY_MIN;
UPDATE EMPLOYEES SET SALARY = 1000 WHERE SALARY < 1000;
ALTER TABLE EMPLOYEES CREATE CONSTRAINT EMP_SALARY_MIN CHECK(SALARY >= 1000);