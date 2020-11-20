INSERT INTO measurement (value, device_datapoint_id) VALUES
('100', (select id from device_datapoint limit 1));
