/*1*/
CREATE TABLE seq_d_songs
AS (SELECT * FROM d_songs);

/*2*/
CREATE SEQUENCE seq_d_songs_seq
    INCREMENT BY 2
    START WITH 100
    MAXVALUE 10000
    NOCACHE
    NOCYCLE;
    
/*3*/
SELECT *
FROM user_sequences
WHERE sequence_name = 'SEQ_D_SONGS_SEQ';

/*4*/
INSERT INTO seq_d_songs (ID, TITLE, DURATION, ARTIST, TYPE_CODE)
VALUES(seq_d_songs_seq.NEXTVAL, 'Island Fever', '5 min', 'Hawaiian Islanders', 12);

INSERT INTO seq_d_songs (ID, TITLE, DURATION, ARTIST, TYPE_CODE)
VALUES(seq_d_songs_seq.NEXTVAL, 'Castle of Dreams', '4 min', 'The Wanderers', 77);

/*5*/
SELECT seq_d_songs_seq.CURRVAL
FROM DUAL;