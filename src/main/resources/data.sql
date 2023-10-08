INSERT INTO users(
    username, password, enabled, phone)
VALUES ('admin', '{noop}admin', 1, 01098400483),('mahmoud', '{noop}mahmoud', 1, 01098400483);

INSERT INTO authorities(
    username, authority)
VALUES ('admin', 'ROLE_ADMIN'),('admin', 'ROLE_EMPLOYEE'),('mahmoud','ROLE_EMPLOYEE');