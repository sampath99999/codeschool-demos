-- Active: 1694497233170@@127.0.0.1@5432@whatsapp_clone
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    phone_number VARCHAR(10) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE chats (
    id SERIAL PRIMARY KEY,
    from_user INT REFERENCES users(id),
    to_user INT REFERENCES users(id),
    message VARCHAR(500),
    created_at TIMESTAMP DEFAULT NOW()
);


INSERT INTO users (phone_number, password, name) VALUES ('7036774550', md5('123456'), 'Sampath');
INSERT INTO users (phone_number, password, name) VALUES ('1234567990', md5('123456'), 'Jhon');
INSERT INTO users (phone_number, password, name) VALUES ('8888888888', md5('123456'), 'TT');

SELECT * FROM users;

INSERT INTO chats (from_user, to_user, message) VALUES (1, 2, 'Hello');
INSERT INTO chats (from_user, to_user, message) VALUES (3, 1, 'Hello');
INSERT INTO chats (from_user, to_user, message) VALUES (1, 3, 'Hello');
SELECT * FROM chats;
-- TO GET THE ALL RECENT CHATS
SELECT DISTINCT(u.id), u.name FROM users u
LEFT JOIN chats f ON f.to_user = u.id
LEFT JOIN chats t ON t.from_user = u.id
WHERE ( f.from_user = 1 OR t.to_user = 1);