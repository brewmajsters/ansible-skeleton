INSERT INTO protocols (id, name, datatype_id) VALUES
('56e5583a-2620-41ac-982f-59113de7c46a', 'Modbus-RTU', (select id from data_types where name = 'Integer'));

INSERT INTO module_device_types (id, manufacturer, model, code, protocol_id) VALUES
('9157c32a-2693-4383-a50f-2319d7d4a0b0', 'Forin.sk', 'H300-OD75S2G', 'VFD_H300', (select id from protocols where name = 'Modbus-RTU'));

INSERT INTO device_type_datapoints (id, name, units, code, legend, writable, module_device_type_id) VALUES
('bed951e5-3198-4cf4-b237-7f1a626428bb', 'Speed', '% * 100', 'SPEED', '<-10000,10000> freq', TRUE, (select id from module_device_types where model = 'H300-OD75S2G')),
('7c0501d3-2181-4d73-a41a-359703dc6849', 'Motion setting', 'enum', 'SET_MOTION', '<1, 7> mode', TRUE, (select id from module_device_types where model = 'H300-OD75S2G')),
('ef17422c-4ebb-4e78-9e08-8508b4aad5a3', 'Motion state', 'enum', 'GET_MOTION', '<1, 3> motion', FALSE, (select id from module_device_types where model = 'H300-OD75S2G')),
('106ca2bb-1be9-4211-bbd9-a1303ce4e4e4', 'Statecode', 'hex', 'STATE', '<0x0, 0x5E> state', FALSE, (select id from module_device_types where model = 'H300-OD75S2G')),
('2169df73-6950-4e1c-9848-e6a9823ae7ba', 'Main frequency', 'Hz * 100', 'MAIN_FREQUENCY', '<0, +/- MAXIMAL_ALLOWED_MAIN_FREQENCY>', FALSE, (select id from module_device_types where model = 'H300-OD75S2G')),
('578cb962-d315-4b8a-a686-e14f27e0478a', 'Auxiliary frequency', 'Hz * 100', 'AUX_FREQUENCY', '<0, +/- MAXIMAL_ALLOWED_AUX_FREQENCY>', FALSE, (select id from module_device_types where model = 'H300-OD75S2G'));

INSERT INTO modules (id, mac, module_device_type_id) VALUES
('1a08c97d-67f0-4c04-b7ff-75f676e98f35', '{{ database_h300_module_mac }}', (select id from module_device_types where model = 'H300-OD75S2G'));

INSERT INTO devices (id, uuid, address, poll_rate, module_id) VALUES
('54f01897-04b8-4404-b6f6-cf6a29cd3cc6', '602a9903-c090-43e1-b0b4-e87a3c1c32f5', 1, 10, (select id from modules where mac = '{{ database_h300_module_mac }}'));
