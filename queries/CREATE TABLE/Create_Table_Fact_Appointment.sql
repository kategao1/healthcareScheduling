/*Create Table*/
DROP TABLE IF EXISTS fact_appointment;

CREATE TABLE fact_appointment (
    appointment_id       TEXT PRIMARY KEY,
    slot_id              TEXT,
    scheduling_date      DATE,
    appointment_date     DATE,
    appointment_time     TEXT,
    scheduling_interval  INTEGER,
    status               TEXT,
    check_in_time        TEXT,
    appointment_duration REAL,
    start_time           TEXT,
    end_time             TEXT,
    waiting_time         REAL,
    patient_id           TEXT,
    Scheduled            INTEGER,
    NoShow               INTEGER,
    Kept                 INTEGER,
    Cancelled            INTEGER,
    Unknown              INTEGER,
    NotDue               INTEGER,
    Available            INTEGER,
    Age                  INTEGER,
    age_Group            TEXT
);
