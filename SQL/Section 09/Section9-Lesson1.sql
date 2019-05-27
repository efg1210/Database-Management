/*2*/
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING AVG(salary) < 16000;

SELECT COUNT(title)
FROM d_cds
WHERE cd_number < 93;

SELECT MAX(ID)
FROM d_songs
WHERE duration IN('3 min', '6 min', '10 min')
HAVING ID < 50
GROUP by ID;

SELECT loc_type, rental_fee AS Fee
FROM d_venues
WHERE id <100
ORDER BY 2;

/*3*/
SELECT DISTINCT MAX(song_id)
FROM d_track_listings
HAVING track = 3
GROUP BY track;

/*5*/
SELECT DEPARTMENT_ID, MIN(SALARY), MAX(SALARY)
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;

/*6*/
SELECT AVG(MIN(SALARY))
FROM EMPLOYEES
GROUP BY DEPARTMENT_ID;