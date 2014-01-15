BEGIN;
DELETE FROM groups;
DELETE FROM group_users;

INSERT INTO groups(id, name) VALUES(1, 'チームA');
INSERT INTO group_users(group_id, user_id) VALUES(1, 46);
INSERT INTO group_users(group_id, user_id) VALUES(1, 1);
INSERT INTO group_users(group_id, user_id) VALUES(1, 34);
INSERT INTO group_users(group_id, user_id) VALUES(1, 55);
INSERT INTO groups(id, name) VALUES(2, 'チームB');
INSERT INTO group_users(group_id, user_id) VALUES(2, 19);
INSERT INTO group_users(group_id, user_id) VALUES(2, 58);
INSERT INTO group_users(group_id, user_id) VALUES(2, 40);
INSERT INTO group_users(group_id, user_id) VALUES(2, 59);
INSERT INTO groups(id, name) VALUES(3, 'チームC');
INSERT INTO group_users(group_id, user_id) VALUES(3, 53);
INSERT INTO group_users(group_id, user_id) VALUES(3, 49);
INSERT INTO group_users(group_id, user_id) VALUES(3, 12);
INSERT INTO group_users(group_id, user_id) VALUES(3, 10);
INSERT INTO groups(id, name) VALUES(4, 'チームD');
INSERT INTO group_users(group_id, user_id) VALUES(4, 7);
INSERT INTO group_users(group_id, user_id) VALUES(4, 30);
INSERT INTO group_users(group_id, user_id) VALUES(4, 56);
INSERT INTO group_users(group_id, user_id) VALUES(4, 33);
INSERT INTO groups(id, name) VALUES(5, 'チームE');
INSERT INTO group_users(group_id, user_id) VALUES(5, 21);
INSERT INTO group_users(group_id, user_id) VALUES(5, 16);
INSERT INTO group_users(group_id, user_id) VALUES(5, 68);
INSERT INTO group_users(group_id, user_id) VALUES(5, 51);
INSERT INTO groups(id, name) VALUES(6, 'チームF');
INSERT INTO group_users(group_id, user_id) VALUES(6, 15);
INSERT INTO group_users(group_id, user_id) VALUES(6, 67);
INSERT INTO group_users(group_id, user_id) VALUES(6, 29);
INSERT INTO group_users(group_id, user_id) VALUES(6, 4);
INSERT INTO groups(id, name) VALUES(7, 'チームG');
INSERT INTO group_users(group_id, user_id) VALUES(7, 6);
INSERT INTO group_users(group_id, user_id) VALUES(7, 44);
INSERT INTO group_users(group_id, user_id) VALUES(7, 60);
INSERT INTO group_users(group_id, user_id) VALUES(7, 14);
INSERT INTO groups(id, name) VALUES(8, 'チームH');
INSERT INTO group_users(group_id, user_id) VALUES(8, 22);
INSERT INTO group_users(group_id, user_id) VALUES(8, 17);
INSERT INTO group_users(group_id, user_id) VALUES(8, 20);
INSERT INTO group_users(group_id, user_id) VALUES(8, 23);
INSERT INTO groups(id, name) VALUES(9, 'チームI');
INSERT INTO group_users(group_id, user_id) VALUES(9, 5);
INSERT INTO group_users(group_id, user_id) VALUES(9, 13);
INSERT INTO group_users(group_id, user_id) VALUES(9, 42);
INSERT INTO group_users(group_id, user_id) VALUES(9, 28);
INSERT INTO groups(id, name) VALUES(10, 'チームJ');
INSERT INTO group_users(group_id, user_id) VALUES(10, 35);
INSERT INTO group_users(group_id, user_id) VALUES(10, 64);
INSERT INTO group_users(group_id, user_id) VALUES(10, 57);
INSERT INTO group_users(group_id, user_id) VALUES(10, 61);
INSERT INTO groups(id, name) VALUES(11, 'チームK');
INSERT INTO group_users(group_id, user_id) VALUES(11, 25);
INSERT INTO group_users(group_id, user_id) VALUES(11, 65);
INSERT INTO group_users(group_id, user_id) VALUES(11, 62);
INSERT INTO groups(id, name) VALUES(12, 'チームL');
INSERT INTO group_users(group_id, user_id) VALUES(12, 47);
INSERT INTO group_users(group_id, user_id) VALUES(12, 63);
INSERT INTO group_users(group_id, user_id) VALUES(12, 24);
INSERT INTO group_users(group_id, user_id) VALUES(12, 52);
INSERT INTO groups(id, name) VALUES(13, 'チームM');
INSERT INTO group_users(group_id, user_id) VALUES(13, 43);
INSERT INTO group_users(group_id, user_id) VALUES(13, 50);
INSERT INTO group_users(group_id, user_id) VALUES(13, 31);
INSERT INTO group_users(group_id, user_id) VALUES(13, 9);
INSERT INTO groups(id, name) VALUES(14, 'チームN');
INSERT INTO group_users(group_id, user_id) VALUES(14, 45);
INSERT INTO group_users(group_id, user_id) VALUES(14, 48);
INSERT INTO group_users(group_id, user_id) VALUES(14, 18);
INSERT INTO groups(id, name) VALUES(15, 'チームO');
INSERT INTO group_users(group_id, user_id) VALUES(15, 11);
INSERT INTO group_users(group_id, user_id) VALUES(15, 41);
INSERT INTO group_users(group_id, user_id) VALUES(15, 27);
INSERT INTO group_users(group_id, user_id) VALUES(15, 3);
INSERT INTO groups(id, name) VALUES(16, 'チームP');
INSERT INTO group_users(group_id, user_id) VALUES(16, 36);
INSERT INTO group_users(group_id, user_id) VALUES(16, 32);
INSERT INTO group_users(group_id, user_id) VALUES(16, 26);
INSERT INTO group_users(group_id, user_id) VALUES(16, 37);

COMMIT;