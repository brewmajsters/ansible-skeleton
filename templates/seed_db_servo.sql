INSERT INTO protocols (id, name, datatype_id) VALUES
('21f4ee45-d017-4756-8461-7baf7a1c6747', 'servo', (select id from data_types where name = 'Integer'));

INSERT INTO module_device_types (id, manufacturer, model, code, protocol_id) VALUES
('1751a162-028f-43f5-b557-14a272f38114', 'Sparkfun', 'S05NF_STD', 'ROB-10333', (select id from protocols where name = 'servo'));

INSERT INTO device_type_datapoints (id, name, units, code, legend, writable, module_device_type_id) VALUES
('b9dcda1d-cf24-4d95-acb7-e881ff251f21', 'Angle', 'Degrees', 'ANGLE', '<0, 180> angle', TRUE, (select id from module_device_types where model = 'S05NF_STD'));

INSERT INTO modules (id, mac, module_device_type_id) VALUES
('2619cd20-49dc-4226-92ff-4d848b276a63', '{{ database_servo_module_mac }}', (select id from module_device_types where model = 'S05NF_STD'));

INSERT INTO devices (id, uuid, address, poll_rate, module_id) VALUES
('f0ba623f-2af0-46a5-a519-a8daf29263ac', '95638296-e8d8-47dc-bf8d-a3cf10b1cd41', 13, 60, (select id from modules where mac = '{{ database_servo_module_mac }}')),
('67849111-e90d-46b8-a16f-1dae5e613fb0', '44702335-a7f0-4ef1-b9c6-b10cea9496b8', 14, 60, (select id from modules where mac = '{{ database_servo_module_mac }}'));
