/*1*/
SELECT *
FROM  d_play_list_items, d_track_listings;

/*2*/
SELECT *
FROM  d_play_list_items p, d_track_listings t
WHERE p.SONG_ID = t.SONG_ID;

/*3*/
SELECT s.title, s.TYPE_CODE, t.description, s.artist
FROM D_SONGS s, D_TYPES t
WHERE s.TYPE_CODE = t.CODE;

/*4*/
SELECT s.title, s.TYPE_CODE, t.description, s.artist
FROM D_SONGS s, D_TYPES t
WHERE s.TYPE_CODE = t.CODE
AND s.ID IN (47, 48);

/*5*/
SELECT *
FROM  d_clients c,  d_events e,  d_job_assignments a
WHERE c.CLIENT_NUMBER = e.CLIENT_NUMBER
AND e.ID = a.EVENT_ID;

/*6*/
SELECT t.song_id, c.title
FROM d_track_listings t, d_cds c
WHERE t.CD_NUMBER = c.CD_NUMBER;