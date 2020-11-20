INSERT INTO protocol (name) VALUES
('Modbus-RTU');

INSERT INTO unit (name, symbol) VALUES
('percentage', '%'),
('Hertz', 'Hz'),
('second', 's'),
('minute', 'm');

INSERT INTO module_device_type (manufacturer, model, code, protocol_id) VALUES
('Forin.sk', 'H300-OD75S2G', 'VFD_H300', (select id from protocol where name = 'Modbus-RTU'));

INSERT INTO device_type_datapoint (virtual, name, unit_id, code, description, writable, module_device_type_id) VALUES
(FALSE, 'Speed', (select id from unit where name = 'Hertz'), 'SPEED', 'Read/Write datapoint used to set frequency in percentage (single decimal precision) of set frequency (SET_FREQ). Possible values: <0.0,100.0>.', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Motion setting', NULL, 'SET_MOTION', 'Write-only datapoint used to control motor motion. Possible values: "FWD" - forward, "REV" - reverse, "FWD_JOG" - forward jogging, "REV_JOG" - reverse jogging, "STOP" - break-free stop, "BREAK" - stop using breaks', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Motion state', NULL, 'GET_MOTION', 'Used to get motion state. Possible values: "FWD" - running forward, "REV" - running reverse, "STOP" - stop', FALSE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Status', NULL, 'STATE', 'Used to determine error state of VFD. Possible values: "OK" - no error, "ERROR %N" - error code, where %N id number.', FALSE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Actual frequency', (select id from unit where name = 'Hertz'), 'GET_FREQ', 'Actual output frequency. Two decimal precision.', FALSE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Frequency setpoint', (select id from unit where name = 'Hertz'), 'SET_FREQ', 'Read/Write datapoint used to set output frequency (at 100% SPEED). Two decimal precision. Possible values: <0.00,500>', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Acceleration time', (select id from unit where name = 'second'), 'ACCEL_TIME', 'Read/Write datapoint used to set accceleration time in seconds. Time to reach set SPEED from stop position. Integer numbers only.', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Deceleration time', (select id from unit where name = 'second'), 'DECEL_TIME', 'Read/Write datapoint used to set decceleration time in seconds. Time for to reach zero SPEED using breaking. Integer numbers only.', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Actual remaining running time', (select id from unit where name = 'minute'), 'GET_TIMER', 'Remaining time until the motor starts slowing down until fully stopped. Timer starts immediately after SET_MOTION. ACCEL_TIME is included in this timer, DECEL_TIME is not. Single decimal precision (6s).', FALSE, (select id from module_device_type where model = 'H300-OD75S2G')),
(FALSE, 'Timer setpoint', (select id from unit where name = 'minute'), 'SET_TIMER', 'Read/Write datapoint used to set the timer. This is the max value for GET_TIMER. Value 0 menas no timer - endless operation until stopped manually. Unlike GET_TIMER, this value does not represent actual remaining time, but rather the setpoint and does not change itself automatically. Single decimal precision (6s).', TRUE, (select id from module_device_type where model = 'H300-OD75S2G')),
(TRUE, 'RPM recalculation factor', NULL, 'RPM_FACTOR', 'Possible values: <0, 1>. e.g. factor is 0.5 -> 20 RPM on motor is 10 RPM on mixer', TRUE, (select id from module_device_type where model = 'H300-OD75S2G'));

INSERT INTO module (mac, module_device_type_id) VALUES
('{{ database_h300_module_mac }}', (select id from module_device_type where model = 'H300-OD75S2G'));

INSERT INTO device (name, address, poll_rate, protocol_name, module_id) VALUES
('VFD H300', 1, 10, 'Modbus-RTU', (select id from module where mac = '{{ database_h300_module_mac }}'));

INSERT INTO device_datapoint (virtual, name, unit_symbol, code, description, writable, device_id) VALUES
(FALSE, 'Speed', (select symbol from unit where name = 'Hertz'), 'SPEED', 'Read/Write datapoint used to set frequency in percentage (single decimal precision) of set frequency (SET_FREQ). Possible values: <0.0,100.0>.', TRUE, (select id from device where name = 'VFD H300')),
(FALSE, 'Motion setting', NULL, 'SET_MOTION', 'Write-only datapoint used to control motor motion. Possible values: "FWD" - forward, "REV" - reverse, "FWD_JOG" - forward jogging, "REV_JOG" - reverse jogging, "STOP" - break-free stop, "BREAK" - stop using breaks', TRUE, (select id from device where name = 'VFD H300')),
(FALSE, 'Motion state', NULL, 'GET_MOTION', 'Used to get motion state. Possible values: "FWD" - running forward, "REV" - running reverse, "STOP" - stop', FALSE, (select id from device where name = 'VFD H300')),
(FALSE, 'Status', NULL, 'STATE', 'Used to determine error state of VFD. Possible values: "OK" - no error, "ERROR %N" - error code, where %N id number.', FALSE, (select id from device where name = 'VFD H300')),
(FALSE, 'Actual frequency', (select symbol from unit where name = 'Hertz'), 'GET_FREQ', 'Actual output frequency. Two decimal precision.', FALSE, (select id from device where name = 'VFD H300')),
(FALSE, 'Frequency setpoint', (select symbol from unit where name = 'Hertz'), 'SET_FREQ', 'Read/Write datapoint used to set output frequency (at 100% SPEED). Two decimal precision. Possible values: <0.00,500>', TRUE, (select id from device where name = 'VFD H300')),
(FALSE, 'Acceleration time', (select symbol from unit where name = 'second'), 'ACCEL_TIME', 'Read/Write datapoint used to set accceleration time in seconds. Time to reach set SPEED from stop position. Integer numbers only.', TRUE, (select id from device where name = 'VFD H300')),
(FALSE, 'Deceleration time', (select symbol from unit where name = 'second'), 'DECEL_TIME', 'Read/Write datapoint used to set decceleration time in seconds. Time for to reach zero SPEED using breaking. Integer numbers only.', TRUE, (select id from device where name = 'VFD H300')),
(FALSE, 'Actual remaining running time', (select symbol from unit where name = 'minute'), 'GET_TIMER', 'Remaining time until the motor starts slowing down until fully stopped. Timer starts immediately after SET_MOTION. ACCEL_TIME is included in this timer, DECEL_TIME is not. Single decimal precision (6s).', FALSE, (select id from device where name = 'VFD H300')),
(FALSE, 'Timer setpoint', (select symbol from unit where name = 'minute'), 'SET_TIMER', 'Read/Write datapoint used to set the timer. This is the max value for GET_TIMER. Value 0 menas no timer - endless operation until stopped manually. Unlike GET_TIMER, this value does not represent actual remaining time, but rather the setpoint and does not change itself automatically. Single decimal precision (6s).', TRUE, (select id from device where name = 'VFD H300')),
(TRUE, 'RPM recalculation factor', NULL, 'RPM_FACTOR', 'Possible values: <0, 1>. e.g. factor is 0.5 -> 20 RPM on motor is 10 RPM on mixer', TRUE, (select id from device where name = 'VFD H300'));
