# 강원도에 위치한 생산공장 목록 출력하기

[프로그래머스 > SELECT > 강원도에 위치한 생산공장 목록 출력하기](https://school.programmers.co.kr/learn/courses/30/lessons/131112)

<br/>

## 문제

`FOOD_FACTORY` 테이블은 식품공장의 정보를 담은 테이블입니다.

`FOOD_FACTORY` 테이블 구조는 다음과 같습니다.

| NAME         | TYPE         | NULLABLE | ALIAS    |
| ------------ | ------------ | -------- | -------- |
| FACTORY_ID   | VARCHAR(10)  | FALSE    | 공장 ID  |
| FACTORY_NAME | VARCHAR(50)  | FALSE    | 공장 이름 |
| ADDRESS      | VARCHAR(100) | FALSE    | 주소     |
| TLNO         | VARCHAR(20)  | TRUE     | 전화번호  |

<br/>

**강원도에 위치한 식품공장의 ID, 이름, 주소를 조회하는 SQL문을 작성해주세요.**

**이때 결과는 공장 ID를 기준으로 오름차순 정렬해주세요.**

<br/>

### 출력 예제

| FACTORY_ID | FACTORY_NAME  | ADDRESS                          |
| ---------- | ------------- | -------------------------------- |
| FT19980003 | (주)맛있는라면 | 강원도 정선군 남면 칠현로 679      |
| FT20100003 | (주)맛있는음료 | 강원도 원주시 문막읍 문막공단길 154 |
| FT20100004 | (주)맛있는국   | 강원도 평창군 봉평면 진조길 227-35 |

<br/>

## 풀이

```SQL
SELECT FACTORY_ID, FACTORY_NAME, ADDRESS
    FROM FOOD_FACTORY
    WHERE ADDRESS LIKE '강원도%'
    ORDER BY FACTORY_ID;
```
