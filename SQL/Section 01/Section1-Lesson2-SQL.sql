/*1*/
SELECT * 
FROM F_STAFFS 
WHERE MANAGER_ID = 19;
/*2*/
SELECT LAST_NAME AS "Client", EMAIL AS "Email Address" 
FROM d_client 
/*3*/
SELECT last_name, salary * 1.05 +.50 FROM f_staffs;
/*4*/
SELECT * FROM d_songs;