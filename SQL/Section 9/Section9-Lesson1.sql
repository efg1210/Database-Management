/*2*/
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING AVG(salary) < 16000;