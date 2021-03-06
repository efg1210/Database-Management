-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2019-01-06 20:35:14 EST
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE lib_author(
    author_id     VARCHAR2(50)NOT NULL,
    first_name    VARCHAR2(20)NOT NULL,
    middle_name   VARCHAR2(20),
    last_name     VARCHAR2(50)NOT NULL
);

ALTER TABLE lib_author ADD CONSTRAINT author_pk PRIMARY KEY(author_id);

CREATE TABLE lib_book(
    isbn                  VARCHAR2(15)NOT NULL,
    copy_number           NUMBER(2)NOT NULL,
    title                 VARCHAR2(50)NOT NULL,
    edition               VARCHAR2(50)NOT NULL,
    cover_type            VARCHAR2(20)NOT NULL,
    genre                 VARCHAR2(20)NOT NULL,
    dewy_decimal_number   VARCHAR2(30)NOT NULL,
    fine_per_day_late     NUMBER(4,2)NOT NULL
);

ALTER TABLE lib_book ADD CONSTRAINT book_pk PRIMARY KEY(isbn);

ALTER TABLE lib_book ADD CONSTRAINT book_copy_number_uk UNIQUE(copy_number);

CREATE TABLE lib_book_author_wrote(
    author_author_id   VARCHAR2(50)NOT NULL,
    bok_isbn           VARCHAR2(15)NOT NULL
);

ALTER TABLE lib_book_author_wrote ADD CONSTRAINT book_author_wrote_pk PRIMARY KEY(author_author_id, bok_isbn);

CREATE TABLE lib_checked_out_book(
    date_checked_out           DATE NOT NULL,
    days_loaned                NUMBER(3)NOT NULL,
    book_isbn                  VARCHAR2(15)NOT NULL,
    user_library_card_number   NUMBER(15)NOT NULL
);

ALTER TABLE lib_checked_out_book ADD CONSTRAINT checked_out_book_pk PRIMARY KEY(book_isbn, user_library_card_number);

CREATE TABLE lib_employee(
    id             VARCHAR2(25)NOT NULL,
    first_name     VARCHAR2(50)NOT NULL,
    last_name      VARCHAR2(50)NOT NULL,
    pay_per_hour   NUMBER(4)
);

ALTER TABLE lib_employee ADD CONSTRAINT employee_pk PRIMARY KEY(id);

CREATE TABLE lib_employee_shift(
    employee_id         VARCHAR2(25)NOT NULL,
    shift_hour          NUMBER(2)NOT NULL,
    shift_day_of_week   VARCHAR2(4)NOT NULL
);

ALTER TABLE lib_employee_shift ADD CONSTRAINT employee_shift_pk PRIMARY KEY(employee_id, shift_hour);

CREATE TABLE lib_on_hold(
    date_on_hold               DATE NOT NULL,
    in_library                 VARCHAR2(5)NOT NULL,
    book_isbn                  VARCHAR2(15)NOT NULL,
    user_library_card_number   NUMBER(15)NOT NULL
);

ALTER TABLE lib_on_hold ADD CONSTRAINT on_hold_pk PRIMARY KEY(book_isbn, user_library_card_number);

CREATE TABLE lib_overdue_book(
    current_date               DATE NOT NULL,
    total_fine                 NUMBER(10,2)NOT NULL,
    book_isbn                  VARCHAR2(15)NOT NULL,
    user_library_card_number   NUMBER(15)NOT NULL
);

ALTER TABLE lib_overdue_book ADD CONSTRAINT overdue_book_pk PRIMARY KEY(book_isbn, user_library_card_number);

CREATE TABLE lib_shift(
    hour          NUMBER(2)NOT NULL,
    day_of_week   VARCHAR2(4)NOT NULL
);

ALTER TABLE lib_shift ADD CONSTRAINT shift_pk PRIMARY KEY(hour, day_of_week);

CREATE TABLE lib_user (
    library_card_number   NUMBER(15)NOT NULL,
    first_name            VARCHAR2(50)NOT NULL,
    last_name             VARCHAR2(50)NOT NULL,
    date_of_birth         DATE NOT NULL,
    town                  VARCHAR2(50)NOT NULL,
    address               VARCHAR2(100)NOT NULL,
    email                 VARCHAR2(50),
    phone_number          VARCHAR2(15)NOT NULL
);

ALTER TABLE lib_user ADD CONSTRAINT user_pk PRIMARY KEY(library_card_number);

ALTER TABLE lib_book_author_wrote
    ADD CONSTRAINT bok_atr_wrote_bok_fk FOREIGN KEY(bok_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_book_author_wrote
    ADD CONSTRAINT book_author_wrote_author_fk FOREIGN KEY(author_author_id)
        REFERENCES lib_author(author_id);

ALTER TABLE lib_checked_out_book
    ADD CONSTRAINT checked_out_book_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_checked_out_book
    ADD CONSTRAINT checked_out_book_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);

ALTER TABLE lib_employee_shift
    ADD CONSTRAINT employee_shift_employee_fk FOREIGN KEY(employee_id)
        REFERENCES lib_employee(id);

ALTER TABLE lib_employee_shift
    ADD CONSTRAINT employee_shift_shift_fk FOREIGN KEY(shift_hour, shift_day_of_week)
        REFERENCES lib_shift(hour, day_of_week);

ALTER TABLE lib_on_hold
    ADD CONSTRAINT on_hold_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_on_hold
    ADD CONSTRAINT on_hold_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);

ALTER TABLE lib_overdue_book
    ADD CONSTRAINT overdue_book_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_overdue_book
    ADD CONSTRAINT overdue_book_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);

ALTER TABLE lib_book_author_wrote
    ADD CONSTRAINT bok_atr_wrote_bok_fk FOREIGN KEY(bok_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_book_author_wrote
    ADD CONSTRAINT book_author_wrote_author_fk FOREIGN KEY(author_author_id)
        REFERENCES lib_author(author_id);

ALTER TABLE lib_checked_out_book
    ADD CONSTRAINT checked_out_book_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_checked_out_book
    ADD CONSTRAINT checked_out_book_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);

ALTER TABLE lib_employee_shift
    ADD CONSTRAINT employee_shift_employee_fk FOREIGN KEY(employee_id)
        REFERENCES lib_employee(id);

ALTER TABLE lib_employee_shift
    ADD CONSTRAINT employee_shift_shift_fk FOREIGN KEY(shift_hour, shift_day_of_week)
        REFERENCES lib_shift(hour, day_of_week);

ALTER TABLE lib_on_hold
    ADD CONSTRAINT on_hold_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_on_hold
    ADD CONSTRAINT on_hold_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);

ALTER TABLE lib_overdue_book
    ADD CONSTRAINT overdue_book_book_fk FOREIGN KEY(book_isbn)
        REFERENCES lib_book(isbn);

ALTER TABLE lib_overdue_book
    ADD CONSTRAINT overdue_book_user_fk FOREIGN KEY(user_library_card_number)
        REFERENCES lib_user(library_card_number);



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            10
-- CREATE INDEX                             0
-- ALTER TABLE                             31
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0