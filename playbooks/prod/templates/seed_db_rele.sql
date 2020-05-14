INSERT INTO protocols (id, name, datatype_id) VALUES
('21f4ee45-d017-4756-8461-7baf7a1c6666', 'rele', (select id from data_types where name = 'Boolean'));

INSERT INTO module_device_types (id, manufacturer, model, code, protocol_id) VALUES
('1751a162-028f-43f5-b557-14a272f38666', 'HONG WEI', 'hw-655', 'HW-655', (select id from protocols where name = 'rele'));

INSERT INTO device_type_datapoints (id, name, units, code, legend, writable, module_device_type_id) VALUES
('b9dcda1d-cf24-4d95-acb7-e881ff251666', 'Status', 'boolean', 'STATUS', '(true|false)', TRUE, (select id from module_device_types where model = 'hw-655'));

INSERT INTO modules (id, mac, module_device_type_id) VALUES
('2619cd20-49dc-4226-92ff-4d848b276666', '{{ database_rele_module_mac }}', (select id from module_device_types where model = 'hw-655'));

INSERT INTO devices (id, uuid, address, poll_rate, module_id) VALUES
('f0ba623f-2af0-46a5-a519-a8daf2926666', '116f9a74-8354-45ce-9003-8091a92ebb73', 1, 2, (select id from modules where mac = '{{ database_rele_module_mac }}'));
