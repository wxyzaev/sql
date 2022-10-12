-- 도시 정보 테이블
CREATE TABLE tCity
(
	name CHAR(10) PRIMARY KEY,
	area INT NULL,
	popu INT NULL,
	metro CHAR(1) NOT NULL,
	region CHAR(6) NOT NULL
);

INSERT INTO tCity VALUES ('서울', 605, 974, 'y', '경기');
INSERT INTO tCity VALUES ('부산', 765, 342, 'y', '경상');
INSERT INTO tCity VALUES ('오산', 42, 21, 'n', '경기');
INSERT INTO tCity VALUES ('청주', 940, 83, 'n', '충청');
INSERT INTO tCity VALUES ('전주', 205, 65, 'n', '전라');
INSERT INTO tCity VALUES ('순천', 910, 27, 'n', '전라');
INSERT INTO tCity VALUES ('춘천', 1116, 27, 'n', '강원');
INSERT INTO tCity VALUES ('홍천', 1819, 7, 'n', '강원');



-- 도시 정보 테이블 사본 + 업데이트
CREATE TABLE tCityNew AS SELECT * FROM tCity;
UPDATE tCityNew SET popu = 1000 WHERE name = '서울';
UPDATE tCityNew SET area = 900 WHERE name = '부산';
DELETE FROM tCityNew WHERE name = '춘천';
INSERT INTO tCityNew VALUES ('이천', 461, 21, 'n', '경기');



-- 도시 인구 테이블
CREATE TABLE tCityPopu
(
	name CHAR(10) PRIMARY KEY,
	popu INT NULL
);

INSERT INTO tCityPopu VALUES ('서울', 1000);
INSERT INTO tCityPopu VALUES ('부산', 500);
INSERT INTO tCityPopu VALUES ('춘천', 100);
