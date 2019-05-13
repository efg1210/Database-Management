/*2*/
DROP TABLE COPY_D_CLIENTS;

CREATE TABLE COPY_D_CLIENTS AS(SELECT * FROM D_CLIENTS);

ALTER TABLE COPY_D_CLIENTS
ADD CONSTRAINT copy_d_clients_pk PRIMARY KEY(CLIENT_NUMBER);

/*3*/
DROP TABLE copy_d_events;

CREATE TABLE copy_d_events AS(SELECT * FROM d_events);

ALTER TABLE copy_d_events
ADD CONSTRAINT copy_d_events_fk FOREIGN KEY(CLIENT_NUMBER) REFERENCES copy_d_clients (client_number);

/*4*/
SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name =  'COPY_D_CLIENTS';

SELECT constraint_name, constraint_type, table_name
FROM user_constraints
WHERE table_name =  'COPY_D_EVENTS';

/*5*/
ALTER TABLE COPY_D_CLIENTS
DROP CONSTRAINT copy_d_clients_pk CASCADE;

/*6*/
INSERT INTO copy_d_events
VALUES(140, 'Cline Bas Mitzvah', '15-Jul-2004', 'Church and Private Home formal', 4500, 105, 87, 77, 7125);

/*7*/
ALTER TABLE COPY_D_CLIENTS
DISABLE CONSTRAINT copy_d_clients_pk;

/*8*/
ALTER TABLE COPY_D_CLIENTS
ENABLE CONSTRAINT copy_d_clients_pk;