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