INSERT INTO protocols (id, name, datatype_id) VALUES
('3e173d2c-29d8-452f-8bf7-a6fab3ae27ca', '1-Wire', (select id from data_types where name = 'Float'));

INSERT INTO module_device_types (id, manufacturer, model, code, protocol_id) VALUES
('9c333e3c-0e3b-45d1-ac5d-2a392a306a1e', 'Maxim Integrated', 'ds18b20', 'DS18B20', (select id from protocols where name = '1-Wire'));

INSERT INTO device_type_datapoints (id, name, units, code, legend, writable, module_device_type_id) VALUES
('7d421026-e802-4b8e-bb83-3b3730ee5b65', 'Temperature', 'degrees C', 'TEMP', 'temperature float number', FALSE, (select id from module_device_types where model = 'ds18b20'));

INSERT INTO modules (id, mac, module_device_type_id) VALUES
('fa6b9dcd-f6a4-4e2f-864c-5539b37fe307', '{{ database_thermometer_module_mac }}', (select id from module_device_types where model = 'ds18b20'));

INSERT INTO devices (id, uuid, address, poll_rate, module_id) VALUES
('ab6b10b4-1c93-4d40-9b45-0aa0ea537a5e', '7f662af3-adda-4e4f-b04f-4e4945563476', '28 84 54 79 97 04 03 12', 20, (select id from modules where mac = '{{ database_thermometer_module_mac }}')),
('79460d96-269f-4eeb-b064-73f45c1c559a', 'bfba0369-a1a9-4643-87ed-867d550400db', '28 B7 97 79 97 15 03 E2', 10, (select id from modules where mac = '{{ database_thermometer_module_mac }}'));
