-- 회원 테이블
CREATE TABLE tMember
(
	member VARCHAR(20) PRIMARY KEY,   -- 아이디
	age INT NOT NULL,                 -- 나이
	email VARCHAR(30) NOT NULL,       -- 이메일
	addr VARCHAR(50) NOT NULL,        -- 주소
	money INT DEFAULT(1000) NOT NULL, -- 예치금
	grade INT DEFAULT(1) NOT NULL,    -- 고객등급 1(준회원) 2(정회원) 3(우수회원)
	remark VARCHAR(100) NULL          -- 메모사항
);

INSERT INTO tMember VALUES
	('춘향', 16, '1004@naver.com', '전남 남원시', 20000, 2, '');
INSERT INTO tMember VALUES
	('이도령', 18, 'wolf@gmail.com', '서울 신사동', 150000, 3, '');
INSERT INTO tMember VALUES
	('향단', 25, 'candy@daum.net', '전남 남원시', 5000, 2, '');
INSERT INTO tMember VALUES
	('방자', 28, 'devlin@ssang.co.kr', '서울 개포동', 1000, 1, '요주의 고객');



-- 상품 유형 테이블
CREATE TABLE tCategory
(
	category VARCHAR(10) PRIMARY KEY,       -- 분류명
	discount INT NOT NULL,                  -- 할인율
	delivery INT NOT NULL,                  -- 배송비
	takeback CHAR(1)                        -- 반품 가능성
);

INSERT INTO tCategory VALUES ('식품', 0, 3000, 'n');
INSERT INTO tCategory VALUES ('패션', 10, 2000, 'y');
INSERT INTO tCategory VALUES ('가전', 20, 2500, 'y');
INSERT INTO tCategory VALUES ('성인', 5, 1000, 'n');



-- 상품 테이블
CREATE TABLE tItem
(
	item VARCHAR(20) PRIMARY KEY,           -- 분류명
	company VARCHAR(20) NULL,               -- 분류명
	num INT NOT NULL,                       -- 할인율
	price INT NOT NULL,                     -- 배송비
	category VARCHAR(10) NOT NULL,          -- 분류명
	CONSTRAINT item_fk FOREIGN KEY(category) REFERENCES tCategory(category)
);

INSERT INTO tItem VALUES ('노트북', '샘성', 3, 820000, '가전');
INSERT INTO tItem VALUES ('청바지', '방방', 80, 32000, '패션');
INSERT INTO tItem VALUES ('사과', '문경농원', 24, 16000, '식품');
INSERT INTO tItem VALUES ('대추', '보은농원', 19, 15000, '식품');
INSERT INTO tItem VALUES ('전자담배', 'TNG', 4, 70000, '성인');
INSERT INTO tItem VALUES ('마우스', '논리텍', 3, 90000, '가전');



-- 주문 테이블 (MariaDB)
CREATE TABLE tOrder
(
	orderID INT AUTO_INCREMENT PRIMARY KEY,                      -- 주문 번호
	member VARCHAR(20) NOT NULL //REFERENCES tMemeber(member),   -- 주문자
	item VARCHAR(20) NOT NULL //REFERENCES tItem(item),          -- 상품
	orderDate DATE DEFAULT CURDATE() NOT NULL,                   -- 주문 날짜
	num INT NOT NULL,                                            -- 개수
	status INT DEFAULT 1 NOT NULL,
                                         -- 1:주문 2:배송중 3:배송완료 4:반품
	remark VARCHAR(1000) NULL                                    -- 메모 사항
);

INSERT INTO tOrder VALUES ('춘향', '청바지', '2019-12-3', 3, 2);
INSERT INTO tOrder VALUES ('향단', '대추', '2019-12-4', 10, 1);
INSERT INTO tOrder VALUES ('방자', '전자담배', '2019-12-2', 4, 1);
INSERT INTO tOrder VALUES ('향단', '사과', '2019-12-5', 5, 2);
INSERT INTO tOrder VALUES ('흥부', '노트북', '2019-12-5', 2, 1);
INSERT INTO tOrder VALUES ('방자', '핸드폰', '2019-11-1', 1, 3);
