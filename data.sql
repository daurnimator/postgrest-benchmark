-- Projects
INSERT INTO mockify.projects(uid, ptype, title, version, description, note, documentation)
VALUES ('p923466', 'P', 'Shop', 0, 'Some project description', 'Some project note', 'Some project documentation');
INSERT INTO mockify.projects(uid, ptype, title, version, description, note, documentation)
VALUES ('28683z6', 'P', 'Mockify', 0, 'Some project description', 'Some project note', 'Some project documentation');
-- Projects for mockify tests
INSERT INTO mockify.projects(uid, ptype, title, version, description, note, documentation)
VALUES ('86uy0mm', 'P', 'ProjectEntity Service Integration Test', 0, 'ProjectEntity Service Integration Test description', 'ProjectEntity Service Integration Test note', 'ProjectEntity Service Integration Test documentation');

-- Groups
INSERT INTO mockify.projects(project_id, uid, ptype, title, version, context_path, description)
VALUES ((SELECT id FROM mockify.projects WHERE uid = '28683z6'), '33722n6', 'G', 'Users', 0, '/', 'GroupEntity holding user related requests');
INSERT INTO mockify.projects(project_id, uid, ptype, title, version, context_path, description)
VALUES ((SELECT id FROM mockify.projects WHERE uid = '28683z6'), '6789j47', 'G', 'Products', 0, '/', 'GroupEntity holding project related requests');
-- Groups for mockify tests
INSERT INTO mockify.projects(project_id, uid, ptype, title, version, context_path, description)
VALUES ((SELECT id FROM mockify.projects WHERE uid = '86uy0mm'), 'zx69j00', 'G', 'GroupEntity Integration Test 1', 0, '/', 'GroupEntity Integration Test description');
INSERT INTO mockify.projects(project_id, uid, ptype, title, version, context_path, description)
VALUES ((SELECT id FROM mockify.projects WHERE uid = '86uy0mm'), '7lh8krx', 'G', 'GroupEntity Integration Test 2', 0, '/index', 'GroupEntity Integration Test description');
INSERT INTO mockify.projects(project_id, uid, ptype, title, version, context_path, description)
VALUES ((SELECT id FROM mockify.projects WHERE uid = '86uy0mm'), 'rbo2md4', 'G', 'GroupEntity Integration Test 3', 0, '/path1', 'GroupEntity Integration Test description');

-- Stubs
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('38443k6', '{ "url": {"val": "/index", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "*", "type": "MATCHING"}] }'::jsonb, '{ "status": 200, "mediaType": "text/html", "headers": [["ETag", "headervalue1"], ["Last-Modified", "headerValue2"]] }'::jsonb, '<html><body><h2>Hello World</h2></body></html>', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = '33722n6'), true, 'Index Page', 0);
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('29y3748', '{ "url": {"val": "/{uid}", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"some" : "value"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = '6789j47'), true, 'Find', 0);
-- Stubs for mockify tests
--//
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('dzbky84', '{ "url": { "val": "/", "type": "EQUALS" }, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value1"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'zx69j00'), true, 'Find', 0);
--/index
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('4ys1ory', '{ "url": {"val": "/index", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value2"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'zx69j00'), true, 'Find', 0);
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('ltk93jh', '{ "url": {"val": "/{path}", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value2pattern"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'zx69j00'), true, 'Find', 0);
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('yz5gh6o', '{ "url": {"val": "/index", "type": "EQUALS"}, "method": "PATCH", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value2patch"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'zx69j00'), true, 'Find', 0);

--/path1/page1
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('0i8pbpd', '{ "url": {"val": "/page1", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value3"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = '7lh8krx'), true, 'Page 1', 0);
--/path1/page2
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('31cmvxq', '{ "url": {"val": "/page2", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value4"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = '7lh8krx'), true, 'Page 2', 0);

--/path2/page3
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('64zronf', '{ "url": {"val": "/page3", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value5"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'rbo2md4'), true, 'Page 3', 0);
--/path2/page4
INSERT INTO mockify.stubs(uid, request, response, response_body, spec, group_id, enabled, title, version)
VALUES ('1plzg0f', '{ "url": {"val": "/page4", "type": "EQUALS"}, "method": "GET", "headers": [{"key": "content-type", "val": "application/json", "type": "EQUALS"}] }'::jsonb, '{ "status": 200, "mediaType": "application/json" }'::jsonb, '{"key": "value6"}', 'MHAR_1_0', (SELECT id FROM mockify.projects WHERE uid = 'rbo2md4'), false, 'Page 4', 0);

INSERT INTO mockify.users (email, password, enabled)
VALUES ('admin@gmail.com', '$2a$10$pddc.HpfIkAAnZAP22dPounPn447v8QKKquqTS1Uq4zUntSKEsaMW', true);
INSERT INTO mockify.users (email, password, enabled)
VALUES ('user@gmail.com', '$2a$10$pddc.HpfIkAAnZAP22dPounPn447v8QKKquqTS1Uq4zUntSKEsaMW', true);
INSERT INTO mockify.users (email, password, enabled)
VALUES ('second_user@gmail.com', '$2a$10$pddc.HpfIkAAnZAP22dPounPn447v8QKKquqTS1Uq4zUntSKEsaMW', true);

INSERT INTO mockify.user_project (user_id, project_id)
VALUES ((SELECT id FROM mockify.users WHERE email = 'admin@gmail.com'), (SELECT id FROM mockify.projects WHERE uid = '28683z6'));
INSERT INTO mockify.user_project (user_id, project_id)
VALUES ((SELECT id FROM mockify.users WHERE email = 'user@gmail.com'), (SELECT id FROM mockify.projects WHERE uid = '28683z6'));
INSERT INTO mockify.user_project (user_id, project_id)
VALUES ((SELECT id FROM mockify.users WHERE email = 'second_user@gmail.com'), (SELECT id FROM mockify.projects WHERE uid = 'p923466'));
