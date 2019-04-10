/*all data*/
SELECT * 
FROM CUSTOMERS;
SELECT * 
FROM TEAMS;
SELECT * 
FROM ITEMS;

/*some data*/
SELECT ctr_number, first_name, last_name, email, phone_number
FROM CUSTOMERS;
SELECT number_of_players
FROM TEAMS;
SELECT name, description, category
FROM ITEMS;

/*math! (part 1 of project 2 lesson 6 section 6)*/
SELECT first_name, last_name, current_balance, current_balance/12
FROM CUSTOMERS;
SELECT first_name, last_name, current_balance, current_balance-5
FROM CUSTOMERS;
/*The problem would be that one balance would be $-5*/

/*Aliases (part 2 of project 2 lesson 6 section 6)*/
SELECT first_name AS "First Name", last_name AS "Last Name", current_balance AS "Balance", current_balance/12  AS "Monthly Repayments"
FROM CUSTOMERS;

/*Literal strings*/
SELECT 'The ' || name || ' team has ' || number_of_players || ' players and receives a discount of ' || discount || ' percent.' AS "Team Information"
FROM TEAMS;
/*the last one has a null discount because it does not have enough team members*/