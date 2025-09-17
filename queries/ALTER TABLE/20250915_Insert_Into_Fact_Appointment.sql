/*Inserting values into cleaned appointment table*/
INSERT INTO fact_appointment (
    appointment_id,
    slot_id,
    scheduling_date,
    appointment_date,
    appointment_time,
    scheduling_interval,
    status,
    check_in_time,
    appointment_duration,
    start_time,
    end_time,
    waiting_time,
    patient_id,
    Scheduled,
    NoShow,
    Kept,
    Cancelled,
    Unknown,
    NotDue,
    Available,
    Age,
    AgeGroup
)
SELECT 
    a.appointment_id,
    a.slot_id,
    a.scheduling_date,
    a.appointment_date,
    a.appointment_time,
    a.scheduling_interval,
    a.status,
    a.check_in_time,
    a.appointment_duration,
    a.start_time,
    a.end_time,
    a.waiting_time,
    a.patient_id,
    1 AS Scheduled,
    /*Converting columns to CASE WHENs to make it easier to do calculations*/
    CASE WHEN a.status = 'did not attend' THEN 1 ELSE 0 END AS NoShow,
    CASE WHEN a.status = 'attended' THEN 1 ELSE 0 END AS Kept,
    CASE WHEN a.status = 'cancelled' THEN 1 ELSE 0 END AS Cancelled,
    CASE WHEN a.status = 'unknown' THEN 1 ELSE 0 END AS Unknown,
    CASE WHEN (a.check_in_time = '' OR a.check_in_time IS NULL) 
              AND a.status = 'scheduled' THEN 1 ELSE 0 END AS NotDue,
    CASE WHEN s.is_available = 'TRUE' THEN 1 ELSE 0 END AS Available,
    a.age,
    a.age_group
FROM appointments a
LEFT JOIN slots s ON s.slot_id = a.slot_id /*Joining to get available status*/
;
