/*4*/
CREATE INDEX CD_TRACK_FK_I
ON D_TRACK_LISTINGS (cd_number);

/*5*/
SELECT M.index_name, M.column_name, M.column_position, X.uniqueness
FROM user_indexes X
INNER JOIN user_ind_columns M
ON X.index_name = M.index_name
WHERE M.table_name ='D_SONGS';

/*6*/
SELECT M.index_name, M.column_name, M.column_position, X.uniqueness
FROM user_indexes X
INNER JOIN user_ind_columns M
ON X.index_name = M.index_name
WHERE M.table_name = 'D_EVENTS';

/*7*/
CREATE SYNONYM dj_tracks
FOR d_track_listings;

/*8*/
CREATE INDEX UPPER_LAST_NAME_IDX
ON D_PARTNERS (LOWER(LAST_NAME));

SELECT LAST_NAME
FROM D_PARTNERS
WHERE LOWER(LAST_NAME) = 'Tsang';

/*9*/
CREATE SYNONYM dJ_tracks2
FOR d_track_listings;

SELECT * FROM dJ_tracks2;

/*10*/
DROP SYNONYM dJ_tracks2;