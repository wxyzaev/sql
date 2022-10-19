-- 디렉터리 테이블
CREATE TABLE tDirectory
(
	id INT PRIMARY KEY,
	name VARCHAR(20) NOT NULL,
	parent INT NOT NULL
);

INSERT INTO tDirectory VALUES (1, 'Root', 0);
INSERT INTO tDirectory VALUES (2, 'Data', 1);
INSERT INTO tDirectory VALUES (3, 'Program', 1);
INSERT INTO tDirectory VALUES (4, 'Sound', 2);
INSERT INTO tDirectory VALUES (5, 'Picture', 2);
INSERT INTO tDirectory VALUES (6, 'Game', 3);
INSERT INTO tDirectory VALUES (7, 'StartCraft', 6);
