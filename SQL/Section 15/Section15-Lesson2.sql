/*1*/
SELECT * FROM USER_UPDATABLE_COLUMNS;

/*2*/
CREATE VIEW VIEW_copy_d_songs AS
SELECT *
FROM copy_d_songs;

/*3*/
INSERT INTO VIEW_copy_d_songs
VALUES(88, 'Mello Jello', '2 min', 'The What', 4);

SELECT * FROM COPY_D_SONGS;

/*4*/
CREATE VIEW read_copy_d_cds AS
SELECT *
FROM COPY_D_CDS
WHERE YEAR = '2000'
WITH READ ONLY;

/*5*/
DELETE FROM read_copy_d_cds WHERE cd_number = 90;

/*6*/
CREATE OR REPLACE VIEW read_copy_d_cds AS
SELECT *
FROM COPY_D_CDS
WHERE YEAR = '2000'
WITH CHECK OPTION CONSTRAINT ck_read_copy_d_cds;

/*7*/
DELETE FROM read_copy_d_cds WHERE YEAR = '2000';

/*8*/
DELETE FROM read_copy_d_cds WHERE cd_number = 90;

/*9*/
DELETE FROM read_copy_d_cds WHERE YEAR = '2001';

/*10*/
SELECT * FROM copy_d_cds;