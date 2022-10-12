-- 직원 정보 테이블
CREATE TABLE tEmployee
(
	name CHAR(10) PRIMARY KEY,
	salary INT NOT NULL,
	addr VARCHAR(30) NOT NULL
);

INSERT INTO tEmployee VALUES ('김상형', 650, '이천시');
INSERT INTO tEmployee VALUES ('문종민', 480, '대구시');
INSERT INTO tEmployee VALUES ('권성직', 625, '안동시');



-- 프로젝트 테이블
CREATE TABLE tProject
(
	projectID INT PRIMARY KEY,
	employee CHAR(10) NOT NULL,
	project VARCHAR(30) NOT NULL,
	cost INT,
	CONSTRAINT FK_emp FOREIGN KEY(employee) REFERENCES tEmployee(name)
);

INSERT INTO tProject VALUES (1, '김상형', '홍콩 수출건', 800);
INSERT INTO tProject VALUES (2, '김상형', 'TV 광고건', 3400);
INSERT INTO tProject VALUES (3, '김상형', '매출분석건', 200);
INSERT INTO tProject VALUES (4, '문종민', '경영 혁신안 작성', 120);
INSERT INTO tProject VALUES (5, '문종민', '대리점 계획', 85);
INSERT INTO tProject VALUES (6, '권성직', '노조 협상건', 24);
