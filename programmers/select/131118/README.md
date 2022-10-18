# 서울에 위치한 식당 목록 출력하기

[프로그래머스 > SELECT > 서울에 위치한 식당 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131118)

<br/>

## 문제

`REST_INFO` 테이블은 식당의 정보를 담은 테이블이고,

`REST_REVIEW` 테이블은 식당의 리뷰 정보를 담은 테이블입니다.  

<br/>

`REST_INFO` 테이블 구조는 다음과 같습니다.

| NAME        | TYPE         | NULLABLE | ALIAS      |
| ----------- | ------------ | -------- | ---------- |
| REST_ID     | VARCHAR(5)   | FALSE    | 식당 ID    |
| REST_NAME   | VARCHAR(50)  | FALSE    | 식당 이름   |
| FOOD_TYPE   | VARCHAR(20)  | TRUE     | 음식 종류   |
| VIEWS       | NUMBER       | TRUE     | 조회수     |
| FAVORITES   | NUMBER       | TRUE     | 즐겨찾기수  |
| PARKING_LOT | VARCHAR(1)   | TRUE     | 주차장 유무 |
| ADDRESS     | VARCHAR(100) | TRUE     | 주소       |
| TEL         | VARCHAR(100) | TRUE     | 전화번호    |

<br/>

`REST_REVIEW` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE          | NULLABLE | ALIAS      |
| ------------ | ------------- | -------- | ---------- |
| REVIEW_ID    | VARCHAR(10)   | FALSE    | 리뷰 ID    |
| REST_ID      | VARCHAR(10)   | TRUE     | 식당 ID    |
| MEMBER_ID    | VARCHAR(100)  | TRUE     | 회원 ID    |
| REVIEW_SCORE | NUMBER        | TRUE     | 점수       |
| REVIEW_TEXT  | VARCHAR(1000) | TRUE     | 리뷰 텍스트 |
| REVIEW_DATE  | DATE          | TRUE     | 리뷰 작성일 |

<br/>

**서울에 위치한 식당들의 ID, 이름, 음식 종류, 즐겨찾기수, 주소, 리뷰 평균 점수를**

**조회하는 SQL문을 작성해주세요.**

<br/>

**이때 리뷰 평균점수는 소수점 세 번째 자리에서 반올림 해주시고,**

**결과는 평균점수를 기준으로 내림차순 정렬해주시고,**

**평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬해주세요.**

<br/>

### 출력 예제

| REST_ID | REST_NAME | FOOD_TYPE | FAVORITES | ADDRESS                          | SCORE |
| ------- | ----------| --------- | --------- | -------------------------------- | ----- |
| 00035   | 삼촌식당   | 일식      | 80        | 서울특별시 강서구 가로공원로 76가길 | 4.50  |

<br/>

## 풀이

```SQL
SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE), 2) AS "SCORE"
    FROM REST_INFO I INNER JOIN REST_REVIEW R
    ON I.REST_ID = R.REST_ID
    WHERE ADDRESS LIKE '서울%'
    GROUP BY REST_ID
    ORDER BY SCORE DESC, I.FAVORITES DESC;
```
