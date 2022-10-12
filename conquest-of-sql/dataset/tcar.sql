-- 차 테이블
CREATE TABLE tCar
(
	car VARCHAR(30) NOT NULL,         -- 이름
	capacity INT NOT NULL,            -- 배기량
	price INT NOT NULL,               -- 가격
	maker VARCHAR(30) NOT NULL        -- 제조사
);

INSERT INTO tCar VALUES ('소나타', 2000, 2500, '현대');
INSERT INTO tCar VALUES ('티볼리', 1600, 2300, '쌍용');
INSERT INTO tCar VALUES ('A8', 3000, 4800, 'Audi');
INSERT INTO tCar VALUES ('SM5', 2000, 2600, '삼성');



-- 자동차 제조사 테이블
CREATE TABLE tMaker
(
	maker VARCHAR(30) NOT NULL,       -- 회사
  factory CHAR(10) NOT NULL,        -- 공장
	domestic VARCHAR(1) NOT NULL      -- 국산 여부. y/n
);

INSERT INTO tMaker VALUES ('현대', '부산', 'y');
INSERT INTO tMaker VALUES ('쌍용', '청주', 'y');
INSERT INTO tMaker VALUES ('Audi', '독일', 'n');
INSERT INTO tMaker VALUES ('기아', '서울', 'y');
