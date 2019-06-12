-- Generated by Oracle SQL Developer Data Modeler 18.3.0.268.1156
--   at:        2019-06-06 18:54:00 EDT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE hb_doctor(
    id             VARCHAR2(8)NOT NULL,
    first_name     VARCHAR2(20)NOT NULL,
    last_name      VARCHAR2(50)NOT NULL,
    speciality     VARCHAR2(100)NOT NULL,
    address        VARCHAR2(100)NOT NULL,
    phone_number   VARCHAR2(11)NOT NULL
);

ALTER TABLE hb_doctor ADD CONSTRAINT doctor_pk PRIMARY KEY(id);

CREATE TABLE hb_doctor_hospital(
    hospital_id   VARCHAR2(8)NOT NULL,
    doctor_id     VARCHAR2(8)NOT NULL
);

ALTER TABLE hb_doctor_hospital ADD CONSTRAINT doctor_hospital_pk PRIMARY KEY(hospital_id, doctor_id);

CREATE TABLE hb_drug_info(
    id        VARCHAR2(8)NOT NULL,
    name      VARCHAR2(50)NOT NULL,
    purpose   VARCHAR2(50)NOT NULL
);

ALTER TABLE hb_drug_info ADD CONSTRAINT drug_info_pk PRIMARY KEY(id);

CREATE TABLE hb_drug_side_effect(
    drug_info_id      VARCHAR2(8)NOT NULL,
    side_effects_id   VARCHAR2(8)NOT NULL
);

ALTER TABLE hb_drug_side_effect ADD CONSTRAINT drug_side_effect_pk PRIMARY KEY(drug_info_id, side_effects_id);

CREATE TABLE hb_hospital(
    id             VARCHAR2(8)NOT NULL,
    address        VARCHAR2(100)NOT NULL,
    phone_number   VARCHAR2(11)NOT NULL,
    email          VARCHAR2(50)NOT NULL
);

ALTER TABLE hb_hospital ADD CONSTRAINT hospital_pk PRIMARY KEY(id);

CREATE TABLE hb_insurance_company(
    id     VARCHAR2(8)NOT NULL,
    name   VARCHAR2(20)NOT NULL
);

ALTER TABLE hb_insurance_company ADD CONSTRAINT insurance_company_pk PRIMARY KEY(id);

CREATE TABLE hb_non_fillable(
    perscription_info_patient_id     VARCHAR2(8)NOT NULL,
    perscription_info_doctor_id      VARCHAR2(8)NOT NULL,
    perscription_info_drug_info_id   VARCHAR2(8)NOT NULL,
    "size"                           NUMBER(3)NOT NULL
);

ALTER TABLE hb_non_fillable
    ADD CONSTRAINT "non-fillable_PK" PRIMARY KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id);

CREATE TABLE hb_patient(
    id                     VARCHAR2(8)NOT NULL,
    first_name             VARCHAR2(20)NOT NULL,
    last_name              VARCHAR2(50)NOT NULL,
    address                VARCHAR2(100)NOT NULL,
    phone_number           VARCHAR2(11)NOT NULL,
    email                  VARCHAR2(50),
    insurance_company_id   VARCHAR2(8)NOT NULL,
    patient_id             VARCHAR2(8)NOT NULL
);

ALTER TABLE hb_patient ADD CONSTRAINT patient_pk PRIMARY KEY(id);

CREATE TABLE hb_patient_doctor_history(
    start_date   DATE NOT NULL,
    end_date     DATE,
    chart        VARCHAR2(100)NOT NULL,
    patient_id   VARCHAR2(8)NOT NULL,
    doctor_id    VARCHAR2(8)NOT NULL
);

ALTER TABLE hb_patient_doctor_history
    ADD CONSTRAINT patient_doctor_history_pk PRIMARY KEY(start_date, patient_id, doctor_id);

CREATE TABLE hb_perscription_info(
    patient_id     VARCHAR2(8)NOT NULL,
    doctor_id      VARCHAR2(8)NOT NULL,
    drug_info_id   VARCHAR2(8)NOT NULL,
    start_date     DATE NOT NULL,
    dosage         NUMBER(8)NOT NULL,
    end_date       DATE NOT NULL
);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT perscription_info_pk PRIMARY KEY(patient_id, doctor_id, drug_info_id);

CREATE TABLE hb_refillable(
    perscription_info_patient_id     VARCHAR2(8)NOT NULL,
    perscription_info_doctor_id      VARCHAR2(8)NOT NULL,
    perscription_info_drug_info_id   VARCHAR2(8)NOT NULL,
    num_refill                       NUMBER(3)NOT NULL,
    "size"                           NUMBER(8)NOT NULL
);

ALTER TABLE hb_refillable
    ADD CONSTRAINT refillable_pk PRIMARY KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id);

CREATE TABLE hb_side_effects(
    id            VARCHAR2(8)NOT NULL,
    description   VARCHAR2(100)NOT NULL
);

ALTER TABLE hb_side_effects ADD CONSTRAINT side_effects_pk PRIMARY KEY(id);

CREATE TABLE hb_visit(
    "date"           DATE NOT NULL,
    time             DATE NOT NULL,
    patient_id       VARCHAR2(8)NOT NULL,
    doctor_id        VARCHAR2(8)NOT NULL,
    status           VARCHAR2(100),
    init_diagnosis   VARCHAR2(100),
    blood_pressure   VARCHAR2(10),
    height           NUMBER(1000),
    weight           NUMBER(10000)
);

ALTER TABLE hb_visit
    ADD CONSTRAINT visit_pk PRIMARY KEY("date", time, patient_id, doctor_id);

ALTER TABLE hb_doctor_hospital
    ADD CONSTRAINT dh_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_doctor_hospital
    ADD CONSTRAINT dh_hospital_fk FOREIGN KEY(hospital_id)
        REFERENCES hospital(id);

ALTER TABLE hb_drug_side_effect
    ADD CONSTRAINT dse_drug_info_fk FOREIGN KEY(drug_info_id)
        REFERENCES drug_info(id);

ALTER TABLE hb_drug_side_effect
    ADD CONSTRAINT dse_se_fk FOREIGN KEY(side_effects_id)
        REFERENCES side_effects(id);

ALTER TABLE hb_non_fillable
    ADD CONSTRAINT non_fillable_pi_fk FOREIGN KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id)
        REFERENCES perscription_info(patient_id, doctor_id, drug_info_id);

ALTER TABLE hb_patient
    ADD CONSTRAINT patient_icn_fk FOREIGN KEY(insurance_company_id)
        REFERENCES insurance_company(id);

ALTER TABLE hb_patient
    ADD CONSTRAINT patient_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_patient_doctor_history
    ADD CONSTRAINT pdh_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_patient_doctor_history
    ADD CONSTRAINT pdh_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_drug_info_fk FOREIGN KEY(drug_info_id)
        REFERENCES drug_info(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_refillable
    ADD CONSTRAINT refillable_pi_fk FOREIGN KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id)
        REFERENCES perscription_info(patient_id, doctor_id, drug_info_id);

ALTER TABLE hb_visit
    ADD CONSTRAINT visit_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_visit
    ADD CONSTRAINT visit_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_doctor_hospital
    ADD CONSTRAINT dh_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_doctor_hospital
    ADD CONSTRAINT dh_hospital_fk FOREIGN KEY(hospital_id)
        REFERENCES hospital(id);

ALTER TABLE hb_drug_side_effect
    ADD CONSTRAINT dse_drug_info_fk FOREIGN KEY(drug_info_id)
        REFERENCES drug_info(id);

ALTER TABLE hb_drug_side_effect
    ADD CONSTRAINT dse_se_fk FOREIGN KEY(side_effects_id)
        REFERENCES side_effects(id);

ALTER TABLE hb_non_fillable
    ADD CONSTRAINT non_fillable_pi_fk FOREIGN KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id)
        REFERENCES perscription_info(patient_id, doctor_id, drug_info_id);

ALTER TABLE hb_patient
    ADD CONSTRAINT patient_icn_fk FOREIGN KEY(insurance_company_id)
        REFERENCES insurance_company(id);

ALTER TABLE hb_patient
    ADD CONSTRAINT patient_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_patient_doctor_history
    ADD CONSTRAINT pdh_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_patient_doctor_history
    ADD CONSTRAINT pdh_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_drug_info_fk FOREIGN KEY(drug_info_id)
        REFERENCES drug_info(id);

ALTER TABLE hb_perscription_info
    ADD CONSTRAINT pi_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

ALTER TABLE hb_refillable
    ADD CONSTRAINT refillable_pi_fk FOREIGN KEY(perscription_info_patient_id, perscription_info_doctor_id, perscription_info_drug_info_id)
        REFERENCES perscription_info(patient_id, doctor_id, drug_info_id);

ALTER TABLE hb_visit
    ADD CONSTRAINT visit_doctor_fk FOREIGN KEY(doctor_id)
        REFERENCES doctor(id);

ALTER TABLE hb_visit
    ADD CONSTRAINT visit_patient_fk FOREIGN KEY(patient_id)
        REFERENCES patient(id);

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated 

--  ERROR: No Discriminator Column found in Arc Arc_1 - constraint trigger for Arc cannot be generated



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            13
-- CREATE INDEX                             0
-- ALTER TABLE                             43
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
-- ERRORS                                   2
-- WARNINGS                                 0