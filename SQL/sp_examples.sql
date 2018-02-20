-- user name
-- password
-- response
CALL sp_add_user('test', 'test', @output);
SELECT @output;

-- event_type = 9 (CBC)
-- person id
-- description
-- start date
-- end date
-- start time
-- end time
-- wbc
-- hgb
-- plt
-- gran
-- anc
-- response
CALL sp_add_event_cbc(9, 1, 'test', '2020-01-02', '2020-01-02', NULL, NULL, 101, 101, 101, 101, 101, @output);
SELECT @output;

-- event_type = 14 (Medication)
-- person id
-- description
-- start date
-- end date
-- start time
-- end time
-- medication id,
-- dose
-- dose um
-- response
CALL sp_add_event_medication(14, 1, 'test', '2020-01-02', '2020-01-02', NULL, NULL, 13, 100, 'test', @output);
SELECT @output;

-- user_name
-- password
-- response
CALL sp_login('test', 'test', @output);
SELECT @output;

-- event_type = 16 (Vitals)
-- person id
-- description
-- start date
-- end date
-- start time
-- end time
-- height
-- weight
-- BMI
-- temperature
-- bp systolic
-- bp diastolic
-- response
CALL sp_add_event_vitals(16, 1, 'test', '2020-01-01', '2020-01-01', '08:00', '08:05', 50, 50, 50, 97.5, 95, 65, @output);
SELECT @output;